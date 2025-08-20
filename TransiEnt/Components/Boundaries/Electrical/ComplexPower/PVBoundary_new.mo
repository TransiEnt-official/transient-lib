within TransiEnt.Components.Boundaries.Electrical.ComplexPower;
model PVBoundary_new "Electric boundary given P and v"
  extends PartialBoundary_new;
  extends TransiEnt.Basics.Icons.ElectricSource;

  parameter Boolean useInputV=false "Use voltage magnitude input" annotation (choices(checkBox=true));
  parameter SI.PerUnit v_pu = 1 annotation (Dialog(enable=not useInputV));
  parameter SI.Voltage v_n(displayUnit="kV") "Nominal voltage magnitude" annotation (Dialog(enable=not useInputV));
  parameter Boolean useInputP=false "Use active power input generated" annotation (choices(checkBox=true));
  parameter SI.ActivePower P_n(displayUnit="MW") "Nominal active power generated" annotation (Dialog(enable=not useInputP));

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn inputP if useInputP annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,110})));
  TransiEnt.Basics.Interfaces.Electrical.VoltageIn inputV if useInputV
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={60,110},
        rotation=270),                                                                   iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,110})));

protected
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_internal;
  TransiEnt.Basics.Interfaces.Electrical.VoltageIn v_internal;

equation
  if useInputP then
    connect(P_internal, inputP);
  else
    P_internal = P_n;
  end if;

  if useInputV then
    connect(v_internal, inputV);
  else
    v_internal = v_pu * v_n;
  end if;

  P = -P_internal;
  v = v_internal;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          visible=useInputP,
          extent={{-140,70},{-100,50}},
          textColor={0,0,0},
          textString="P"), Text(
          visible=useInputV,
          extent={{-140,-8},{-100,-28}},
          textColor={0,0,0},
          textString="v")}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    defaultComponentName="pv1");
end PVBoundary_new;
