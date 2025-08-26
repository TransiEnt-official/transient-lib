within TransiEnt.Producer.Heat.Heat2Heat.Check;
model TestHeatPump_DHN "Test model for the heat pump for the DHN simulations"

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

  TransiEnt.Producer.Heat.Heat2Heat.Heatpump_DHN heatpump1(
    Delta_T_internal(displayUnit="K"),
    COP_n=3.7,
    P_el_max(displayUnit="kW") = 300000) annotation (Placement(transformation(extent={{-46,-146},{-26,-126}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=60)
                                                             annotation (Placement(transformation(extent={{-90,-104},{-70,-84}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=heatpump1.inlet.m_flow*(4185*60 - inStream(heatpump1.inlet.h_outflow))) annotation (Placement(transformation(extent={{-78,-146},{-58,-126}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.1)
                                                             annotation (Placement(transformation(extent={{-84,-74},{-64,-54}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{100,68},{120,88}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump heatpump(
    usePowerPort=false,
    T_source(displayUnit="degC") = 293.15,
    T_set=333.15) annotation (Placement(transformation(extent={{-62,4},{-42,24}})));
  TransiEnt.Components.Heat.Grid.IdealizedExpansionVessel idealizedExpansionVessel annotation (Placement(transformation(extent={{-40,38},{-20,58}})));
  TransiEnt.Components.Heat.PumpVLE_L1_simple pumpVLE_L1_simple(presetVariableType="m_flow", m_flow_fixed=0.03682)
                                                                                                                  annotation (Placement(transformation(extent={{-14,8},{6,28}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=heatpump.inlet.m_flow*(4184.71*60 - inStream(heatpump.inlet.h_outflow)))
                                                             annotation (Placement(transformation(extent={{-92,-2},{-72,18}})));
  TransiEnt.Consumer.Heat.ConstantHeatConsumer constantHeatConsumer(Q_flow_const=5000) annotation (Placement(transformation(extent={{58,4},{38,24}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{-18,-92},{2,-72}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=0.1)
                                                             annotation (Placement(transformation(extent={{-30,-70},{-10,-50}})));
  DistrictHeatingGridsNew.Consumer.Consumer_HeatFlow consumer_HeatFlow annotation (Placement(transformation(extent={{20,-144},{48,-124}})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(realExpression3.y, heatpump1.T_set_variable) annotation (Line(points={{-69,-94},{-40,-94},{-40,-126}}, color={0,0,127}));
  connect(heatpump1.Q_flow_set, realExpression6.y) annotation (Line(points={{-44,-136},{-57,-136}},
                                                                                                  color={0,0,127}));
  connect(realExpression1.y, heatpump1.dp) annotation (Line(points={{-63,-64},{-38,-64},{-38,-74},{-36,-74},{-36,-126}},
                                                                                                                   color={0,0,127}));
  connect(pumpVLE_L1_simple.fluidPortIn, heatpump.outlet) annotation (Line(
      points={{-14,18},{-27.9,18},{-27.9,17},{-41.8,17}},
      color={175,0,0},
      thickness=0.5));
  connect(pumpVLE_L1_simple.fluidPortOut, constantHeatConsumer.fluidPortIn) annotation (Line(
      points={{6,18},{32,18},{32,10},{38,10}},
      color={175,0,0},
      thickness=0.5));
  connect(constantHeatConsumer.fluidPortOut, heatpump.inlet) annotation (Line(
      points={{38,6},{38,0},{-36,0},{-36,10.2},{-42,10.2}},
      color={175,0,0},
      thickness=0.5));
  connect(idealizedExpansionVessel.waterPort, constantHeatConsumer.fluidPortIn) annotation (Line(
      points={{-30,38},{-6,38},{-6,36},{18,36},{18,18},{32,18},{32,10},{38,10}},
      color={175,0,0},
      thickness=0.5));
  connect(realExpression4.y, sink.p_in) annotation (Line(points={{-9,-60},{12,-60},{12,-82.2},{0,-82.2}},  color={0,0,127}));
  connect(heatpump1.outlet, consumer_HeatFlow.inlet) annotation (Line(points={{-26.2,-130},{20,-130}},color={0,0,0}));
  connect(consumer_HeatFlow.outlet, heatpump1.inlet) annotation (Line(points={{20,-138},{-18,-138},{-18,-142.2},{-26,-142.2}},
                                                                                                                            color={0,0,0}));
  connect(sink.port_a, consumer_HeatFlow.inlet) annotation (Line(points={{-18,-82},{-26,-82},{-26,-104},{-16,-104},{-16,-130},{20,-130}},
                                                                                                                                       color={0,0,0}));
  connect(heatpump.Q_flow_set, realExpression2.y) annotation (Line(
      points={{-62.6,8.6},{-66.8,8.6},{-66.8,8},{-71,8}},
      color={175,0,0},
      pattern=LinePattern.Dash));
  annotation (
    Icon(                                                                                                                                                                                  coordinateSystem(initialScale = 0.1, extent={{-160,-200},{140,100}})),
                                                                                                                                                                                                        experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-160,-200},{140,100}}), graphics={Text(
          extent={{-132,-28},{-2,-42}},
          textColor={28,108,200},
          textString="Test model for heat pump"), Text(
          extent={{-136,84},{-6,70}},
          textColor={28,108,200},
          textString="Test model for heat pump")}),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model:</span></h4>
<p>Test model for the verification of the heat pump model.</p>
<h4><span style=\"color: #1c6cc8\">Compare this variables for verification of the heat pump:</span></h4>
<p><span style=\"font-size: 8pt;\">heatpump1.Q_flow</span></p>
<p><span style=\"font-size: 8pt;\">heatpump1.P_el</span></p>
<p><span style=\"font-size: 8pt;\">heatpump.Q_flow_set</span></p>
<p><span style=\"font-size: 8pt;\">heatpump.P_el.y</span></p>
<p><span style=\"font-size: 8pt;\">heatpump.COP.y</span></p>
<p><span style=\"font-size: 8pt;\">heatpump1.COP</span></p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p><span style=\"font-size: 8pt;\">The model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</span></p>
</html>"));
end TestHeatPump_DHN;
