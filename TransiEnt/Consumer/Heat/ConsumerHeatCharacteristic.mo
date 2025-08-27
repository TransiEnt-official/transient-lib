within TransiEnt.Consumer.Heat;
model ConsumerHeatCharacteristic "Simple model of a thermal consumer with a heat characteristic in between heat exchanger and building capacity"

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

 parameter Real G = 155.737 "Thermal Conuctivity of the thermal resistor";
 parameter SI.HeatCapacity C = 570000 "Thermal capacity of the heat capacitor";
 parameter SI.PressureDifference delta_p_nom = 0.001e5 "Nominal pressure difference of the valve inside the consumer";
 parameter SI.MassFlowRate m_flow_nom = 0.18 "Nominal mass flow rate of the water (used in the valve)";
 parameter SI.HeatFlowRate Q_flow_nom = 8e3 "Nominal heat flow rate (used in the heat exchanger)";
 parameter SI.Temperature T_room=295.15 "Set value for room temperature";
 //parameters of controller
 parameter SI.Time tau_i = 1000 "Constant for integrator part of PI-controller";
 parameter Real k = 20 "Constant for proportional part of PI-controller";
 parameter Real y_max = m_flow_nom "Max. opening of valve";//10, m_flow_nom
 parameter Real y_min = 0.0001 "Min. opening of valve";
 parameter Real cp=4186;

  // _____________________________________________
  //
  //          Variables
  // _____________________________________________

 SI.HeatFlowRate Q_flow_C;

  // _____________________________________________
  //
  //         Interfaces
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
        origin={186,0})));

  // _____________________________________________
  //
  //         Instances of other classes
  // _____________________________________________

 Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = C) annotation (
   Placement(visible = true, transformation(origin={32,10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 TransiEnt.Components.Heat.SimplePump pump annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-58,26})));
 Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = G) annotation (
   Placement(visible = true, transformation(origin={62,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature AmbientTemperature1
                                                                                 annotation (
    Placement(transformation(extent={{108,-10},{88,10}})));
  Modelica.Blocks.Sources.RealExpression SetTemperature(y=T_room - 273.15)   annotation (
   Placement(visible = true, transformation(origin={22,64},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
 Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor1 annotation (
   Placement(visible = true, transformation(origin={12,-22},   extent = {{-6, -6}, {6, 6}}, rotation = 180)));
 TransiEnt.Components.Heat.HeatExchanger heatExchanger1(V=0.01, m_flow_nom=m_flow_nom, Q_flow_nom=Q_flow_nom, n=1)                                                                                        annotation (Placement(visible=true, transformation(
        origin={-58,-2},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
 Modelica.Blocks.Continuous.LimPID PID1(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=k,
    Ti=100,
    Td=0.1,
    yMax=10*y_max,
    yMin=y_min,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0.001,
    strict=true)                                                                                                                                                   annotation (
   Placement(transformation(extent={{-6,54},{-26,74}})));
  TransiEnt.Consumer.Heat.HeatCharacteristic heizkurveR annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
equation

  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

  Q_flow_C=heatExchanger1.heatPort.Q_flow;
  connect(heatExchanger1.outlet, outlet) annotation (Line(points={{-58,-12},{-58,-40},{-100,-40}}));
  connect(heatExchanger1.inlet, pump.outlet) annotation (Line(points={{-58,8},{-58,15.8}},  color={0,0,0}));
  connect(inlet, pump.inlet) annotation (Line(points={{-100,40},{-58,40},{-58,36.2}}, color={0,0,0}));
  connect(PID1.u_s, SetTemperature.y) annotation (Line(points={{-4,64},{11,64}},  color={0,0,127}));
  connect(temperatureSensor1.port, heatCapacitor1.port) annotation (Line(points={{18,-22},{32,-22},{32,0}},                         color={191,0,0}));
  connect(temperatureSensor1.T, PID1.u_m) annotation (Line(points={{6,-22},{-16,-22},{-16,52}},                    color={0,0,127}));
  connect(PID1.y, pump.m_flow) annotation (Line(points={{-27,64},{-52,64},{-52,35.4}}, color={0,0,127}));
  connect(thermalConductor1.port_b, AmbientTemperature1.port) annotation (Line(points={{72,0},{88,0}},                 color={191,0,0}));
  connect(thermalConductor1.port_a, heatCapacitor1.port) annotation (Line(points={{52,0},{32,0}}, color={191,0,0}));
  connect(heizkurveR.heatPortDHN_R, heatExchanger1.heatPort) annotation (Line(points={{-39.7,0.1},{-48,0.1},{-48,-2}},  color={191,0,0}));
  connect(heizkurveR.heatPortHouse, heatCapacitor1.port) annotation (Line(points={{-20,0.2},{16,0.2},{16,0},{32,0}}, color={191,0,0}));
  connect(T_outdoor_K, AmbientTemperature1.T) annotation (Line(points={{186,0},{110,0}},                   color={0,0,127}));
  connect(T_outdoor_K, heizkurveR.Toutdoor) annotation (Line(points={{186,0},{152,0},{152,64},{42,64},{42,32},{-30,32},{-30,10.6}}, color={0,0,127}));
 annotation (
   Icon(coordinateSystem(extent={{-100,-100},{180,100}}),      graphics={  Ellipse(extent = {{100, -100}, {-100, 100}}, endAngle = 360), Line(origin = {-10, 10}, points = {{-70, -70}, {70, 70}, {70, 70}}), Line(origin = {10, -10}, points = {{-70, -70}, {70, 70}})}),
   Diagram(coordinateSystem(extent={{-100,-100},{180,100}})),
    experiment(StopTime=604800, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a district heating network consumer. It contains a P-Controller, a pump, a heat exchanger, a thermal capacity and a heat conductance. The P-Controller sets the mass flow rate through the pump so that the temperature of the thermal capacity is kept constant. The thermal capacity represents the thermal capacity of the building. Heat losses are calculated with the thermal resistance and the temperature difference between the thermal capacity and the ambient temperature. The ambient temperature is set with a RealInput.</p>
<p>The difference to the consumer and Consumer_SLP model is that the supply and the return temperature of the building are calculated from the heat caracteristics of the building. </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<ul>
<li>P-controler</li>
<li>heat losses from the building to the environemnt</li>
<li>a thermal capacity of the buildings</li>
</ul>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model was used in the following publication:</p>
<p>[1]Vieth, J.; Westphal, J.; Speerforck, A.; District heating network topology optimization and optimal co-planning using dynamic simulations; Advances in Applied Energy; 2025</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end ConsumerHeatCharacteristic;
