within TransiEnt.Components.Sensors.Check;
model Check_SmartMeter

  extends TransiEnt.Basics.Icons.Checkmodel;
  Models_CyEntEE.CellModels.SmartMeter SmartMeter_TAF7(configuration="TAF7") annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
  Boundaries.Electrical.ComplexPower.SlackBoundary slackBoundary(v_gen=400, f_n=50) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-72,0})));
  Modelica.Blocks.Sources.Pulse pulseP(
    amplitude=1e6,
    width=50,
    period=1800,
    offset=0,
    startTime=0)  annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Blocks.Sources.Pulse pulseQ(
    amplitude=1e3,
    width=50,
    period=2000,
    offset=0,
    startTime=10) annotation (Placement(transformation(extent={{82,-62},{102,-42}})));
  Models_CyEntEE.CellModels.SmartMeter SmartMeter_TAF10(configuration="TAF10") annotation (Placement(transformation(extent={{-30,-70},{-10,-50}})));
  Models_CyEntEE.CellModels.SmartMeter SmartMeter_Manual(
    useStandardConfiguration=false,
    useNoise=true,
    useDelay=true,
    samplePeriod=120) annotation (Placement(transformation(extent={{-30,10},{-10,30}})));
  Models_CyEntEE.CellModels.SmartMeter SmartMeter_Ideal(useStandardConfiguration=true, configuration="Ideal") annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
  Boundaries.Electrical.ComplexPower.PQBoundary pQBoundary(v_n=400) annotation (Placement(transformation(extent={{40,50},{60,70}})));
  Boundaries.Electrical.ComplexPower.PQBoundary pQBoundary1(v_n=400) annotation (Placement(transformation(extent={{40,10},{60,30}})));
  Boundaries.Electrical.ComplexPower.PQBoundary pQBoundary2(v_n=400) annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
  Boundaries.Electrical.ComplexPower.PQBoundary pQBoundary3(v_n=400) annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
equation
  connect(SmartMeter_TAF7.epp_a, slackBoundary.epp) annotation (Line(
      points={{-29.2,-20},{-52,-20},{-52,0},{-62,0}},
      color={28,108,200},
      thickness=0.5));
  connect(SmartMeter_TAF10.epp_a, slackBoundary.epp) annotation (Line(
      points={{-29.2,-60},{-52,-60},{-52,0},{-62,0}},
      color={28,108,200},
      thickness=0.5));
  connect(SmartMeter_Ideal.epp_a, slackBoundary.epp) annotation (Line(
      points={{-29.2,60},{-52,60},{-52,0},{-62,0}},
      color={28,108,200},
      thickness=0.5));
  connect(SmartMeter_Manual.epp_a, slackBoundary.epp) annotation (Line(
      points={{-29.2,20},{-52,20},{-52,0},{-62,0}},
      color={28,108,200},
      thickness=0.5));
  connect(pQBoundary3.epp, SmartMeter_TAF10.epp_b) annotation (Line(
      points={{40,-60},{-10.8,-60}},
      color={28,108,200},
      thickness=0.5));
  connect(pQBoundary2.epp, SmartMeter_TAF7.epp_b) annotation (Line(
      points={{40,-20},{-10.8,-20}},
      color={28,108,200},
      thickness=0.5));
  connect(SmartMeter_Manual.epp_b, pQBoundary1.epp) annotation (Line(
      points={{-10.8,20},{40,20}},
      color={28,108,200},
      thickness=0.5));
  connect(SmartMeter_Ideal.epp_b, pQBoundary.epp) annotation (Line(
      points={{-10.8,60},{40,60}},
      color={28,108,200},
      thickness=0.5));
  connect(pulseP.y, pQBoundary.P_el_set) annotation (Line(points={{101,30},{106,30},{106,80},{44,80},{44,72}}, color={0,0,127}));
  connect(pQBoundary1.P_el_set, pulseP.y) annotation (Line(points={{44,32},{44,44},{106,44},{106,30},{101,30}}, color={0,127,127}));
  connect(pQBoundary2.P_el_set, pulseP.y) annotation (Line(points={{44,-8},{44,6},{106,6},{106,30},{101,30}}, color={0,127,127}));
  connect(pQBoundary3.P_el_set, pulseP.y) annotation (Line(points={{44,-48},{44,-34},{106,-34},{106,30},{101,30}}, color={0,127,127}));
  connect(pQBoundary3.Q_el_set, pulseQ.y) annotation (Line(points={{56,-48},{72,-48},{72,-36},{108,-36},{108,-52},{103,-52}}, color={0,127,127}));
  connect(pQBoundary2.Q_el_set, pulseQ.y) annotation (Line(points={{56,-8},{108,-8},{108,-52},{103,-52}}, color={0,127,127}));
  connect(pQBoundary1.Q_el_set, pulseQ.y) annotation (Line(points={{56,32},{66,32},{66,-8},{108,-8},{108,-52},{103,-52}}, color={0,127,127}));
  connect(pQBoundary.Q_el_set, pulseQ.y) annotation (Line(points={{56,72},{66,72},{66,-8},{108,-8},{108,-52},{103,-52}}, color={0,127,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=20000, __Dymola_Algorithm="Dassl"));
end Check_SmartMeter;
