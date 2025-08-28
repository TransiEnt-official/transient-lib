within TransiEnt.Components.Sensors.Check;
model Check_SmartMeter
  //________________________________________________________________________________//
  // Component of the TransiEnt Library, version: 2.0.2                             //
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
  // Gas- und Wärme-Institut Essen                                                  //
  // and                                                                            //
  // XRG Simulation GmbH (Hamburg, Germany).                                        //
  //________________________________________________________________________________//
  extends TransiEnt.Basics.Icons.Checkmodel;
  TransiEnt.Components.Sensors.SmartMeter SmartMeter_TAF7(configuration="TAF7") annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
  Modelica.Blocks.Sources.Pulse pulseP(
    amplitude=1e6,
    width=50,
    period=1800,
    offset=0,
    startTime=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Blocks.Sources.Pulse pulseQ(
    amplitude=1e3,
    width=50,
    period=2000,
    offset=0,
    startTime=10) annotation (Placement(transformation(extent={{82,-62},{102,-42}})));
  TransiEnt.Components.Sensors.SmartMeter SmartMeter_TAF10(configuration="TAF10") annotation (Placement(transformation(extent={{-30,-70},{-10,-50}})));
  TransiEnt.Components.Sensors.SmartMeter SmartMeter_Manual(
    useStandardConfiguration=false,
    useNoise=true,
    useDelay=true,
    samplePeriod=120) annotation (Placement(transformation(extent={{-30,10},{-10,30}})));
  TransiEnt.Components.Sensors.SmartMeter SmartMeter_Ideal(useStandardConfiguration=true, configuration="Ideal") annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
  Boundaries.Electrical.ComplexPower.SlackBoundary_new vDelta1(v_n=400, isFrequencyRoot=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,0})));
  Boundaries.Electrical.ComplexPower.PQBoundary_new pq1(
    v_n=400,
    useInputConnectorP=true,
    useInputConnectorQ=true) annotation (Placement(transformation(extent={{40,50},{60,70}})));
  Boundaries.Electrical.ComplexPower.PQBoundary_new pq2(
    v_n=400,
    useInputConnectorP=true,
    useInputConnectorQ=true) annotation (Placement(transformation(extent={{40,10},{60,30}})));
  Boundaries.Electrical.ComplexPower.PQBoundary_new pq3(
    v_n=400,
    useInputConnectorP=true,
    useInputConnectorQ=true) annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
  Boundaries.Electrical.ComplexPower.PQBoundary_new pq4(
    v_n=400,
    useInputConnectorP=true,
    useInputConnectorQ=true) annotation (Placement(transformation(extent={{40,-70},{60,-50}})));
equation
  connect(vDelta1.epp, SmartMeter_Ideal.epp_a) annotation (Line(
      points={{-60,0},{-36,0},{-36,60},{-29.2,60}},
      color={28,108,200},
      thickness=0.5));
  connect(vDelta1.epp, SmartMeter_Manual.epp_a) annotation (Line(
      points={{-60,0},{-36,0},{-36,20},{-29.2,20}},
      color={28,108,200},
      thickness=0.5));
  connect(vDelta1.epp, SmartMeter_TAF7.epp_a) annotation (Line(
      points={{-60,0},{-36,0},{-36,-20},{-29.2,-20}},
      color={28,108,200},
      thickness=0.5));
  connect(vDelta1.epp, SmartMeter_TAF10.epp_a) annotation (Line(
      points={{-60,0},{-36,0},{-36,-60},{-29.2,-60}},
      color={28,108,200},
      thickness=0.5));
  connect(pq4.epp, SmartMeter_TAF10.epp_b) annotation (Line(
      points={{40,-60},{-10.8,-60}},
      color={28,108,200},
      thickness=0.5));
  connect(pq3.epp, SmartMeter_TAF7.epp_b) annotation (Line(
      points={{40,-20},{-10.8,-20}},
      color={28,108,200},
      thickness=0.5));
  connect(pq2.epp, SmartMeter_Manual.epp_b) annotation (Line(
      points={{40,20},{-10.8,20}},
      color={28,108,200},
      thickness=0.5));
  connect(pq1.epp, SmartMeter_Ideal.epp_b) annotation (Line(
      points={{40,60},{-10.8,60}},
      color={28,108,200},
      thickness=0.5));
  connect(pulseP.y, pq1.P_el_set) annotation (Line(points={{101,30},{106,30},{106,78},{44,78},{44,71}}, color={0,0,127}));
  connect(pulseP.y, pq2.P_el_set) annotation (Line(points={{101,30},{106,30},{106,44},{44,44},{44,31}}, color={0,0,127}));
  connect(pulseP.y, pq3.P_el_set) annotation (Line(points={{101,30},{106,30},{106,44},{66,44},{66,-6},{44,-6},{44,-9}}, color={0,0,127}));
  connect(pulseP.y, pq4.P_el_set) annotation (Line(points={{101,30},{106,30},{106,44},{66,44},{66,-46},{44,-46},{44,-49}}, color={0,0,127}));
  connect(pulseQ.y, pq4.Q_el_set) annotation (Line(points={{103,-52},{103,-38},{56,-38},{56,-49}}, color={0,0,127}));
  connect(pulseQ.y, pq3.Q_el_set) annotation (Line(points={{103,-52},{104,-52},{104,-38},{64,-38},{64,-4},{56,-4},{56,-9}}, color={0,0,127}));
  connect(pulseQ.y, pq2.Q_el_set) annotation (Line(points={{103,-52},{104,-52},{104,-38},{64,-38},{64,38},{56,38},{56,31}}, color={0,0,127}));
  connect(pulseQ.y, pq1.Q_el_set) annotation (Line(points={{103,-52},{104,-52},{104,-38},{64,-38},{64,76},{56,76},{56,71}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=20000, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The purpose of this model is to showcase the model characteristics of TransiEnt.Components.Sensors.SmartMeter. The model has four different SmartMeter configurations included for Ideal, TAF7, TAF10 and Manual measurement characteristics.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p>Ideal: Values for P, V, I, delta, f, Q are connected to controlBus without noise and without delay.</p>
<p>Manual: Values for P, V, I, delta, f, Q are connected to controlBus with configured noise and delay.</p>
<p>TAF7: Values for P, V, I and E, Q are connected to controlBus with noise and without delay. All values are taken the mean value over 900s and then are sampled by a discrete sampler to get the regulatory required 900s mean values.</p>
<p>TAF10: Values for P, V, I, delta, f, Q are connected to controlBus without noise and without delay. All values are sampled every 60s to get the regulatory required 60s effective values.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p>(no remarks)</p><p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<pre>Added by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</pre>
</html>"));
end Check_SmartMeter;
