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

  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink2(h=95*4186) annotation (Placement(transformation(extent={{-48,-32},{-68,-12}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1.1e5)
                                                             annotation (Placement(transformation(extent={{-96,-32},{-76,-12}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink3 annotation (Placement(transformation(extent={{-48,-68},{-68,-48}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1e5)
                                                             annotation (Placement(transformation(extent={{-96,-68},{-76,-48}})));
  TransiEnt.Consumer.Heat.Consumer consumer(
    multiplicationFactor=3.4,
    m_flow_nom=0.139,
    Q_flow_nom(displayUnit="kW") = 17500) annotation (Placement(transformation(extent={{-8,-54},{20,-34}})));
  Consumer_SLP consumer_SLP annotation (Placement(transformation(extent={{124,-48},{152,-28}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink4(h=95*4186) annotation (Placement(transformation(extent={{100,-30},{80,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=1.1e5)
                                                             annotation (Placement(transformation(extent={{52,-30},{72,-10}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink5 annotation (Placement(transformation(extent={{100,-66},{80,-46}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=1e5)
                                                             annotation (Placement(transformation(extent={{52,-66},{72,-46}})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(realExpression2.y, sink2.p_in) annotation (Line(points={{-75,-22},{-64.5,-22},{-64.5,-22.2},{-66,-22.2}},
                                                                                                            color={0,0,127}));
  connect(sink3.p_in, realExpression3.y) annotation (Line(points={{-66,-58.2},{-65.5,-58.2},{-65.5,-58},{-75,-58}}, color={0,0,127}));
  connect(sink2.port_a, consumer.inlet) annotation (Line(points={{-48,-22},{-32,-22},{-32,-40},{-8,-40}},
                                                                                                      color={0,0,0}));
  connect(consumer.outlet, sink3.port_a) annotation (Line(points={{-8,-48},{-42,-48},{-42,-58},{-48,-58}}, color={0,0,0}));
  connect(realExpression5.y,sink4. p_in) annotation (Line(points={{73,-20},{83.5,-20},{83.5,-20.2},{82,-20.2}},
                                                                                                            color={0,0,127}));
  connect(sink5.p_in,realExpression6. y) annotation (Line(points={{82,-56.2},{82.5,-56.2},{82.5,-56},{73,-56}},     color={0,0,127}));
  connect(sink5.port_a, consumer_SLP.outlet) annotation (Line(points={{100,-56},{114,-56},{114,-42},{124,-42}}, color={0,0,0}));
  connect(consumer_SLP.inlet, sink4.port_a) annotation (Line(points={{124,-34},{112,-34},{112,-20},{100,-20}}, color={0,0,0}));
  annotation (experiment(StopTime=6048000, __Dymola_Algorithm="Dassl"), Icon(coordinateSystem(extent={{-160,-160},{160,120}})),
    Diagram(coordinateSystem(extent={{-160,-160},{160,120}}), graphics={
        Text(
          extent={{-136,12},{22,-6}},
          textColor={28,108,200},
          textString="Test model for consumer (ambient)")}),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model:</span></h4>
<p>Test model for the verification of the Consumer and the Consumer_SLP model.</p>
<h4><span style=\"color: #1c6cc8\">Compare temperatures for verification, check if temperature difference at nominal point is 30 K</span></h4>
<p>consumer.heatExchanger1.T_out</p>
<p>consumer_HeatFlow.heatExchanger1.T_out</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>The model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end TestConsumer;
