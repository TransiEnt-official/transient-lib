within TransiEnt.Producer.Heat.Power2Heat.Heatpump.Controller.Base;
model Splitter

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
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//  "Splits heating demand between heat pump and heater rod with some operational logic"

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter Modelica.Units.SI.HeatFlowRate Q_HP_nom=10e3
    "nominal heat output of heat pump" annotation (Dialog(group="Heat Pump"));

  parameter Modelica.Units.SI.HeatFlowRate Q_HR_max=6e3
    "maximum heat output of heater rod" annotation (Dialog(group="Heat Pump"));

  parameter Modelica.Units.SI.Temperature T_HP_amb_min(displayUnit="degC") = 273.15
     - 10 "minimum ambient temperature for heat pump"
    annotation (Dialog(group="Heat Pump"));

  parameter Modelica.Units.SI.Temperature T_HP_bivalence(displayUnit="degC") = 273.15
     - 5 "minimum ambient temperature for heat pump"
    annotation (Dialog(group="Heat Pump"));

  parameter Modelica.Units.SI.Temperature T_HP_sup_max(displayUnit="degC") = 273.15
     + 60 "maximum supply temperature of heat pump"
    annotation (Dialog(group="Heat Pump"));

  parameter Modelica.Units.SI.Time t_onOff_minOff=300
    "time between heat pump state change from off to on"
    annotation (Dialog(group="Heat Pump"));

  parameter Modelica.Units.SI.Time t_onOff_minOn=180
    "time between heat pump state change from on to off"
    annotation (Dialog(group="Heat Pump"));

  // ------------------------------------------------------------------------------------------
  //   Instances of other classes
  // ------------------------------------------------------------------------------------------

  Modelica.Blocks.Interfaces.BooleanInput signal
    annotation (Placement(transformation(extent={{-128,40},{-88,80}})));
  Modelica.Blocks.Interfaces.RealInput Q_request
    annotation (Placement(transformation(extent={{-128,-80},{-88,-40}})));
  Modelica.Blocks.Interfaces.RealOutput Q_HP
    annotation (Placement(transformation(extent={{96,50},{116,70}})));
  Modelica.Blocks.Interfaces.RealOutput Q_HR
    annotation (Placement(transformation(extent={{96,-70},{116,-50}})));
  Modelica.Blocks.Nonlinear.VariableLimiter HP_limiter(strict=true)
    annotation (Placement(transformation(extent={{-50,-8},{-34,8}})));
  Modelica.Blocks.Sources.RealExpression HP_off(y=0)
    annotation (Placement(transformation(extent={{-6,-8},{6,8}},
        rotation=180,
        origin={62,8})));
  Basics.Blocks.OnOff onOff(t_holdOff=t_onOff_minOff, t_holdOn=t_onOff_minOn)
    annotation (Placement(transformation(extent={{22,16},{38,32}})));
  Modelica.Blocks.Sources.RealExpression T_HP_amb_min_(y=T_HP_amb_min)
    annotation (Placement(transformation(extent={{-98,16},{-78,34}})));
  Modelica.Blocks.Logical.Switch HP_switch
    annotation (Placement(transformation(extent={{56,18},{68,30}})));
  Modelica.Blocks.Math.Add Q_remaining(k1=-1)
    annotation (Placement(transformation(extent={{-34,-64},{-22,-52}})));
  Modelica.Blocks.Logical.Greater cond_HP_amb
    annotation (Placement(transformation(extent={{-50,14},{-36,26}})));
  Modelica.Blocks.Interfaces.RealInput T_amb annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,108})));
  Modelica.Blocks.Interfaces.RealInput T_bufferTank annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,106})));
  Modelica.Blocks.Logical.Less    cond_HP_buffer
    annotation (Placement(transformation(extent={{34,60},{50,76}})));
  Modelica.Blocks.Sources.RealExpression T_HP_sup_max_(y=T_HP_sup_max)
    annotation (Placement(transformation(extent={{-8,50},{18,68}})));
  Modelica.Blocks.Sources.RealExpression HR_min(y=0) annotation (Placement(
        transformation(
        extent={{-6,-8},{6,8}},
        rotation=0,
        origin={40,-78})));
  Modelica.Blocks.Logical.Switch HR_switch
    annotation (Placement(transformation(extent={{56,-66},{68,-54}})));
  Modelica.Blocks.Interfaces.RealInput Q_HP_max annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-60,-108})));
  Modelica.Blocks.Interfaces.RealInput Q_HP_min annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,108})));
  Modelica.Blocks.Nonlinear.Limiter HR_limiter(uMax=Q_HR_max, uMin=0)
    annotation (Placement(transformation(extent={{-2,-52},{14,-36}})));
  Modelica.Blocks.Logical.LessThreshold bivalence_HR_on(threshold=
        T_HP_bivalence)
    annotation (Placement(transformation(extent={{0,-86},{12,-74}})));
  Modelica.Blocks.Logical.And HR_unblocked
    annotation (Placement(transformation(extent={{34,-66},{46,-54}})));
  Modelica.Blocks.MathBoolean.And HP_on(nu=4)
    annotation (Placement(transformation(extent={{-2,18},{10,30}})));
  Modelica.Blocks.Logical.Greater HP_unblocked
    annotation (Placement(transformation(extent={{-22,4},{-10,16}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T=10,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0)
    annotation (Placement(transformation(extent={{78,-66},{90,-54}})));
  Modelica.Blocks.Interfaces.RealOutput Q_HR_available annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-104})));
  Modelica.Blocks.Logical.Switch HR_availability annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={60,-84})));
  Modelica.Blocks.Sources.RealExpression HR_max(y=Q_HR_max) annotation (
      Placement(transformation(
        extent={{-6,-8},{6,8}},
        rotation=90,
        origin={80,-84})));
  Modelica.Blocks.Math.Gain gain(k=0.99) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=270,
        origin={-30,56})));
  Modelica.Blocks.Interfaces.BooleanOutput HP_blocked annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={104,0})));
  Modelica.Blocks.Interfaces.BooleanOutput HP_blocked_on annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={104,-40})));
  Modelica.Blocks.Interfaces.BooleanOutput HP_blocked_off annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={104,-20})));
equation
  connect(Q_request, HP_limiter.u) annotation (Line(points={{-108,-60},{-56,-60},
          {-56,0},{-51.6,0}}, color={0,0,127}));
  connect(HP_off.y, HP_switch.u3) annotation (Line(points={{55.4,8},{46,8},{46,
          19.2},{54.8,19.2}},     color={0,0,127}));
  connect(cond_HP_amb.u1, T_amb)
    annotation (Line(points={{-51.4,20},{-60,20},{-60,108}}, color={0,0,127}));
  connect(T_HP_amb_min_.y, cond_HP_amb.u2) annotation (Line(points={{-77,25},{-70,
          25},{-70,15.2},{-51.4,15.2}}, color={0,0,127}));
  connect(HP_limiter.y, HP_switch.u1) annotation (Line(points={{-33.2,0},{42,0},
          {42,28.8},{54.8,28.8}}, color={0,0,127}));
  connect(HP_switch.y, Q_HP) annotation (Line(points={{68.6,24},{92,24},{92,60},
          {106,60}}, color={0,0,127}));
  connect(Q_request, Q_remaining.u2) annotation (Line(points={{-108,-60},{-40,
          -60},{-40,-61.6},{-35.2,-61.6}},
                                    color={0,0,127}));
  connect(Q_remaining.u1, HP_switch.y) annotation (Line(points={{-35.2,-54.4},{
          -40,-54.4},{-40,-12},{72,-12},{72,24},{68.6,24}},
                                     color={0,0,127}));
  connect(onOff.signal, HP_switch.u2)
    annotation (Line(points={{38,24},{54.8,24}}, color={255,0,255}));
  connect(cond_HP_buffer.u1, T_bufferTank) annotation (Line(points={{32.4,68},{24,
          68},{24,82},{60,82},{60,106}},                 color={0,0,127}));
  connect(T_HP_sup_max_.y, cond_HP_buffer.u2) annotation (Line(points={{19.3,59},
          {26,59},{26,61.6},{32.4,61.6}},
                                   color={0,0,127}));
  connect(HR_switch.u3, HR_min.y) annotation (Line(points={{54.8,-64.8},{52,
          -64.8},{52,-78},{46.6,-78}},color={0,0,127}));
  connect(Q_HP_max, HP_limiter.limit1) annotation (Line(points={{-60,-108},{-60,
          6.4},{-51.6,6.4}}, color={0,0,127}));
  connect(Q_remaining.y, HR_limiter.u)
    annotation (Line(points={{-21.4,-58},{-18,-58},{-18,-44},{-3.6,-44}},
                                                     color={0,0,127}));
  connect(HR_limiter.y, HR_switch.u1) annotation (Line(points={{14.8,-44},{50,
          -44},{50,-55.2},{54.8,-55.2}}, color={0,0,127}));
  connect(HR_min.y, HP_limiter.limit2) annotation (Line(points={{46.6,-78},{52,
          -78},{52,-30},{-54,-30},{-54,-6.4},{-51.6,-6.4}}, color={0,0,127}));
  connect(bivalence_HR_on.y, HR_unblocked.u2) annotation (Line(points={{12.6,
          -80},{24,-80},{24,-66},{28,-66},{28,-64.8},{32.8,-64.8}}, color={255,
          0,255}));
  connect(HR_unblocked.u1, signal) annotation (Line(points={{32.8,-60},{-18,-60},
          {-18,-66},{-58,-66},{-58,60},{-108,60}}, color={255,0,255}));
  connect(bivalence_HR_on.u, T_amb) annotation (Line(points={{-1.2,-80},{-62,
          -80},{-62,20},{-60,20},{-60,108}}, color={0,0,127}));
  connect(HR_unblocked.y, HR_switch.u2)
    annotation (Line(points={{46.6,-60},{54.8,-60}}, color={255,0,255}));
  connect(signal, HP_on.u[1]) annotation (Line(points={{-108,60},{-58,60},{-58,
          38},{-8,38},{-8,22.425},{-2,22.425}}, color={255,0,255}));
  connect(cond_HP_amb.y, HP_on.u[2]) annotation (Line(points={{-35.3,20},{-8,20},
          {-8,23.475},{-2,23.475}}, color={255,0,255}));
  connect(cond_HP_buffer.y, HP_on.u[3]) annotation (Line(points={{50.8,68},{54,
          68},{54,38},{-8,38},{-8,24.525},{-2,24.525}}, color={255,0,255}));
  connect(HP_on.y, onOff.request)
    annotation (Line(points={{10.9,24},{22,24}}, color={255,0,255}));
  connect(HP_limiter.y, HP_unblocked.u1) annotation (Line(points={{-33.2,0},{
          -28,0},{-28,10},{-23.2,10}}, color={0,0,127}));
  connect(HP_unblocked.y, HP_on.u[4]) annotation (Line(points={{-9.4,10},{-8,10},
          {-8,25.575},{-2,25.575}}, color={255,0,255}));
  connect(HR_switch.y, firstOrder.u)
    annotation (Line(points={{68.6,-60},{76.8,-60}}, color={0,0,127}));
  connect(firstOrder.y, Q_HR)
    annotation (Line(points={{90.6,-60},{106,-60}}, color={0,0,127}));
  connect(HR_availability.y, Q_HR_available)
    annotation (Line(points={{60,-90.6},{60,-104}}, color={0,0,127}));
  connect(bivalence_HR_on.y, HR_availability.u2) annotation (Line(points={{12.6,
          -80},{24,-80},{24,-70},{60,-70},{60,-76.8}}, color={255,0,255}));
  connect(HR_min.y, HR_availability.u3) annotation (Line(points={{46.6,-78},{52,
          -78},{52,-76.8},{55.2,-76.8}}, color={0,0,127}));
  connect(HR_max.y, HR_availability.u1) annotation (Line(points={{80,-77.4},{80,
          -70},{64.8,-70},{64.8,-76.8}}, color={0,0,127}));
  connect(Q_HP_min, gain.u) annotation (Line(points={{0,108},{0,72},{-30,72},{
          -30,65.6}}, color={0,0,127}));
  connect(gain.y, HP_unblocked.u2) annotation (Line(points={{-30,47.2},{-30,5.2},
          {-23.2,5.2}}, color={0,0,127}));
  connect(onOff.blocked, HP_blocked) annotation (Line(points={{34.8,16},{34.8,
          -14},{88,-14},{88,0},{104,0}}, color={255,0,255}));
  connect(onOff.blocked_off, HP_blocked_off)
    annotation (Line(points={{30,16},{30,-20},{104,-20}}, color={255,0,255}));
  connect(onOff.blocked_on, HP_blocked_on) annotation (Line(points={{25.2,16},{
          25.2,-28},{88,-28},{88,-40},{104,-40}}, color={255,0,255}));
  annotation (Icon(graphics={           Text(
        extent={{-132,-120},{134,-158}},
        textString="%name",
        textColor={0,0,255}),
  Line(points={{-80,78},{-80,-90}},
    color={192,192,192}),
  Line(origin={-26.667,6.667},
      points = {{106.667,43.333},{-13.333,29.333},{-53.333,-86.667}},
      color = {0,0,127},
      smooth = Smooth.Bezier),
  Text(textColor={192,192,192},
    extent={{0,-60},{60,0}},
    textString="PT1"),          Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
  Line(points={{-80,-80},{92,-80}},
    color={192,192,192}),
  Line(points={{-80,88},{-80,-80}},
    color={192,192,192}),
  Polygon(lineColor={192,192,192},
    fillColor={192,192,192},
    fillPattern=FillPattern.Solid,
    points={{-80,96},{-88,74},{-72,74},{-80,96}}),
  Polygon(lineColor={192,192,192},
    fillColor={192,192,192},
    fillPattern=FillPattern.Solid,
    points={{0,11},{-8,-11},{8,-11},{0,11}},
          origin={84,-79},
          rotation=270),
        Line(points={{-80,6}}, color={192,192,192}),
        Line(
          points={{-80,28},{-20,0},{22,-32},{72,-48}},
          color={0,140,72},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Line(
          points={{-80,-80},{-22,-80},{26,-70},{72,12}},
          color={238,46,47},
          thickness=0.5,
          smooth=Smooth.Bezier)}), Documentation(info="<html>
<h4>Basic functionality of the model</h4>
<p><b>Splits</b> a <b>heating demand</b> between a <b>heat pump (HP)</b> and an electric <b>heater rod (HR)</b> based on operating conditions, capacity limits, and minimum on/off time constraints for the HP.</p>

<p><b>HP enable conditions.</b> The HP is allowed to operate only if all of the following hold:</p>
<ul>
  <li><code>signal</code> (system enable) is true.</li>
  <li><code>T_bufferTank</code> is below <code>T_HP_sup_max</code> (supply temperature limit).</li>
  <li>Requested heat flow is above the HP turn‑on threshold <code>Q_HP_min</code> (with a small safety margin internally).</li>
  <li><code>T_amb</code> is above <code>T_HP_amb_min</code> (ambient limit).</li>
  <li>The HP on/off state is managed by an internal <code>OnOff</code> latch that enforces <code>t_onOff_minOn</code> and <code>t_onOff_minOff</code> to prevent short cycling.</li>
</ul>

<p><b>Load split.</b> When enabled, the HP supplies up to its available capacity (from <code>Q_HP_max</code> input and limiter). Any remaining demand is routed to the HR.</p>

<p><b>HR logic.</b> The HR is permitted when <code>T_amb</code> is below the bivalence threshold <code>T_HP_bivalence</code> and the system is enabled. Its output is limited to <code>Q_HR_max</code> and filtered by a first‑order lag before becoming <code>Q_HR</code>. The output <code>Q_HR_available</code> reports the currently available HR capacity given limits and the bivalence condition.</p>

<p><b>Outputs.</b> The block provides the actual heat flows <code>Q_HP</code> and <code>Q_HR</code>, the HR availability <code>Q_HR_available</code>, and HP status flags <code>HP_blocked</code>, <code>HP_blocked_on</code>, and <code>HP_blocked_off</code> so supervisory control can observe capacity usage and lock states.</p>

<h4>Source</h4>
<p>Based on measurements and logic analysis during the ERIGrid 2.0 Project at SYSLAB @ DTU, Copenhagen.</p>

</html>"));
end Splitter;
