within TransiEnt.Basics.Blocks;
block DerivativeReset "Derivative block with reset"
  extends Modelica.Blocks.Continuous.Derivative;

  Modelica.Blocks.Interfaces.BooleanInput reset annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-60,-120})));

equation
  when reset then
    reinit(x, u);
  end when;

  annotation (Documentation(info="<html>
<p>Based on the MSL derivative block, enhanced by a reset function.</p>
<p>During reset, the state of the first order transfer function is resetted so that <code>x = u</code>.</p>
</html>"));
end DerivativeReset;
