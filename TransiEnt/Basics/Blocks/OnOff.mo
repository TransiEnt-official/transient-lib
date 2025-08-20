within TransiEnt.Basics.Blocks;
model OnOff "OnOff - Latching on/off with minimum hold times"

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter Modelica.Units.SI.Time t_holdOff=60
    "Time while the off state is locked";

  parameter Modelica.Units.SI.Time t_holdOn=30
    "Time while the on state is locked";

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------

  Modelica.Blocks.Interfaces.BooleanInput request
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

  discrete Modelica.Blocks.Interfaces.BooleanOutput signal
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

  discrete Modelica.Blocks.Interfaces.BooleanOutput blocked
    "True if heat pump state is blocked (on or off state)" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-100})));

  discrete Modelica.Blocks.Interfaces.BooleanOutput blocked_on
    "True if heat pump state is blocked at on state" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-100})));

  discrete Modelica.Blocks.Interfaces.BooleanOutput blocked_off
    "True if heat pump state is blocked at off state" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-100})));

  // ------------------------------------------------------------------------------------------
  //   Variables
  // ------------------------------------------------------------------------------------------

  discrete Modelica.Units.SI.Time t_lastChange;

  // ------------------------------------------------------------------------------------------
  //   Equations
  // ------------------------------------------------------------------------------------------

initial equation
  // initial request
  signal = request;

  // assume that a change is directly possible after simulation start
  t_lastChange = -t_holdOff;
  blocked = false;
  blocked_on = false;
  blocked_off = false;

algorithm
  when request and not pre(signal) and not pre(blocked) then
     signal :=true;
     blocked :=true;
     blocked_on :=true;
     t_lastChange :=time;
  elsewhen not request and pre(signal) and not pre(blocked) then
     signal :=false;
     blocked :=true;
     blocked_off :=true;
     t_lastChange :=time;
  end when;

  // block after a state change, and unblock after edge specific time
  when not pre(signal) and time > pre(t_lastChange) + t_holdOff then
    blocked :=false;
    blocked_off :=false;
  elsewhen pre(signal) and time > pre(t_lastChange) + t_holdOn then
    blocked :=false;
    blocked_on :=false;
  end when;

  annotation (Icon(graphics={   Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,66},{26,-44}},
          lineColor={28,108,200},
          fillColor={199,234,255},
          fillPattern=FillPattern.Solid),
                             Text(
          extent={{-100,-60},{100,-98}},
          textColor={28,108,200},
          textString="%t_min"),
        Text(
          extent={{-148,-108},{152,-148}},
          textString="%name",
          textColor={0,0,255}),
        Rectangle(
          extent={{-30,66},{2,-44}},
          lineColor={28,108,200},
          fillColor={238,146,147},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-86,-44},{-30,-44},{-30,66},{2,66},{2,-44},{80,-44}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{2,66},{26,66},{26,-44},{80,-44}},
          color={0,140,72},
          thickness=0.5),    Text(
          extent={{30,76},{88,48}},
          textColor={28,108,200},
          fontSize=48,
          textString="on",
          horizontalAlignment=TextAlignment.Left),
                             Text(
          extent={{30,-22},{88,-50}},
          textColor={28,108,200},
          fontSize=48,
          horizontalAlignment=TextAlignment.Left,
          textString="off")}), Documentation(info="<html>
<p>This block turns a Boolean <i>request</i> into a Boolean <i>signal</i> (e.g., a compressor enable) while enforcing minimum on/off holding times. After every state change, the output is blocked against further changes until the corresponding hold time elapses. Separate flags indicate which state is currently locked. </p>
<h4>Parameters</h4>
<ul>
<li><span style=\"font-family: Courier New;\">t_holdOff:</span> time while the <b>off</b> state is locked (no switch to on allowed). </li>
<li><span style=\"font-family: Courier New;\">t_holdOn:</span> time while the <b>on</b> state is locked (no switch to off allowed). </li>
</ul>
<h4>Connectors</h4>
<ul>
<li><span style=\"font-family: Courier New;\">request</span> (Boolean input): desired state (true = on). </li>
<li><span style=\"font-family: Courier New;\">signal</span> (Boolean output, discrete): commanded state after enforcing hold logic. </li>
<li><span style=\"font-family: Courier New;\">blocked</span> (Boolean output, discrete): true while <span style=\"font-family: Courier New;\">signal</span> is locked (either state). </li>
<li><span style=\"font-family: Courier New;\">blocked_on</span> (Boolean output, discrete): true while on-state is locked. </li>
<li><span style=\"font-family: Courier New;\">blocked_off</span> (Boolean output, discrete): true while off-state is locked. </li>
</ul>
<h4>Behavior</h4>
<p><b>Initialization</b>: signal = request. All block flags start as false.</p>
<p><b>Edge acceptance</b>:</p>
<ul>
<li>Rising edge (<span style=\"font-family: Courier New;\">request</span>: false &rarr; true) is accepted only if <span style=\"font-family: Courier New;\">pre(signal)=false</span> and <span style=\"font-family: Courier New;\">pre(blocked)=false</span>. </li>
<li>Falling edge (<span style=\"font-family: Courier New;\">request</span>: true &rarr; false) is accepted only if <span style=\"font-family: Courier New;\">pre(signal)=true</span> and <span style=\"font-family: Courier New;\">pre(blocked)=false</span>. </li>
</ul>
<p>When an edge is accepted, <span style=\"font-family: Courier New;\">signal</span> toggles, <span style=\"font-family: Courier New;\">blocked</span> is set, the corresponding lock flag (<span style=\"font-family: Courier New;\">blocked_on</span> or <span style=\"font-family: Courier New;\">blocked_off</span>) is set, and <span style=\"font-family: Courier New;\">t_lastChange := time</span>. </p>
<p><b>Hold timers:</b> The lock clears when the appropriate hold time has elapsed since the last change: </p>
<ul>
<li>If the current state is <i>off</i> (<span style=\"font-family: Courier New;\">pre(signal)=false</span>): lock clears at <span style=\"font-family: Courier New;\">time &gt; pre(t_lastChange) + t_holdOff</span>. </li>
<li>If the current state is <i>on</i> (<span style=\"font-family: Courier New;\">pre(signal)=true</span>): lock clears at <span style=\"font-family: Courier New;\">time &gt; pre(t_lastChange) + t_holdOn</span>. </li>
</ul>
<h4>Notes</h4>
<p>While <span style=\"font-family: Courier New;\">blocked=true</span>, <span style=\"font-family: Courier New;\">signal</span> cannot change regardless of <span style=\"font-family: Courier New;\">request</span>. </p>
<p><span style=\"font-family: Courier New;\">blocked_on</span> and <span style=\"font-family: Courier New;\">blocked_off</span> are mutually exclusive and imply <span style=\"font-family: Courier New;\">blocked</span>. </p>
<p>First change after start is allowed immediately (no initial hold). </p>
<h4>Typical use</h4>
<p>Place <span style=\"font-family: Courier New;\">OnOff</span> between a thermostat (or controller) output and a plant enable input to prevent short cycling: enforce a minimum <i>on</i> duration with <span style=\"font-family: Courier New;\">t_holdOn</span> and a minimum off duration with <span style=\"font-family: Courier New;\">t_holdOff</span>. </p>
</html>"));
end OnOff;
