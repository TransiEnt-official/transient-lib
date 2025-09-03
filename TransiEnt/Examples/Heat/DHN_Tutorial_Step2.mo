within TransiEnt.Examples.Heat;
model DHN_Tutorial_Step2

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
  //          Imports and Class Hierarchy
  // _____________________________________________

  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{-56,68},{-36,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=6e5) annotation (Placement(transformation(extent={{-84,68},{-64,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=heatpump1.inlet.m_flow*((4186*60) - inStream(heatpump1.inlet.h_outflow)))          annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=0.1e5)
                                                                annotation (Placement(transformation(extent={{-60,42},{-40,62}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=topologyA_Ports.consumer_9.inlet.p - topologyA_Ports.consumer_9.outlet.p)       annotation (Placement(transformation(extent={{-60,22},{-40,42}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10,
    Ti=1000,
    yMax=24e5,
    yMin=0.0001) annotation (Placement(transformation(extent={{-28,42},{-8,62}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump_DHN heatpump1(
    COP_n=3.5,                                                       P_el_max(displayUnit="MW") = 200000000, P_el_min=0.00001) annotation (Placement(transformation(extent={{-14,-20},{6,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=60)                              annotation (Placement(transformation(extent={{-60,4},{-40,24}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyA_Ports topologyA_Ports annotation (Placement(transformation(
        extent={{-31,-16},{31,16}},
        rotation=90,
        origin={77,-10})));
equation
  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(sink.p_in,realExpression. y) annotation (Line(points={{-54,78},{-54,78},{-63,78}},                  color={0,0,127}));
  connect(PID.y,heatpump1. dp) annotation (Line(points={{-7,52},{-4,52},{-4,0}},                                color={0,0,127}));
  connect(realExpression6.y,PID. u_s) annotation (Line(points={{-39,52},{-30,52}},     color={0,0,127}));
  connect(realExpression7.y,PID. u_m) annotation (Line(points={{-39,32},{-18,32},{-18,40}},       color={0,0,127}));
  connect(realExpression3.y,heatpump1. T_set_variable) annotation (Line(points={{-39,14},{-8,14},{-8,0}},          color={0,0,127}));
  connect(realExpression9.y,heatpump1. Q_flow_set) annotation (Line(points={{-39,-10},{-12,-10}},                                    color={0,0,127}));
  connect(heatpump1.outlet, topologyA_Ports.inlet) annotation (Line(points={{5.8,-4},{54,-4},{54,-12.8},{61.2,-12.8}}, color={0,0,0}));
  connect(heatpump1.inlet, topologyA_Ports.outlet) annotation (Line(points={{6,-16.2},{56,-16.2},{56,-7},{61.2,-7}}, color={0,0,0}));
  connect(sink.port_a, topologyA_Ports.inlet) annotation (Line(points={{-36,78},{22,78},{22,-4},{54,-4},{54,-12.8},{61.2,-12.8}}, color={0,0,0}));
  annotation (experiment(StopTime=172800, __Dymola_Algorithm="Dassl"), Icon(graphics={
                                   Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}), Polygon(
          origin={22,14},
          lineColor={78,138,73},
          fillColor={0,124,124},
          fillPattern=FillPattern.Solid,
          points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A tutorial for the modeling of district heating networks with the TransiEnt Library. Step 2 is about setting up a pressure control for the DHN. </p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The written Tutorial can be found on the TransiEnt website: https://www.tuhh.de/transient-ee/tutorials</p>
</html>"));
end DHN_Tutorial_Step2;
