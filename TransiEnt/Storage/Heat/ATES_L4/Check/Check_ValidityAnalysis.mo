within TransiEnt.Storage.Heat.ATES_L4.Check;
model Check_ValidityAnalysis "Check of the validity analysis function ValidityAnalysis with seven scenarios"

  extends TransiEnt.Basics.Icons.Checkmodel;

  import Modelica.Units.SI;

  //parameters
  parameter SI.Time t_year = 365*86400 "Duration of one year";

  // Scenario 1: Auburn field experiment, cycle 1 (Molz et al. 1983; Table 5 of Gillner et al.), NRGF 0.8 m/month
  parameter Base.Records.ValidityResult auburn = Base.Function.ValidityAnalysis(
    site = Base.Records.Molz1983(),
    setting = Base.Records.Setting(H_a=21, H_c=9, V_inj=25300, r_0=0.1, buoyancy=true),
    m_flow_max = 19.36,
    T_inj = 333.15,
    t_cycle = 87*86400,
    u_amb = 9.6/t_year,
    vleFluidType = simCenter.fluid1) "Scenario 1: Auburn field experiment, cycle 1";

  // Scenario 2: as scenario 1, but with buoyancy switched off
  parameter Base.Records.ValidityResult auburnNoBuoyancy = Base.Function.ValidityAnalysis(
    site = Base.Records.Molz1983(),
    setting = Base.Records.Setting(H_a=21, H_c=9, V_inj=25300, r_0=0.1, buoyancy=false),
    m_flow_max = 19.36,
    T_inj = 333.15,
    t_cycle = 87*86400,
    u_amb = 9.6/t_year,
    vleFluidType = simCenter.fluid1) "Scenario 2: Auburn field experiment without buoyancy";

  // Scenario 3: ten-year study of Gillner et al. with H_a/R_th = 0.2 (no NRGF as in the study)
  parameter Base.Records.ValidityResult tenYears_HR020 = Base.Function.ValidityAnalysis(
    site = Base.Records.Molz1983(T_initial=303.15, p_initial=40e5),
    setting = Base.Records.Setting(H_a=21, H_c=30, V_inj=4.2e5, r_0=0.15, buoyancy=true),
    m_flow_max = 31.44,
    T_inj = 333.15,
    t_cycle = t_year,
    vleFluidType = simCenter.fluid1) "Scenario 3: ten-year study, H_a/R_th = 0.2";

  // Scenario 4: ten-year study of Gillner et al. with H_a/R_th = 0.75 (no NRGF as in the study)
  parameter Base.Records.ValidityResult tenYears_HR075 = Base.Function.ValidityAnalysis(
    site = Base.Records.Molz1983(T_initial=303.15, p_initial=40e5),
    setting = Base.Records.Setting(H_a=21, H_c=30, V_inj=3.0e4, r_0=0.15, buoyancy=true),
    m_flow_max = 2.24,
    T_inj = 333.15,
    t_cycle = t_year,
    vleFluidType = simCenter.fluid1) "Scenario 4: ten-year study, H_a/R_th = 0.75";

  // Scenario 5: synthetic fine gravel aquifer (grain diameter between the LTE thresholds), NRGF 9.6 m/a
  parameter Base.Records.ValidityResult fineGravel = Base.Function.ValidityAnalysis(
    site = Base.Records.Molz1983(T_initial=303.15, p_initial=40e5, k=1e-10, k_v=1e-11),
    setting = Base.Records.Setting(H_a=21, H_c=30, V_inj=4.2e5, r_0=0.15, buoyancy=true),
    m_flow_max = 31.44,
    T_inj = 333.15,
    t_cycle = t_year,
    d_50 = 0.010,
    u_amb = 9.6/t_year,
    vleFluidType = simCenter.fluid1) "Scenario 5: synthetic fine gravel aquifer";

  // Scenario 6: synthetic coarse gravel aquifer with strong NRGF and buoyancy switched off
  parameter Base.Records.ValidityResult coarseGravel = Base.Function.ValidityAnalysis(
    site = Base.Records.Molz1983(T_initial=303.15, p_initial=40e5, n=0.3, k=1e-9, k_v=2e-10),
    setting = Base.Records.Setting(H_a=21, H_c=30, V_inj=2.31e5, r_0=0.15, buoyancy=false),
    m_flow_max = 31.44,
    T_inj = 333.15,
    t_cycle = t_year,
    d_50 = 0.025,
    u_amb = 100/t_year,
    vleFluidType = simCenter.fluid1) "Scenario 6: synthetic coarse gravel aquifer";

  // Scenario 7: synthetic thick aquifer of low permeability with buoyancy switched off
  parameter Base.Records.ValidityResult thickLowPermeability = Base.Function.ValidityAnalysis(
    site = Base.Records.Molz1983(T_initial=303.15, p_initial=40e5, k=2e-11, k_v=1.2e-12),
    setting = Base.Records.Setting(H_a=60, H_c=30, V_inj=6.6e4, r_0=0.15, buoyancy=false),
    m_flow_max = 5,
    T_inj = 333.15,
    t_cycle = t_year,
    vleFluidType = simCenter.fluid1) "Scenario 7: synthetic thick aquifer of low permeability";

  //variables
  Integer status_auburn = auburn.statusOverall "Overall status of scenario 1 (expected 1)";
  Integer status_auburnNoBuoyancy = auburnNoBuoyancy.statusOverall "Overall status of scenario 2 (expected 2)";
  Integer status_tenYears_HR020 = tenYears_HR020.statusOverall "Overall status of scenario 3 (expected 1)";
  Integer status_tenYears_HR075 = tenYears_HR075.statusOverall "Overall status of scenario 4 (expected 0)";
  Integer status_fineGravel = fineGravel.statusOverall "Overall status of scenario 5 (expected 1)";
  Integer status_coarseGravel = coarseGravel.statusOverall "Overall status of scenario 6 (expected 2)";
  Integer status_thickLowPermeability = thickLowPermeability.statusOverall "Overall status of scenario 7 (expected 1)";

  inner ClaRa.SimCenter simCenter annotation (Placement(transformation(extent={{60,80},{100,100}})));

  annotation (
    experiment(StopTime=1),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Check model for the validity analysis function ValidityAnalysis. Seven scenarios are evaluated, which together trigger every status value of every criterion at least once. Scenarios 1 to 4 are taken from Gillner et al. (Auburn field experiment and ten-year study), scenarios 5 to 7 are synthetic.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- The function is evaluated once during initialization; there is no dynamic simulation.</p>
<p>- Scenario 1 uses the injected volume of the first cycle in Table 5 of Gillner et al. and the optimized grid with a first cell width of 1 m.</p>
<p>- Scenarios 5 to 7 are constructed to trigger specific status values and do not represent real sites.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no elements &mdash; standalone check model)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-status.png\" alt=\"s\"/></td>
  <td valign=\"middle\"><code>status_*</code></td>
  <td valign=\"middle\">overall status of the scenarios (0 fulfilled, 1 warning, 2 violated) [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"></td>
  <td valign=\"middle\"><code>auburn, auburnNoBuoyancy, tenYears_HR020, tenYears_HR075, fineGravel, coarseGravel, thickLowPermeability</code></td>
  <td valign=\"middle\">result records of the scenarios (see Records.ValidityResult)</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations &mdash; check model)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Translate and simulate (StopTime = 1 s). The reports of all scenarios are printed to the log. Expected status values (Darcy's law / local thermal equilibrium / natural regional groundwater flow / buoyancy switch &rarr; overall):</p>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"1\">
<tr><td><b>Scenario</b></td><td><b>Input</b></td><td><b>Expected key figures</b></td><td><b>Status</b></td></tr>
<tr><td>1 auburn</td><td>Molz1983, 19.36 kg/s, r_0 = 0.1 m, H_a = 21 m, V_inj = 25300 m&sup3;, 20 &rarr; 60 &deg;C, t_cycle = 87 d, u = 9.6 m/a</td><td>R_th &asymp; 25.6 m, Re_d &asymp; 1.8, E &asymp; 2.8 %, Ra &asymp; 79, q_0 &asymp; 0.21 m/d, N = 0.12 ... 0.19</td><td>1/0/1/0 &rarr; 1</td></tr>
<tr><td>2 auburnNoBuoyancy</td><td>as 1, buoyancy = false</td><td>Ra &gt; 4&pi;&sup2;, q_0 &gt; 0.05 m/d</td><td>1/0/1/2 &rarr; 2</td></tr>
<tr><td>3 tenYears_HR020</td><td>Molz1983, 30 &rarr; 60 &deg;C, 40 bar, 31.44 kg/s, V_inj = 420000 m&sup3;, u = 0</td><td>R_th &asymp; 104 m, E &asymp; 3 %</td><td>1/0/0/0 &rarr; 1</td></tr>
<tr><td>4 tenYears_HR075</td><td>as 3, 2.24 kg/s, V_inj = 30000 m&sup3;</td><td>E &asymp; 0.2 %</td><td>0/0/0/0 &rarr; 0</td></tr>
<tr><td>5 fineGravel</td><td>as 3, d_50 = 10 mm, k = 1e-10 m&sup2;, u = 9.6 m/a</td><td>E &asymp; 35 %, r_E &asymp; 0.7 m, N_hi &asymp; 0.16</td><td>1/1/1/0 &rarr; 1</td></tr>
<tr><td>6 coarseGravel</td><td>d_50 = 25 mm, k = 1e-9 m&sup2;, n = 0.3, V_inj = 231000 m&sup3;, u = 100 m/a, buoyancy = false</td><td>Re_d &asymp; 85, r_E &asymp; 1.9 m, r_LTNE &asymp; 1.7 m, N_lo &asymp; 1.7</td><td>2/2/2/2 &rarr; 2</td></tr>
<tr><td>7 thickLowPermeability</td><td>H_a = 60 m, k = 2e-11 m&sup2;, k_v = 1.2e-12 m&sup2;, 5 kg/s, buoyancy = false</td><td>Ra &asymp; 27, q_0 &asymp; 0.04 m/d</td><td>0/0/0/1 &rarr; 1</td></tr>
</table>
<p>An inner ClaRa.SimCenter must be present; its fluid1 is passed to the function for the property evaluation.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>The expected values in section 7 were calculated independently with tabulated water properties. For scenario 1, the Rayleigh-Darcy number reproduces Ra = 79 reported by Gillner et al. for the Auburn experiment.</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Gillner, M., Jin, Y., Speerforck, A.: System-level model for high-temperature aquifer thermal energy storage (HT-ATES) accounting for buoyancy-driven flow. Manuscript.</p>
<p>Molz, F. J., Melville, J. G., Parr, A. D., King, D. A., Hopf, M. T., 1983: Aquifer thermal energy storage: a well doublet experiment at increased temperatures. Water Resources Research 19, 149&ndash;160.</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de) on 01.10.2026</p>
</html>"));

end Check_ValidityAnalysis;
