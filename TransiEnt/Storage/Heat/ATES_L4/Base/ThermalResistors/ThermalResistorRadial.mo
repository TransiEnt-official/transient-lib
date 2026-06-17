within TransiEnt.Storage.Heat.ATES_L4.Base.ThermalResistors;
model ThermalResistorRadial "Lumped thermal element transporting heat without storing it"
 //Import und Hierachie
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  import Modelica.Constants.pi;
  import Modelica.Units.SI;

  //Parameter
  parameter SI.ThermalConductivity lambda "Heat Capacity of the aquifer";
  parameter SI.Length r_r "radius from well to center of control volume";
  parameter SI.Length z "height of control volume";
  parameter SI.Length r "Radius of thermal resistance";
  parameter SI.ThermalResistance R=(log(r)-log(r_r))/(lambda*2*pi*z) "Thermal resistance of material";//Modelica.Constants.inf;//


equation

  dT = R*Q_flow;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
        Rectangle(
          extent={{-90,70},{90,-70}},
          pattern=LinePattern.None,
          fillColor={192,192,192},
          fillPattern=FillPattern.Forward),
        Line(
          points={{-90,70},{-90,-70}},
          thickness=0.5),
        Line(
          points={{90,70},{90,-70}},
          thickness=0.5),
        Text(
          extent={{-150,120},{150,78}},
          textString="%name",
          textColor={0,0,255}),
        Text(
          extent={{-150,-80},{150,-110}},
          textString="R=%R")}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Quasi-static radial thermal resistor for one-dimensional heat conduction in cylindrical geometry between two neighbouring control volumes. The thermal resistance is computed from the cell geometry (inner and outer radius, height) and a constant thermal conductivity. Same idea as the Modelica Standard Library <a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.ThermalConductor\">ThermalConductor</a>, but parametrized by the thermal resistance instead of the conductance, which allows a resistance of zero (no temperature difference) in series connections. This is the variant without dispersion; for hydrodynamic dispersion use ThermalResistorRadial_withDispersion.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L1: Quasi-static 1D heat transport in radial direction. No thermal storage within the resistor; the temperature drop is given by the calculated thermal resistance.</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- No thermal mass inside the resistor (instantaneous conduction).</p>
<p>- Constant thermal conductivity (no temperature dependency, no dispersion).</p>
<p>- Cylindrical (radially symmetric) geometry.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>port_a: inner heat port &mdash; heat inlet (Heat, inherited from Element1D)</p>
<p>port_b: outer heat port &mdash; heat outlet (Heat, inherited from Element1D)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-tr-symbol-R.png\" alt=\"R_r\"/></td>
  <td valign=\"middle\"><code>R</code></td>
  <td valign=\"middle\">radial thermal resistance [K/W]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-lambda.png\" alt=\"\\lambda\"/></td>
  <td valign=\"middle\"><code>lambda</code></td>
  <td valign=\"middle\">thermal conductivity of the aquifer/aquitard [W/(m&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-tr-symbol-r_outer.png\" alt=\"r_\\mathrm{outer}\"/></td>
  <td valign=\"middle\"><code>r</code></td>
  <td valign=\"middle\">outer edge radius of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-tr-symbol-r_r.png\" alt=\"r_r\"/></td>
  <td valign=\"middle\"><code>r_r</code></td>
  <td valign=\"middle\">centre radius of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-z.png\" alt=\"z\"/></td>
  <td valign=\"middle\"><code>z</code></td>
  <td valign=\"middle\">height of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Qdot.png\" alt=\"\\dot{Q}\"/></td>
  <td valign=\"middle\"><code>Q_flow</code></td>
  <td valign=\"middle\">heat flow rate [W] (inherited from Element1D)</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-tr-symbol-dT.png\" alt=\"\\Delta T\"/></td>
  <td valign=\"middle\"><code>dT</code></td>
  <td valign=\"middle\">temperature difference across resistor [K] (inherited from Element1D)</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Radial thermal resistance for cylindrical geometry:</p>
<p><img src=\"modelica://ATES/../Resources/Images/equations/equation-trrad-R.png\"
     alt=\"R = (ln(r_outer) - ln(r_r)) / (lambda * 2*pi*z)\"/></p>
<p>Heat transport (inherited from Element1D):</p>
<p><img src=\"modelica://ATES/../Resources/Images/equations/equation-tr-dT.png\"
     alt=\"dT = R * Q_flow\"/></p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Used inside ImpermeableLayer to represent radial heat conduction in the confining layers. A resistance of R = 0 is permitted and yields no temperature difference, which is convenient for series connections. Thermal properties are taken from the Subsurface_Basic (Parameters) record.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Model revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Completed the documentation (10-section template, preferred heading style) and corrected the interface description (heat ports port_a/port_b inherited from Element1D; r is a parameter, not a Real input).</p>
</html>"));
end ThermalResistorRadial;
