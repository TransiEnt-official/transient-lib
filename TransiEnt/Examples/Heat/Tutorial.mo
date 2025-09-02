within TransiEnt.Examples.Heat;
model Tutorial


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
  Modelica.Blocks.Sources.RealExpression realExpression9(y=heatpump1.inlet.m_flow*((4200*trapezoid.y) - inStream(heatpump1.inlet.h_outflow))) annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=1.8e5)
                                                                annotation (Placement(transformation(extent={{-38,24},{-18,44}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump_DHN heatpump1(P_el_max(displayUnit="MW") = 200000000, P_el_min=0.00001) annotation (Placement(transformation(extent={{-14,-20},{6,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=heatpump1.outlet.h_outflow/4186) annotation (Placement(transformation(extent={{-60,4},{-40,24}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyA_Ports topologyA_Ports annotation (Placement(transformation(
        extent={{-31,-16},{31,16}},
        rotation=90,
        origin={77,-10})));
  Modelica.Blocks.Sources.Trapezoid trapezoid(
    amplitude=6,
    rising=3600,
    width=7200,
    falling=3600,
    period=24400,
    nperiod=1,
    offset=60,
    startTime=43200)
    annotation (Placement(transformation(extent={{-86,34},{-66,54}})));
equation


  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________
  connect(sink.p_in,realExpression. y) annotation (Line(points={{-54,78},{-54,78},{-63,78}},                  color={0,0,127}));
  connect(realExpression3.y,heatpump1. T_set_variable) annotation (Line(points={{-39,14},{-8,14},{-8,0}},          color={0,0,127}));
  connect(realExpression9.y,heatpump1. Q_flow_set) annotation (Line(points={{-39,-10},{-12,-10}},                                    color={0,0,127}));
  connect(heatpump1.outlet, topologyA_Ports.inlet) annotation (Line(points={{5.8,-4},{54,-4},{54,-12.8},{61.2,-12.8}}, color={0,0,0}));
  connect(heatpump1.inlet, topologyA_Ports.outlet) annotation (Line(points={{6,-16.2},{56,-16.2},{56,-7},{61.2,-7}}, color={0,0,0}));
  connect(sink.port_a, topologyA_Ports.inlet) annotation (Line(points={{-36,78},{22,78},{22,-4},{54,-4},{54,-12.8},{61.2,-12.8}}, color={0,0,0}));
  connect(realExpression6.y, heatpump1.dp) annotation (Line(points={{-17,34},{-4,34},{-4,0}}, color={0,0,127}));
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
          points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
end Tutorial;
