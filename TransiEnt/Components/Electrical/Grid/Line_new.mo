within TransiEnt.Components.Electrical.Grid;
model Line_new "Transmission line given r,x,b"

  extends TransiEnt.Components.Electrical.Grid.Base.AdmittanceTwoPort(
    final Y_11=1/Complex(R_actual, X) + Complex(0, B)/2,
    final Y_12=-1/Complex(R_actual, X),
    final Y_21=Y_12,
    final Y_22=Y_11);

  SI.Current i_loading "Overall current flow";

  SI.PerUnit loading(displayUnit="%") "Line current [pu]";
  parameter Boolean useHeatPort = false;
  parameter Boolean simplified_Pi_Model = false;
  parameter SI.Length length "Line length";
  parameter Integer parallel=1 "Number of parallel lines";

  parameter TransiEnt.Basics.Units.SpecificResistance r(displayUnit="Ohm/km");
  parameter TransiEnt.Basics.Units.SpecificReactance x(displayUnit="Ohm/km");
  parameter TransiEnt.Basics.Units.SpecificConductance b(displayUnit="uS/km");
  parameter SI.Current i_n(displayUnit="kA");

  final parameter SI.Impedance R=r*length/parallel;
  final parameter SI.Impedance X=x*length/parallel;
  final parameter SI.Conductance B= if not simplified_Pi_Model then b*length*parallel else 0;

  SI.Impedance R_actual;
  SI.Temperature T = 20;
  Modelica.Blocks.Interfaces.RealOutput T_internal(start=0) "Temperature";
  TransiEnt.Basics.Interfaces.General.TemperatureCelsiusIn CoreTemperature(start=0) if useHeatPort annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-100}),  iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-90})));

equation
  if not useHeatPort then
    T_internal = T;
  end if;

  R_actual = R * (1 + 0.0403 * (T_internal - 20));
  i_loading=sqrt(max((epp_p.P^2 +epp_p.Q ^2)/epp_p.v^2, (epp_n.P^2 +epp_n.Q ^2)/epp_n.v^2)/3);
  loading = i_loading/(i_n*parallel);

  connect(CoreTemperature, T_internal);

  annotation (Icon(graphics={Line(
          points={{-100,0},{102,0}},
          color={0,0,0},
          thickness=0.5), Text(
          extent={{-100,-12},{100,-26}},
          textColor={28,108,200},
          textString="%length")}));
end Line_new;
