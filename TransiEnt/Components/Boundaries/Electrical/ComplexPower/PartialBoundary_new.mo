within TransiEnt.Components.Boundaries.Electrical.ComplexPower;
partial model PartialBoundary_new
  "Partial Boundary, inherited from other CPP boundaries"

  /* NOTE: When deriving from this class use and set the following variables:
  *  P, Q, v, delta
  */

  extends
    TransiEnt.Components.Boundaries.Electrical.Base.PartialModelPowerBoundary(
      redeclare TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp);

  final SI.ActivePower P(displayUnit="MW") = epp.P;
  final SI.ReactivePower Q(displayUnit="Mvar") = epp.Q;
  final SI.ActivePower P_gen(displayUnit="MW") = -epp.P "Injected active power";
  final SI.ReactivePower Q_gen(displayUnit="Mvar") = -epp.Q
    "Injected reactive power";
  final SI.Voltage v(
    displayUnit="kV",
    stateSelect=StateSelect.never) = epp.v;
  final SI.Angle delta(
    displayUnit="deg",
    stateSelect=StateSelect.never) = epp.delta;
  SI.Angle phi=Modelica.Math.atan2(Q, P);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialBoundary_new;
