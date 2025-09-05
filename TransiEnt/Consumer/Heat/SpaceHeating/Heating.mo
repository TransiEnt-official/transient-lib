within TransiEnt.Consumer.Heat.SpaceHeating;
model Heating "Building Heating System"

  import Modelica.Blocks.Types.Init;
  import TransiEnt.Basics.Types.ControlType;

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  // --- Building Geometry ---

  parameter Modelica.Units.SI.Area A_living "living area"
    annotation (Dialog(group="Building Geometry"));

  parameter Modelica.Units.SI.Area A_wall "area of exterior walls"
    annotation (Dialog(group="Building Geometry"));

  parameter Modelica.Units.SI.Area A_window "area of windows"
    annotation (Dialog(group="Building Geometry"));

  parameter Modelica.Units.SI.Area A_roof "area of rooftop"
    annotation (Dialog(group="Building Geometry"));

  parameter Modelica.Units.SI.Area A_ground "area of building ground"
    annotation (Dialog(group="Building Geometry"));

  parameter Modelica.Units.SI.Volume V_air "Volume of air"
    annotation (Dialog(group="Building Geometry"));

  // --- Building Thermodynamics ---

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_wall
    "heat transfer coefficient of walls"
    annotation (Dialog(group="Building Thermodynamics"));

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_window
    "heat transfer coefficient of windows"
    annotation (Dialog(group="Building Thermodynamics"));

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_roof
    "heat transfer coefficient of rooftop"
    annotation (Dialog(group="Building Thermodynamics"));

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_ground
    "heat transfer coefficient of building ground"
    annotation (Dialog(group="Building Thermodynamics"));

  parameter Modelica.Units.SI.HeatCapacity thermalMass
    "total thermal mass of building"
    annotation (Dialog(group="Building Thermodynamics"));

  // --- Heating System ---

  parameter Modelica.Units.SI.HeatFlowRate Q_HP=10e3
    "nominal heat output of heat pump"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.HeatFlowRate Q_HR=6e3
    "maximum heat output of heater rod"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Temperature T_HP_amb_min(displayUnit="degC")=273.15
     - 15 "minimal ambient temperature for heat pump"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Temperature T_HP_bivalence(displayUnit="degC")=273.15
     - 3  "minimal ambient temperature for heat pump"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Temperature T_HP_sup_max(displayUnit="degC")=273.15
     + 65 "maximum supply temperature for heat pump"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Temperature T_HP_sup_min(displayUnit="degC")=273.15
     + 40 "minimum supply temperature for heat pump"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Time t_onOff_minOff=300
    "time between heat pump state change from off to on"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Time t_onOff_minOn=180
    "time between heat pump state change from on to off"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Volume V_HS(displayUnit="l")=0.8
    "volume of heat storage" annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Temperature T_room_set(displayUnit="degC")=273.15 +
    21    "set point of room temperature"
    annotation (Dialog(group="Heating System"));

  parameter Modelica.Units.SI.Temperature T_buffer_set(displayUnit="degC")=273.15
     + 50 "set point of room temperature"
    annotation (Dialog(group="Heating System"));

  parameter String tappingProfilePath="" if useTappingCycles
    annotation (Dialog(enable=useTappingCycles));

  // --- External control ---

  parameter ControlType controlType=TransiEnt.Basics.Types.ControlType.Internal
    "Type of control (see enumeration)"
    annotation (Evaluate=true, Dialog(group="External Control"));

  parameter Boolean busActive=false
    "Activate heat pump control bus"
    annotation (Evaluate=true, Dialog(group="External Control"));

  // --- Initialization ---

  parameter Init initType=Init.NoInit
    "Type of initialization (1: no init, 2: steady state, others do not apply)"
    annotation (Evaluate=true, Dialog(group="Initialization"));

  parameter Modelica.Units.SI.Temperature T_buffer_start=323.15
    "Buffer tank initialization temperature"
    annotation (Evaluate=true, Dialog(group="Initialization"));

  parameter Boolean useTappingCycles=true;

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp
    annotation (Placement(transformation(extent={{110,-110},{130,-90}})));

  TransiEnt.Basics.Interfaces.General.TemperatureIn T_amb
    annotation (Placement(transformation(extent={{-148,60},{-108,100}})));

  TransiEnt.Basics.Interfaces.General.ControlBus controlBus if busActive
    annotation (Placement(transformation(extent={{-120,-120},{-100,-100}})));

  // ------------------------------------------------------------------------------------------
  //   Components, Instances of other classes
  // ------------------------------------------------------------------------------------------

  outer TransiEnt.SimCenter simCenter;

  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump
                                          heatpump(
    use_T_source_input_K=true,
    use_T_supply_input=false,
    useFluidPorts=false,
    Delta_T_internal=1,
    Q_flow_n=Q_HP,
    T_source_n=263.15,
    eta_n=0.40,
    p_min_rel=0.2,
    useEta=true,
    useInertia=true,
    initType=Modelica.Blocks.Types.Init.NoInit,
    redeclare connector PowerPortModel =
        TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort,
    redeclare model PowerBoundaryModel = TransiEnt.Components.Boundaries.Electrical.ComplexPower.PQBoundary,
    Power(useInputConnectorQ=false))
    annotation (Placement(transformation(extent={{26,28},{50,52}})));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heaterRod
    annotation (Placement(transformation(extent={{70,-40},{90,-20}})));

  TransiEnt.Components.Boundaries.Electrical.ComplexPower.PQBoundary
                                                      pq_heaterRod(
      useInputConnectorP=true,
    useInputConnectorQ=false,  v_n=400)
    annotation (Placement(transformation(extent={{78,-74},{102,-50}})));

  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor bufferTank(
    C=0.6*4180*V_HS*rho_water,
    T(fixed=true, start=T_buffer_start),
    der_T(fixed=initType == Init.SteadyState))
    annotation (Placement(transformation(extent={{88,22},{108,42}})));

  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor bufferTank2(
    C=0.4*4180*V_HS*rho_water,
    T(fixed=true, start=T_buffer_start),
    der_T(fixed=initType == Init.SteadyState))
    annotation (Placement(transformation(extent={{142,22},{162,42}})));

  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=
        5e2) annotation (Placement(transformation(extent={{124,2},{144,22}})));

  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor T_bufferTank
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={76,4})));

  Modelica.Blocks.Continuous.FirstOrder T_delay(T=15, initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-74,28},{-68,34}})));

  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Controller.Base.Splitter
                                                     splitter(
    Q_HP_nom=Q_HP,
    Q_HR_max=Q_HR,
    T_HP_amb_min=T_HP_amb_min,
    T_HP_bivalence=T_HP_bivalence,
    T_HP_sup_max=T_HP_sup_max,
    t_onOff_minOff=t_onOff_minOff,
    t_onOff_minOn=t_onOff_minOn)
    annotation (Placement(transformation(extent={{-26,16},{-6,36}})));

  RoomHeating                                roomHeating(
    C=thermalMass,
    G_conductance=G_conductance,
    G_ventilation=G_ventilation,
    U_total=(A_wall*U_wall + A_window*U_window + A_roof*U_roof + A_ground*
        U_ground)/(A_wall + A_window + A_roof + A_ground),
    A_living=A_living,
    NHL=Q_HP,
    T_amb_nom=258.15,
    controlType=if controlType == ControlType.External_T then ControlType.External_T
         else ControlType.Internal,
    initType=initType)
    annotation (Placement(transformation(extent={{88,98},{108,118}})));

  TransiEnt.Basics.Blocks.PID_reset_lim                   PID_Storage(
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=Q_HP/12,
    k_p=0.5,
    Ti=3600/5,
    Td=7200,
    wd=0,
    Ni=0.9,
    Nd=1,
    withFeedForward=false,
    initType=if initType == Init.NoInit then Init.InitialState else Init.NoInit,
    strict=true,
    useVariableLimits=true,
    useDeadZone=true,
    deadZoneValue=0.1)
    annotation (Placement(transformation(extent={{-62,24},{-48,38}})));

  TransiEnt.Basics.Blocks.Hysteresis_withDelay                   hysteresis_withDelay(
    offsetInput=controlType == ControlType.External_T,
    uLow=-5,
    uHigh=3.15,
    offsetValue=T_buffer_set)
    annotation (Placement(transformation(extent={{-68,50},{-48,70}})));

  Modelica.Blocks.Sources.RealExpression T_buffer_set_(y=T_buffer_set)
                                           annotation (HideResult=true,
      Placement(transformation(extent={{-120,22},{-94,40}})));

  Modelica.Blocks.Sources.RealExpression T_room_set_(y=T_room_set) annotation (
      HideResult=true, Placement(transformation(
        extent={{-16,-10},{16,10}},
        rotation=180,
        origin={78,86})));

  Modelica.Blocks.Logical.Not not1 if not controlType == ControlType.External_P
                                   annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-44,42})));

  Modelica.Blocks.Sources.RealExpression Q_varLimiter_min(y=0)
                                           annotation (HideResult=true,
      Placement(transformation(extent={{-120,-12},{-94,6}})));

  TransiEnt.Components.Sensors.ElectricPowerComplex measuring_power(
      change_of_sign=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={86,-100})));

  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Controller.LimitController
                                                            limitController(
      Q_limit_not_active=Q_HP + Q_HR, Q_nom=Q_HP)
    if controlType == ControlType.Limit_P
    annotation (Placement(transformation(extent={{-72,-96},{-52,-76}})));

  Modelica.Blocks.Logical.Or or1 if controlType == ControlType.Limit_P
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=180,
        origin={-58,6})));

  Modelica.Blocks.Logical.Not not2 if controlType == ControlType.Limit_P or
    controlType == ControlType.External_P
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-70,-12})));

  Modelica.Blocks.Math.Add T_buffer_add if controlType == ControlType.External_T
    annotation (Placement(transformation(extent={{-98,44},{-86,56}})));

  Modelica.Blocks.Sources.RealExpression Q_varLimiter_max(y=heatpump.Q_max +
        splitter.Q_HR_available) if not controlType == ControlType.Limit_P
                                              annotation (HideResult=true,
      Placement(transformation(extent={{-120,2},{-94,20}})));

  Modelica.Blocks.Sources.RealExpression SOC(y=(T_mean - T_HP_sup_min)/(
        T_HP_sup_max - T_HP_sup_min)) if busActive
    "State of charge of the buffer tank. Could be below zero or above one in case of extraordinary but physically possible temperatures."
    annotation (Placement(transformation(extent={{-160,-188},{-140,-168}})));

  Modelica.Blocks.Sources.RealExpression P_min_(y=heatpump.P_min);

  Modelica.Blocks.Logical.Switch switch_controller
    if controlType == ControlType.External_P annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-34,20})));

  // ------------------------------------------------------------------------------------------
  //   Constants
  // ------------------------------------------------------------------------------------------

  constant TransiEnt.Basics.Units.AirChangeRate airChangeRate=0.5;
  constant Modelica.Units.SI.SpecificHeatCapacity cp_air=1012;
  constant Modelica.Units.SI.Density rho_air=1.225;
  constant Modelica.Units.SI.Density rho_water=998;

  // ------------------------------------------------------------------------------------------
  //   Variable Declarations
  // ------------------------------------------------------------------------------------------

  final parameter Modelica.Units.SI.ThermalConductance G_conductance=(A_wall*
      U_wall + A_window*U_window + A_roof*U_roof + A_ground*U_ground);

  final parameter Modelica.Units.SI.ThermalConductance G_ventilation=
      airChangeRate*cp_air*rho_air*V_air/3600;

  Modelica.Units.SI.Temperature T_mean=bufferTank.T*bufferTank.C/(bufferTank.C +
      bufferTank2.C) + bufferTank2.T*bufferTank2.C/(bufferTank.C + bufferTank2.C);

  // ------------------------------------------------------------------------------------------
  //   Equation Part
  // ------------------------------------------------------------------------------------------

  Modelica.Blocks.Sources.RealExpression P_el_max(y=heatpump.P_el_n + Q_HR)
    annotation (Placement(transformation(extent={{-160,-132},{-140,-112}})));
  Modelica.Blocks.Sources.RealExpression P_HP_max(y=heatpump.P_el_n)
    if not controlType == ControlType.Limit_P annotation (HideResult=true,
      Placement(transformation(extent={{-160,-146},{-140,-126}})));
  Modelica.Blocks.Sources.BooleanExpression HP_blocked(y=pre(splitter.onOff.blocked))
    if not controlType == ControlType.Limit_P annotation (HideResult=true,
      Placement(transformation(extent={{-160,-160},{-140,-140}})));
  Modelica.Blocks.Sources.BooleanExpression HP_status(y=pre(splitter.onOff.signal))
    if not controlType == ControlType.Limit_P annotation (HideResult=true,
      Placement(transformation(extent={{-160,-174},{-140,-154}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Controller.ActivePowerController
    hP_P_controller(HP_P_min=heatpump.P_min, HP_P_max=heatpump.P_el_n)
    if controlType == ControlType.External_P
    annotation (Placement(transformation(extent={{-72,-64},{-52,-44}})));
  Modelica.Blocks.Sources.RealExpression SOC_dyn(y=(T_mean - roomHeating.T_bt_min)
        /(T_HP_sup_max - roomHeating.T_bt_min))
                                        if busActive
    "Dynamic SOC according to minimal buffer tank temperature needed"
    annotation (Placement(transformation(extent={{-160,-204},{-140,-184}})));
  TappingCycles                                tappingCycles(profile=
        tappingProfilePath) if useTappingCycles
    annotation (Placement(transformation(extent={{106,-44},{126,-24}})));
initial equation

  // switch on heating system at certain ambient temperature
  pre(hysteresis_withDelay.y) = T_amb > 273.15 + 12;

equation

  // NoInit: No initial state is assumed. System starts with zero for all states
  assert(initType == Init.NoInit or initType == Init.SteadyState, "Init type not supported.");

  // Storage temperature must remain within physically reasonable limits
  assert(bufferTank.T >= T_room_set and bufferTank.T <= 273.15 + 100, "Hot water storage temperature out of bounds: bufferTank.T = "
     + String(bufferTank.T));

  // ------------------------------------------------------------------------------------------
  //   Connect Statements
  // ------------------------------------------------------------------------------------------

  // manual conditiional connections
  if not controlType == ControlType.External_T then
    connect(T_buffer_set_.y, T_delay.u) annotation (Line(points={{-92.7,31},{
            -84,31},{-84,32},{-74.6,32},{-74.6,31}},
                                                 color={0,0,127}));
  end if;
  if not controlType == ControlType.Limit_P then
    connect(not1.y, PID_Storage.reset) annotation (Line(points={{-44,37.6},{-44,
            10},{-50,10},{-50,16},{-59.2,16},{-59.2,22.6}},
                                                   color={255,0,255}));
  end if;
  if not controlType == ControlType.External_P then
    connect(PID_Storage.y, splitter.Q_request) annotation (Line(points={{-47.3,
            31},{-42,31},{-42,20},{-46,20},{-46,4},{-26.8,4},{-26.8,20}},
                                                                        color={0,
            0,127}));
  end if;

  connect(controlBus.P_min, P_min_.y);
  connect(T_amb, heatpump.T_source_input_K) annotation (Line(points={{-128,80},{
          -22,80},{-22,62},{38.24,62},{38.24,52.48}}, color={0,0,127}));
  connect(roomHeating.heatPort_supply, heatpump.heatPort) annotation (Line(
        points={{98,98.2},{98,58},{50,58},{50,49.36}}, color={191,0,0}));
  connect(bufferTank.port, heatpump.heatPort) annotation (Line(points={{98,22},{
          98,18},{58,18},{58,58},{50,58},{50,49.36}}, color={191,0,0}));
  connect(T_room_set_.y, roomHeating.T_room_set) annotation (Line(points={{60.4,
          86},{56,86},{56,116},{87.4,116}}, color={0,0,127}));
  connect(T_bufferTank.port, heatpump.heatPort) annotation (Line(points={{70,4},
          {58,4},{58,58},{50,58},{50,49.36}}, color={191,0,0}));
  connect(roomHeating.T_amb, T_amb) annotation (Line(points={{87.2,100},{-22,100},
          {-22,80},{-128,80}}, color={0,0,127}));
  connect(heaterRod.port, bufferTank.port)
    annotation (Line(points={{90,-30},{98,-30},{98,22}}, color={191,0,0}));
  connect(splitter.Q_HR, heaterRod.Q_flow) annotation (Line(points={{-5.4,20},{16,
          20},{16,-30},{70,-30}}, color={0,0,127}));
  connect(hysteresis_withDelay.u, T_bufferTank.T) annotation (Line(points={{-70,
          60},{-74,60},{-74,76},{0,76},{0,-2},{78,-2},{78,4},{82.6,4}}, color={0,
          0,127}));
  connect(splitter.T_amb, T_amb)
    annotation (Line(points={{-22,36.8},{-22,80},{-128,80}}, color={0,0,127}));
  connect(splitter.T_bufferTank, T_bufferTank.T) annotation (Line(points={{-10,36.6},
          {-10,76},{0,76},{0,-2},{78,-2},{78,4},{82.6,4}}, color={0,0,127}));
  connect(hysteresis_withDelay.y, not1.u) annotation (Line(points={{-47,60},{-44,
          60},{-44,46.8}}, color={255,0,255}));
  connect(splitter.signal, not1.y) annotation (Line(points={{-26.8,32},{-44,32},
          {-44,37.6}}, color={255,0,255}));
  connect(PID_Storage.u_m, T_bufferTank.T) annotation (Line(points={{-55,22.6},
          {-56,22.6},{-56,18},{-48,18},{-48,8},{0,8},{0,-2},{78,-2},{78,4},{
          82.6,4}},                         color={0,0,127}));
  connect(Q_varLimiter_min.y, PID_Storage.limit2) annotation (Line(points={{-92.7,
          -3},{-92.7,-2},{-88,-2},{-88,24},{-63.4,24},{-63.4,25.4}},
                                               color={0,0,127}));
  connect(pq_heaterRod.P_el_set, heaterRod.Q_flow) annotation (Line(points={{82.8,
          -47.6},{82.8,-44},{62,-44},{62,-30},{70,-30}}, color={0,0,127}));
  connect(epp, measuring_power.epp_IN) annotation (Line(
      points={{120,-100},{95.2,-100}},
      color={28,108,200},
      thickness=0.5));
  connect(measuring_power.epp_OUT, heatpump.epp) annotation (Line(
      points={{76.6,-100},{47.12,-100},{47.12,28}},
      color={28,108,200},
      thickness=0.5));
  connect(pq_heaterRod.epp, measuring_power.epp_OUT) annotation (Line(
      points={{78,-62},{66,-62},{66,-100},{76.6,-100}},
      color={28,108,200},
      thickness=0.5));
  connect(limitController.P_Heating, measuring_power.P) annotation (Line(points={{-68,
          -96.8},{-68,-110},{91,-110},{91,-108.6}},      color={0,0,127}));
  connect(limitController.PID_limit, PID_Storage.limit1) annotation (Line(
        points={{-51.2,-86},{-48,-86},{-48,-70},{-88,-70},{-88,-6},{-82,-6},{
          -82,38},{-63.4,38},{-63.4,36.6}},
        color={0,0,127}));
  connect(splitter.Q_HP, heatpump.Q_flow_set) annotation (Line(points={{-5.4,32},
          {18,32},{18,33.52},{25.28,33.52}}, color={0,0,127}));
  connect(or1.y, PID_Storage.reset) annotation (Line(points={{-62.4,6},{-66,6},
          {-66,18},{-59.2,18},{-59.2,22.6}},
                         color={255,0,255}));
  connect(or1.u2, not1.y) annotation (Line(points={{-53.2,9.2},{-53.2,10},{-44,
          10},{-44,37.6}}, color={255,0,255}));
  connect(not2.y, or1.u1) annotation (Line(points={{-70,-7.6},{-70,-4},{-50,-4},
          {-50,6},{-53.2,6}},              color={255,0,255}));
  connect(T_buffer_set_.y, T_buffer_add.u2) annotation (Line(points={{-92.7,31},
          {-90,31},{-90,40},{-99.2,40},{-99.2,46.4}}, color={0,0,127}));
  connect(Q_varLimiter_max.y, PID_Storage.limit1) annotation (Line(points={{-92.7,
          11},{-82,11},{-82,38},{-63.4,38},{-63.4,36.6}},
                                                 color={0,0,127}));
  connect(controlBus.T_room_offset, roomHeating.T_room_offset) annotation (Line(points={{-110,
          -110},{-152,-110},{-152,112},{87.4,112}},color={0,0,127}));
  connect(hysteresis_withDelay.offset, T_delay.u) annotation (Line(points={{-70,
          68},{-78,68},{-78,32},{-74.6,32},{-74.6,31}}, color={0,0,127}));
  connect(T_buffer_add.y, T_delay.u) annotation (Line(points={{-85.4,50},{-78,
          50},{-78,32},{-74.6,32},{-74.6,31}}, color={0,0,127}));
  connect(T_delay.y, PID_Storage.u_s)
    annotation (Line(points={{-67.7,31},{-63.4,31}}, color={0,0,127}));
  connect(thermalConductor.port_a, heatpump.heatPort) annotation (Line(points={{124,12},
          {100,12},{100,18},{58,18},{58,58},{50,58},{50,49.36}},
                                                        color={191,0,0}));
  connect(bufferTank2.port, thermalConductor.port_b)
    annotation (Line(points={{152,22},{152,12},{144,12}}, color={191,0,0}));
  connect(switch_controller.y, splitter.Q_request)
    annotation (Line(points={{-29.6,20},{-26.8,20}}, color={0,0,127}));
  connect(switch_controller.u1, PID_Storage.y) annotation (Line(points={{-38.8,23.2},
          {-42,23.2},{-42,31},{-47.3,31}}, color={0,0,127}));
  connect(switch_controller.u2, not2.y) annotation (Line(points={{-38.8,20},{
          -42,20},{-42,-4},{-70,-4},{-70,-7.6}},
                        color={255,0,255}));
  connect(controlBus.P, measuring_power.P) annotation (Line(points={{-110,-110},
          {-82,-110},{-82,-114},{91,-114},{91,-108.6}}, color={0,0,0}), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlBus.SignalActive, limitController.P_limit_active) annotation (
      Line(points={{-110,-110},{-82,-110},{-82,-92},{-72.8,-92}}, color={0,0,0}),
      Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlBus.SignalActive, not2.u) annotation (Line(points={{-110,-110},
          {-110,-30},{-70,-30},{-70,-16.8}},
                 color={0,0,0}), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(heatpump.Q_min, splitter.Q_HP_min) annotation (Line(
      points={{37.04,27.52},{37.04,24},{-2,24},{-2,44},{-16,44},{-16,36.8}},
      color={175,0,0},
      pattern=LinePattern.Dash));
  connect(heatpump.Q_max, splitter.Q_HP_max) annotation (Line(
      points={{44.24,27.52},{44.24,16},{44,16},{44,6},{-22,6},{-22,15.2}},
      color={175,0,0},
      pattern=LinePattern.Dash));
  connect(limitController.P_limit, controlBus.P_limit) annotation (Line(points={{-73,-80},
          {-110,-80},{-110,-110}},                                                                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(T_buffer_add.u1, controlBus.T_buffer_offset) annotation (Line(points={{-99.2,
          53.6},{-99.2,54},{-132,54},{-132,-62},{-110,-62},{-110,-110}},                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(P_HP_max.y, controlBus.P_HP_max) annotation (Line(points={{-139,-136},
          {-110,-136},{-110,-110}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(HP_blocked.y, controlBus.HP_blocked) annotation (Line(points={{-139,
          -150},{-110,-150},{-110,-110}},                   color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(HP_status.y, controlBus.HP_state) annotation (Line(points={{-139,-164},
          {-110,-164},{-110,-110}},                                     color={255,
          0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(hP_P_controller.y, switch_controller.u3) annotation (Line(points={{
          -51.4,-46},{-38.8,-46},{-38.8,16.8}}, color={0,0,127}));
  connect(SOC.y, controlBus.SOC) annotation (Line(points={{-139,-178},{-110,
          -178},{-110,-110}},                                     color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(hP_P_controller.SignalActive, controlBus.SignalActive) annotation (
      Line(points={{-73,-62},{-110,-62},{-110,-110}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(hP_P_controller.P_external, controlBus.P_external) annotation (Line(
        points={{-73,-46},{-110,-46},{-110,-110}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(hP_P_controller.HP_Q_max, heatpump.Q_max) annotation (Line(points={{
          -54.2,-43.2},{-54.2,-20},{44,-20},{44,6},{44.24,6},{44.24,27.52}},
        color={0,0,127}));
  connect(hP_P_controller.Signal, splitter.signal) annotation (Line(points={{
          -51.4,-62},{20,-62},{20,46},{-34,46},{-34,32},{-26.8,32}}, color={255,
          0,255}));
  connect(hP_P_controller.P_measurement, measuring_power.P) annotation (Line(
        points={{-57.4,-64.8},{-57.4,-68},{-40,-68},{-40,-110},{91,-110},{91,
          -108.6}}, color={0,0,127}));
  connect(PID_Storage.reset, hP_P_controller.Signal) annotation (Line(points={{
          -59.2,22.6},{-59.2,16},{-50,16},{-50,10},{-44,10},{-44,34},{-34,34},{
          -34,46},{20,46},{20,-62},{-51.4,-62}}, color={255,0,255}));
  connect(hP_P_controller.HP_Q_min, heatpump.Q_min) annotation (Line(points={{
          -58,-43.2},{-58,-18},{22,-18},{22,18},{37.04,18},{37.04,27.52}},
        color={0,0,127}));
  connect(SOC_dyn.y, controlBus.SOC_dyn) annotation (Line(points={{-139,-194},
          {-110,-194},{-110,-110}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(tappingCycles.heatPort, bufferTank.port) annotation (Line(points={{126,
          -34},{132,-34},{132,-4},{98,-4},{98,22}}, color={191,0,0}));
  connect(splitter.HP_blocked_off, hP_P_controller.HP_blocked_off) annotation (
      Line(points={{-5.6,24},{4,24},{4,22},{6,22},{6,-4},{-40,-4},{-40,-16},{
          -62,-16},{-62,-36},{-82,-36},{-82,-52},{-84,-52},{-84,-58},{-73,-58}},
        color={255,0,255}));
  connect(splitter.HP_blocked_on, hP_P_controller.HP_blocked_on) annotation (
      Line(points={{-5.6,22},{2,22},{2,0},{-48,0},{-48,-2},{-78,-2},{-78,-34},{-84,
          -34},{-84,-54},{-73,-54}}, color={255,0,255}));
  connect(P_el_max.y, controlBus.P_max) annotation (Line(points={{-139,-122},{-126,
          -122},{-126,-110},{-110,-110}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,140}}),
        graphics={
        Ellipse(
          extent={{-98,98},{98,-98}},
          lineColor={28,108,200},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
        Line(
          points={{-50,-74},{-2,-18},{-72,18},{-32,78}},
          color={255,128,0},
          smooth=Smooth.Bezier,
          thickness=1),
        Line(
          points={{-12,-76},{36,-20},{-34,16},{6,76}},
          color={255,128,0},
          smooth=Smooth.Bezier,
          thickness=1),
        Line(
          points={{26,-74},{74,-18},{4,18},{44,78}},
          color={255,128,0},
          smooth=Smooth.Bezier,
          thickness=1),
        Text(
          extent={{-150,-114},{150,-154}},
          textString="%name",
          textColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,
            140}})),
    Documentation(info="<html>
<h4>Basic Idea of the model</h4>
<p>This model describes a Building Heating System (BHS) of a dwelling based on a <a href=\"modelica://TransiEnt/Producer/Heat/Power2Heat/Heatpump/Heatpump.mo\">Electric Heat Pump (EHP)</a> with a Heater Rod (HR) as auxiliary heater as heat source, and <a href=\"modelica://TransiEnt/Consumer/Heat/SpaceHeating/RoomHeating.mo\">RoomHeating</a> as heat sink. Key part of this model is a PID-controller and a power splitter. The basic block diagram is shown below.</p>
<p><img src=\"modelica://TransiEnt/Images/Blockdiagram_Building_Heating_System.svg\"/></p>
<p>A PID controller controls the EHP+HR operating point based on a Buffer Storage Tank (BST) temperature set-point. The set-point is given by parameter. The <a href=\"modelica://TransiEnt/Producer/Heat/Power2Heat/Heatpump/Controller/Base/Splitter.mo\">Splitter</a> splits the requested heat flow rate to the EHP and HR based on different ambient and system conditions. For more details, have a look at the <a href=\"modelica://TransiEnt/Producer/Heat/Power2Heat/Heatpump/Controller/Base/Splitter.mo\">Splitter</a> model.</p>
<p>The parameters of the PID-Model were measured at a real EHP. The laboratory experiments were conducted at the SYSLAB at the Technical University of Denmark (DTU). Details of the project and the results can be found at: <a href=\"https://zenodo.org/records/17054821\">https://zenodo.org/records/17054821</a>.</p>
<h4>Control Bus - external control modes</h4>
<p>The model is equiped with a expandable connector called <a href=\"modelica://TransiEnt/Basics/Interfaces/General/ControlBus.mo\">ControlBus</a>. Dependent on the <a href=\"modelica://TransiEnt/Basics/Types/ControlType.mo\">ControlType</a>, different control modes are possible, as described below.</p>
<ul>
<li><b>Internal</b>: No external control. The internal PID controller is active an controls the BST temperature based on the parameter set value.</li>
<li><b>Limit_P</b>: Active power is limited from outside via <code>controlBus.P_limit</code>.</li>
<li><b>External_P</b>: The internal PID controller is bypassed and a P controller is active, controlling the consumed active power set by <code>controlBus.P_external</code> from the grid. In this operation mode, the HP and HR are active independent from the temperature set point. Useful for externally controlled components, like aggregators.</li>
<li><b>External_T</b>: External temperature set-value <code>controlBus.T_buffer_offset</code> will be used. The internal PID controller is still active.</li>
</ul>
Note that all external signals are only active if the control bus input <code>controlBus.SignalActive</code> is true. Otherwise, the internal PID controller is active as it is in the mode <code>Internal</code>. When <code>controlBus.SignalActive</code> changes, respective controllers are reinitialized.
<h4>Initialization</h4>
<p>There are two possible initalization methods for this block, as defined in <a href=\"modelica://Modelica.Blocks.Types.Init\">Modelica.Blocks.Types.Init</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><h4>initType</h4></td>
<td></td>
</tr>
<tr>
<td><h4>NoInit</h4></td>
<td><p>No initialization. States are zero</p></td>
</tr>
<tr>
<td><h4>SteadyState</h4></td>
<td><p>Initialization in steady state</p></td>
</tr>
<tr>
<td><h4>InitialState</h4></td>
<td><p><i><span style=\"color: #7c7c7c;\">Not applicable</span></i></p></td>
</tr>
<tr>
<td><h4>InitialOutput</h4></td>
<td><p><i><span style=\"color: #7c7c7c;\">Not applicable</span></i></p></td>
</tr>
</table>
<ul>
<li><b>NoInit</b>: The system is initialized with <i>states equal to zero</i>. This is equivalent to a switched off system for simulation start. It can be useful to if the start of all components and controllers should be simulated.</li>
<li><b>SteadyState</b>: The system is initialized in steady state. All <i>derivatives are zero</i>, and the states are calculated accordingly.</li>
</ul>
</html>"));
end Heating;
