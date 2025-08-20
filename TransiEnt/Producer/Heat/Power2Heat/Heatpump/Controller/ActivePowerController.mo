within TransiEnt.Producer.Heat.Power2Heat.Heatpump.Controller;
block ActivePowerController "Controls electrical power of heat pump"

  import Modelica.Units.SI;

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter SI.ActivePower HP_P_min;
  parameter SI.ActivePower HP_P_max;

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------

  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{96,70},{116,90}})));

  Modelica.Blocks.Interfaces.RealInput HP_Q_max annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={78,108})));

  Modelica.Blocks.Interfaces.BooleanInput SignalActive
    annotation (Placement(transformation(extent={{-130,-100},{-90,-60}})));

  Modelica.Blocks.Interfaces.RealInput P_external
    annotation (Placement(transformation(extent={{-130,60},{-90,100}})));

  Modelica.Blocks.Interfaces.BooleanOutput Signal
    annotation (Placement(transformation(extent={{96,-90},{116,-70}})));

  // ------------------------------------------------------------------------------------------
  //   Instances of other classes
  // ------------------------------------------------------------------------------------------

  Basics.Blocks.PID_reset_lim control_P(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=2,
    k_p=2,
    Ti=60,
    xi_start=0,
    reinitMethod=Models_CyEntEE.CellModels.Heat.Controller.PID_reset_lim.Types.reinitMethods.limit2,

    useVariableLimits=true)
    annotation (Placement(transformation(extent={{40,44},{60,64}})));

  Modelica.Blocks.Logical.Hysteresis
                       hysteresis(
    uLow=HP_P_min*0.95,
    uHigh=HP_P_min*0.99)
    annotation (Placement(transformation(extent={{-74,26},{-58,42}})));
  Modelica.Blocks.Sources.RealExpression HP_off(y=0) annotation (HideResult=true,
      Placement(transformation(extent={{-8,-6},{8,6}},
        rotation=180,
        origin={82,-4})));
  Modelica.Blocks.Logical.Switch switch_off annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={81,13})));

  Modelica.Blocks.Sources.BooleanExpression Signal_always_on(y=true)
    annotation (HideResult=true, Placement(transformation(extent={{64,-86},{78,-74}})));
  Modelica.Blocks.Interfaces.RealInput HP_Q_min annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={40,108})));
  Modelica.Blocks.MathBoolean.Or reinitialize(nu=2)
    annotation (Placement(transformation(extent={{28,18},{40,30}})));
  Modelica.Blocks.Interfaces.RealInput P_measurement annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={46,-108})));
  Modelica.Blocks.Logical.Edge edge_reinit1
    annotation (Placement(transformation(extent={{-82,-86},{-70,-74}})));
  Modelica.Blocks.Interfaces.BooleanInput HP_blocked_on
    annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
  Modelica.Blocks.Interfaces.BooleanInput HP_blocked_off
    annotation (Placement(transformation(extent={{-130,-60},{-90,-20}})));
  Modelica.Blocks.Logical.LogicalSwitch logicalSwitch
    annotation (Placement(transformation(extent={{20,-48},{36,-32}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={28,-18})));
  Modelica.Blocks.Logical.LogicalSwitch logicalSwitch1
    annotation (Placement(transformation(extent={{-16,-8},{0,8}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=true)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-8,22})));
equation

  when (hysteresis.y) then

  end when;

  connect(control_P.limit1, HP_Q_max) annotation (Line(points={{38,62},{32,62},
          {32,82},{78,82},{78,108}},
                         color={0,0,127}));
  connect(Signal_always_on.y, Signal)
    annotation (Line(points={{78.7,-80},{106,-80}}, color={255,0,255}));
  connect(HP_Q_min, control_P.limit2) annotation (Line(points={{40,108},{40,88},
          {28,88},{28,46},{38,46}},color={0,0,127}));
  connect(P_measurement, control_P.u_m) annotation (Line(points={{46,-108},{46,
          34},{50,34},{50,42}},
                             color={0,0,127}));
  connect(edge_reinit1.y, reinitialize.u[1]) annotation (Line(points={{-69.4,
          -80},{44,-80},{44,8},{18,8},{18,22.95},{28,22.95}},
                                                     color={255,0,255}));
  connect(reinitialize.y, control_P.reset)
    annotation (Line(points={{40.9,24},{44,24},{44,42}},   color={255,0,255}));
  connect(SignalActive, edge_reinit1.u) annotation (Line(points={{-110,-80},{
          -83.2,-80}},                     color={255,0,255}));
  connect(switch_off.y, y) annotation (Line(points={{88.7,13},{122,13},{122,80},
          {106,80}}, color={0,0,127}));
  connect(P_external, hysteresis.u) annotation (Line(points={{-110,80},{-110,34},
          {-75.6,34}}, color={0,0,127}));
  connect(HP_off.y, switch_off.u3) annotation (Line(points={{73.2,-4},{72.6,-4},
          {72.6,7.4}}, color={0,0,127}));
  connect(control_P.y, switch_off.u1) annotation (Line(points={{61,54},{66,54},
          {66,18.6},{72.6,18.6}}, color={0,0,127}));
  connect(HP_blocked_off, logicalSwitch.u2)
    annotation (Line(points={{-110,-40},{18.4,-40}}, color={255,0,255}));
  connect(booleanExpression.y, logicalSwitch.u1) annotation (Line(points={{17,
          -18},{18.4,-18},{18.4,-33.6}}, color={255,0,255}));
  connect(logicalSwitch.y, switch_off.u2) annotation (Line(points={{36.8,-40},{
          66,-40},{66,13},{72.6,13}}, color={255,0,255}));
  connect(HP_blocked_on, logicalSwitch1.u2)
    annotation (Line(points={{-110,0},{-17.6,0}}, color={255,0,255}));
  connect(booleanExpression1.y, logicalSwitch1.u1) annotation (Line(points={{
          -19,22},{-17.6,22},{-17.6,6.4}}, color={255,0,255}));
  connect(logicalSwitch1.y, logicalSwitch.u3) annotation (Line(points={{0.8,0},
          {8,0},{8,-46.4},{18.4,-46.4}}, color={255,0,255}));
  connect(hysteresis.y, logicalSwitch1.u3) annotation (Line(points={{-57.2,34},
          {-52,34},{-52,-6.4},{-17.6,-6.4}}, color={255,0,255}));
  connect(switch_off.u2, reinitialize.u[2]) annotation (Line(points={{72.6,13},
          {66,13},{66,12},{22,12},{22,24},{28,24},{28,25.05}}, color={255,0,255}));
  connect(control_P.u_s, P_external)
    annotation (Line(points={{38,54},{-110,54},{-110,80}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-60,20},{60,-80}},
          textColor={28,108,200},
          textString="P"),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Text(
          extent={{-60,80},{60,20}},
          textColor={28,108,200},
          textString="Control")}), Diagram(coordinateSystem(preserveAspectRatio
          =false)),
    Documentation(info="<html>
<h4>Purpose</h4>
<p>PI-based power controller for a heat pump. Tracks an external power request <span style=\"font-family: Courier New;\">P_external</span> within time‑varying limits and enables/disables the output based on a minimum‑power hysteresis and block flags. </p>
<h4>Function</h4>
<ul>
<li><b>PI control:</b> <span style=\"font-family: Courier New;\">PID_reset_lim</span> (PI mode) regulates from setpoint <span style=\"font-family: Courier New;\">P_external</span> and feedback <span style=\"font-family: Courier New;\">P_measurement</span>.</li>
<li><b>Variable limits:</b> Controller output is limited between <span style=\"font-family: Courier New;\">HP_Q_min</span> and <span style=\"font-family: Courier New;\">HP_Q_max</span> via the internal variable limiter.</li>
<li><b>Enable gating:</b> The final output is switched between the PI value and 0 by a Boolean gate: hysteresis on <span style=\"font-family: Courier New;\">P_external</span> (u<sub>Low</sub>=0.95 <span style=\"font-family: Courier New;\">HP_P_min</span>, u<sub>High</sub>=0.99 <span style=\"font-family: Courier New;\">HP_P_min</span>) combined with <span style=\"font-family: Courier New;\">HP_blocked_on</span>/<span style=\"font-family: Courier New;\">HP_blocked_off</span>. If blocked‑on, the gate is forced <i>on</i>; if blocked‑off, it can be forced <i>off</i>. </li>
<li><b>Reset behavior:</b> A rising edge of <span style=\"font-family: Courier New;\">SignalActive</span> or a change of the output gate triggers a controller reset (<span style=\"font-family: Courier New;\">reinitMethod = limit2</span>), reinitializing the integrator to the current lower limit to avoid windup/bumps.</li>
</ul>
</html>"));
end ActivePowerController;
