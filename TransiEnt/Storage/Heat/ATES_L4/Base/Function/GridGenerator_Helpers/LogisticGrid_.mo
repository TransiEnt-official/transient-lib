within TransiEnt.Storage.Heat.ATES_L4.Base.Function.GridGenerator_Helpers;
function LogisticGrid_ "Pure function: compute normalized logistic cell widths for given N_r.
     Logistic function: f(r) = b + A / (1 + exp(-k * (r_norm - 1)))
     where r_norm = (i-1) / N_r for i in 1..N_r+1.
     Output: normalized cell widths (dimensionless, sum = 1.0).
     Caller must scale output by domain radius R_domain if physical dimensions needed."

  extends TransiEnt.Basics.Icons.Function;



  input Integer N_r "number of radial control volumes (5 to 500)";
  output Real dx_normalized[N_r] "normalized cell widths (dimensionless, sum = 1.0)";

protected
  Real b = 0.5095 "baseline of logistic function";
  Real A = 31.82 "amplitude of logistic step";
  Real k = 23.10 "steepness of logistic transition";

  Real f_r[N_r + 1] "logistic function values at nodes";
  Real cumsum[N_r + 1] "cumulative sum of logistic values";
  Integer i "loop index";

algorithm
  // Evaluate logistic function at N_r+1 nodes
  for i in 1:(N_r + 1) loop
    f_r[i] := b + A / (1.0 + Modelica.Math.exp(-k * (((i - 1.0) / N_r) - 1.0)));
  end for;

  // Cumulative sum
  cumsum[1] := f_r[1];
  for i in 2:(N_r + 1) loop
    cumsum[i] := cumsum[i - 1] + f_r[i];
  end for;

  // Normalized cell widths (dimensionless, sum = 1.0)
  for i in 1:N_r loop
    dx_normalized[i] := (cumsum[i + 1] - cumsum[i]) / cumsum[N_r + 1];
  end for;

annotation(Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of function</span></h4>
<p>Pure helper function that computes normalized logistic cell widths for a given number of radial control volumes and domain radius. This function is used by both GridGenerator and GridGenerator_SizeOnly to ensure consistent grid generation logic. </p>
<h4><span style=\"color: #008000\">2. Level of detail</span></h4>
<p>Purely mathematical function. Implements the logistic (S-shaped) function from Gillner et al. (2025) with fixed coefficients. </p>
<h4><span style=\"color: #008000\">3. Limits of validity</span></h4>
<p>- N_r must be in range [5, 500]</p>
<p>- R_domain must be positive </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>Input: N_r (number of radial control volumes, range [5, 500])</p>
<p>Output: dx_normalized (normalized cell widths, length = N_r, dimensionless, sum = 1.0). The caller scales these by the domain radius R_domain to obtain physical cell widths. </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>N_r = number of radial control volumes [-]</p>
<p>dx_normalized = normalized cell widths [-] (sum = 1.0)</p>
<p>b = 0.5095 (logistic baseline)</p>
<p>A = 31.82 (logistic amplitude)</p>
<p>k = 23.10 (logistic steepness) </p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Logistic function:</p>
<p>f(r) = b + A / (1 + exp(-k * (r_norm - 1)))</p>
<p>where r_norm = (i-1) / N_r </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>This is a pure function (no side effects). Used internally by GridGenerator and GridGenerator_SizeOnly. Changes to logistic coefficients should be made here to ensure consistency across both functions. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested implicitly through validation of GridGenerator and GridGenerator_SizeOnly. </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Gillner, M., Jin, Y., Speerforck, A. (2025): A Validated System Model for High-Temperature Aquifer Thermal Energy Storage (HT-ATES) considering Buoyancy Flow. </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Function created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Function revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Corrected the interface description: the function takes only N_r and returns normalized cell widths (sum = 1.0); there is no R_domain input.</p>
</html>"));
end LogisticGrid_;
