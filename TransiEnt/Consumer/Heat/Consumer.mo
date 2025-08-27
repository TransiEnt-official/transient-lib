within TransiEnt.Consumer.Heat;
model Consumer "Simple model of a thermal consumer"

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
  //             Visible Parameters
  // _____________________________________________

 parameter Real multiplicationFactor = 1 "Factor for the heat flow rate multiplication (for upscaling of consumer)";
 parameter Real G = 155.737 "Thermal Conuctivity of the thermal resistor";
 parameter SI.HeatCapacity C = 570000 "Thermal capacity of the heat capacitor";
 parameter SI.PressureDifference delta_p_nom = 0.1e5 "Nominal pressure difference of the valve inside the consumer";
 parameter SI.MassFlowRate m_flow_nom = 0.18 "Nominal mass flow rate of the water (used in the valve)";
 parameter SI.HeatFlowRate Q_flow_nom = 8e3 "Nominal heat flow rate (used in the heat exchanger)";
 parameter SI.Temperature T_room=295.15 "Set value for room temperature";
 parameter Real cp=4186;
 //parameters of controller
 parameter SI.Time tau_i = 1000 "Constant for integrator part of PI-controller";
 parameter Real k = 20 "Constant for proportional part of PI-controller";
 parameter Real y_max = m_flow_nom "Max. opening of valve";//10, m_flow_nom
 parameter Real y_min = 0.0001 "Min. opening of valve";

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

 SI.HeatFlowRate Q_flow_C;

  // _____________________________________________
  //
  //            Instances of other classes
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
 Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = C) annotation (
   Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = G) annotation (
   Placement(visible = true, transformation(origin={62,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 TransiEnt.Components.Heat.HeatFlowMultiplier heatFlowMultiplier(factor=multiplicationFactor) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-26,0})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature AmbientTemperature1
                                                                                 annotation (
    Placement(transformation(extent={{110,46},{90,66}})));
  TransiEnt.Components.Heat.SimplePump pump annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,26})));
 Modelica.Blocks.Sources.RealExpression SetTemperature(y=T_room - 273.15)   annotation (
   Placement(visible = true, transformation(origin={4,64},     extent = {{10, -10}, {-10, 10}}, rotation = 0)));
 Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation (
   Placement(visible = true, transformation(origin={0,-22},    extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  TransiEnt.Components.Heat.HeatExchanger heatExchanger1(V=0.01, Q_flow_nom=Q_flow_nom) annotation (Placement(visible=true, transformation(
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
    y_start=0.1,
    strict=true)                                                                                                                                                   annotation (
   Placement(transformation(extent={{-14,54},{-34,74}})));
 Modelica.Blocks.Sources.RealExpression SetTemperature2(y=273.15 - 4.4)     annotation (
   Placement(visible = true, transformation(origin={130,38},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
 Modelica.Blocks.Sources.RealExpression SetTemperature3(y=273.15 + 2.2)     annotation (
   Placement(visible = true, transformation(origin={128,20},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
 Modelica.Blocks.Sources.RealExpression SetTemperature4(y=273.15 + 8.8)     annotation (
   Placement(visible = true, transformation(origin={128,0},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid(
    amplitude=-5,
    rising=3600,
    width=7200,
    falling=3600,
    period=14400,
    nperiod=1,
    offset=273.15,
    startTime=86400)
    annotation (Placement(transformation(extent={{128,76},{148,96}})));
equation

  // _____________________________________________
  //
  //            Characteristic Equations
  // _____________________________________________

  Q_flow_C=heatExchanger1.heatPort.Q_flow;

  connect(heatExchanger1.outlet, outlet) annotation (Line(points={{-54,-10},{-54,-40},{-100,-40}}));
 connect(heatExchanger1.heatPort, heatFlowMultiplier.port_b) annotation (
   Line(points = {{-44, -1.83187e-15}, {-40, -1.83187e-15}, {-40, 5.55112e-16}, {-36, 5.55112e-16}}, color = {191, 0, 0}));
 connect(heatFlowMultiplier.port_a, heatCapacitor1.port) annotation (
   Line(points = {{-16, -5.55112e-16}, {7, -5.55112e-16}, {7, 0}, {30, 0}}, color = {191, 0, 0}));
  connect(heatExchanger1.inlet, pump.outlet) annotation (Line(points={{-54,10},{-54,15.8}}, color={0,0,0}));
  connect(inlet, pump.inlet) annotation (Line(points={{-100,40},{-54,40},{-54,36.2}}, color={0,0,0}));
  connect(PID1.u_s, SetTemperature.y) annotation (Line(points={{-12,64},{-7,64}}, color={0,0,127}));
  connect(temperatureSensor1.port, heatCapacitor1.port) annotation (Line(points={{6,-22},{10,-22},{10,-12},{14,-12},{14,0},{30,0}}, color={191,0,0}));
  connect(temperatureSensor1.T, PID1.u_m) annotation (Line(points={{-6,-22},{-12,-22},{-12,36},{-24,36},{-24,52}}, color={0,0,127}));
  connect(PID1.y, pump.m_flow) annotation (Line(points={{-35,64},{-48,64},{-48,35.4}}, color={0,0,127}));
  connect(thermalConductor1.port_b, AmbientTemperature1.port) annotation (Line(points={{72,0},{
          84,0},{84,56},{90,56}},                                                                                      color={191,0,0}));
  connect(thermalConductor1.port_a, heatCapacitor1.port) annotation (Line(points={{52,0},{30,0}}, color={191,0,0}));
  connect(trapezoid.y, AmbientTemperature1.T) annotation (Line(points={{149,86},
          {158,86},{158,62},{112,62},{112,56}}, color={0,0,127}));
 annotation (
   Icon(coordinateSystem(extent={{-100,-100},{180,100}}),      graphics={  Ellipse(extent = {{100, -100}, {-100, 100}}, endAngle = 360), Line(origin = {-10, 10}, points = {{-70, -70}, {70, 70}, {70, 70}}), Line(origin = {10, -10}, points = {{-70, -70}, {70, 70}})}),
   Diagram(coordinateSystem(extent={{-100,-100},{180,100}})),
    experiment(StopTime=604800, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a heat consumer for district heating networks. It consists of a pump, a heat exchanger, a thermal capacity, a thermal conductor and a P-controller. The P-Controller sets the mass flow rate through the pump so that the temperature of the thermal capacity (which represents the room temperature of the building) is kept constant. The heat carrier flows through the inlet, the pump and the heat exchanger, from where the heat is transported to the thermal capacity. The thermal capacity is connected with a thermal conductor via a heat port. A heat flow rate is calculated with a temperature difference between the thermal capacity and a temperature boundary that defines an ambient temperature. </p>
<p>This consumer model is used for the simulation of district heating networks. It calculates the mass flow rate flowing through the consumer, which is important for the numerics of a district heating network simulation. Therefore, a pressure difference has to be given by the hydraulic grid. The mass flow rate is limited by a parameter (m_flow_nom) inside the P-Controller. The calculation of the mass flow rate is independent of the pressure difference at the inlet and outlet. Therefore, the user has to pick sensible pressure values inside the hydraulic grid. An example of a pressure control is given in: TransiEnt.Examples.Heat.Largescale_DHN</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<ul>
<li>P-controler</li>
<li>heat losses from the building to the environemnt</li>
<li>a thermal capacity of the buildings</li>
</ul>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model was used and verified in the following publication:</p>
<p>[1] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end Consumer;
