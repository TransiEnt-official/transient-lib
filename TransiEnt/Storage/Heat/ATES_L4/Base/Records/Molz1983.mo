within TransiEnt.Storage.Heat.ATES_L4.Base.Records;
record Molz1983 "Parameter values are taken from Molz et al 1983 and Buscheck et al 1983"
  extends Records.Subsurface_Basic(
    lambda_l = 0.61,
    rho_s = 2600,
    Cp_s = 696.15,
    lambda_s = 2.85,
    n=0.25,
    C_a = 1.81*10^6,
    k_v = 9*10^(-12),
    k = 0.63*10^(-10),
    n_c = 0.35,
    rho_sc = 2600,
    Cp_sc = 696.15,
    lambda_sc = 3.2,
    d_h = 0.5,
    T_initial = 293.15,
    p_initial = 500000);
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Subsurface parameter record with values taken from the well doublet field experiment described in Molz et al. (1983). Intended as a reference parameter set for validation studies of high-temperature aquifer thermal energy storage (HT-ATES) models.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Values represent a shallow sand aquifer at the Auburn University test site (Alabama, USA).</p>
<p>- Initial aquifer temperature is 293.15 K (20&deg;C).</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no elements)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-lambda.png\" alt=\"\\lambda_l\"/></td>
  <td valign=\"middle\"><code>lambda_l</code></td>
  <td valign=\"middle\">fluid thermal conductivity = 0.61 W/(m&middot;K)</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-rho_s.png\" alt=\"\\rho_s\"/></td>
  <td valign=\"middle\"><code>rho_s</code></td>
  <td valign=\"middle\">solid density = 2600 kg/m&sup3;</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-cps.png\" alt=\"c_{p,s}\"/></td>
  <td valign=\"middle\"><code>Cp_s</code></td>
  <td valign=\"middle\">specific heat capacity of solid = 696.15 J/(kg&middot;K)</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-lambda.png\" alt=\"\\lambda_s\"/></td>
  <td valign=\"middle\"><code>lambda_s</code></td>
  <td valign=\"middle\">solid thermal conductivity = 2.85 W/(m&middot;K)</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-n.png\" alt=\"n\"/></td>
  <td valign=\"middle\"><code>n</code></td>
  <td valign=\"middle\">aquifer porosity = 0.25 [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-dv-symbol-kv.png\" alt=\"k_v\"/></td>
  <td valign=\"middle\"><code>k_v</code></td>
  <td valign=\"middle\">vertical permeability = 9&times;10<sup>-12</sup> m&sup2;</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-k.png\" alt=\"k\"/></td>
  <td valign=\"middle\"><code>k</code></td>
  <td valign=\"middle\">radial permeability = 6.3&times;10<sup>-11</sup> m&sup2;</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Tinit.png\" alt=\"T_\\mathrm{init}\"/></td>
  <td valign=\"middle\"><code>T_initial</code></td>
  <td valign=\"middle\">initial aquifer temperature = 293.15 K (20&deg;C)</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Use this record in conjunction with Val_homogenLayer to reproduce the Molz et al. (1983) well doublet experiment.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Molz, F. J., Melville, J. G., Parr, A. D., King, D. A., &amp; Hopf, M. T. (1983): Aquifer thermal energy storage: a well doublet experiment at increased temperatures. Water Resources Research, 19(1), 149&ndash;160.</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"));
end Molz1983;
