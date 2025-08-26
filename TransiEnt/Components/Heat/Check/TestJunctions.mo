within TransiEnt.Components.Heat.Check;
model TestJunctions "Test model for the junctions"

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

  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source1 annotation (Placement(visible=true, transformation(
        origin={-244,50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split1(delta_p_nom(displayUnit="bar") = 20000) annotation (Placement(visible=true, transformation(
        origin={-214,50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink1 annotation (Placement(visible=true, transformation(
        origin={-160,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ClaRa.Components.VolumesValvesFittings.Fittings.SplitVLE_L2_Y splitVLE_L2_Y(
    redeclare model PressureLossIn = ClaRa.Components.VolumesValvesFittings.Fittings.Fundamentals.Linear (m_flow_nom=1, dp_nom=2e4),
    redeclare model PressureLossOut1 = ClaRa.Components.VolumesValvesFittings.Fittings.Fundamentals.Linear (m_flow_nom=1, dp_nom=2e4),
    redeclare model PressureLossOut2 = ClaRa.Components.VolumesValvesFittings.Fittings.Fundamentals.Linear (m_flow_nom=1, dp_nom=2e4),
    h_start=4200*60)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-206,-40})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_hxim_flow boundaryVLE_hxim_flow(
    variable_h=false,                                                             m_flow_const=1,
    h_const=60*4185)                                                                                               annotation (Placement(transformation(extent={{-276,-38},{-256,-18}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi(p_const(displayUnit="bar") = 100000) annotation (Placement(transformation(extent={{-156,-50},{-176,-30}})));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource(y=1) annotation (Placement(transformation(extent={{-286,43},{-266,63}})));
  Modelica.Blocks.Sources.RealExpression sinkPressure(y=1e5) annotation (Placement(transformation(extent={{-118,50},{-138,70}})));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource1(y=60*4185)
                                                                 annotation (Placement(transformation(extent={{-286,24},{-266,44}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi1(p_const(displayUnit="bar") = 200000)
                                                                                                             annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-206,-68})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink2 annotation (Placement(visible=true, transformation(
        origin={-166,18},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression sinkPressure1(y=2e5)
                                                             annotation (Placement(transformation(extent={{-120,8},{-140,28}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source3 annotation (Placement(visible=true, transformation(
        origin={10,46},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split3(delta_p_nom(displayUnit="bar") = 1000) annotation (Placement(visible=true, transformation(
        origin={40,46},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource4(y=1)
                                                                 annotation (Placement(transformation(extent={{-32,39},{-12,59}})));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource5(y=60*4185)
                                                                 annotation (Placement(transformation(extent={{-32,20},{-12,40}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink6 annotation (Placement(visible=true, transformation(
        origin={112,44},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression sinkPressure5(y=2e5)
                                                             annotation (Placement(transformation(extent={{152,34},{132,54}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 simplePipe_L4_3(
    cp=4185,
    l=100,
    N_cv=20,
    u=0.0001,
    m_flow_start=10) annotation (Placement(transformation(extent={{48,58},{68,78}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 simplePipe_L4_4(
    cp=4185,
    l=100,
    MassFlowState=true,
    N_cv=10,
    u=0.0001,
    m_flow_start=10) annotation (Placement(transformation(extent={{48,2},{68,22}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join(delta_p_nom(displayUnit="bar") = 1000) annotation (Placement(transformation(extent={{68,34},{88,54}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source5 annotation (Placement(visible=true, transformation(
        origin={-246,-144},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split5(delta_p_nom(displayUnit="bar") = 20000) annotation (Placement(visible=true, transformation(
        origin={-204,-144},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink7 annotation (Placement(visible=true, transformation(
        origin={-162,-134},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource8(y=1)
                                                                 annotation (Placement(transformation(extent={{-288,-151},{-268,-131}})));
  Modelica.Blocks.Sources.RealExpression sinkPressure6(y=1e5)
                                                             annotation (Placement(transformation(extent={{-120,-144},{-140,-124}})));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource9(y=60*4185)
                                                                 annotation (Placement(transformation(extent={{-288,-170},{-268,-150}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink8 annotation (Placement(visible=true, transformation(
        origin={-168,-176},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression sinkPressure7(y=2e5)
                                                             annotation (Placement(transformation(extent={{-122,-186},{-142,-166}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_hxim_flow boundaryVLE_hxim_flow1(
    variable_h=false,
    m_flow_const=1,
    h_const=60*4185)                                                                                               annotation (Placement(transformation(extent={{0,-42},{20,-22}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi2(p_const(displayUnit="bar") = 100000)
                                                                                                             annotation (Placement(transformation(extent={{112,-58},{92,-38}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_hxim_flow boundaryVLE_hxim_flow2(
    variable_h=false,
    m_flow_const=1,
    h_const=60*4185)                                                                                               annotation (Placement(transformation(extent={{14,-84},{34,-64}})));
  ClaRa.Components.VolumesValvesFittings.Fittings.JoinVLE_L2_Y joinVLE_L2_Y(
    redeclare model PressureLossIn1 = ClaRa.Components.VolumesValvesFittings.Fittings.Fundamentals.Linear (m_flow_nom=1, dp_nom=2e4),
    redeclare model PressureLossIn2 = ClaRa.Components.VolumesValvesFittings.Fittings.Fundamentals.Linear (m_flow_nom=1, dp_nom=2e4),
    redeclare model PressureLossOut = ClaRa.Components.VolumesValvesFittings.Fittings.Fundamentals.Linear (m_flow_nom=1, dp_nom=2e4)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={64,-48})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source2 annotation (Placement(visible=true, transformation(
        origin={22,-144},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink3 annotation (Placement(visible=true, transformation(
        origin={106,-134},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource2(y=1)
                                                                 annotation (Placement(transformation(extent={{-20,-151},{0,-131}})));
  Modelica.Blocks.Sources.RealExpression sinkPressure2(y=1e5)
                                                             annotation (Placement(transformation(extent={{148,-144},{128,-124}})));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource3(y=60*4185)
                                                                 annotation (Placement(transformation(extent={{-20,-170},{0,-150}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join2(delta_p_nom=20000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,-144})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source6 annotation (Placement(visible=true, transformation(
        origin={72,-186},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource10(y=1)
                                                                 annotation (Placement(transformation(extent={{30,-193},{50,-173}})));
  Modelica.Blocks.Sources.RealExpression MassFlowRateSource11(y=60*4185)
                                                                 annotation (Placement(transformation(extent={{30,-212},{50,-192}})));
equation

  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

  connect(source1.port_a, split1.inlet) annotation (
    Line(points={{-234,50},{-224,50}}));
  connect(boundaryVLE_hxim_flow.steam_a, splitVLE_L2_Y.inlet) annotation (Line(
      points={{-256,-28},{-206,-28},{-206,-30}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(source1.m_flow_in, MassFlowRateSource.y) annotation (Line(points={{-252,53},{-265,53}},
                                                                                                color={0,0,127}));
  connect(sink1.p_in, sinkPressure.y) annotation (Line(points={{-152,59.8},{-146,59.8},{-146,60},{-139,60}},
                                                                                 color={0,0,127}));
  connect(splitVLE_L2_Y.outlet2, boundaryVLE_pTxi.steam_a) annotation (Line(
      points={{-196,-40},{-176,-40}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(splitVLE_L2_Y.outlet1, boundaryVLE_pTxi1.steam_a) annotation (Line(
      points={{-206,-50},{-206,-58}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(sink1.port_a, split1.outlet1) annotation (Line(points={{-170,60},{-200,60},{-200,70},{-214,70},{-214,59.8}}, color={0,0,0}));
  connect(sink2.port_a, split1.outlet2) annotation (Line(points={{-176,18},{-214,18},{-214,40}}, color={0,0,0}));
  connect(sinkPressure1.y, sink2.p_in) annotation (Line(points={{-141,18},{-156,18},{-156,17.8},{-158,17.8}},
                                                                                                           color={0,0,127}));
  connect(MassFlowRateSource1.y, source1.h_in) annotation (Line(points={{-265,34},{-256,34},{-256,48},{-252,48}}, color={0,0,127}));
  connect(source3.port_a,split3. inlet) annotation (
    Line(points={{20,46},{30,46}}));
  connect(source3.m_flow_in,MassFlowRateSource4. y) annotation (Line(points={{2,49},{-11,49}},       color={0,0,127}));
  connect(sinkPressure5.y,sink6. p_in) annotation (Line(points={{131,44},{122,44},{122,43.8},{120,43.8}},            color={0,0,127}));
  connect(MassFlowRateSource5.y,source3. h_in) annotation (Line(points={{-11,30},{-2,30},{-2,44},{2,44}},             color={0,0,127}));
  connect(split3.outlet1,simplePipe_L4_3. inlet) annotation (Line(points={{40,55.8},{40,68},{48,68}},          color={0,0,0}));
  connect(simplePipe_L4_4.inlet,split3. outlet2) annotation (Line(points={{48,12},{40,12},{40,36}},            color={0,0,0}));
  connect(simplePipe_L4_3.outlet, join.inlet1) annotation (Line(points={{68,68},{77.8,68},{77.8,54}},    color={0,0,0}));
  connect(simplePipe_L4_4.outlet, join.inlet2) annotation (Line(points={{68,12},{78,12},{78,34.2}},      color={0,0,0}));
  connect(join.outlet, sink6.port_a) annotation (Line(points={{88,44},{102,44}},  color={0,0,0}));
  connect(source5.m_flow_in, MassFlowRateSource8.y) annotation (Line(points={{-254,-141},{-267,-141}},
                                                                                                  color={0,0,127}));
  connect(sink7.p_in, sinkPressure6.y) annotation (Line(points={{-154,-134.2},{-148,-134.2},{-148,-134},{-141,-134}},
                                                                                                             color={0,0,127}));
  connect(sinkPressure7.y,sink8. p_in) annotation (Line(points={{-143,-176},{-158,-176},{-158,-176.2},{-160,-176.2}},
                                                                                                           color={0,0,127}));
  connect(MassFlowRateSource9.y,source5. h_in) annotation (Line(points={{-267,-160},{-258,-160},{-258,-146},{-254,-146}},
                                                                                                                  color={0,0,127}));
  connect(source5.port_a, split5.outlet1) annotation (Line(points={{-236,-144},{-213.8,-144}},
                                                                                         color={0,0,0}));
  connect(split5.outlet2, sink7.port_a) annotation (Line(points={{-194,-144},{-178,-144},{-178,-134},{-172,-134}},
                                                                                                       color={0,0,0}));
  connect(split5.inlet, sink8.port_a) annotation (Line(points={{-204,-154},{-204,-176},{-178,-176}},
                                                                                               color={0,0,0}));
  connect(boundaryVLE_hxim_flow1.steam_a, joinVLE_L2_Y.inlet2) annotation (Line(
      points={{20,-32},{64,-32},{64,-38}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(joinVLE_L2_Y.inlet1, boundaryVLE_hxim_flow2.steam_a) annotation (Line(
      points={{54,-48},{40,-48},{40,-74},{34,-74}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(joinVLE_L2_Y.outlet, boundaryVLE_pTxi2.steam_a) annotation (Line(
      points={{74,-48},{92,-48}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(source2.m_flow_in,MassFlowRateSource2. y) annotation (Line(points={{14,-141},{1,-141}}, color={0,0,127}));
  connect(sink3.p_in,sinkPressure2. y) annotation (Line(points={{114,-134.2},{120,-134.2},{120,-134},{127,-134}},
                                                                                                             color={0,0,127}));
  connect(MassFlowRateSource3.y,source2. h_in) annotation (Line(points={{1,-160},{10,-160},{10,-146},{14,-146}},  color={0,0,127}));
  connect(source2.port_a, join2.inlet1) annotation (Line(points={{32,-144},{42,-144},{42,-144.2},{52,-144.2}}, color={0,0,0}));
  connect(sink3.port_a, join2.outlet) annotation (Line(points={{96,-134},{76,-134},{76,-106},{62,-106},{62,-134}}, color={0,0,0}));
  connect(source6.m_flow_in, MassFlowRateSource10.y) annotation (Line(points={{64,-183},{51,-183}}, color={0,0,127}));
  connect(MassFlowRateSource11.y, source6.h_in) annotation (Line(points={{51,-202},{60,-202},{60,-188},{64,-188}}, color={0,0,127}));
  connect(source6.port_a, join2.inlet2) annotation (Line(points={{82,-186},{98,-186},{98,-144},{71.8,-144}},   color={0,0,0}));
  annotation (
    Icon(                                                                                                                                                                                  coordinateSystem(initialScale = 0.1, extent={{-340,-220},{200,100}})),
                                                                                                                                                                                                        experiment(StopTime=10000, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-340,-220},{200,100}}), graphics={
        Text(
          extent={{-308,98},{-186,72}},
          textColor={28,108,200},
          textString="Test model of the split"),
        Text(
          extent={{-308,4},{-180,-12}},
          textColor={28,108,200},
          textString="ClaRa model of a split"),
        Text(
          extent={{-310,-88},{-118,-118}},
          textColor={28,108,200},
          textString="Test model of the split for reverse flow"),
        Text(
          extent={{-70,-4},{58,-20}},
          textColor={28,108,200},
          textString="ClaRa model of a join"),
        Text(
          extent={{-72,-94},{56,-110}},
          textColor={28,108,200},
          textString="Test model of a join"),
        Text(
          extent={{-76,92},{52,76}},
          textColor={28,108,200},
          textString="Test hydraulic circuit")}),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model:</span></h4>
<p>Test model for the validation of the junctions.</p>
<h4><span style=\"color: #1c6cc8\">Compare this variables for verification of the split:</span></h4>
<p><b><span style=\"font-size: 8pt;\">Test model of the split:</span></b></p>
<p><span style=\"font-size: 8pt;\">split1.inlet.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">split1.outlet1.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">split1.outlet2.m_flow</span></p>
<p><b><span style=\"font-size: 8pt;\">ClaRa model of the split:</span></b></p>
<p><span style=\"font-size: 8pt;\">splitVLE_L2_Y.inlet.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">splitVLE_L2_Y.outlet1.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">splitVLE_L2_Y.outlet2.m_flow</span></p>
<p><b><span style=\"font-size: 8pt;\">Test model of the split for reverse flow:</span></b></p>
<p><span style=\"font-size: 8pt;\">split1.inlet.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">split1.outlet1.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">split1.outlet2.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">The pressures can be checked and compared accordingly.</span></p>
<h4><span style=\"color: #1c6cc8\">Compare this variables for the verification of the join:</span></h4>
<p><b><span style=\"font-size: 8pt;\">Test model of the join:</span></b></p>
<p><span style=\"font-size: 8pt;\">join2.inlet1.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">join2.inlet2.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">join2.outlet.m_flow</span></p>
<p><b><span style=\"font-size: 8pt;\">ClaRa model of the join:</span></b></p>
<p><span style=\"font-size: 8pt;\">joinVLE_L2_Y.inlet1.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">joinVLE_L2_Y.inlet2.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">joinVLE_L2_Y.outlet.m_flow</span></p>
<p><span style=\"font-size: 8pt;\">Plausibility check of the junctions:</span></p>
<p><span style=\"font-size: 8pt;\">Look at split3 and check if the mass flow rates of the outlets are equal for the same pressure loss in each pipe</span></p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p><span style=\"font-size: 8pt;\">The model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</span></p>
</html>"));
end TestJunctions;
