within TransiEnt.Consumer.Heat;
model Consumer_LowTemperatureDHN "Simple model of a thermal consumer for a low temperature DHN"
 //import and hierachy
 import      Modelica.Units.SI;
 //parameter
 parameter Real multiplicationFactor = 1 "Factor for the heat flow rate multiplication (for upscaling of consumer)";
 parameter Real G = 155.737 "Thermal Conuctivity of the thermal resistor";
 //0.5e3
 parameter SI.HeatCapacity C = 570000 "Thermal capacity of the heat capacitor";
 //300
 parameter SI.PressureDifference delta_p_nom = 0.1e5 "Nominal pressure difference of the valve inside the consumer";
 parameter SI.MassFlowRate m_flow_nom = 0.18 "Nominal mass flow rate of the water (used in the valve)";
 parameter SI.HeatFlowRate Q_flow_nom = 8e3 "Nominal heat flow rate (used in the heat exchanger)";
 parameter SI.Temperature T_room=295.15 "Set value for room temperature";
 //parameters of controller
 parameter SI.Time tau_i = 1000 "Constant for integrator part of PI-controller";
 //1000
 parameter Real k = 20 "Constant for proportional part of PI-controller";
 //10
 parameter Real y_max = 3*m_flow_nom "Max. opening of valve";//10, m_flow_nom
 parameter Real y_min = 0.0001 "Min. opening of valve";
 parameter Real cp=4186;
 parameter String DHWfileName="Data_files/dhw_demand_w_dym.txt";
 parameter String DHWtableName="tab1";
 SI.HeatFlowRate Q_flow_C;

 //instances of other classes
 DistrictHeatingGridsNew.Interfaces.FluidPortIn inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
 DistrictHeatingGridsNew.Interfaces.FluidPortOut outlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,-40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
 Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = C) annotation (
   Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = G) annotation (
   Placement(visible = true, transformation(origin={62,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 DistrictHeatingGridsNew.Interfaces.HeatFlowMultiplier heatFlowMultiplier(factor=multiplicationFactor) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-2,0})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature AmbientTemperature1
                                                                                 annotation (
    Placement(transformation(extent={{104,-10},{84,10}})));
  DistrictHeatingGridsNew.Components.Pump pump annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,26})));
 Modelica.Blocks.Sources.RealExpression SetTemperature(y=T_room - 273.15)   annotation (
   Placement(visible = true, transformation(origin={4,64},     extent = {{10, -10}, {-10, 10}}, rotation = 0)));
 Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation (
   Placement(visible = true, transformation(origin={0,-22},    extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  TransiEnt.Components.Heat.HeatPump_LowTemperatureDHN heatPump annotation (Placement(visible=true, transformation(
        origin={-54,0},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
 Modelica.Blocks.Continuous.LimPID PID1(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    Ti=tau_i,
    Td=0.1,
    yMax=y_max,
    yMin=y_min,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0.001,
    strict=true)                                                                                                                                                   annotation (
   Placement(transformation(extent={{-16,54},{-36,74}})));

  DistrictHeatingGridsNew.Consumer.HeatCharacteristicDoublePort heizkurveDoublePort annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));
  Modelica.Blocks.Interfaces.RealInput T_outdoor_K annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={188,0})));
equation
  Q_flow_C=heatPump.heatPortS.Q_flow;
  connect(heatPump.outlet, outlet) annotation (Line(points={{-54,-10},{-54,-40},{-100,-40}}));
 connect(heatFlowMultiplier.port_a, heatCapacitor1.port) annotation (
   Line(points={{8,0},{30,0}},                                              color = {191, 0, 0}));
  connect(heatPump.inlet, pump.outlet) annotation (Line(points={{-54,10},{-54,15.8}}, color={0,0,0}));
  connect(inlet, pump.inlet) annotation (Line(points={{-100,40},{-54,40},{-54,36.2}}, color={0,0,0}));
  connect(PID1.u_s, SetTemperature.y) annotation (Line(points={{-14,64},{-7,64}}, color={0,0,127}));
  connect(temperatureSensor1.port, heatCapacitor1.port) annotation (Line(points={{6,-22},{10,-22},{10,-12},{14,-12},{14,0},{30,0}}, color={191,0,0}));
  connect(temperatureSensor1.T, PID1.u_m) annotation (Line(points={{-6,-22},{-12,-22},{-12,36},{-26,36},{-26,52}}, color={0,0,127}));
  connect(PID1.y, pump.m_flow) annotation (Line(points={{-37,64},{-48,64},{-48,35.4}}, color={0,0,127}));
  connect(thermalConductor1.port_b, AmbientTemperature1.port) annotation (Line(points={{72,0},{84,0}},                 color={191,0,0}));
  connect(thermalConductor1.port_a, heatCapacitor1.port) annotation (Line(points={{52,0},{30,0}}, color={191,0,0}));
  connect(heizkurveDoublePort.heatPortHouse, heatFlowMultiplier.port_b) annotation (Line(points={{-18,0.2},{-15,0.2},{-15,0},{-12,0}}, color={191,0,0}));
  connect(heizkurveDoublePort.heatPortDHN_S, heatPump.heatPortS) annotation (Line(points={{-38,2},{-38,2},{-44,2}}, color={191,0,0}));
  connect(heizkurveDoublePort.heatPortDHN_R, heatPump.heatPortR) annotation (Line(points={{-37.9,-1.9},{-38,-2},{-44,-2}}, color={191,0,0}));
  connect(T_outdoor_K, AmbientTemperature1.T) annotation (Line(points={{188,0},{106,0}}, color={0,0,127}));
  connect(T_outdoor_K, heizkurveDoublePort.Toutdoor) annotation (Line(points={{188,0},{114,0},{114,24},{-28,24},{-28,10.6}}, color={0,0,127}));
 annotation (
   Icon(coordinateSystem(extent={{-100,-100},{180,100}}),      graphics={  Ellipse(extent = {{100, -100}, {-100, 100}}, endAngle = 360), Line(origin = {-10, 10}, points = {{-70, -70}, {70, 70}, {70, 70}}), Line(origin = {10, -10}, points = {{-70, -70}, {70, 70}})}),
   Diagram(coordinateSystem(extent={{-100,-100},{180,100}})),
    experiment(StopTime=604800, __Dymola_Algorithm="Dassl"));
end Consumer_LowTemperatureDHN;
