within TransiEnt.Components.Boundaries.Electrical.ComplexPower;
model PQBoundary_new "Electric boundary given P and Q"
  extends PartialBoundary_new;
  extends TransiEnt.Basics.Icons.ElectricSink;

  parameter Boolean useInputConnectorP=false "Use active power input" annotation (choices(checkBox=true));
  parameter SI.ActivePower P_n(displayUnit="MW") = 0 "Nominal active power" annotation (choices(checkBox=true), Dialog(enable=not useInputP));
  parameter Boolean useInputConnectorQ=false "Use active power input" annotation (choices(checkBox=true));
  parameter SI.ReactivePower Q_n(displayUnit="Mvar") = 0 "Nominal reactive power" annotation (choices(checkBox=true), Dialog(enable=not useInputQ));
  parameter SI.Voltage v_n(displayUnit="kV");

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_el_set if useInputConnectorP annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,110})));
  TransiEnt.Basics.Interfaces.Electrical.ReactivePowerIn Q_el_set if useInputConnectorQ
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={60,110},
        rotation=270),                                                                   iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,110})));

protected
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_internal;
  TransiEnt.Basics.Interfaces.Electrical.ReactivePowerIn Q_internal;

equation
  if useInputConnectorP then
    connect(P_internal, P_el_set);
  else
    P_internal = P_n;
  end if;

  if useInputConnectorQ then
    connect(Q_internal, Q_el_set);
  else
    Q_internal = Q_n;
  end if;

  P = P_internal;
  Q = Q_internal;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          visible=useInputP,
          extent={{-140,70},{-100,50}},
          textColor={0,0,0},
          textString="P"), Text(
          visible=useInputQ,
          extent={{-140,-10},{-100,-30}},
          textColor={0,0,0},
          textString="Q")}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    defaultComponentName="pq1");
end PQBoundary_new;
