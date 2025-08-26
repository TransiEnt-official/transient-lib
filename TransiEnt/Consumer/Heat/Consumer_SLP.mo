within TransiEnt.Consumer.Heat;
model Consumer_SLP "Simple model of a thermal consumer"

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
 parameter SI.PressureDifference delta_p_nom = 0.1e5 "Nominal pressure difference of the valve inside the consumer";
 parameter SI.MassFlowRate m_flow_nom = 0.18 "Nominal mass flow rate of the water (used in the valve)";
 parameter SI.HeatFlowRate Q_flow_nom = 8e3 "Nominal heat flow rate (used in the heat exchanger)";
 parameter SI.HeatFlowRate Q_flow_Ref = 6.0563e3;
 parameter SI.Temperature T_room=295.15 "Set value for room temperature";
 //parameters of controller
 parameter SI.Time tau_i = 1000 "Constant for integrator part of PI-controller";
 parameter Real k = 20 "Constant for proportional part of PI-controller";
 parameter Real y_max = m_flow_nom "Max. opening of valve";//10, m_flow_nom
 parameter Real y_min = 0.0001 "Min. opening of valve";
 parameter Real cp=4186;

  // _____________________________________________
  //
  //          Visible Parameters
  // _____________________________________________

 SI.HeatFlowRate Q_flow_C "Consumed heat flow rate, just for evaluation";

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

  // _____________________________________________
  //
  //          Intances of other classes
  // _____________________________________________

  TransiEnt.Components.Heat.SimplePump pump annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,26})));
  TransiEnt.Components.Heat.HeatExchanger_simple heatExchanger annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,0})));
 Modelica.Blocks.Sources.RealExpression SetTemperature2(y=heatExchanger.T_r)
                                                                            annotation (
   Placement(visible = true, transformation(origin={24,44},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    tableName="default",
    fileName="C:/Users/cjw1704/Documents/Data_files/WaermelastRissen.txt",
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) annotation (Placement(transformation(extent={{28,-10},
            {8,10}})));
  Modelica.Blocks.Math.Gain gain(k=Q_flow_nom/Q_flow_Ref)
    annotation (Placement(transformation(extent={{-12,-10},{-32,10}})));
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
   Placement(transformation(extent={{14,58},{-6,78}})));
 Modelica.Blocks.Sources.RealExpression SetTemperature1(y=273.15 + 58)      annotation (
   Placement(visible = true, transformation(origin={40,68},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  Q_flow_C=-heatExchanger.Q_flow;
  connect(inlet, pump.inlet) annotation (Line(points={{-100,40},{-54,40},{-54,36.2}}, color={0,0,0}));
  connect(pump.outlet, heatExchanger.inlet)
    annotation (Line(points={{-54,15.8},{-54,10}}, color={0,0,0}));
  connect(heatExchanger.outlet, outlet)
    annotation (Line(points={{-54,-10},{-54,-40},{-100,-40}}, color={0,0,0}));
  connect(PID1.u_s, SetTemperature1.y)
    annotation (Line(points={{16,68},{29,68}}, color={0,0,127}));
  connect(SetTemperature2.y, PID1.u_m)
    annotation (Line(points={{13,44},{4,44},{4,56}}, color={0,0,127}));
  connect(combiTimeTable.y[1], gain.u)
    annotation (Line(points={{7,0},{-10,0}}, color={0,0,127}));
  connect(gain.y, heatExchanger.Q_flow)
    annotation (Line(points={{-33,0},{-44,0}}, color={0,0,127}));

  connect(PID1.y, pump.m_flow)
    annotation (Line(points={{-7,68},{-48,68},{-48,35.4}}, color={0,0,127}));
 annotation (
   Icon(coordinateSystem(extent={{-100,-100},{180,100}}),      graphics={  Ellipse(extent = {{100, -100}, {-100, 100}}, endAngle = 360), Line(origin = {-10, 10}, points = {{-70, -70}, {70, 70}, {70, 70}}), Line(origin = {10, -10}, points = {{-70, -70}, {70, 70}})}),
   Diagram(coordinateSystem(extent={{-100,-100},{180,100}})),
    experiment(StopTime=604800, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a heat consumer for district heating networks. It consists of a pump, a heat exchanger and a P-controller. The P-Controller sets the mass flow rate through the pump so that the return temperature of the district heating network is kept constant. The heat is transported from the heat carrier through the heat exchanger. With a combi time table the consumed heat flow is set. A gain model is used to normalize the heat flow rate according to a given Q_flow_nom, which can be set by the user. </p>
<p>This consumer model is used for the simulation of district heating networks. It calculates the mass flow rate flowing through the consumer, which is important for the numerics of a district heating network simulation. Therefore, a pressure difference has to be given by the hydraulic grid. The mass flow rate is limited by a parameter (m_flow_nom) inside the P-Controller. The calculation of the mass flow rate is independent of the pressure difference at the inlet and outlet. Therefore, the user has to pick sensible pressure values inside the hydraulic grid. An example of a pressure control is given in... </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<ul>
<li>P-controler</li>
<li>Heat losses from the building to the environemnt</li>
<li>Heat transport through the heat exchanger</li>
</ul>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model is based on the model Consumer.Consumer</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end Consumer_SLP;
