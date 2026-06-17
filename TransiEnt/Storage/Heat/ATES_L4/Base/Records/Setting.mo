within TransiEnt.Storage.Heat.ATES_L4.Base.Records;
record Setting "record with parameters for operation, design and discretization of the aquifer"
  extends TransiEnt.Basics.Icons.Record;
  import Modelica.Units.SI;

  // ==== Numerical parameters ====

  parameter Boolean optimized_grid = true "use an optimized grid for radial and vertical discretization rather than an own grid" annotation(Dialog(tab="Discretization"), choices(__Dymola_checkBox=true));

  parameter SI.Length dx_min = 1 "width of the first cells" annotation(Dialog(tab="Discretization", group="Optimized grid", enable = optimized_grid));
  parameter SI.Volume V_inj = 60000 "Volume that is injected into the aquifer" annotation(Dialog(tab="Discretization", group="Optimized grid", enable = optimized_grid));
  parameter SI.Height H_a = 20 "Height of the aquifer that is modelled" annotation(Dialog(tab="Discretization", group="Optimized grid", enable = optimized_grid));
  parameter SI.Height H_c = 10 "Height of the adjacent layers that are modelled" annotation(Dialog(tab="Discretization", group="Optimized grid", enable = optimized_grid));
  parameter Real domain_factor = 3 "Radius of the modelled aquifer domain_factor*thermal Radius" annotation(Dialog(tab="Discretization", group="Optimized grid", enable = optimized_grid));
  parameter Integer N_r(min=5, max=500) = 31 "number of radial control volumes (computed by GridGenerator_SizeOnly and entered here)" annotation(Dialog(tab="Discretization", group="Optimized grid"));
  parameter Integer N_z = 20 "Number of volumes in vertical direction of the aquifer" annotation(Dialog(tab="Discretization", group="Optimized grid", enable = optimized_grid));
  parameter Integer N_z_c = 5 "Number of volumes in vertical direction of the aquiclud" annotation(Dialog(tab="Discretization", group="Optimized grid", enable = optimized_grid));

  parameter Integer NoGS_H = 3 "Number of horizontal grid sections" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));
  parameter Integer R_GS_H[NoGS_H] = {10, 30, 150} "Number of control volumes in horizontal grid sections" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));
  parameter SI.Length dx_GS[NoGS_H] = {0.5, 1, 10} "Thicknes of the control volumes within the grid sections" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));

  parameter Integer NoGS_VA = 1 "Number of vertical grid sections within the aquifer" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));
  parameter Integer H_GS_VA[NoGS_VA] = {20} "Number of control volumes in vertical grid sections within the aquifer" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));
  parameter SI.Length dz_GS_A[NoGS_VA] = {1} "Height of the control volumes within the grid sections of the aquifer" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));

  parameter Integer NoGS_VC = 2 "Number of vertical grid sections within the aquitard, the adjacent layers on top and bottom of the aquifer" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));
  parameter Integer H_GS_VC[NoGS_VC] = {5, 20} "Number of control volumes in vertical grid sections within the aquitard" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));
  parameter SI.Length dz_GS_C[NoGS_VC] = {1, 5} "Height of the control volumes within the grid sections of the aquitard" annotation(Dialog(tab="Discretization", group="Individual grid", enable = not optimized_grid));

  // ==== Design parameters ====
  parameter SI.Length r_0 = 0.15 "Radius of well screen" annotation(Dialog(tab="General", group="Design parameters"));


  // ==== Physics parameters ====
  parameter Boolean buoyancy = true "logical value if buoyancy caused by thermal gradient should be considered" annotation(Dialog(tab="General", group="Physics"), choices(__Dymola_checkBox=true));
  parameter Boolean dispersion = false "logial value if dispersion should be considered in calculation of thermal conductivity" annotation(Dialog(tab="General", group="Physics"), choices(__Dymola_checkBox=true));

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Record consolidating all discretization (grid), geometry, and physics toggle parameters for the ATES model. A single Setting instance is shared between Geometry, ControlVolumeL4, AquiferL4, and ATES_confinedLayer.</p>
<p>The record offers two mutually exclusive ways to define the radial and vertical grid, selected by the Boolean <code>optimized_grid</code>:</p>
<ul>
<li><b>Optimized grid</b> (<code>optimized_grid = true</code>, default): The grid is generated automatically from physical parameters (<code>V_inj</code>, <code>H_a</code>, <code>H_c</code>, <code>domain_factor</code>, <code>N_r</code>, <code>N_z</code>, <code>N_z_c</code>) using the logistic/polynomial distribution of the GridGenerator function. Fine cells are concentrated near the well. The number of radial cells <code>N_r</code> is pre-computed with GridGenerator_SizeOnly (see Section 7).</li>
<li><b>Individual grid</b> (<code>optimized_grid = false</code>): The grid is defined manually by grid sections (<code>NoGS_H</code>, <code>R_GS_H</code>, <code>dx_GS</code>, <code>NoGS_VA</code>, <code>H_GS_VA</code>, <code>dz_GS_A</code>, <code>NoGS_VC</code>, <code>H_GS_VC</code>, <code>dz_GS_C</code>), giving full control over the number and thickness of control volumes in each section. </li>
</ul>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.) </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Grid section counts must be consistent: length of R_GS_H equals NoGS_H, etc. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no elements) </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\"><tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-optimized_grid.png\" alt=\"f_\\mathrm{opt,grid}\"/></p></td>
<td valign=\"middle\"><pre>optimized_grid</pre></td>
<td valign=\"middle\"><p>flag: use automatically optimized grid (true) or manual grid sections (false) [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-dx_min.png\" alt=\"\\Delta x_\\mathrm{min}\"/></p></td>
<td valign=\"middle\"><pre>dx_min</pre></td>
<td valign=\"middle\"><p>target width of the first (innermost) radial control volume, optimized grid [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-V_inj.png\" alt=\"V_\\mathrm{inj}\"/></p></td>
<td valign=\"middle\"><pre>V_inj</pre></td>
<td valign=\"middle\"><p>injected storage volume (sizes the thermal radius), optimized grid [m&sup3;]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-H_a.png\" alt=\"H_\\mathrm{a}\"/></p></td>
<td valign=\"middle\"><pre>H_a</pre></td>
<td valign=\"middle\"><p>modelled aquifer thickness, optimized grid [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-H_c.png\" alt=\"H_\\mathrm{c}\"/></p></td>
<td valign=\"middle\"><pre>H_c</pre></td>
<td valign=\"middle\"><p>modelled aquitard (confining layer) thickness, optimized grid [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-domain_factor.png\" alt=\"f_\\mathrm{domain}\"/></p></td>
<td valign=\"middle\"><pre>domain_factor</pre></td>
<td valign=\"middle\"><p>radial domain extent as multiple of the thermal radius, optimized grid [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nr.png\" alt=\"N_r\"/></p></td>
<td valign=\"middle\"><pre>N_r</pre></td>
<td valign=\"middle\"><p>number of radial control volumes, optimized grid (pre-computed by GridGenerator_SizeOnly) [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nz.png\" alt=\"N_z\"/></p></td>
<td valign=\"middle\"><pre>N_z</pre></td>
<td valign=\"middle\"><p>number of vertical aquifer control volumes, optimized grid [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p> </p></td>
<td valign=\"middle\"><pre>N_z_c</pre></td>
<td valign=\"middle\"><p>number of vertical aquitard control volumes (per confining layer), optimized grid [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-NoGS_H.png\" alt=\"N_\\mathrm{GS,H}\"/></p></td>
<td valign=\"middle\"><pre>NoGS_H</pre></td>
<td valign=\"middle\"><p>number of horizontal (radial) grid sections [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-R_GS_H.png\" alt=\"R_\\mathrm{GS,H}\"/></p></td>
<td valign=\"middle\"><pre>R_GS_H[NoGS_H]</pre></td>
<td valign=\"middle\"><p>number of control volumes per radial grid section [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-dx_GS.png\" alt=\"\\Delta x_\\mathrm{GS}\"/></p></td>
<td valign=\"middle\"><pre>dx_GS[NoGS_H]</pre></td>
<td valign=\"middle\"><p>thickness of control volumes per radial grid section [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nr.png\" alt=\"N_r\"/></p></td>
<td valign=\"middle\"><pre>sum(R_GS_H)</pre></td>
<td valign=\"middle\"><p>total number of radial control volumes [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-NoGS_VA.png\" alt=\"N_\\mathrm{GS,VA}\"/></p></td>
<td valign=\"middle\"><pre>NoGS_VA</pre></td>
<td valign=\"middle\"><p>number of vertical grid sections in the aquifer [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-H_GS_VA.png\" alt=\"H_\\mathrm{GS,VA}\"/></p></td>
<td valign=\"middle\"><pre>H_GS_VA[NoGS_VA]</pre></td>
<td valign=\"middle\"><p>number of control volumes per vertical aquifer grid section [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-dz_GS_A.png\" alt=\"\\Delta z_\\mathrm{GS,A}\"/></p></td>
<td valign=\"middle\"><pre>dz_GS_A[NoGS_VA]</pre></td>
<td valign=\"middle\"><p>height of control volumes per vertical aquifer grid section [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nz.png\" alt=\"N_z\"/></p></td>
<td valign=\"middle\"><pre>sum(H_GS_VA)</pre></td>
<td valign=\"middle\"><p>total number of vertical aquifer control volumes [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-NoGS_VC.png\" alt=\"N_\\mathrm{GS,VC}\"/></p></td>
<td valign=\"middle\"><pre>NoGS_VC</pre></td>
<td valign=\"middle\"><p>number of vertical grid sections in the aquitard [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-H_GS_VC.png\" alt=\"H_\\mathrm{GS,VC}\"/></p></td>
<td valign=\"middle\"><pre>H_GS_VC[NoGS_VC]</pre></td>
<td valign=\"middle\"><p>number of control volumes per vertical aquitard grid section [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-dz_GS_C.png\" alt=\"\\Delta z_\\mathrm{GS,C}\"/></p></td>
<td valign=\"middle\"><pre>dz_GS_C[NoGS_VC]</pre></td>
<td valign=\"middle\"><p>height of control volumes per vertical aquitard grid section [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-sym-r0.png\" alt=\"r_0\"/></p></td>
<td valign=\"middle\"><pre>r_0</pre></td>
<td valign=\"middle\"><p>well screen radius [m]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-buoyancy.png\" alt=\"f_\\mathrm{buoy}\"/></p></td>
<td valign=\"middle\"><pre>buoyancy</pre></td>
<td valign=\"middle\"><p>flag: activate buoyancy-driven vertical flow [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://ATES/../Resources/Images/equations/equation-set-symbol-dispersion.png\" alt=\"f_\\mathrm{disp}\"/></p></td>
<td valign=\"middle\"><pre>dispersion</pre></td>
<td valign=\"middle\"><p>flag: activate hydrodynamic dispersion in effective thermal conductivity [-]</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations) </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p><b>Choosing the grid.</b> Two discretization modes are available, selected via <code>optimized_grid</code>:</p>
<p><b>(a) Optimized grid</b> (<code>optimized_grid = true</code>): recommended workflow:</p>
<p>1. Set <code>dx_min</code> (target first cell width) and the physical parameters <code>V_inj</code>, <code>H_a</code>, <code>H_c</code>, <code>domain_factor</code>, <code>N_z</code>, <code>N_z_c</code>.</p>
<p>2. <b>First run GridGenerator_SizeOnly</b> to determine the required number of radial control volumes <code>N_r</code> for the chosen <code>dx_min</code>. The ready-to-use Dymola script <code>Resources/../AutoConfigureN_r.mos</code> calls <code>GridGenerator_SizeOnly(c_f, c_a, H_a, H_c, V_inj, r_0, domain_factor, dx_min)</code> and prints the resulting <code>N_r</code>.</p>
<p>3. Enter the computed value into the <code>N_r</code> parameter of this record. Geometry then calls GridGenerator with this <code>N_r</code> to build the grid.</p>
<p>Note: <code>N_r</code>, <code>N_z</code> and <code>N_z_c</code> are structural parameters; changing them requires re-translation of the model.</p>
<p><b>(b) Individual grid</b> (<code>optimized_grid = false</code>): define the grid manually via the section parameters <code>NoGS_H</code>/<code>R_GS_H</code>/<code>dx_GS</code> (radial), <code>NoGS_VA</code>/<code>H_GS_VA</code>/<code>dz_GS_A</code> (vertical aquifer) and <code>NoGS_VC</code>/<code>H_GS_VC</code>/<code>dz_GS_C</code> (vertical aquitard). The length of each value vector must equal the corresponding section count (e.g. <code>size(R_GS_H) = NoGS_H</code>).</p>
<p><b>Physics toggles.</b> Set <code>buoyancy = true</code> to activate vertical flow driven by thermal density differences. Set <code>dispersion = true</code> to include hydrodynamic dispersion in the effective thermal conductivity. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary) </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Model revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Documented the optimized grid mode and its GridGenerator_SizeOnly workflow alongside the existing individual grid mode.</p>
</html>"));
end Setting;
