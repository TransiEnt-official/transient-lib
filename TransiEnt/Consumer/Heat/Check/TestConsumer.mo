within TransiEnt.Consumer.Heat.Check;
model TestConsumer "Test model for the consumer"

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
  //          Import and Class Hierachy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Checkmodel;


  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink(h=60*4186) annotation (Placement(transformation(extent={{-52,70},{-72,90}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=1.1e5)
                                                             annotation (Placement(transformation(extent={{-96,70},{-76,90}})));
  DistrictHeatingGridsNew.Consumer.Consumer_HeatFlow consumer_HeatFlow(
    multiplicationFactor=3.4,
    m_flow_nom=0.139,
    Q_flow_nom(displayUnit="kW") = 17500)                              annotation (Placement(transformation(extent={{-10,40},{18,60}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink1 annotation (Placement(transformation(extent={{-50,28},{-70,48}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=1e5)
                                                             annotation (Placement(transformation(extent={{-96,28},{-76,48}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink2(h=60*4186) annotation (Placement(transformation(extent={{-48,-32},{-68,-12}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1.1e5)
                                                             annotation (Placement(transformation(extent={{-96,-32},{-76,-12}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink3 annotation (Placement(transformation(extent={{-48,-68},{-68,-48}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1e5)
                                                             annotation (Placement(transformation(extent={{-96,-68},{-76,-48}})));
  TransiEnt.Consumer.Heat.Consumer consumer(
    multiplicationFactor=3.4,
    m_flow_nom=0.139,
    Q_flow_nom(displayUnit="kW") = 17500) annotation (Placement(transformation(extent={{-8,-54},{20,-34}})));
  Verification.Consumer_ClaRaHex consumer_ClaRaHex(
    multiplicationFactor=3.4,
    m_flow_nom=0.139,
    Q_flow_nom(displayUnit="kW") = 17500,
    k=0.01) annotation (Placement(transformation(extent={{14,-132},{42,-112}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_phxi boundaryVLE_phxi(
    variable_h=true,
    p_const=1.1e5,
    h_const=4186*60) annotation (Placement(transformation(extent={{-68,-130},{-48,-110}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_phxi boundaryVLE_phxi1(p_const=1e5, h_const=60*4186) annotation (Placement(transformation(extent={{-68,-156},{-48,-136}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{68,72},{88,92}})));
  Modelica.Blocks.Sources.Step step(
    height=10*4200,
    offset=60*4200,
    startTime=432000) annotation (Placement(transformation(extent={{-100,-130},{-80,-110}})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(realExpression4.y,sink. p_in) annotation (Line(points={{-75,80},{-72.5,80},{-72.5,79.8},{-70,79.8}},
                                                                                                           color={0,0,127}));
  connect(sink.port_a,consumer_HeatFlow. inlet) annotation (Line(points={{-52,80},{-16,80},{-16,54},{-10,54}},                         color={0,0,0}));
  connect(sink1.port_a, consumer_HeatFlow.outlet) annotation (Line(points={{-50,38},{-16,38},{-16,46},{-10,46}}, color={0,0,0}));
  connect(sink1.p_in, realExpression1.y) annotation (Line(points={{-68,37.8},{-71.5,37.8},{-71.5,38},{-75,38}}, color={0,0,127}));
  connect(realExpression2.y, sink2.p_in) annotation (Line(points={{-75,-22},{-64.5,-22},{-64.5,-22.2},{-66,-22.2}},
                                                                                                            color={0,0,127}));
  connect(sink3.p_in, realExpression3.y) annotation (Line(points={{-66,-58.2},{-65.5,-58.2},{-65.5,-58},{-75,-58}}, color={0,0,127}));
  connect(sink2.port_a, consumer.inlet) annotation (Line(points={{-48,-22},{-32,-22},{-32,-40},{-8,-40}},
                                                                                                      color={0,0,0}));
  connect(consumer.outlet, sink3.port_a) annotation (Line(points={{-8,-48},{-42,-48},{-42,-58},{-48,-58}}, color={0,0,0}));
  connect(consumer_ClaRaHex.fluidPortIn, boundaryVLE_phxi.steam_a) annotation (Line(
      points={{14,-120},{-48,-120}},
      color={175,0,0},
      thickness=0.5));
  connect(consumer_ClaRaHex.fluidPortOut, boundaryVLE_phxi1.steam_a) annotation (Line(
      points={{14,-124},{-40,-124},{-40,-146},{-48,-146}},
      color={175,0,0},
      thickness=0.5));
  connect(boundaryVLE_phxi.h, step.y) annotation (Line(points={{-68,-120},{-79,-120}},
                                                                                     color={0,0,127}));
  annotation (experiment(StopTime=6048000, __Dymola_Algorithm="Dassl"), Icon(coordinateSystem(extent={{-160,-160},{160,120}})),
    Diagram(coordinateSystem(extent={{-160,-160},{160,120}}), graphics={
        Text(
          extent={{-140,112},{18,96}},
          textColor={28,108,200},
          textString="Test model for consumer (heat flow)"),
        Text(
          extent={{-136,12},{22,-6}},
          textColor={28,108,200},
          textString="Test model for consumer (ambient)"),
        Text(
          extent={{-134,-78},{24,-96}},
          textColor={28,108,200},
          textString="Test model for ClaRa consumer")}),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model:</span></h4>
<p>Test model for the verification of the pump model.</p>
<h4><span style=\"color: #1c6cc8\">Compare temperatures for verification, check if temperature difference at nominal point is 30 K</span></h4>
<p>consumer.heatExchanger1.T_out</p>
<p>consumer_HeatFlow.heatExchanger1.T_out</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>The model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end TestConsumer;
