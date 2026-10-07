within TransiEnt.Storage.Heat.ATES_L4.Base.ThermalResistors;
model ThermalResistorVertical_withDispersion "model of thermal resistor can consider dispersion"

  //Import und Hierachie
  import Modelica.Units.SI;
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;

  //Parameter
  parameter SI.ThermalConductivity lambda "Heat Conductivity of the aquifer";
  parameter SI.Area A;
  parameter SI.Length z "heights of all control volumes in aquifer";
  parameter SI.Length disp_length = 0.7 "vertical dispersion length";
  parameter Real C(quantity="specific volumetric heat capacity", unit="J/(m3.K)")=n*C_f + (1-n)*C_s "volumetric heat capacity of stone and fluid";
  parameter Real C_f(quantity="specific volumetric heat capacity", unit="J/(m3.K)")=4.3*10^6 "volumetric heat capacity of fluid";
  parameter Real C_s(quantity="specific volumetric heat capacity", unit="J/(m3.K)")=1.81*10^6 "volumetric heat capacity of stone";
  parameter Real n = 0.25 "porosity of underground";
  parameter Boolean dispersion = false "whether dispersion is considered or not";

  //variable
  SI.ThermalResistance R "Thermal resistance of material";//Modelica.Constants.inf;//
  SI.ThermalConductivity lambda_overall "overall effective thermal conductivity";
  SI.ThermalConductivity lambda_disp "dispersion depending part of thermal conductivity";


  //Gleichungen

  Modelica.Blocks.Interfaces.RealInput
                       q_v annotation (Placement(transformation(extent={{-126,40},{-86,80}})));
equation
  lambda_disp = disp_length * abs(q_v) * C_f;
  if dispersion then
    lambda_overall = lambda + lambda_disp;
  else
    lambda_overall = lambda;
  end if;
  R=0.5*z/(lambda_overall*A);
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
<p>Quasi-static vertical thermal resistor for heat conduction between two vertically neighbouring aquifer control volumes. Optionally adds hydrodynamic dispersion to the effective thermal conductivity based on the local vertical Darcy velocity. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L1: Quasi-static 1D heat transport in vertical direction. No thermal storage within the resistor. Thermal resistance is computed from half the control volume height and the cross-sectional area. Dispersion increases effective conductivity proportionally to the magnitude of the vertical Darcy flux. </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- No thermal mass inside the resistor (instantaneous conduction).</p>
<p>- The factor 0.5 in the resistance formula assumes the temperature node sits at the centre of the control volume. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/ThermalResistorVertical_withDispersion_interfaces.svg\" alt=\"Interface diagram: port_a (heat in, bottom), port_b (heat out, top), q_v (Darcy velocity signal, left)\"/></p>
<p>port_a: lower heat port &mdash; heat inlet (Heat, inherited from Element1D)</p>
<p>port_b: upper heat port &mdash; heat outlet (Heat, inherited from Element1D)</p>
<p>q_v: vertical Darcy velocity input for dispersion calculation (Signal) </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\"><tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-symbol-R.png\" alt=\"R_v\"/></p></td>
<td valign=\"middle\"><pre>R</pre></td>
<td valign=\"middle\"><p>vertical thermal resistance [K/W]</p></td>
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
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-symbol-qv.png\" alt=\"q_v\"/></p></td>
<td valign=\"middle\"><pre>q_v</pre></td>
<td valign=\"middle\"><p>vertical Darcy velocity [m/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-symbol-z.png\" alt=\"z_\\mathrm{cv}\"/></p></td>
<td valign=\"middle\"><pre>z</pre></td>
<td valign=\"middle\"><p>height of control volume [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-symbol-As.png\" alt=\"A_s\"/></p></td>
<td valign=\"middle\"><pre>A</pre></td>
<td valign=\"middle\"><p>cross-sectional area of control volume [m&sup2;]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-dL.png\" alt=\"d_L\"/></p></td>
<td valign=\"middle\"><pre>disp_length</pre></td>
<td valign=\"middle\"><p>vertical dispersivity length [m]</p></td>
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
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-lambda_disp.png\" alt=\"lambda_disp = d_L * |q_v| * C_f\"/></p>
<p>Vertical thermal resistance (half-cell formulation):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-R.png\" alt=\"R_v = 0.5*z / (lambda_eff * A)\"/></p>
<p>Heat transport (inherited from Element1D):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-tv-dT.png\" alt=\"dT = R * Q_flow\"/> </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Connect q_v to the q_trans output of the corresponding ControlVolumeL4 cell. Set <code>dispersion = false</code> (default) to use pure conduction. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"));
end ThermalResistorVertical_withDispersion;
