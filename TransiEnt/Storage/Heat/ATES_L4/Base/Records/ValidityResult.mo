within TransiEnt.Storage.Heat.ATES_L4.Base.Records;
record ValidityResult "Result of the validity analysis of the ATES_L4 model"
extends TransiEnt.Basics.Icons.Record;

  //Import und Hierachie
  import Modelica.Units.SI;

  // ==== Status of the criteria (0 = fulfilled, 1 = warning, 2 = violated) ====
  Integer statusDarcy "Validity of Darcy's law (creeping flow)" annotation(Dialog(group="Status"));
  Integer statusLTE "Local thermal equilibrium between fluid and solid" annotation(Dialog(group="Status"));
  Integer statusNRGF "Negligible natural regional groundwater flow" annotation(Dialog(group="Status"));
  Integer statusBuoyancy "Consistency of the buoyancy switch" annotation(Dialog(group="Status"));
  Integer statusOverall "Maximum of all status values" annotation(Dialog(group="Status"));

  // ==== Key figures ====
  SI.Length R_th "Thermal radius of the stored volume" annotation(Dialog(group="General"));
  SI.Length d_grain "Grain diameter used for the criteria on Darcy's law and local thermal equilibrium" annotation(Dialog(group="General"));
  Boolean dGrainEstimated "True if the grain diameter was estimated from permeability and porosity" annotation(Dialog(group="General"));
  Real Re_well "Grain Reynolds number at the well screen" annotation(Dialog(group="Darcy's law"));
  Real E_well "Non-Darcy share of the pressure gradient at the well screen" annotation(Dialog(group="Darcy's law"));
  SI.Length r_E "Radius up to which the non-Darcy share exceeds E_Darcy_max" annotation(Dialog(group="Darcy's law"));
  SI.Length r_LTE "Radius up to which the seepage velocity exceeds v_s_LTE" annotation(Dialog(group="Local thermal equilibrium"));
  Real fV_LTE "Fraction of the thermal plume volume in which the seepage velocity exceeds v_s_LTE" annotation(Dialog(group="Local thermal equilibrium"));
  SI.Length r_LTNE "Radius up to which the Darcy velocity exceeds q_LTNE" annotation(Dialog(group="Local thermal equilibrium"));
  Real M_mobility "Mobility ratio of the injected to the ambient water (viscosity ratio)" annotation(Dialog(group="Natural regional groundwater flow"));
  Real N_0 "Displacement number without high-temperature correction" annotation(Dialog(group="Natural regional groundwater flow"));
  Real N_lo "Lower bound of the displacement number with high-temperature correction" annotation(Dialog(group="Natural regional groundwater flow"));
  Real N_hi "Upper bound of the displacement number with high-temperature correction" annotation(Dialog(group="Natural regional groundwater flow"));
  Real Ra "Rayleigh-Darcy number of the aquifer" annotation(Dialog(group="Buoyancy switch"));
  SI.Velocity q_0 "Characteristic buoyancy flow velocity" annotation(Dialog(group="Buoyancy switch"));

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Record returned by the validity analysis function ValidityAnalysis. It contains one status per criterion and the key figures on which the status is based.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Status values: 0 = criterion fulfilled, 1 = warning, 2 = criterion violated.</p>
<p>- The key figures are pre-simulation estimates; see ValidityAnalysis for their definitions and limits.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no elements)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-status.png\" alt=\"s\"/></td>
  <td valign=\"middle\"><code>statusDarcy, statusLTE, statusNRGF, statusBuoyancy</code></td>
  <td valign=\"middle\">status of the criteria on Darcy's law, local thermal equilibrium, natural regional groundwater flow and buoyancy switch (0 fulfilled, 1 warning, 2 violated) [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-status.png\" alt=\"s\"/></td>
  <td valign=\"middle\"><code>statusOverall</code></td>
  <td valign=\"middle\">maximum of all status values [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-R_th.png\" alt=\"R_\\mathrm{th}\"/></td>
  <td valign=\"middle\"><code>R_th</code></td>
  <td valign=\"middle\">thermal radius of the stored volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-d.png\" alt=\"d\"/></td>
  <td valign=\"middle\"><code>d_grain</code></td>
  <td valign=\"middle\">grain diameter used for the criteria on Darcy's law and local thermal equilibrium [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"></td>
  <td valign=\"middle\"><code>dGrainEstimated</code></td>
  <td valign=\"middle\">true if the grain diameter was estimated from permeability and porosity [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-Re_d.png\" alt=\"\\mathrm{Re}_\\mathrm{d}\"/></td>
  <td valign=\"middle\"><code>Re_well</code></td>
  <td valign=\"middle\">grain Reynolds number at the well screen [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-E.png\" alt=\"E\"/></td>
  <td valign=\"middle\"><code>E_well</code></td>
  <td valign=\"middle\">non-Darcy share of the pressure gradient at the well screen [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-r_E.png\" alt=\"r_E\"/></td>
  <td valign=\"middle\"><code>r_E</code></td>
  <td valign=\"middle\">radius up to which the non-Darcy share exceeds E_Darcy_max [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-r_LTE.png\" alt=\"r_\\mathrm{LTE}\"/></td>
  <td valign=\"middle\"><code>r_LTE</code></td>
  <td valign=\"middle\">radius up to which the seepage velocity exceeds v_s_LTE [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-f_V.png\" alt=\"f_\\mathrm{V}\"/></td>
  <td valign=\"middle\"><code>fV_LTE</code></td>
  <td valign=\"middle\">fraction of the thermal plume volume in which the seepage velocity exceeds v_s_LTE [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-r_LTNE.png\" alt=\"r_\\mathrm{LTNE}\"/></td>
  <td valign=\"middle\"><code>r_LTNE</code></td>
  <td valign=\"middle\">radius up to which the Darcy velocity exceeds q_LTNE [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-M.png\" alt=\"M\"/></td>
  <td valign=\"middle\"><code>M_mobility</code></td>
  <td valign=\"middle\">mobility ratio of the injected to the ambient water [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-N_0.png\" alt=\"N_0\"/></td>
  <td valign=\"middle\"><code>N_0</code></td>
  <td valign=\"middle\">displacement number without high-temperature correction [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-N_lo.png\" alt=\"N_\\mathrm{lo}\"/></td>
  <td valign=\"middle\"><code>N_lo</code></td>
  <td valign=\"middle\">lower bound of the displacement number with high-temperature correction [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-N_hi.png\" alt=\"N_\\mathrm{hi}\"/></td>
  <td valign=\"middle\"><code>N_hi</code></td>
  <td valign=\"middle\">upper bound of the displacement number with high-temperature correction [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-Ra.png\" alt=\"\\mathrm{Ra}\"/></td>
  <td valign=\"middle\"><code>Ra</code></td>
  <td valign=\"middle\">Rayleigh-Darcy number of the aquifer [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-q_0.png\" alt=\"q_0\"/></td>
  <td valign=\"middle\"><code>q_0</code></td>
  <td valign=\"middle\">characteristic buoyancy flow velocity [m/s]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Returned by ValidityAnalysis; the definitions of all key figures are given in the documentation of ValidityAnalysis. Bind the result to a parameter record, e.g. <code>parameter Records.ValidityResult validity = Function.ValidityAnalysis(...)</code>, to access the values in a model.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de) on 01.10.2026</p>
</html>"));
end ValidityResult;
