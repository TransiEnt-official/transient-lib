within TransiEnt.Basics.Blocks;
block PID_reset_lim
  "MSL PID block enhanced by variable limits, dead zone and reset function"
  import Modelica.Blocks.Types.Init;
  import Modelica.Blocks.Types.SimpleController;
  extends Modelica.Blocks.Interfaces.SVcontrol;
  output Real controlError=u_s - u_m "Control error (set point - measurement)";

  encapsulated package Types
    type reinitMethods = enumeration(
        zero "Use zero",
        xi_start "Use xi_start",
        limit1 "Use lower limit (sampled value)",
        limit2 "Use upper limit (sampled value)",
        limitMean "Use mean of both limits (sampled value)");
  end Types;

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter .Modelica.Blocks.Types.SimpleController controllerType=.Modelica.Blocks.Types.SimpleController.PID
    "Type of controller";
  parameter Real k(
    min=0,
    unit="1") = 1 "Gain of controller";
  parameter Real k_p(
    min=0,
    unit="1") = 1 "Gain of P";
  parameter Modelica.Units.SI.Time Ti(min=Modelica.Constants.small) = 0.5
    "Time constant of Integrator block" annotation (Dialog(enable=
          controllerType == .Modelica.Blocks.Types.SimpleController.PI or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Modelica.Units.SI.Time Td(min=0) = 0.1
    "Time constant of Derivative block" annotation (Dialog(enable=
          controllerType == .Modelica.Blocks.Types.SimpleController.PD or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real yMax(start=1) if not useVariableLimits "Upper limit of output"
    annotation (Dialog(enable=not useVariableLimits));
  parameter Real yMin=-yMax if not useVariableLimits "Lower limit of output"
    annotation (Dialog(enable=not useVariableLimits));
  parameter Real wp(min=0) = 1 "Set-point weight for Proportional block (0..1)";
  parameter Real wd(min=0) = 0 "Set-point weight for Derivative block (0..1)"
    annotation (Dialog(enable=controllerType == .Modelica.Blocks.Types.SimpleController.PD
           or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Ni(min=100*Modelica.Constants.eps) = 0.9
    "Ni*Ti is time constant of anti-windup compensation" annotation (Dialog(
        enable=controllerType == .Modelica.Blocks.Types.SimpleController.PI or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Nd(min=100*Modelica.Constants.eps) = 10
    "The higher Nd, the more ideal the derivative block" annotation (Dialog(
        enable=controllerType == .Modelica.Blocks.Types.SimpleController.PD or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Boolean withFeedForward=false "Use feed-forward input?"
    annotation (Evaluate=true, choices(checkBox=true));
  parameter Real kFF=1 "Gain of feed-forward input"
    annotation (Dialog(enable=withFeedForward));
  parameter Init initType=Init.InitialState
    "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
    annotation (Evaluate=true, Dialog(group="Initialization"));
  parameter Real xi_start=0
    "Initial or guess value for integrator output (= integrator state)"
    annotation (Dialog(group="Initialization", enable=controllerType == .Modelica.Blocks.Types.SimpleController.PI
           or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Types.reinitMethods reinitMethod=Types.reinitMethods.zero
    "Source for new integrator state after reset" annotation (Dialog(group="Initialization",
        enable=useReset and (controllerType == .Modelica.Blocks.Types.SimpleController.PI
           or controllerType == .Modelica.Blocks.Types.SimpleController.PID)));
  parameter Real xd_start=0
    "Initial or guess value for state of derivative block" annotation (Dialog(
        group="Initialization", enable=controllerType == .Modelica.Blocks.Types.SimpleController.PD
           or controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real y_start=0 "Initial value of output" annotation (Dialog(enable=
          initType == Init.InitialOutput, group="Initialization"));
  parameter Modelica.Blocks.Types.VariableLimiterHomotopy homotopyType=Modelica.Blocks.Types.VariableLimiterHomotopy.Linear
    "Simplified model for homotopy-based initialization"
    annotation (Evaluate=true, Dialog(group="Initialization"));
  parameter Boolean strict=false "= true, if strict limits with noEvent(..)"
    annotation (
    Evaluate=true,
    choices(checkBox=true),
    Dialog(tab="Advanced"));
  parameter Boolean useReset=true "use reset input (affects I and D)"
    annotation (Evaluate=true);
  parameter Boolean useVariableLimits=false
    "use variable limits (as model inputs)" annotation (Evaluate=true);
  parameter Boolean useDeadZone=false
    "use dead zone for control error input for I" annotation (Evaluate=true);
  parameter Real deadZoneValue=0.5 "dead zone value" annotation (
    Evaluate=true,
    choices(checkBox=true),
    Dialog(enable=useDeadZone));
  constant Modelica.Units.SI.Time unitTime=1 annotation (HideResult=true);

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------

  Modelica.Blocks.Interfaces.RealInput u_ff if withFeedForward
    "Optional connector of feed-forward input signal" annotation (Placement(
        transformation(
        origin={60,-120},
        extent={{20,-20},{-20,20}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput limit1 if useVariableLimits
    "Connector of Real input signal used as maximum of input u"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput limit2 if useVariableLimits
    "Connector of Real input signal used as minimum of input u"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.BooleanInput reset if useReset annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-60,-120})));

  // ------------------------------------------------------------------------------------------
  //   Instances of other classes
  // ------------------------------------------------------------------------------------------

  Modelica.Blocks.Math.Add addP(k1=wp, k2=-1)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Math.Add addD(k1=wd, k2=-1) if with_D
    annotation (Placement(transformation(extent={{-84,-8},{-68,8}})));
  Modelica.Blocks.Math.Gain P(k=k_p)
    annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
  Modelica.Blocks.Continuous.Integrator I(
    k=unitTime/Ti,
    y_start=xi_start,
    initType=if initType == Init.SteadyState then Init.SteadyState else if
        initType == Init.InitialState then Init.InitialState else Init.NoInit)
    if with_I
    annotation (Placement(transformation(extent={{-32,-60},{-12,-40}})));
  DerivativeReset D(
    k=Td/unitTime,
    T=max([Td/Nd,1.e-14]),
    x_start=xd_start,
    initType=Modelica.Blocks.Types.Init.SteadyState) if with_D
    annotation (Placement(transformation(extent={{-62,-8},{-46,8}})));
  Modelica.Blocks.Math.Gain gainPID(k=k)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Add3 addPID
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add3 addI(k2=-1) if with_I
    annotation (Placement(transformation(extent={{-82,-60},{-62,-40}})));
  Modelica.Blocks.Math.Add addSat(k1=+1, k2=-1) if with_I annotation (Placement(
        transformation(
        origin={80,-50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Math.Gain gainTrack(k=1/(k*Ni)) if with_I
    annotation (Placement(transformation(extent={{36,-80},{16,-60}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter(strict=strict,
      homotopyType=homotopyType)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Sources.Constant Dzero(k=0) if not with_D
    annotation (Placement(transformation(extent={{-40,20},{-30,30}})));
  Modelica.Blocks.Sources.Constant Izero(k=0) if not with_I
    annotation (Placement(transformation(extent={{20,-57},{10,-47}})));
  Modelica.Blocks.Sources.Constant FFzero(k=0) if not withFeedForward
    annotation (Placement(transformation(extent={{30,-35},{40,-25}})));
  Modelica.Blocks.Math.Add addFF(k1=1, k2=kFF)
    annotation (Placement(transformation(extent={{48,-6},{60,6}})));
  Modelica.Blocks.Nonlinear.Limiter D_limiter(uMax=2, uMin=-1000) if with_D
    annotation (Placement(transformation(extent={{-40,-6},{-28,6}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=deadZoneValue) if
    useDeadZone
    annotation (Placement(transformation(extent={{-54,-56},{-42,-44}})));

  // ------------------------------------------------------------------------------------------
  //   Protected section
  // ------------------------------------------------------------------------------------------

  Modelica.Blocks.Sources.Constant constLimit2(k=yMin) if not useVariableLimits
    annotation (Placement(transformation(extent={{48,-35},{58,-25}})));
  Modelica.Blocks.Sources.Constant constLimit1(k=yMax) if not useVariableLimits
    annotation (Placement(transformation(extent={{48,23},{58,33}})));
protected
  parameter Boolean with_I=controllerType == SimpleController.PI or
      controllerType == SimpleController.PID
    annotation (Evaluate=true, HideResult=true);
  parameter Boolean with_D=controllerType == SimpleController.PD or
      controllerType == SimpleController.PID
    annotation (Evaluate=true, HideResult=true);
  Modelica.Blocks.Interfaces.BooleanInput reset_internal;

  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------

initial equation
  if initType == Init.InitialOutput then
    gainPID.y = y_start;
  end if;
equation

  when reset_internal and reinitMethod == Types.reinitMethods.zero then
    reinit(I.y, 0);
  elsewhen reset_internal and reinitMethod == Types.reinitMethods.xi_start then
    reinit(I.y, xi_start);
  elsewhen reset_internal and reinitMethod == Types.reinitMethods.limit1 then
    reinit(I.y, variableLimiter.limit1);
  elsewhen reset_internal and reinitMethod == Types.reinitMethods.limit2 then
    reinit(I.y, variableLimiter.limit2);
  elsewhen reset_internal and reinitMethod == Types.reinitMethods.limitMean then
    reinit(I.y, (variableLimiter.limit1 + variableLimiter.limit2) / 2);
  end when;

  // dead zone
  if not useDeadZone then
    connect(addI.y, I.u) annotation (Line(points={{-61,-50},{-58,-50},{-58,-64},
            {-38,-64},{-38,-50},{-34,-50}}, color={0,0,127}));
  end if;

  // conditional reset input
  connect(reset_internal, reset);
  if not useReset then
    reset_internal = false;
  end if;
  connect(reset, D.reset);

  connect(u_s, addP.u1) annotation (Line(points={{-120,0},{-96,0},{-96,56},{-82,
          56}}, color={0,0,127}));
  connect(u_s, addD.u1) annotation (Line(points={{-120,0},{-96,0},{-96,4.8},{-85.6,
          4.8}}, color={0,0,127}));
  connect(addP.y, P.u)
    annotation (Line(points={{-59,50},{-52,50}}, color={0,0,127}));
  connect(addD.y, D.u)
    annotation (Line(points={{-67.2,0},{-63.6,0}}, color={0,0,127}));
  connect(P.y, addPID.u1) annotation (Line(points={{-29,50},{-20,50},{-20,8},{-12,
          8}}, color={0,0,127}));
  connect(I.y, addPID.u3) annotation (Line(points={{-11,-50},{-8,-50},{-8,-16},{
          -12,-16},{-12,-8}}, color={0,0,127}));
  connect(variableLimiter.y, addSat.u1) annotation (Line(points={{91,0},{94,0},{
          94,-20},{86,-20},{86,-38}}, color={0,0,127}));
  connect(variableLimiter.y, y)
    annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
  connect(addSat.y, gainTrack.u)
    annotation (Line(points={{80,-61},{80,-70},{38,-70}}, color={0,0,127}));
  connect(gainTrack.y, addI.u3)
    annotation (Line(points={{15,-70},{-84,-70},{-84,-58}}, color={0,0,127}));
  connect(u_m, addP.u2) annotation (Line(points={{0,-120},{0,-92},{-92,-92},{-92,
          44},{-82,44}}, color={0,0,127}));
  connect(u_m, addD.u2) annotation (Line(points={{0,-120},{0,-92},{-92,-92},{-92,
          -4.8},{-85.6,-4.8}}, color={0,0,127}));
  connect(Dzero.y, addPID.u2) annotation (Line(points={{-29.5,25},{-24,25},{-24,
          0},{-12,0}}, color={0,0,127}));
  connect(Izero.y, addPID.u3) annotation (Line(points={{9.5,-52},{-8,-52},{-8,-16},
          {-12,-16},{-12,-8}}, color={0,0,127}));
  connect(addPID.y, gainPID.u)
    annotation (Line(points={{11,0},{18,0}}, color={0,0,127}));
  connect(addFF.y, variableLimiter.u)
    annotation (Line(points={{60.6,0},{68,0}}, color={0,0,127}));
  connect(gainPID.y, addFF.u1) annotation (Line(points={{41,0},{44,0},{44,3.6},{
          46.8,3.6}}, color={0,0,127}));
  connect(FFzero.y, addFF.u2) annotation (Line(points={{40.5,-30},{44,-30},{44,-3.6},
          {46.8,-3.6}}, color={0,0,127}));
  connect(addFF.u2, u_ff) annotation (Line(points={{46.8,-3.6},{44,-3.6},{44,-92},
          {60,-92},{60,-120}}, color={0,0,127}));
  connect(addFF.y, addSat.u2) annotation (Line(points={{60.6,0},{64,0},{64,-20},
          {74,-20},{74,-38}}, color={0,0,127}));
  connect(limit1, variableLimiter.limit1)
    annotation (Line(points={{-120,80},{68,80},{68,8}}, color={0,0,127}));
  connect(limit2, variableLimiter.limit2) annotation (Line(points={{-120,-80},{-94,
          -80},{-94,-18},{68,-18},{68,-8}}, color={0,0,127}));
  connect(D.y, D_limiter.u)
    annotation (Line(points={{-45.2,0},{-41.2,0}}, color={0,0,127}));
  connect(D_limiter.y, addPID.u2)
    annotation (Line(points={{-27.4,0},{-12,0}}, color={0,0,127}));
  connect(u_s, addI.u1) annotation (Line(points={{-120,0},{-96,0},{-96,4},{-90,4},
          {-90,-42},{-84,-42}}, color={0,0,127}));
  connect(u_m, addI.u2) annotation (Line(points={{0,-120},{0,-92},{-92,-92},{-92,
          -50},{-84,-50}}, color={0,0,127}));
  connect(addI.y, deadZone.u)
    annotation (Line(points={{-61,-50},{-55.2,-50}}, color={0,0,127}));
  connect(deadZone.y, I.u)
    annotation (Line(points={{-41.4,-50},{-34,-50}}, color={0,0,127}));
  connect(constLimit2.y, variableLimiter.limit2) annotation (Line(points={{58.5,
          -30},{62,-30},{62,-18},{68,-18},{68,-8}}, color={0,0,127}));
  connect(constLimit1.y, variableLimiter.limit1)
    annotation (Line(points={{58.5,28},{68,28},{68,8}}, color={0,0,127}));
  annotation (
    defaultComponentName="PID",
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(
          points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-80},{-80,-20},{30,60},{80,60}}, color={0,0,127}),
        Text(
          extent={{-20,-20},{80,-60}},
          textColor={192,192,192},
          textString="%controllerType"),
        Line(
          visible=strict,
          points={{30,60},{81,60}},
          color={255,0,0})}),
    Diagram(graphics={Text(
          extent={{79,-112},{129,-102}},
          textColor={0,0,255},
          textString=" (feed-forward)")}),
    Documentation(info="<html>
<h4>New features</h4>
<p>The PID controller is based on the MSL Model <code>Modelica.Blocks.Continuous.LimPID</code>. The changes are listed below:</p>

<h5>Dead zone</h5>
<p>Via parameter <code>useDeadZone</code> the dead zone block at the input of the integrator can be activated so that small changes in the input do not change the integrator state.</p>
<p>The dead zone value can be changed via parameter <code>deadZoneValue</code>.</p>

<h5>Reset</h5>
<p>As input, the model's states (<code>I.x</code>, <code>D.x</code>) can be reset. The following options are possible:</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <th>reinitMethods value</th>
  <th>Description</th>
</tr>
<tr>
  <td><code>zero</code></td>
  <td>Reset the state to zero.</td>
</tr>
<tr>
  <td><code>xi_start</code></td>
  <td>Reset the state to its initial value (<code>xi_start</code>).</td>
</tr>
<tr>
  <td><code>limit1</code></td>
  <td>Reset the state to the current lower limit (sampled value).</td>
</tr>
<tr>
  <td><code>limit2</code></td>
  <td>Reset the state to the current upper limit (sampled value).</td>
</tr>
</table>

<h5>Variable limits</h5>
<p>Via parameter <code>useVariableLimits</code> variable limits can be activated, so that during simulation the lower and upper limit can be changed. This is useful if the allowable actuator range changes dynamically, for example due to varying operating conditions, safety margins, or resource availability.</p>

</html>"));
end PID_reset_lim;
