within TransiEnt.Basics.Interfaces.Electrical;
connector AngleIn=Modelica.Blocks.Interfaces.RealInput (final quantity= "Angle", final unit="deg", displayUnit="°")
  "Input for delta angle for ComplexPowerPort"
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
    Polygon(
          fillColor={0,128,255},
          lineColor={0,128,255},
          fillPattern=FillPattern.Solid,
          points={{-104.0,104.0},{104.0,0.0},{-104.0,-104.0}})}), Diagram(graphics,
                                                                          coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Interface for delta input.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no physical modeling)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no physical modeling)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>Modelica RealInput: delta in [°]</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>This connector should only be used for voltage angles (delta) (type consistency).</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Tom Steffen (tom.steffen@tuhh.de), September 2023</p>
</html>"));
