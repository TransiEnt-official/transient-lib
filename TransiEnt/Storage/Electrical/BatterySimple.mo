within TransiEnt.Storage.Electrical;
model BatterySimple "Simplified model of a battery without events"
  extends TransiEnt.Basics.Icons.Model;
  //________________________________________________________________________________//
  // Component of the TransiEnt Library, version: 3.0.0                             //
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
  //                                                                                //
  //________________________________________________________________________________//

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter Modelica.Units.SI.Energy Bat_Capacity(displayUnit="kWh") = 90e3*3600
    "Battery capacity in Joule" annotation (Dialog(group="Battery"));

  parameter Real Bat_SOCStart(unit="1",displayUnit="%") = 0.5 "Battery Charge at start"
    annotation (Dialog(group="Battery"));

  parameter Modelica.Units.SI.Power Bat_PowerLimit(displayUnit="kW") = 15000
    "Charge and discharge power" annotation (Dialog(group="Battery"));

  parameter Real threshold_P_curtailment(unit="1",displayUnit="%") = 0.95
    "If SOC > thr. reduce power linearly";

  parameter Real P_min_rel(unit="1",displayUnit="%") = 0.02
    "Minimum relative power at SOC limits (0 or 1)";

  parameter Boolean useDynamics=true
    "Time constant of delay transfer function"
    annotation (Dialog(group="Dynamics"));

  parameter Modelica.Units.SI.Time deadTime=2 if useDynamics
    "Time constant of delay transfer function"
    annotation (Dialog(group="Dynamics", enable=useDynamics));

  parameter Modelica.Units.SI.Time tau=3 if useDynamics
    "Time constant of first order transfer function"
    annotation (Dialog(group="Dynamics", enable=useDynamics));

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort  epp
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

  Modelica.Blocks.Interfaces.RealOutput SOC
    annotation (Placement(transformation(extent={{96,70},{116,90}})));

  Modelica.Blocks.Interfaces.RealOutput P_set_internal
    annotation (Placement(transformation(extent={{14,-68},{34,-48}})));

  // ------------------------------------------------------------------------------------------
  //   Other Classes
  // ------------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_set
    "Set power for charging and discharging" annotation (Placement(
        transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-80,-106}), iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-80,-106})));

  Modelica.Blocks.Sources.RealExpression P_actual_(y=P_actual)
    annotation (Placement(transformation(extent={{16,18},{56,38}})));

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_max(start=0) "Real Power" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,50}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,50})));

  // Models for dynamic behavior

  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=deadTime)
    if useDynamics
    annotation (Placement(transformation(extent={{-64,-84},{-44,-64}})));

  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T=tau,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0) if useDynamics
    annotation (Placement(transformation(extent={{-26,-84},{-6,-64}})));

  Modelica.Blocks.Math.Gain noDynamics(k=1) if not useDynamics
    annotation (Placement(transformation(extent={{-24,-50},{-8,-34}})));

  // ------------------------------------------------------------------------------------------
  //   Variables
  // ------------------------------------------------------------------------------------------

  Modelica.Units.SI.Energy E(nominal=90e3*3600, start=Bat_SOCStart*Bat_Capacity, fixed=true);
  Modelica.Units.SI.Power P_actual;
  Modelica.Units.SI.Power P_limit;

  TransiEnt.Components.Boundaries.Electrical.ComplexPower.PQBoundary     pQBoundary(
    useInputConnectorQ=false,                                                v_n=400,
      useInputConnectorP=true)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));

  Modelica.Blocks.Sources.RealExpression Battery_PowerLimit(y=Bat_PowerLimit) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,50})));
equation

  // main equations
  P_limit = max(min(P_set_internal, Bat_PowerLimit), -Bat_PowerLimit);

  der(E) = P_actual;
  SOC = E/Bat_Capacity;

  if noEvent(SOC >= 1 and P_limit > 0 or SOC <= 0 and P_limit < 0) then
    // if nominal value of E (which defines SOC) is not set correctly,
    // branches of this if block cannot be resolved in certain situations
    // (leads to error "ill-conditioned jacobi matrix")
    P_actual = 0;
  elseif noEvent(SOC >= threshold_P_curtailment and P_limit > 0) then
    // limit at high SOC
    P_actual = min(P_limit, Bat_PowerLimit*max(0, 1 - (1 - P_min_rel)/(1 -
      threshold_P_curtailment)*(SOC - threshold_P_curtailment)));
  elseif noEvent(SOC <= (1 - threshold_P_curtailment) and P_limit < 0) then
    // limit at low SOC
    P_actual = max(P_limit, -Bat_PowerLimit*max(0, (1 - P_min_rel)/(1 -
      threshold_P_curtailment)*SOC + P_min_rel));
  else
    // limit dis-/charging power
    P_actual = P_limit;
  end if;

  // ------------------------------------------------------------------------------------------
  //   Connect equations
  // ------------------------------------------------------------------------------------------

  connect(epp, epp) annotation (Line(
      points={{-100,0},{-100,0}},
      color={0,127,0},
      thickness=0.5));
  connect(pQBoundary.epp, epp) annotation (Line(
      points={{80,0},{-100,0}},
      color={28,108,200},
      thickness=0.5));
  connect(Battery_PowerLimit.y, P_max) annotation (Line(points={{81,50},{106,50}}, color={0,0,127}));
  connect(fixedDelay.y, firstOrder.u)
    annotation (Line(points={{-43,-74},{-28,-74}}, color={0,0,127}));
  connect(P_set, fixedDelay.u) annotation (Line(points={{-80,-106},{-80,-74},{-66,
          -74}}, color={0,127,127}));
  connect(firstOrder.y, P_set_internal) annotation (Line(points={{-5,-74},{6,-74},
          {6,-58},{24,-58}}, color={0,0,127}));
  connect(noDynamics.y, P_set_internal) annotation (Line(points={{-7.2,-42},{6,-42},
          {6,-58},{24,-58}}, color={0,0,127}));
  connect(noDynamics.u, P_set) annotation (Line(points={{-25.6,-42},{-80,-42},{-80,
          -106}}, color={0,0,127}));
  connect(P_actual_.y, pQBoundary.P_el_set) annotation (Line(points={{58,28},{84,28},{84,11}}, color={0,0,127}));
  annotation (Icon(graphics={
        Ellipse(
          extent={{-40,-46},{40,-72}},
          lineColor={28,108,200},
          fillColor={0,149,152},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(points={{-40,54},{-40,-60}}, color={28,108,200}),
        Line(points={{40,54},{40,-60}}, color={28,108,200}),
        Rectangle(
          extent={{-40,54},{40,-60}},
          lineColor={28,108,200},
          fillColor={0,149,152},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-40,68},{40,42}},
          lineColor={28,108,200},
          fillColor={94,215,217},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-10,68},{8,60}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={107,107,107},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-10,58},{8,50}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={107,107,107},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,64},{8,54}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={107,107,107},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<h4>Purpose</h4>
<p>Simple battery model with SOC state and SOC‑dependent charge/discharge limits. Optionally applies input dynamics (dead time and first‑order lag) to the power setpoint before enforcing limits. </p>
<h4>Function</h4>
<ul>
<li>Energy state: <span style=\"font-family: Courier New;\">der(E) = P_actual</span>, <span style=\"font-family: Courier New;\">SOC = E / Bat_Capacity</span>. </li>
<li>Setpoint path: <span style=\"font-family: Courier New;\">P_set</span> &rarr; optional <span style=\"font-family: Courier New;\">fixedDelay(deadTime)</span> &rarr; optional <span style=\"font-family: Courier New;\">FirstOrder(T=tau)</span> &rarr; <span style=\"font-family: Courier New;\">P_set_internal</span>. </li>
<li>Hard limit: <span style=\"font-family: Courier New;\">P_limit = clamp(P_set_internal, -Bat_PowerLimit, +Bat_PowerLimit)</span>. </li>
<li>SOC limits (no nested lists): &ndash; If <span style=\"font-family: Courier New;\">SOC &ge; 1</span> and charging or <span style=\"font-family: Courier New;\">SOC &le; 0</span> and discharging &rArr; <span style=\"font-family: Courier New;\">P_actual = 0</span>.<br>&ndash; If charging and <span style=\"font-family: Courier New;\">SOC &ge; threshold_P_curtailment</span> &rArr; linear taper to <span style=\"font-family: Courier New;\">P_min_rel</span> at <span style=\"font-family: Courier New;\">SOC = 1</span>.<br>&ndash; If discharging and <span style=\"font-family: Courier New;\">SOC &le; 1 - threshold_P_curtailment</span> &rArr; linear taper to <span style=\"font-family: Courier New;\">P_min_rel</span> at <span style=\"font-family: Courier New;\">SOC = 0</span>.<br>&ndash; Else &rArr; <span style=\"font-family: Courier New;\">P_actual = P_limit</span>. </li>
<li>Electrical coupling: <span style=\"font-family: Courier New;\">P_actual</span> is exported via a PQ boundary at the complex power port <span style=\"font-family: Courier New;\">epp</span>. </li>
</ul>
<h4>Inputs</h4>
<ul>
<li><span style=\"font-family: Courier New;\">P_set</span> &mdash; desired charge/discharge power (W, + = charge). </li>
<li><span style=\"font-family: Courier New;\">epp</span> &mdash; electrical grid connection (complex power port). </li>
</ul>
<h4>Outputs</h4>
<ul>
<li><span style=\"font-family: Courier New;\">SOC</span> &mdash; state of charge (0&ndash;1). </li>
<li><span style=\"font-family: Courier New;\">P_set_internal</span> &mdash; setpoint after optional dynamics (for diagnostics). </li>
<li><span style=\"font-family: Courier New;\">P_max</span> &mdash; reported absolute power limit (= <span style=\"font-family: Courier New;\">Bat_PowerLimit</span>). </li>
</ul>
<h4>Notes</h4>
<ul>
<li><span style=\"font-family: Courier New;\">useDynamics=false</span> bypasses both dead time and first‑order lag. </li>
<li>Model omits voltage/current dynamics and efficiency; power is applied directly to the energy state. </li>
</ul>
<h4>Source</h4>
<p>Time‑constant references: S. S. T. AG, <i>Technische Information &ndash; SUNNY BOY SMART ENERGY / SUNNY BOY STORAGE / SUNNY ISLAND</i>, 1st ed., Sep. 2022. </p>
</html>"),
    Diagram(graphics={
        Rectangle(
          extent={{-72,-28},{6,-56}},
          lineColor={175,175,175},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{-68,-32},{-44,-36}},
          textColor={175,175,175},
          textString="no dynamics",
          fontSize=8),
        Rectangle(
          extent={{-72,-58},{6,-98}},
          lineColor={175,175,175},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{-68,-92},{-40,-96}},
          textColor={175,175,175},
          fontSize=8,
          textString="with dynamics")}));
end BatterySimple;
