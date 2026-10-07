within TransiEnt.Storage.Heat.ATES_L4.Base.Records;
record ValidityThresholds "Thresholds of the validity analysis of the ATES_L4 model (defaults with literature sources)"

  extends TransiEnt.Basics.Icons.Record;

  //Import und Hierachie
  import Modelica.Units.SI;
  import Modelica.Constants.pi;

  // ==== Darcy's law (creeping flow) ====
  parameter Real E_Darcy_ok = 0.01 "Non-Darcy share of the pressure gradient up to which Darcy's law is regarded as fulfilled (derived)" annotation(Dialog(group="Darcy's law"));
  parameter Real E_Darcy_max = 0.10 "Non-Darcy share of the pressure gradient above which Darcy's law is violated, Fo = 0.11 (Zeng and Grigg 2006)" annotation(Dialog(group="Darcy's law"));
  parameter Real c_Ergun_visc = 150 "Viscous coefficient of the Ergun equation (Ergun 1952)" annotation(Dialog(group="Darcy's law"));
  parameter Real c_Ergun_inert = 1.75 "Inertial coefficient of the Ergun equation (Ergun 1952)" annotation(Dialog(group="Darcy's law"));

  // ==== Local thermal equilibrium ====
  parameter SI.Length d_LTE = 7e-3 "Grain diameter up to which LTE holds for all flow velocities (Gossler et al. 2020)" annotation(Dialog(group="Local thermal equilibrium"));
  parameter SI.Velocity v_s_LTE = 1.6/86400 "Seepage velocity up to which LTE holds for all grain diameters, 1.6 m/d (Gossler et al. 2020)" annotation(Dialog(group="Local thermal equilibrium"));
  parameter SI.Length d_LTNE = 20e-3 "Grain diameter from which LTNE effects > 5 % were measured (Lee et al. 2025)" annotation(Dialog(group="Local thermal equilibrium"));
  parameter SI.Velocity q_LTNE = 12/86400 "Darcy velocity from which LTNE effects > 5 % were measured for d >= d_LTNE, 12 m/d (Lee et al. 2025)" annotation(Dialog(group="Local thermal equilibrium"));

  // ==== Natural regional groundwater flow ====
  parameter Real N_NRGF_ok = 0.1 "Displacement number up to which the natural regional groundwater flow is negligible (derived)" annotation(Dialog(group="Natural regional groundwater flow"));
  parameter Real N_NRGF_max = 1 "Displacement number above which displacement losses dominate, R_th/u = 1 a for annual cycles (Bloemendal and Hartog 2018)" annotation(Dialog(group="Natural regional groundwater flow"));

  // ==== Buoyancy switch ====
  parameter Real Ra_crit = 4*pi^2 "Critical Rayleigh-Darcy number (Nield and Bejan 2017)" annotation(Dialog(group="Buoyancy switch"));
  parameter SI.Velocity q_0_crit = 0.05/86400 "Characteristic buoyancy flow velocity from which buoyancy-driven flow becomes significant, 0.05 m/d (Beernink et al. 2024)" annotation(Dialog(group="Buoyancy switch"));
  parameter Real f_warn = 0.5 "Fraction of Ra_crit and q_0_crit from which a warning is issued if buoyancy is switched off (derived)" annotation(Dialog(group="Buoyancy switch"));

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Record collecting all thresholds used by the validity analysis function ValidityAnalysis. Each default value is taken from the literature or derived from it; the source is given in the description of each parameter.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- The thresholds marked as derived (E_Darcy_ok, N_NRGF_ok, f_warn) are engineering choices and not taken directly from the literature.</p>
<p>- The thresholds for the natural regional groundwater flow were determined for low-temperature ATES with annual cycles (Bloemendal and Hartog 2018; Tas et al. 2025).</p>
<p>- The LTE thresholds are based on numerical studies (Gossler et al. 2020) and laboratory experiments with uniform spherical grains (Lee et al. 2025).</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no elements)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-E_ok.png\" alt=\"E_\\mathrm{ok}\"/></td>
  <td valign=\"middle\"><code>E_Darcy_ok</code></td>
  <td valign=\"middle\">non-Darcy share of the pressure gradient up to which Darcy's law is fulfilled, default 0.01 [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-E_max.png\" alt=\"E_\\mathrm{max}\"/></td>
  <td valign=\"middle\"><code>E_Darcy_max</code></td>
  <td valign=\"middle\">non-Darcy share of the pressure gradient above which Darcy's law is violated, default 0.10 [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-c_visc.png\" alt=\"c_\\mathrm{visc}\"/></td>
  <td valign=\"middle\"><code>c_Ergun_visc</code></td>
  <td valign=\"middle\">viscous coefficient of the Ergun equation, default 150 [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-c_inert.png\" alt=\"c_\\mathrm{inert}\"/></td>
  <td valign=\"middle\"><code>c_Ergun_inert</code></td>
  <td valign=\"middle\">inertial coefficient of the Ergun equation, default 1.75 [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-d_LTE.png\" alt=\"d_\\mathrm{LTE}\"/></td>
  <td valign=\"middle\"><code>d_LTE</code></td>
  <td valign=\"middle\">grain diameter up to which LTE holds for all flow velocities, default 7 mm [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-v_s_LTE.png\" alt=\"v_\\mathrm{s,LTE}\"/></td>
  <td valign=\"middle\"><code>v_s_LTE</code></td>
  <td valign=\"middle\">seepage velocity up to which LTE holds for all grain diameters, default 1.6 m/d [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-d_LTNE.png\" alt=\"d_\\mathrm{LTNE}\"/></td>
  <td valign=\"middle\"><code>d_LTNE</code></td>
  <td valign=\"middle\">grain diameter from which significant LTNE effects were measured, default 20 mm [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-q_LTNE.png\" alt=\"q_\\mathrm{LTNE}\"/></td>
  <td valign=\"middle\"><code>q_LTNE</code></td>
  <td valign=\"middle\">Darcy velocity from which significant LTNE effects were measured, default 12 m/d [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-N_ok.png\" alt=\"N_\\mathrm{ok}\"/></td>
  <td valign=\"middle\"><code>N_NRGF_ok</code></td>
  <td valign=\"middle\">displacement number up to which the natural regional groundwater flow is negligible, default 0.1 [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-N_max.png\" alt=\"N_\\mathrm{max}\"/></td>
  <td valign=\"middle\"><code>N_NRGF_max</code></td>
  <td valign=\"middle\">displacement number above which displacement losses dominate, default 1 [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-Ra_crit.png\" alt=\"\\mathrm{Ra}_\\mathrm{crit}\"/></td>
  <td valign=\"middle\"><code>Ra_crit</code></td>
  <td valign=\"middle\">critical Rayleigh-Darcy number, default 4&pi;&sup2; [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-q_0_crit.png\" alt=\"q_\\mathrm{0,crit}\"/></td>
  <td valign=\"middle\"><code>q_0_crit</code></td>
  <td valign=\"middle\">characteristic buoyancy flow velocity from which buoyancy-driven flow becomes significant, default 0.05 m/d [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-f_warn.png\" alt=\"f_\\mathrm{warn}\"/></td>
  <td valign=\"middle\"><code>f_warn</code></td>
  <td valign=\"middle\">fraction of Ra_crit and q_0_crit from which a warning is issued if buoyancy is switched off, default 0.5 [-]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Pass a modified instance to ValidityAnalysis to change single thresholds, e.g. <code>thresholds = Records.ValidityThresholds(N_NRGF_ok = 0.2)</code>. The criteria and the meaning of each threshold are described in the documentation of ValidityAnalysis.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Beernink, S., Hartog, N., Vardon, P. J., Bloemendal, M., 2024: Heat losses in ATES systems: The impact of processes, storage geometry and temperature. Geothermics 117, 102889, https://doi.org/10.1016/j.geothermics.2023.102889.</p>
<p>Bloemendal, M., Hartog, N., 2018: Analysis of the impact of storage conditions on the thermal recovery efficiency of low-temperature ATES systems. Geothermics 71, 306&ndash;319, https://doi.org/10.1016/j.geothermics.2017.10.009.</p>
<p>Ergun, S., 1952: Fluid flow through packed columns. Chemical Engineering Progress 48, 89&ndash;94.</p>
<p>Gossler, M. A., Bayer, P., Rau, G. C., Einsiedl, F., Zosseder, K., 2020: On the limitations and implications of modeling heat transport in porous aquifers by assuming local thermal equilibrium. Water Resources Research 56, e2020WR027772.</p>
<p>Lee, H., Gossler, M., Zosseder, K., Blum, P., Bayer, P., Rau, G. C., 2025: Laboratory heat transport experiments reveal grain-size- and flow-velocity-dependent local thermal non-equilibrium effects. Hydrology and Earth System Sciences 29, 1359&ndash;1378, https://doi.org/10.5194/hess-29-1359-2025.</p>
<p>Nield, D. A., Bejan, A., 2017: Convection in Porous Media. 5th edition. Springer, New York, https://doi.org/10.1007/978-3-319-49562-0.</p>
<p>Tas, L., et al., 2025: Efficiency and heat transport processes of low-temperature aquifer thermal energy storage systems: new insights from global sensitivity analyses. Geothermal Energy 13, 2, https://doi.org/10.1186/s40517-024-00326-1.</p>
<p>Zeng, Z., Grigg, R., 2006: A criterion for non-Darcy flow in porous media. Transport in Porous Media 63, 57&ndash;69, https://doi.org/10.1007/s11242-005-2720-3.</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de) on 01.10.2026</p>
</html>"));

end ValidityThresholds;
