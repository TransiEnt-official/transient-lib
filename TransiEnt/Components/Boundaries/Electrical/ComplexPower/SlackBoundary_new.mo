within TransiEnt.Components.Boundaries.Electrical.ComplexPower;
model SlackBoundary_new "Electric boundary given v and delta (slack boundary)"
  extends PartialBoundary_new;
  extends TransiEnt.Basics.Icons.ElectricSource;

  parameter Boolean useInputV=false "Use voltage magnitude input" annotation (choices(checkBox=true));
  parameter SI.Voltage v_n(displayUnit="kV") "Nominal voltage magnitude" annotation (Dialog(enable=not useInputV));
  parameter Boolean useInputDelta=false "Use voltage angle input" annotation (choices(checkBox=true));
  parameter SI.Angle delta_n=0 "Nominal voltage angle" annotation (Dialog(enable=not useInputDelta));
  parameter Boolean isFrequencyRoot=false "=true, sets grid frequency" annotation (choices(checkBox=true));
  parameter SI.Frequency f_n=50 "Nominal frequency";

  TransiEnt.Basics.Interfaces.Electrical.VoltageIn inputV if useInputV annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,110})));

  TransiEnt.Basics.Interfaces.Electrical.AngleIn inputDelta if useInputDelta annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,110}),   iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,110})));

protected
  TransiEnt.Basics.Interfaces.Electrical.VoltageIn v_internal;
  TransiEnt.Basics.Interfaces.Electrical.AngleIn delta_internal;

equation
  if useInputV then
    connect(v_internal, inputV);
  else
    v_internal = v_n;
  end if;

  if useInputDelta then
    connect(delta_internal, inputDelta);
  else
    delta_internal = delta_n;
  end if;

  if isFrequencyRoot then
    Connections.root(epp.f);
    epp.f = f_n;
  end if;

  v = v_internal;
  delta = delta_internal;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          visible=useInputV,
          extent={{-140,70},{-100,50}},
          textColor={0,0,0},
          textString="v"), Text(
          visible=useInputDelta,
          extent={{-140,-10},{-100,-28}},
          textColor={0,0,0},
          textString="δ")}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    defaultComponentName="vDelta1");
end SlackBoundary_new;
