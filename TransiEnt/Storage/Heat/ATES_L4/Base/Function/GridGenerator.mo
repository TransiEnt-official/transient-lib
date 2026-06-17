within TransiEnt.Storage.Heat.ATES_L4.Base.Function;
model GridGenerator "Generate optimized grid discretization from physical parameters using characteristic grid spacing"

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Function;
  import Modelica.Units.SI;
  import Modelica.Math.Vectors;
  import Modelica.Constants.pi;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  input Real c_f "volumetric heat capacity of fluid [J/(m³·K)]";
  input Real c_a "effective volumetric heat capacity of aquifer [J/(m³·K)]";
  input SI.Length H_a "thickness of aquifer [m]";
  input SI.Length H_c "thickness of aquitard (upper and lower) [m]";
  input SI.Volume V_inj "injected thermal energy storage volume [m³]";
  input SI.Length r_0 "radius of well screen [m]";
  input Real domain_factor(min=1.5, max=10) = 3.0 "domain radius factor relative to thermal radius [-]";
  input Integer N_r(min=5, max=500) "number of radial control volumes (computed separately by GridGenerator_SizeOnly) [-]";
  input Integer N_z(min=2, max=100) "number of vertical control volumes in aquifer [-]";
  input Integer N_z_c(min=1, max=50) "number of vertical control volumes in aquitard [-]";

  output Integer R_GS_H[:] "number of control volumes in radial grid sections (all = 1, length = N_r_actual)";
  output SI.Length dx_GS[:] "radial thickness of control volumes [m] (length = N_r_actual)";
  output Integer H_GS_VA[:] "number of control volumes in vertical aquifer grid sections (all = 1, length = N_z)";
  output SI.Length dz_GS_A[:] "height of control volumes in aquifer [m] (length = N_z)";
  output Integer H_GS_VC[:] "number of control volumes in vertical aquitard grid sections (all = 1, length = N_z_c)";
  output SI.Length dz_GS_C[:] "height of control volumes in aquitard [m] (length = N_z_c)";
  output SI.Length R_th "thermal radius of the storage plume";

protected

  SI.Length R_domain "domain radius = domain_factor * R_th";
  Integer N_r_actual "computed number of radial control volumes (5 to 500)";

  // Logistic function coefficients (optimized from Table 2, Gillner et al. 2025)
  Real b = 0.5095 "baseline of logistic function";
  Real A = 31.82 "amplitude of logistic step";
  Real k = 23.10 "steepness of logistic transition";

  // Vertical polynomial coefficients (optimized from Table 2, Gillner et al. 2025)
  Real b0 = 1.1 "quadratic coefficient a_0";
  Real b1 = 0.75 "linear coefficient a_1";
  Real b2 = -1.0 "quadratic coefficient a_2";

  // Working arrays for grid calculation
  Real dx_raw[500] "raw unnormalized cell widths from logistic function";
  Real f_z[N_z] "unnormalized polynomial function values";
  Real sum_fz "sum of polynomial values";

  Integer i "loop index";

algorithm

  // ===================== STEP 0: Thermal radius and domain =====================

  R_th := sqrt(c_f * V_inj / (c_a * pi * H_a));
  R_domain := domain_factor * R_th;

  // ===================== STEP 1: Use provided N_r directly =====================

  N_r_actual := N_r;

  // ===================== STEP 1b: Compute radial cell widths using logistic grid =====================

  R_GS_H := fill(1, N_r_actual);
  dx_GS := zeros(N_r_actual);
  H_GS_VA := fill(1, N_z);
  dz_GS_A := zeros(N_z);
  H_GS_VC := fill(1, N_z_c);
  dz_GS_C := zeros(N_z_c);

  // Compute normalized logistic grid cell widths
  dx_raw[1:N_r_actual] := GridGenerator_Helpers.LogisticGrid_(N_r_actual);

  // Scale to physical domain radius
  for i in 1:N_r_actual loop
    dx_GS[i] := dx_raw[i] * R_domain;
  end for;

  // ===================== STEP 2: Vertical grid (aquifer) from polynomial =====================

  // Polynomial: f(z) = b2*z^2 + b1*z + b0
  // Applied to normalized heights [0, 1] and scaled to aquifer thickness.

  for i in 1:N_z loop
    // Normalized height coordinate
    f_z[i] := b2 * ((i - 1.0) / N_z) ^ 2 + b1 * ((i - 1.0) / N_z) + b0;
  end for;

  // Ensure strictly positive values
  for i in 1:N_z loop
    if f_z[i] < 0.01 then
      f_z[i] := 0.01;
    end if;
  end for;

  // Sum and normalize
  sum_fz := 0.0;
  for i in 1:N_z loop
    sum_fz := sum_fz + f_z[i];
  end for;

  // Convert to physical heights
  for i in 1:N_z loop
    dz_GS_A[i] := (f_z[i] / sum_fz) * H_a;
    H_GS_VA[i] := 1;
  end for;

  // ===================== STEP 3: Vertical grid (aquitard) - uniform distribution =====================

  for i in 1:N_z_c loop
    dz_GS_C[i] := H_c / N_z_c;
    H_GS_VC[i] := 1;
  end for;

  annotation(Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Pure function that generates optimized discretization grid parameters from physical aquifer properties and desired characteristic grid spacing. The function implements grid optimization strategies from Gillner, Jin, and Speerforck (2025) using logistic functions for radial discretization and quadratic polynomials for vertical discretization. Automatically computes the number of radial control volumes based on the desired minimum grid spacing. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L1: Automatic grid generation based on physical parameters for a given number of radial control volumes. </p>
<ul>
<li>The number of radial control volumes N_r is provided as an input. It is computed beforehand by GridGenerator_SizeOnly from the desired first cell width dx_min; this function only builds the grid for that N_r.</li>
<li>Radial discretization uses a logistic (S-shaped) function to concentrate fine control volumes near the well (high temperature gradients) and coarsen them away from the well (low gradients). The normalized logistic widths (sum = 1) are scaled by the domain radius R_domain. Output arrays are sized to N_r values only (no padding).</li>
<li>Thermal radius R_th (equation 10, Gillner et al. 2025) determines the horizontal extent of the thermal plume and scales the radial domain size R_domain = domain_factor * R_th.</li>
<li>Vertical discretization in the aquifer uses a quadratic polynomial to concentrate fine control volumes at top and bottom boundaries (heat conduction to adjacent layers) and coarsen them in the middle.</li>
<li>Aquitard discretization is uniform, as vertical gradients in confining layers are secondary. </li>
</ul>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Grid generation parameters (coefficients b, A, k for logistic; b0, b1, b2 for polynomial) are optimized for the thermal conditions described in Gillner et al. (2025) and may require adjustment for significantly different operating conditions.</p>
<p>- Domain radius is computed as domain_factor * R_th; default domain_factor = 3.0 provides a balance between domain size and computational cost. Increase if boundary effects are observed.</p>
<p>- N_r is an input constrained to [5, 500]. It should be obtained from GridGenerator_SizeOnly so that the first cell width matches the desired dx_min; remaining cells follow the logistic distribution scaled to the domain radius.</p>
<p>- Function assumes positive volumetric heat capacities and aquifer dimensions. Thermal radius R_th must be positive.</p>
<p>- First cell must have positive width; if dx_raw[1] (logistic-derived) would result in zero or negative width after scaling, the result becomes ill-defined. This should not occur for typical input ranges. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<h4>Inputs:</h4>
<p>c_f &mdash; volumetric heat capacity of fluid [J/(m&sup3;&middot;K)]</p>
<p>c_a &mdash; effective volumetric heat capacity of aquifer [J/(m&sup3;&middot;K)]</p>
<p>H_a &mdash; thickness of aquifer [m]</p>
<p>H_c &mdash; thickness of aquitard (upper and lower) [m]</p>
<p>V_inj &mdash; injected thermal energy storage volume [m&sup3;]</p>
<p>r_0 &mdash; radius of well screen [m] (for use by Discretization function)</p>
<p>domain_factor &mdash; multiplicative factor for R_th to determine domain extent [-] (default 3.0)</p>
<p>N_r &mdash; number of radial control volumes [-], range [5, 500] (computed beforehand by GridGenerator_SizeOnly)</p>
<p>N_z &mdash; number of vertical control volumes in aquifer [-]</p>
<p>N_z_c &mdash; number of vertical control volumes in aquitard [-]</p>
<h4>Outputs (for use in Discretization function):</h4>
<p>R_GS_H[:] &mdash; number of control volumes per radial grid section (all = 1, size = N_r)</p>
<p>dx_GS[:] &mdash; radial thickness of control volumes [m] (size = N_r, first cell &asymp; dx_min used in GridGenerator_SizeOnly)</p>
<p>H_GS_VA[:] &mdash; number of control volumes per vertical aquifer section (all = 1, size = N_z)</p>
<p>dz_GS_A[:] &mdash; height of control volumes in aquifer [m] (size = N_z)</p>
<p>H_GS_VC[:] &mdash; number of control volumes per vertical aquitard section (all = 1, size = N_z_c)</p>
<p>dz_GS_C[:] &mdash; height of control volumes in aquitard [m] (size = N_z_c) </p>
<p>R_th &mdash; thermal radius of the storage plume [m]</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(See equation definitions below for parameter meanings.) </p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<h4>Thermal radius and domain extent:</h4>
<p>R_th = sqrt( (c_f / c_a) * (V_inj / (pi * H_a)) )</p>
<p>R_domain = domain_factor * R_th</p>
<p>(The number of radial control volumes N_r is an input; it is determined beforehand by GridGenerator_SizeOnly so that dx[1] &asymp; dx_min.)</p>
<h4>Radial discretization via logistic function (equation 13):</h4>
<p>f(r) = b + A / (1 + exp(-k * (r_norm - 1)))</p>
<p>where r_norm = (i - 1) / N_r for i = 1..N_r+1</p>
<p>Normalized cell widths (sum = 1, from helper function LogisticGrid_): dx_raw[i] = (cumsum[i+1] - cumsum[i]) / cumsum[N_r+1]</p>
<p>Scaled cell width: dx[i] = dx_raw[i] * R_domain</p>
<p>Result: cells follow the logistic distribution, sum(dx) = R_domain, first cell &asymp; dx_min (by choice of N_r)</p>
<p>Optimized coefficients (Table 2, Gillner et al. 2025):</p>
<p>b = 0.5095, A = 31.82, k = 23.10 </p>
<h4>Vertical discretization in aquifer via polynomial (equation 12):</h4>
<p>f(z) = b2 * z_norm^2 + b1 * z_norm + b0</p>
<p>where z_norm = (i - 1) / N_z for i = 1..N_z</p>
<p>Cell height: dz[i] = (f(z[i]) / sum(f)) * H_a</p>
<p>Optimized coefficients (Table 2, Gillner et al. 2025):</p>
<p>b0 = 1.1, b1 = 0.75, b2 = -1.0 </p>
<h4>Vertical discretization in aquitard:</h4>
<p>Uniform cell height: dz_c[i] = H_c / N_z_c </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Call this function to generate grid parameters from physical aquifer properties for a given number of radial control volumes N_r. It eliminates the need for manual specification of grid sections (R_GS_H, dx_GS) by generating optimized cell distributions. The matching N_r for a desired first cell width dx_min must be obtained beforehand from GridGenerator_SizeOnly (e.g. via the script AutoConfigureN_r.mos).</p>
<p>Larger N_r (finer grids) result in longer computation times; smaller N_r reduces computational cost but may reduce accuracy near the thermal plume center.</p>
<p>Output arrays have variable sizes: R_GS_H and dx_GS have length N_r; H_GS_VA and dz_GS_A have length N_z; H_GS_VC and dz_GS_C have length N_z_c. Arrays can be passed directly to Discretization without slicing.</p>
<p>Typical call pattern in Geometry.mo:</p>
<p>initial equation</p><p>&nbsp;&nbsp;(R_GS_H_opt, dx_GS_opt, H_GS_VA_opt, dz_GS_A_opt, H_GS_VC_opt, dz_GS_C_opt) =</p><p>&nbsp;&nbsp;&nbsp;&nbsp;Base.Functions.GridGenerator(C_w, C, setting.H_a, setting.H_c, setting.V_inj, setting.r_0, setting.domain_factor, setting.N_r, setting.N_z, setting.N_z_c); </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>no validation </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Gillner, M., Jin, Y., Speerforck, A. (2025): A Validated System Model for High-Temperature Aquifer Thermal Energy Storage (HT-ATES) considering Buoyancy Flow. Manuscript. </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de) on 19.05.2026</p>
<p>Model revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Updated documentation to reflect that N_r is now an input (computed by GridGenerator_SizeOnly) instead of being calculated internally from dx_min.</p>
</html>"));
end GridGenerator;
