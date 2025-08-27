within TransiEnt.Consumer.Heat;
model Consumer_LowTemperatureDHN "Simple model of a thermal consumer for a low temperature DHN"

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

  // _____________________________________________
  //
  //          Import and Hierachy
  // _____________________________________________

 import      Modelica.Units.SI;

  // _____________________________________________
  //
  //          Visible Parameters
  // _____________________________________________

 parameter Real multiplicationFactor = 1 "Factor for the heat flow rate multiplication (for upscaling of consumer)";
 parameter Real G = 155.737 "Thermal Conuctivity of the thermal resistor";
 parameter SI.HeatCapacity C = 570000 "Thermal capacity of the heat capacitor";
 parameter SI.PressureDifference delta_p_nom = 0.1e5 "Nominal pressure difference of the valve inside the consumer";
 parameter SI.MassFlowRate m_flow_nom = 0.18 "Nominal mass flow rate of the water (used in the valve)";
 parameter SI.HeatFlowRate Q_flow_nom = 8e3 "Nominal heat flow rate (used in the heat exchanger)";
 parameter SI.Temperature T_room=295.15 "Set value for room temperature";
 //parameters of controller
 parameter SI.Time tau_i = 1000 "Constant for integrator part of PI-controller";
 parameter Real k = 20 "Constant for proportional part of PI-controller";
 parameter Real y_max = 3*m_flow_nom "Max. opening of valve";//10, m_flow_nom
 parameter Real y_min = 0.0001 "Min. opening of valve";
 parameter Real cp=4186;
 parameter String DHWfileName="Data_files/dhw_demand_w_dym.txt";
 parameter String DHWtableName="tab1";
 SI.HeatFlowRate Q_flow_C;

  // _____________________________________________
  //
  //          Interfaces
  // _____________________________________________

 TransiEnt.Basics.Interfaces.Thermal.inlet inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
 TransiEnt.Basics.Interfaces.Thermal.outlet outlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,-40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
 Modelica.Blocks.Interfaces.RealInput T_outdoor_K annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={188,0})));

  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

 Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = C) annotation (
   Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = G) annotation (
   Placement(visible = true, transformation(origin={62,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 TransiEnt.Components.Heat.HeatFlowMultiplier heatFlowMultiplier(factor=multiplicationFactor) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-2,0})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature AmbientTemperature1
                                                                                 annotation (
    Placement(transformation(extent={{104,-10},{84,10}})));
  TransiEnt.Components.Heat.SimplePump pump annotation (Placement(transformation(
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

  TransiEnt.Consumer.Heat.HeatCharacteristicDoublePort heatCharacteristicsDoublePort annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));

equation
  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

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
  connect(heatCharacteristicsDoublePort.heatPortHouse, heatFlowMultiplier.port_b) annotation (Line(points={{-18,0.2},{-15,0.2},{-15,0},{-12,0}}, color={191,0,0}));
  connect(heatCharacteristicsDoublePort.heatPortDHN_S, heatPump.heatPortS) annotation (Line(points={{-37.9,2.1},{-37.9,2},{-44,2}}, color={191,0,0}));
  connect(heatCharacteristicsDoublePort.heatPortDHN_R, heatPump.heatPortR) annotation (Line(points={{-37.9,-1.9},{-38,-2},{-44,-2}}, color={191,0,0}));
  connect(T_outdoor_K, AmbientTemperature1.T) annotation (Line(points={{188,0},{106,0}}, color={0,0,127}));
  connect(T_outdoor_K, heatCharacteristicsDoublePort.Toutdoor) annotation (Line(points={{188,0},{114,0},{114,24},{-28,24},{-28,10.6}}, color={0,0,127}));
 annotation (
   Icon(coordinateSystem(extent={{-100,-100},{180,100}}),      graphics={  Ellipse(extent = {{100, -100}, {-100, 100}}, endAngle = 360), Line(origin = {-10, 10}, points = {{-70, -70}, {70, 70}, {70, 70}}), Line(origin = {10, -10}, points = {{-70, -70}, {70, 70}})}),
   Diagram(coordinateSystem(extent={{-100,-100},{180,100}})),
    experiment(StopTime=604800, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a low temperature district heating network consumer. It contains a P-Controller, a pump, a heat exchanger, a thermal capacity and a heat conductance. The heat exchanger contains an integrated heat pump to increase the temperature of the heat source. The P-Controller sets the mass flow rate through the pump so that the temperature of the thermal capacity is kept constant. The thermal capacity represents the thermal capacity of the building. Heat losses are calculated with the thermal resistance and the temperature difference between the thermal capacity and the ambient temperature. The ambient temperature is set with a RealInput.</p>
<p>The difference to the consumer and Consumer_SLP model is that the supply and the return temperature of the building are calculated from the heat characteristics of the building. </p>
<p>The difference to the ConsumerHeatCharacteristic model is that the heat exchanger model has an integrated heat pump. </p>
<p>The model ist based on TransiEnt.Consumer.Heat.ConsumerHeatCharacteristic.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<ul>
<li>P-controler</li>
<li>heat losses from the building to the environemnt</li>
<li>a thermal capacity of the buildings</li>
</ul>
<h4><span style=\"color: #008c48\">References</span></h4>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end Consumer_LowTemperatureDHN;
