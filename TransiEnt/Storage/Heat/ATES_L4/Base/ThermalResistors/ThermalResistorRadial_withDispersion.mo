within TransiEnt.Storage.Heat.ATES_L4.Base.ThermalResistors;
model ThermalResistorRadial_withDispersion "model of thermal resistor can consider dispersion"
//Import und Hierachie
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  import Modelica.Constants.pi;
  import Modelica.Units.SI;

  //Parameter
  parameter SI.ThermalConductivity lambda "Heat Capacity of the aquifer";
  parameter SI.Length r_r "radius from well to center of control volume";
  parameter SI.Length z "height of control volume";
  parameter SI.Length r "Radius of thermal resistance";
  parameter SI.Length disp_length = 0.7 "dispersion length";
  parameter Real C(quantity="specific volumetric heat capacity", unit="J/(m3.K)")=n*C_f + (1-n)*C_s "volumetric heat capacity of stone and fluid";
  parameter Real C_f(quantity="specific volumetric heat capacity", unit="J/(m3.K)")=4.3*10^6 "volumetric heat capacity of fluid";
  parameter Real C_s(quantity="specific volumetric heat capacity", unit="J/(m3.K)")=1.81*10^6 "volumetric heat capacity of stone";
  parameter Real n = 0.25 "porosity of underground";
  parameter Boolean dispersion = false "whether dispersion is considered or not";

  //variable
  SI.ThermalConductivity lambda_overall "overall effective thermal conductivity";
  SI.ThermalResistance R "Thermal resistance of material";//Modelica.Constants.inf;//
  SI.ThermalConductivity lambda_disp "dispersion depending part of thermal conductivity";

  //Gleichungen
  Modelica.Blocks.Interfaces.RealInput
                       q_r "darcy velocity in radial direction" annotation (Placement(transformation(extent={{-126,38},{-86,78}})));
equation
  lambda_disp = disp_length * abs(q_r) * C_f;
  if dispersion then
    lambda_overall = lambda + lambda_disp;
  else
    lambda_overall = lambda;
  end if;
  R=(log(r)-log(r_r))/(lambda_overall*2*pi*z);
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
<p>Quasi-static radial thermal resistor for heat conduction in cylindrical geometry between two neighbouring aquifer control volumes. Optionally adds hydrodynamic dispersion to the effective thermal conductivity based on the local radial Darcy velocity. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L1: Quasi-static 1D heat transport in radial direction. No thermal storage within the resistor. Thermal resistance is computed from geometry and effective conductivity. Dispersion increases effective conductivity proportionally to the magnitude of the Darcy flux. </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- No thermal mass inside the resistor (instantaneous conduction).</p>
<p>- Dispersion term assumes a linear relationship between Darcy velocity and dispersivity. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/ThermalResistorRadial_withDispersion_interfaces.svg\" alt=\"Interface diagram: port_a (heat in, left), port_b (heat out, right), q_r (Darcy velocity signal, left)\"/></p>
<p>port_a: inner heat port &mdash; heat inlet (Heat, inherited from Element1D)</p>
<p>port_b: outer heat port &mdash; heat outlet (Heat, inherited from Element1D)</p>
<p>q_r: radial Darcy velocity input for dispersion calculation (Signal) </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\"><tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-R.png\" alt=\"R_r\"/></p></td>
<td valign=\"middle\"><pre>R</pre></td>
<td valign=\"middle\"><p>radial thermal resistance [K/W]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-lambda_eff.png\" alt=\"\\lambda_\\mathrm{eff}\"/></p></td>
<td valign=\"middle\"><pre>lambda_overall</pre></td>
<td valign=\"middle\"><p>effective thermal conductivity incl. dispersion [W/(m&middot;K)]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-lambda_disp.png\" alt=\"\\lambda_\\mathrm{disp}\"/></p></td>
<td valign=\"middle\"><pre>lambda_disp</pre></td>
<td valign=\"middle\"><p>dispersion contribution to thermal conductivity [W/(m&middot;K)]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-qr.png\" alt=\"q_r\"/></p></td>
<td valign=\"middle\"><pre>q_r</pre></td>
<td valign=\"middle\"><p>radial Darcy velocity [m/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-r_outer.png\" alt=\"r_\\mathrm{outer}\"/></p></td>
<td valign=\"middle\"><pre>r</pre></td>
<td valign=\"middle\"><p>outer edge radius of control volume [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-r_r.png\" alt=\"r_r\"/></p></td>
<td valign=\"middle\"><pre>r_r</pre></td>
<td valign=\"middle\"><p>centre radius of control volume [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-dL.png\" alt=\"d_L\"/></p></td>
<td valign=\"middle\"><pre>disp_length</pre></td>
<td valign=\"middle\"><p>dispersivity length [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-Cf.png\" alt=\"C_f\"/></p></td>
<td valign=\"middle\"><pre>C_f</pre></td>
<td valign=\"middle\"><p>volumetric heat capacity of fluid [J/(m&sup3;&middot;K)]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-Qdot.png\" alt=\"\\dot{Q}\"/></p></td>
<td valign=\"middle\"><pre>Q_flow</pre></td>
<td valign=\"middle\"><p>heat flow rate [W] (inherited from Element1D)</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-dT.png\" alt=\"\\Delta T\"/></p></td>
<td valign=\"middle\"><pre>dT</pre></td>
<td valign=\"middle\"><p>temperature difference across resistor [K] (inherited from Element1D)</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">6. Governing Equations</span></h4></p>
<p>Effective thermal conductivity with optional dispersion:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-lambda_disp.png\" alt=\"lambda_disp = d_L * |q_r| * C_f\"/></p>
<p>Radial thermal resistance for cylindrical geometry:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-R.png\" alt=\"R_r = (ln(r_outer) - ln(r_r)) / (lambda_eff * 2*pi*z)\"/></p>
<p>Heat transport (inherited from Element1D):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-dT.png\" alt=\"dT = R * Q_flow\"/> </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Connect q_r to the q_long output of the corresponding ControlVolumeL4 cell. Set <code>dispersion = false</code> (default) to use pure conduction. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"));
end ThermalResistorRadial_withDispersion;
