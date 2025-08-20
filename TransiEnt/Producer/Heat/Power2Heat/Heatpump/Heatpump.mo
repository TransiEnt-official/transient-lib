within TransiEnt.Producer.Heat.Power2Heat.Heatpump;
model Heatpump "Simple heatpump model that calculates the heat output from the externally specified electric power"



  //________________________________________________________________________________//
  // Component of the TransiEnt Library, version: 2.0.3                             //
  //                                                                                //
  // Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
  // Copyright 2021, Hamburg University of Technology.                              //
  //________________________________________________________________________________//
  //                                                                                //
  // TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
  // supported by the German Federal Ministry of Economics and Energy               //
  // (FKZ 03ET4003, 03ET4048, 0324027 and 03EI1008).                                //
  // The TransiEnt Library research team consists of the following project partners://
  // Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
  // Institute of Energy Systems (Hamburg University of Technology),                //
  // Institute of Electrical Power and Energy Technology                            //
  // (Hamburg University of Technology)                                             //
  // Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
  // Gas- und WÃ¤rme-Institut Essen                                                  //
  // and                                                                            //
  // XRG Simulation GmbH (Hamburg, Germany).                                        //
  //________________________________________________________________________________//




  import Modelica.Blocks.Types.Init;
  outer TransiEnt.SimCenter simCenter;
  outer TransiEnt.ModelStatistics modelStatistics;

  //___________________________________________________________________________
  //
  //                      Parameters
  //___________________________________________________________________________

  parameter Boolean use_T_source_input_K=false
    "False, use outer ambient conditions"
    annotation (Dialog(group="Heat pump parameters"));

  parameter Boolean use_T_supply_input=false
    "True if supply temperature is taken from input, false if heat or fluid port is used"
    annotation (Dialog(group="Heat pump parameters"));

  parameter Boolean usePowerPort=true "True if power port shall be used"
    annotation (Dialog(group="Fundamental Definitions"));

  parameter Boolean useHeatPort=true "True if heat port shall be used"
    annotation (Dialog(group="Fundamental Definitions", enable=not
          useFluidPorts));

  parameter Boolean useFluidPorts=false "True if fluid ports shall be used"
    annotation (Dialog(group="Fundamental Definitions"));

  parameter Modelica.Units.SI.TemperatureDifference Delta_T_internal=5
    "Temperature difference between refrigerant and source/sink temperature"
    annotation (Dialog(group="Heat pump parameters"));

  parameter Modelica.Units.SI.TemperatureDifference Delta_T_db=2
    "Deadband of hysteresis control"
    annotation (Dialog(group="Heat pump parameters"));

  parameter Modelica.Units.SI.HeatFlowRate Q_flow_n=3.5e3
    "Nominal heat flow of heat pump at nominal conditions according to EN14511"
    annotation (Dialog(group="Heat pump parameters"));

  parameter Boolean useEta=false
    annotation (Dialog(group="Heat pump parameters"));

  parameter Real COP_n=3.7
    "Coefficient of performance at nominal conditions according to EN14511"
    annotation (Dialog(group="Heat pump parameters", enable=not useEta));

  parameter Modelica.Units.SI.Temperature T_supply_n(displayUnit="degC")=273.15 + 50 "Nominal supply temperature";

  parameter Modelica.Units.SI.Temperature T_source_n(displayUnit="degC")=273.15 - 5
    "Nominal ambient temperature (DIN EN 12831)";

  parameter Real eta_n=0.5 "Efficiency factor"
    annotation (Dialog(group="Heat pump parameters", enable=useEta));

  parameter Real p_min_rel=0.2 "Minimal possible compressor load"
    annotation (Dialog(group="Heat pump parameters"));

  parameter Boolean useInertia=false "True if intertia is used"
    annotation (Dialog(group="Heat pump parameters"));

  parameter Modelica.Units.SI.Time T_inertia=30 if useInertia
    "Inertia of heat pump" annotation (Dialog(group="Heat pump parameters"));

  final parameter Real eta_HP=if useEta then eta_n else COP_n/(T_supply_n/(T_supply_n - T_source_n));

  final parameter Modelica.Units.SI.Power P_el_n=Q_flow_n/COP_c(
      eta_HP,
      Delta_T_internal,
      T_source_n,
      T_supply_n);

  Modelica.Units.SI.Temperature T_source=simCenter.ambientConditions.temperature.value
       + 273.15 "Temperature of heat source" annotation (Dialog(group="Heat pump parameters",
        enable=not use_T_source_input_K), choices(choice=simCenter.ambientConditions.temperature.value
           + 273.15 "Ambient Temperature", choice=IntegraNet.SimCenter.Ground_Temperature
           + 273.15 "Ground Temperature"));

  replaceable model ProducerCosts =
      TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.Empty
    constrainedby
    TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.PartialPowerPlantCostSpecs
    annotation (Dialog(group="Statistics"));

  parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium=simCenter.fluid1
    "Medium to be used" annotation (choicesAllMatching=true, Dialog(group="Fundamental Definitions"));

  parameter SI.Pressure p_drop=simCenter.p_nom[2] - simCenter.p_nom[1]
    annotation (Dialog(group="Fundamental Definitions", enable=useFluidPorts));

  parameter Init initType=Init.NoInit
    "Type of initialization (1: no init, 2: steady state, others do not apply)"
    annotation (Evaluate=true, Dialog(group="Initialization"));

  function COP_c
    output Real y;
    input Real eta;
    input Real Delta_T;
    input Real T_lower;
    input Real T_upper;
  algorithm
    y := eta*(T_upper + Delta_T)/max(2*Delta_T, T_upper + 2*Delta_T - T_lower);
  end COP_c;

  //___________________________________________________________________________
  //
  //                      Variables
  //___________________________________________________________________________

  input SI.Temperature T_set=50 + 273.15
    "Heatpump supply temperature"
    annotation (Dialog(group="Heat pump parameters", enable=not use_T_supply_input));

  final parameter SI.ActivePower P_min=Q_flow_n/COP_n*p_min_rel;
  SI.HeatFlowRate Q_min_calc=COP.y*P_min;

  //___________________________________________________________________________
  //
  //                      Interfaces
  //___________________________________________________________________________

  TransiEnt.Basics.Interfaces.General.TemperatureIn T_source_input_K
    if use_T_source_input_K "Temperature of source" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,106}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={2,104})));

  Basics.Interfaces.Thermal.HeatFlowRateIn Q_flow_set "Heatflow set point"
    annotation (Placement(transformation(extent={{-126,-74},{-86,-34}}),
        iconTransformation(extent={{-126,-74},{-86,-34}})));

  TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateOut Heat_output
    "Setpoint value, e.g. Storage setpoint temperature"
    annotation (Placement(transformation(extent={{96,38},{136,78}}),
        iconTransformation(extent={{96,38},{136,78}})));

  replaceable connector PowerPortModel =
      Basics.Interfaces.Electrical.ActivePowerPort constrainedby
    Basics.Interfaces.Electrical.PartialPowerPort "Choice of power port"
    annotation (choicesAllMatching=true, Dialog(group="Replaceable Components"));

  PowerPortModel epp if usePowerPort
    annotation (Placement(transformation(extent={{66,-110},{86,-90}})));

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn inlet(Medium=medium)
    if useFluidPorts annotation (Placement(transformation(extent={{94,-68},{114,
            -48}}), iconTransformation(extent={{90,-48},{110,-28}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut outlet(Medium=medium)
    if useFluidPorts annotation (Placement(transformation(extent={{92,20},{112,40}}),
        iconTransformation(extent={{92,20},{112,40}})));

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b heatPort
    if useHeatPort and not useFluidPorts
    annotation (Placement(transformation(extent={{90,68},{110,88}})));

  TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateOut Q_min
    "Setpoint value, e.g. Storage setpoint temperature" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,-112}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-8,-104})));
  TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateOut Q_max
    "Setpoint value, e.g. Storage setpoint temperature" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={40,-112}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={52,-104})));

protected
  Modelica.Blocks.Interfaces.RealOutput T_supply_internal;
  TransiEnt.Basics.Interfaces.General.TemperatureOut T_source_internal;

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

public
  Modelica.Blocks.Math.Division P_el
    annotation (Placement(transformation(extent={{10,28},{30,48}})));

  Modelica.Blocks.Sources.RealExpression COP(y=COP_c(
        eta_HP,
        Delta_T_internal,
        T_source_internal,
        T_supply_internal))
    annotation (Placement(transformation(extent={{-22,22},{-2,42}})));

  TransiEnt.Components.Statistics.Collectors.LocalCollectors.HeatingPlantCost
    heatingPlantCost(
    calculateCost=true,
    consumes_H_flow=false,
    Q_flow_n=Q_flow_n,
    Q_flow_is=-P_el.y,
    produces_m_flow_CDE=false,
    m_flow_CDE_is=0)
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));

  replaceable model heatFlowBoundaryModel =
      TransiEnt.Components.Boundaries.Heat.Heatflow_L1 constrainedby
    TransiEnt.Components.Boundaries.Heat.Heatflow_L1 annotation (
      choicesAllMatching=true, Dialog(group="Replaceable Components"));

  heatFlowBoundaryModel heatFlowBoundary(
    p_drop=p_drop,
    Medium=medium,
    change_sign=true,
    use_Q_flow_in=true) if useFluidPorts annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={18,-44})));

  TransiEnt.Components.Sensors.TemperatureSensor T_in_sensor if useFluidPorts
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={80,-40})));

  TransiEnt.Components.Sensors.TemperatureSensor T_out_sensor if useFluidPorts
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={78,44})));

  TransiEnt.Components.Sensors.SpecificEnthalpySensorVLE
    specificEnthalpySensorVLE if useFluidPorts
    annotation (Placement(transformation(extent={{52,-16},{72,4}})));

  ClaRa.Components.Sensors.SensorVLE_L1_m_flow massFlowSensorVLE
    if useFluidPorts
    annotation (Placement(transformation(extent={{28,-16},{48,4}})));

  TransiEnt.Components.Sensors.SpecificEnthalpySensorVLE
    specificEnthalpySensorVLE1 if useFluidPorts
    annotation (Placement(transformation(extent={{42,-50},{62,-30}})));

  replaceable model PowerBoundaryModel =
      TransiEnt.Components.Boundaries.Electrical.ActivePower.Power
    constrainedby
    TransiEnt.Components.Boundaries.Electrical.Base.PartialModelPowerBoundary
    "Choice of power boundary model. The power boundary model must match the power port."
    annotation (choicesAllMatching=true, Dialog(group="Replaceable Components"));

  PowerBoundaryModel Power(v_n=400, useInputConnectorP=true)
                           if usePowerPort
    "Choice of power boundary model. The power boundary model must match the power port."
    annotation (Placement(transformation(extent={{-6,-90},{-26,-70}})));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    if not useFluidPorts and useHeatPort
    annotation (Placement(transformation(extent={{46,68},{66,88}})));

  //Statistics
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectElectricPower
    collectElectricPower(typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Consumer)
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectHeatingPower
    collectHeatingPower(typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Conventional)
    annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));

  Modelica.Blocks.Sources.RealExpression Q_min_(y=Q_min_calc)
    annotation (Placement(transformation(extent={{-42,-64},{-22,-44}})));

  Modelica.Blocks.Continuous.FirstOrder inertia_heatPump(T=T_inertia, initType=
        if initType == Init.NoInit then Init.InitialState else Init.SteadyState)
    if useInertia
    annotation (Placement(transformation(extent={{-74,-62},{-58,-46}})));

  Modelica.Blocks.Sources.RealExpression Q_off(y=0)
    annotation (Placement(transformation(extent={{-96,-36},{-76,-16}})));

  Modelica.Blocks.Sources.RealExpression Q_max_(y=P_el_n*COP.y)
    annotation (Placement(transformation(extent={{-100,-18},{-70,2}})));

  Modelica.Blocks.Nonlinear.VariableLimiter Q_limiter
    annotation (Placement(transformation(extent={{-44,-22},{-32,-10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor heatPort_T
    if useHeatPort and not useFluidPorts
    annotation (Placement(transformation(extent={{76,80},{90,94}})));
equation

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  if not use_T_source_input_K then
    T_source_internal = T_source;
  end if;

  collectElectricPower.powerCollector.P = Q_flow_set;
  collectHeatingPower.heatFlowCollector.Q_flow = -P_el.y;

  connect(T_source_internal, T_source_input_K);

  if not use_T_supply_input and not useFluidPorts and not useHeatPort then
    T_supply_internal = T_set;
  end if;

  if not useInertia then
    connect(Q_flow_set, Q_limiter.u) annotation (Line(
        points={{-106,-54},{-80,-54},{-80,-40},{-54,-40},{-54,-16},{-45.2,-16}},
        color={175,0,0},
        pattern=LinePattern.Dash));
  end if;

  connect(heatPort_T.T, T_supply_internal);
  connect(T_in_sensor.T, T_supply_internal);

  connect(modelStatistics.powerCollector[collectElectricPower.typeOfResource],
    collectElectricPower.powerCollector);
  connect(modelStatistics.heatFlowCollector[collectHeatingPower.typeOfResource],
    collectHeatingPower.heatFlowCollector);
  connect(modelStatistics.costsCollector, heatingPlantCost.costsCollector);

  connect(T_in_sensor.port, inlet) annotation (Line(
      points={{80,-50},{80,-58},{104,-58}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(outlet, T_out_sensor.port) annotation (Line(
      points={{102,30},{78,30},{78,34}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(outlet, specificEnthalpySensorVLE.outlet) annotation (Line(
      points={{102,30},{68,30},{68,8},{80,8},{80,-16},{72,-16}},
      color={175,0,0},
      thickness=0.5));
  connect(specificEnthalpySensorVLE.inlet, massFlowSensorVLE.outlet)
    annotation (Line(
      points={{52,-16},{52,-20},{48,-20},{48,-16}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(heatFlowBoundary.fluidPortOut, massFlowSensorVLE.inlet) annotation (
      Line(
      points={{28,-38},{32,-38},{32,-20},{28,-20},{28,-16}},
      color={175,0,0},
      thickness=0.5));
  connect(inlet, specificEnthalpySensorVLE1.outlet) annotation (Line(
      points={{104,-58},{104,-56},{62,-56},{62,-50}},
      color={175,0,0},
      thickness=0.5));
  connect(heatFlowBoundary.fluidPortIn, specificEnthalpySensorVLE1.inlet)
    annotation (Line(
      points={{28,-50},{36,-50},{36,-54},{42,-54},{42,-50}},
      color={175,0,0},
      thickness=0.5));
  connect(prescribedHeatFlow.port, heatPort)
    annotation (Line(points={{66,78},{100,78}}, color={191,0,0}));
  connect(Power.epp, epp) annotation (Line(
      points={{-6,-80},{76,-80},{76,-100}},
      color={0,135,135},
      thickness=0.5));
  connect(P_el.u2, COP.y)
    annotation (Line(points={{8,32},{-1,32}}, color={0,0,127}));
  connect(P_el.y, Power.P_el_set) annotation (Line(points={{31,38},{36,38},{36,8},
          {-10,8},{-10,-68}}, color={0,0,127}));
  connect(Q_flow_set, inertia_heatPump.u) annotation (Line(
      points={{-106,-54},{-75.6,-54}},
      color={175,0,0},
      pattern=LinePattern.Dash));
  connect(inertia_heatPump.y, Q_limiter.u) annotation (Line(points={{-57.2,-54},
          {-54,-54},{-54,-16},{-45.2,-16}}, color={0,0,127}));
  connect(Q_max_.y, Q_limiter.limit1) annotation (Line(points={{-68.5,-8},{-58,-8},
          {-58,-11.2},{-45.2,-11.2}}, color={0,0,127}));
  connect(Q_off.y, Q_limiter.limit2) annotation (Line(points={{-75,-26},{-62,-26},
          {-62,-20.8},{-45.2,-20.8}}, color={0,0,127}));
  connect(Q_min_.y, Q_min)
    annotation (Line(points={{-21,-54},{0,-54},{0,-112}}, color={0,0,127}));
  connect(Q_max, Q_max_.y) annotation (Line(
      points={{40,-112},{40,-60},{-12,-60},{-12,-4},{-60,-4},{-60,-8},{-68.5,-8}},
      color={175,0,0},
      pattern=LinePattern.Dash));

  connect(Q_limiter.y, P_el.u1) annotation (Line(points={{-31.4,-16},{-26,-16},{
          -26,54},{8,54},{8,44}}, color={0,0,127}));
  connect(Q_limiter.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{-31.4,
          -16},{-26,-16},{-26,78},{46,78}}, color={0,0,127}));
  connect(Q_limiter.y, Heat_output) annotation (Line(points={{-31.4,-16},{-26,-16},
          {-26,78},{40,78},{40,58},{116,58}}, color={0,0,127}));
  connect(Q_limiter.y, heatFlowBoundary.Q_flow_prescribed) annotation (Line(
        points={{-31.4,-16},{2,-16},{2,-50},{10,-50}}, color={0,0,127}));
  connect(heatPort_T.port, heatPort) annotation (Line(points={{76,87},{72,87},{72,
          78},{100,78}}, color={191,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Rectangle(
          extent={{-38,40},{42,-48}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-48,8},{-44,8},{-30,8},{-38,-4},{-30,-14},{-48,-14},{-38,-4},
              {-48,8}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-18,48},{20,32}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-16,-40},{22,-56}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{30,10},{56,-14}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{34,-10},{42,10},{52,-10}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-20,22},{-20,-24},{28,-24}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-20,-22},{-16,-14},{-4,4},{-2,6},{6,12},{16,16},{24,16}},
          color={0,0,255},
          smooth=Smooth.None)}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p><b><span style=\"color: #008000;\">1. Purpose of model</span></b></p>
<p>Simple heat pump with power input specified externally.</p>
<p><b><span style=\"color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p>Efficiency calculation based on Carnot efficiency. </p>
<p>Relative difference to Carnot efficiency at reference point kept at all operating points </p>
<p><b><span style=\"color: #008000;\">3. Limits of validity </span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">4. Interfaces</span></b></p>
<p>&nbsp;&nbsp; TransiEnt.Basics.Interfaces.Thermal.TemperatureIn_K T_set</p>
<p>&nbsp;&nbsp; TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_set_el</p>
<p>&nbsp;&nbsp; TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateOut Heat_output</p>
<p><b><span style=\"color: #008000;\">5. Nomenclature</span></b></p>
<p>(no elements)</p>
<p><b><span style=\"color: #008000;\">6. Governing Equations</span></b></p>
<p>COP_Carnot=(T_set+Delta_T_internal)/max(2*Delta_T_internal, T_set + 2*Delta_T_internal - T_source_internal)</p>
<p>COP=COP_Carnot*eta_HP</p>
<p><b><span style=\"color: #008000;\">7. Remarks for Usage</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">8. Validation</span></b></p>
<p>not validated yet</p>
<p><b><span style=\"color: #008000;\">9. References</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">10. Version History</span></b></p>
<p>Model from TransiEnt 1.1.0 modified by Anne Hagemeier (anne.hagemeier@umsicht.fraunhofer.de), Jan 2019</p>
</html>"));
end Heatpump;
