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

  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink2(h=95*4186) annotation (Placement(transformation(extent={{-106,62},{-86,82}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1.1e5)
                                                             annotation (Placement(transformation(extent={{-134,62},{-114,82}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink3 annotation (Placement(transformation(extent={{-106,26},{-86,46}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1e5)
                                                             annotation (Placement(transformation(extent={{-134,26},{-114,46}})));
  TransiEnt.Consumer.Heat.Consumer consumer(
    multiplicationFactor=3.4,
    m_flow_nom=0.139,
    Q_flow_nom(displayUnit="kW") = 17500) annotation (Placement(transformation(extent={{-46,40},{-18,60}})));
  Consumer_SLP consumer_SLP annotation (Placement(transformation(extent={{116,50},{144,70}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink4(h=95*4186) annotation (Placement(transformation(extent={{72,68},{92,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=1.1e5)
                                                             annotation (Placement(transformation(extent={{44,68},{64,88}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink5 annotation (Placement(transformation(extent={{72,32},{92,52}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=1e5)
                                                             annotation (Placement(transformation(extent={{44,32},{64,52}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink1(h=95*4186) annotation (Placement(transformation(extent={{-110,-42},{-90,-22}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=1.1e5)
                                                             annotation (Placement(transformation(extent={{-138,-42},{-118,-22}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink6 annotation (Placement(transformation(extent={{-110,-78},{-90,-58}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=1e5)
                                                             annotation (Placement(transformation(extent={{-138,-78},{-118,-58}})));
  ConsumerHeatCharacteristic consumerHeatCharacteristic annotation (Placement(transformation(extent={{-58,-62},{-30,-42}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=273.15)
                                                             annotation (Placement(transformation(extent={{4,-62},{-16,-42}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink7(h=95*4186) annotation (Placement(transformation(extent={{22,-104},{42,-84}})));
  Modelica.Blocks.Sources.RealExpression realExpression8(y=1.1e5)
                                                             annotation (Placement(transformation(extent={{-6,-104},{14,-84}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink8 annotation (Placement(transformation(extent={{22,-140},{42,-120}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=1e5)
                                                             annotation (Placement(transformation(extent={{-6,-140},{14,-120}})));
  Modelica.Blocks.Sources.RealExpression realExpression10(y=273.15)
                                                             annotation (Placement(transformation(extent={{138,-124},{118,-104}})));
  Consumer_LowTemperatureDHN consumer_LowTemperatureDHN annotation (Placement(transformation(extent={{76,-124},{104,-104}})));
  Modelica.Blocks.Sources.RealExpression realExpression11(y=268.13)
                                                             annotation (Placement(transformation(extent={{18,46},{-2,66}})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(realExpression2.y, sink2.p_in) annotation (Line(points={{-113,72},{-102.5,72},{-102.5,72},{-104,72}},
                                                                                                            color={0,0,127}));
  connect(sink3.p_in, realExpression3.y) annotation (Line(points={{-104,36},{-103.5,36},{-103.5,36},{-113,36}},     color={0,0,127}));
  connect(sink2.port_a, consumer.inlet) annotation (Line(points={{-86,72},{-70,72},{-70,54},{-46,54}},color={0,0,0}));
  connect(consumer.outlet, sink3.port_a) annotation (Line(points={{-46,46},{-80,46},{-80,36},{-86,36}},    color={0,0,0}));
  connect(realExpression5.y,sink4. p_in) annotation (Line(points={{65,78},{75.5,78},{75.5,78},{74,78}},     color={0,0,127}));
  connect(sink5.p_in,realExpression6. y) annotation (Line(points={{74,42},{74.5,42},{74.5,42},{65,42}},             color={0,0,127}));
  connect(sink5.port_a, consumer_SLP.outlet) annotation (Line(points={{92,42},{106,42},{106,56},{116,56}},      color={0,0,0}));
  connect(consumer_SLP.inlet, sink4.port_a) annotation (Line(points={{116,64},{104,64},{104,78},{92,78}},      color={0,0,0}));
  connect(realExpression1.y,sink1. p_in) annotation (Line(points={{-117,-32},{-106.5,-32},{-106.5,-32},{-108,-32}},
                                                                                                            color={0,0,127}));
  connect(sink6.p_in,realExpression4. y) annotation (Line(points={{-108,-68},{-107.5,-68},{-107.5,-68},{-117,-68}}, color={0,0,127}));
  connect(consumerHeatCharacteristic.inlet, sink1.port_a) annotation (Line(points={{-58,-48},{-82,-48},{-82,-32},{-90,-32}}, color={0,0,0}));
  connect(consumerHeatCharacteristic.outlet, sink6.port_a) annotation (Line(points={{-58,-56},{-84,-56},{-84,-68},{-90,-68}}, color={0,0,0}));
  connect(realExpression7.y, consumerHeatCharacteristic.T_outdoor_K) annotation (Line(points={{-17,-52},{-29.4,-52}}, color={0,0,127}));
  connect(realExpression8.y,sink7. p_in) annotation (Line(points={{15,-94},{25.5,-94},{25.5,-94},{24,-94}}, color={0,0,127}));
  connect(sink8.p_in,realExpression9. y) annotation (Line(points={{24,-130},{24.5,-130},{24.5,-130},{15,-130}},     color={0,0,127}));
  connect(consumer_LowTemperatureDHN.inlet, sink7.port_a) annotation (Line(points={{76,-110},{46,-110},{46,-94},{42,-94}}, color={0,0,0}));
  connect(consumer_LowTemperatureDHN.outlet, sink8.port_a) annotation (Line(points={{76,-118},{48,-118},{48,-130},{42,-130}}, color={0,0,0}));
  connect(realExpression10.y, consumer_LowTemperatureDHN.T_outdoor_K) annotation (Line(points={{117,-114},{104.8,-114}}, color={0,0,127}));
  annotation (experiment(StopTime=6048000, __Dymola_Algorithm="Dassl"), Icon(coordinateSystem(extent={{-160,-160},{160,120}})),
    Diagram(coordinateSystem(extent={{-160,-160},{160,120}}), graphics={
        Text(
          extent={{-144,110},{14,92}},
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
