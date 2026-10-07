within TransiEnt.Storage.Heat.ATES_L4.Base.ThermalResistors;
model ThermalResistorVertical "Lumped thermal element transporting heat without storing it"

  //Import und Hierachie
  import Modelica.Units.SI;
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;

  //Parameter
  parameter SI.ThermalConductivity lambda "Heat Conductivity of the aquifer";
  parameter SI.Area A;
  parameter SI.Length z "heights of all control volumes in aquifer";
  parameter SI.ThermalResistance R=0.5*z/(lambda*A) "Thermal resistance of material";//Modelica.Constants.inf;//


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
<p>Quasi-static vertical thermal resistor for one-dimensional heat conduction between two vertically neighbouring control volumes. The thermal resistance is computed from half the control volume height and the cross-sectional area with a constant thermal conductivity. Same idea as the Modelica Standard Library <a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.ThermalConductor\">ThermalConductor</a>, but parametrized by the thermal resistance instead of the conductance, which allows a resistance of zero (no temperature difference) in series connections. This is the variant without dispersion; for hydrodynamic dispersion use ThermalResistorVertical_withDispersion.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L1: Quasi-static 1D heat transport in vertical direction. No thermal storage within the resistor; the temperature drop is given by the calculated thermal resistance.</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- No thermal mass inside the resistor (instantaneous conduction).</p>
<p>- Constant thermal conductivity (no temperature dependency, no dispersion).</p>
<p>- The factor 0.5 in the resistance formula assumes the temperature node sits at the centre of the control volume.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>port_a: lower heat port &mdash; heat inlet (Heat, inherited from Element1D)</p>
<p>port_b: upper heat port &mdash; heat outlet (Heat, inherited from Element1D)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-symbol-R.png\" alt=\"R_v\"/></td>
  <td valign=\"middle\"><code>R</code></td>
  <td valign=\"middle\">vertical thermal resistance [K/W]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-lambda.png\" alt=\"\\lambda\"/></td>
  <td valign=\"middle\"><code>lambda</code></td>
  <td valign=\"middle\">thermal conductivity of the aquifer/aquitard [W/(m&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-symbol-As.png\" alt=\"A_s\"/></td>
  <td valign=\"middle\"><code>A</code></td>
  <td valign=\"middle\">cross-sectional area of control volume [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-symbol-z.png\" alt=\"z_\\mathrm{cv}\"/></td>
  <td valign=\"middle\"><code>z</code></td>
  <td valign=\"middle\">height of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-Qdot.png\" alt=\"\\dot{Q}\"/></td>
  <td valign=\"middle\"><code>Q_flow</code></td>
  <td valign=\"middle\">heat flow rate [W] (inherited from Element1D)</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-dT.png\" alt=\"\\Delta T\"/></td>
  <td valign=\"middle\"><code>dT</code></td>
  <td valign=\"middle\">temperature difference across resistor [K] (inherited from Element1D)</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Vertical thermal resistance (half-cell formulation):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-trvert-R.png\"
     alt=\"R = 0.5*z / (lambda * A)\"/></p>
<p>Heat transport (inherited from Element1D):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-dT.png\"
     alt=\"dT = R * Q_flow\"/></p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Used inside ImpermeableLayer to represent vertical heat conduction in the confining layers. A resistance of R = 0 is permitted and yields no temperature difference, which is convenient for series connections. Thermal properties are taken from the Subsurface_Basic (Parameters) record.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Model revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Completed the documentation (10-section template, preferred heading style) and corrected the interface description (heat ports port_a/port_b inherited from Element1D; A is a parameter, not a Real input).</p>
</html>"));
end ThermalResistorVertical;
