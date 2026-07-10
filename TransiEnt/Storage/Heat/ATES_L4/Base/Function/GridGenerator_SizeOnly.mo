within TransiEnt.Storage.Heat.ATES_L4.Base.Function;
function GridGenerator_SizeOnly "Compute N_r_actual from physical parameters and characteristic spacing.
   This pure function enables compile-time sizing of geometry arrays.
   Uses same bisection logic as GridGenerator (steps 0-1b) but returns only N_r_actual.
   For discretization and cell sizing, use GridGenerator function."

  extends TransiEnt.Basics.Icons.Function;
  import Modelica.Units.SI;
  import Modelica.Constants.pi;

  // _____________________________________________
  //
  //          Interfaces
  // _____________________________________________

  input Real c_f "volumetric heat capacity of fluid [J/(m³·K)]";
  input Real c_a "effective volumetric heat capacity of aquifer [J/(m³·K)]";
  input SI.Length H_a "thickness of aquifer [m]";
  input SI.Length H_c "thickness of aquitard (upper and lower) [m]";
  input SI.Volume V_inj "injected thermal energy storage volume [m³]";
  input SI.Length r_0 "radius of well screen [m]";
  input Real domain_factor(min=1.5, max=10) = 3.0 "domain radius factor relative to thermal radius [-]";
  input SI.Length dx_min(min=0.01, max=100) "characteristic radial grid width: first cell width target [m]";

  output Integer N_r_actual "computed number of radial control volumes (5 to 500)";

protected

  SI.Length R_th "thermal radius of the storage plume";
  SI.Length R_domain "domain radius = domain_factor * R_th";
  Integer N_r_temp "temporary storage for computed N_r";
  Integer N_r_min "bisection lower bound";
  Integer N_r_max "bisection upper bound";
  Integer iteration "iteration counter for bisection";
  Integer max_iterations = 100 "maximum iterations for bisection convergence";
  Real tolerance "tolerance for convergence (1% of dx_min)";
  Real dx_first "first cell width at current N_r_actual";

  Real dx_raw_test[500] "test normalized cell widths array for current N_r";
  Integer i "loop index";

algorithm

  // ===================== STEP 0: Thermal radius and domain =====================

  R_th := sqrt(c_f * V_inj / (c_a * pi * H_a));
  R_domain := domain_factor * R_th;  // CONSTANT throughout!

  // ===================== STEP 1a: Initial N_r estimation =====================

  // Heuristic: assume average cell width ≈ dx_min
  N_r_temp := integer(ceil(R_domain / dx_min));
  N_r_actual := max(N_r_temp, 5);
  N_r_actual := min(N_r_actual, 500);

  // ===================== STEP 1b: Bisection algorithm to match dx[1] ≈ dx_min =====================

  tolerance := 0.01 * dx_min;  // 1% convergence tolerance
  N_r_min := 5;
  N_r_max := N_r_actual;
  iteration := 0;

  while (iteration < max_iterations) and ((N_r_max - N_r_min) > 1) loop
    iteration := iteration + 1;

    // Bisection midpoint
    N_r_actual := integer((N_r_min + N_r_max) / 2);  // integer division in Modelica

    // Get normalized logistic grid cell widths for this N_r using helper function
    dx_raw_test[1:N_r_actual] := GridGenerator_Helpers.LogisticGrid_(N_r_actual);

    // First cell width at this N_r (scaled to physical dimension)
    dx_first := dx_raw_test[1] * R_domain;

    // Bisection step
    if abs(dx_first - dx_min) < tolerance then
      // Converged! Exit loop
      iteration := max_iterations;
    else if dx_first < dx_min then
      // First cell too small → reduce N_r_max (fewer cells → larger cells)
      N_r_max := N_r_actual - 1;
    else
      // First cell too large → increase N_r_min (more cells → smaller cells)
      N_r_min := N_r_actual + 1;
    end if;
    end if;
  end while;

  // Final N_r from bisection
  N_r_actual := integer((N_r_min + N_r_max) / 2);

annotation(Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of function</span></h4>
<p>Pure function that computes the number of radial control volumes (N_r_actual) from physical aquifer parameters and desired characteristic grid spacing. This function is designed for compile-time evaluation and enables dynamic sizing of geometry arrays in the Geometry model. It implements the same bisection algorithm as GridGenerator (steps 0-1b) but returns only the number of control volumes, not the full discretization. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>Purely mathematical component. Implements steps 0 and 1 of the GridGenerator algorithm:</p>
<ul>
<li>Step 0: Computation of thermal radius R_th from injected volume and heat capacities (characteristic length scale)</li>
<li>Step 1a: Heuristic initial estimate of number of cells</li>
<li>Step 1b: Bisection refinement to match first cell width to target dx_min </li>
</ul>
<h4><span style=\"color: #008000\">3. Limits of validity</span></h4>
<p>- N_r is clamped to [5, 500]. If computed N_r exceeds 500, result is 500 (undersampling).</p>
<p>- Function assumes positive volumetric heat capacities and aquifer dimensions.</p>
<p>- Thermal radius R_th must be positive for meaningful result.</p>
<p>- Bisection convergence tolerance is 1&percnt; of dx_min; result may differ slightly from exact match. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<h4>Inputs:</h4>
<p>c_f &mdash; volumetric heat capacity of fluid [J/(m&sup3;&middot;K)]</p>
<p>c_a &mdash; effective volumetric heat capacity of aquifer [J/(m&sup3;&middot;K)]</p>
<p>H_a &mdash; thickness of aquifer [m]</p>
<p>H_c &mdash; thickness of aquitard (upper and lower) [m] (for reference, not used in this function)</p>
<p>V_inj &mdash; injected thermal energy storage volume [m&sup3;]</p>
<p>r_0 &mdash; radius of well screen [m] (for reference, not used in this function)</p>
<p>domain_factor &mdash; multiplicative factor for R_th to determine domain extent [-] (default 3.0)</p>
<p>dx_min &mdash; target width of first radial cell [m] </p>
<h4>Output:</h4>
<p>N_r_actual &mdash; computed number of radial control volumes (fixed after initialization), range [5, 500] </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>See GridGenerator documentation for full nomenclature. Key quantities:</p>
<p>R_th = thermal radius [m]</p>
<p>R_domain = domain radius [m]</p>
<p>N_r_actual = number of radial control volumes [-]</p>
<p>dx_min = target first cell width [m] </p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Same as GridGenerator steps 0-1b:</p>
<p>Thermal radius: R_th = sqrt( (c_f / c_a) * (V_inj / (pi * H_a)) )</p>
<p>Domain radius: R_domain = domain_factor * R_th</p>
<p>Initial estimate: N_r_temp = ceil(R_domain / dx_min)</p>
<p>Final: N_r_actual from bisection to match first logistic cell width to dx_min </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Run this function once up front to size the optimized grid. Because N_r is a structural parameter (it sets array dimensions), it cannot be computed inside the model at runtime; instead the value returned here is entered manually into the Setting record:</p>
<p>1. Choose dx_min and the physical parameters (V_inj, H_a, H_c, domain_factor, ...).</p>
<p>2. Evaluate N_r = GridGenerator_SizeOnly(c_f, c_a, H_a, H_c, V_inj, r_0, domain_factor, dx_min).</p>
<p>3. Enter the resulting N_r into Setting.N_r (with optimized_grid = true).</p>
<p>The Dymola script Resources/../AutoConfigureN_r.mos automates steps 1-2 (it prints the computed N_r) and then translates and simulates Val_homogenLayer with the new N_r.</p>
<p>For the full discretization and cell width generation, the GridGenerator function then uses this N_r (passed as input) and reproduces the same first cell width by identical logistic logic. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested implicitly through comparison with GridGenerator: both functions must return identical N_r for same inputs. </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>no remarks</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Function created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Function revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Filled in author placeholder and clarified the manual N_r workflow (Setting record / AutoConfigureN_r.mos).</p>
</html>"));
end GridGenerator_SizeOnly;
