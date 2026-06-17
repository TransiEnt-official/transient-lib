within TransiEnt.Storage.Heat.ATES_L4.Base.Function;
function ValidityAnalysis "Validity analysis of the ATES_L4 model for given site and operating parameters"


  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Function;
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Constants.g_n;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  input TransiEnt.Storage.Heat.ATES_L4.Base.Records.Subsurface_Basic site "Subsurface properties, same record as ATES_confinedLayer.Parameters";
  input TransiEnt.Storage.Heat.ATES_L4.Base.Records.Setting setting "Grid, geometry and physics settings, same record as ATES_confinedLayer.setting";
  input SI.MassFlowRate m_flow_max "Maximum absolute mass flow rate during injection or production";
  input SI.Temperature T_inj "Maximum injection temperature";
  input SI.Volume V_inj = setting.V_inj "Volume injected per cycle (default: value of the setting record)";
  input SI.Time t_cycle = 365*86400 "Duration of one storage cycle (injection, storage, production and rest)";
  input SI.Length d_50 = -1 "Representative grain diameter (d_50 <= 0: estimated from permeability and porosity)";
  input SI.Velocity u_amb = 0 "Darcy flux of the natural regional groundwater flow at ambient temperature";
  input TransiEnt.Storage.Heat.ATES_L4.Base.Records.ValidityThresholds thresholds = TransiEnt.Storage.Heat.ATES_L4.Base.Records.ValidityThresholds() "Thresholds of the validity criteria";
  input TILMedia.VLEFluidTypes.BaseVLEFluid vleFluidType = TILMedia.VLEFluidTypes.TILMedia_SplineWater() "Fluid type for the property evaluation, should equal simCenter.fluid1";
  input Boolean printReport = true "Print a report of the validity analysis to the log";

  output TransiEnt.Storage.Heat.ATES_L4.Base.Records.ValidityResult result "Status and key figures of the validity analysis";

protected
  constant String statusText[3] = {"fulfilled", "WARNING", "VIOLATED"} "Text of the status values 0, 1 and 2";

  SI.Height H_a "Thickness of the aquifer";
  SI.Length r_0 "Radius of the well screen";
  SI.Length dr_1 "Width of the first radial control volume";
  SI.Length r_1 "Outer radius of the first radial control volume";
  SI.Temperature T_0 "Undisturbed aquifer temperature";
  SI.Temperature T_m "Mean temperature of undisturbed aquifer and injection";
  SI.AbsolutePressure p "Pressure for the property evaluation (initial pressure at the bottom of the aquifer)";
  SI.AbsolutePressure p_top "Hydrostatic pressure at the top of the aquifer";
  SI.Temperature T_sat "Saturation temperature at the top of the aquifer";
  SI.Density rho_0 "Density of water at T_0";
  SI.Density rho_inj "Density of water at T_inj";
  SI.Density rho_m "Density of water at T_m";
  SI.DynamicViscosity mu_0 "Dynamic viscosity of water at T_0";
  SI.DynamicViscosity mu_inj "Dynamic viscosity of water at T_inj";
  SI.DynamicViscosity mu_m "Dynamic viscosity of water at T_m";
  SI.SpecificHeatCapacity cp_m "Specific isobaric heat capacity of water at T_m";
  Real beta_m(unit="1/K") "Isobaric thermal expansion coefficient of water at T_m";
  SI.VolumeFlowRate V_flow "Maximum volume flow rate at injection temperature";
  SI.Velocity v_D_well "Darcy velocity at the well screen";
  Real Fo_well "Forchheimer number at the well screen";
  Real Fo_max "Forchheimer number corresponding to E_Darcy_max";
  Real F_lo "Lower bound of the high-temperature mobility factor";
  Real F_hi "Upper bound of the high-temperature mobility factor";

algorithm

  // ===================== Geometry from the setting record =====================

  if setting.optimized_grid then
    H_a := setting.H_a;
    dr_1 := 1;
  else
    H_a := sum(setting.H_GS_VA[i]*setting.dz_GS_A[i] for i in 1:setting.NoGS_VA);
    dr_1 := setting.dx_GS[1];
  end if;
  r_0 := setting.r_0;
  r_1 := r_0 + dr_1;

  assert(m_flow_max > 0, "ValidityAnalysis: m_flow_max must be positive.");
  assert(H_a > 0 and r_0 > 0 and dr_1 > 0 and V_inj > 0, "ValidityAnalysis: aquifer thickness, well screen radius, width of the first control volume and injected volume must be positive.");

  // ===================== Fluid properties =====================

  T_0 := site.T_initial;
  T_m := 0.5*(T_0 + T_inj);
  p := site.p_initial;
  rho_0 := TILMedia.VLEFluidFunctions.density_pTxi(vleFluidType, p, T_0);
  rho_inj := TILMedia.VLEFluidFunctions.density_pTxi(vleFluidType, p, T_inj);
  rho_m := TILMedia.VLEFluidFunctions.density_pTxi(vleFluidType, p, T_m);
  mu_0 := TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(T_0, rho_0);
  mu_inj := TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(T_inj, rho_inj);
  mu_m := TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(T_m, rho_m);
  cp_m := TILMedia.VLEFluidFunctions.specificIsobaricHeatCapacity_pTxi(vleFluidType, p, T_m);
  beta_m := TILMedia.VLEFluidFunctions.isobaricThermalExpansionCoefficient_pTxi(vleFluidType, p, T_m);

  // the model is restricted to liquid water: check the saturation temperature at the top of the aquifer
  p_top := p - rho_0*g_n*H_a;
  assert(p_top > 0, "ValidityAnalysis: the hydrostatic pressure at the top of the aquifer is not positive. Check p_initial (pressure at the bottom of the aquifer) and the aquifer thickness.");
  T_sat := TILMedia.VLEFluidFunctions.bubbleTemperature_pxi(vleFluidType, p_top);
  assert(max(T_0, T_inj) < T_sat, "ValidityAnalysis: the temperature (" + String(max(T_0, T_inj) - 273.15, significantDigits=4) + " degC) is not below the saturation temperature (" + String(T_sat - 273.15, significantDigits=4) + " degC) at the top of the aquifer. The model is restricted to liquid water.");

  // ===================== Thermal radius (Eq. 9 of Gillner et al.) =====================

  result.R_th := sqrt(site.C_w*V_inj/(site.C*pi*H_a));

  // ===================== Darcy's law (creeping flow) =====================

  V_flow := m_flow_max/rho_inj;
  v_D_well := V_flow/(2*pi*r_0*H_a);
  if d_50 > 0 then
    result.d_grain := d_50;
    result.dGrainEstimated := false;
  else
    // Kozeny-Carman form of the viscous term of the Ergun equation
    result.d_grain := sqrt(thresholds.c_Ergun_visc*site.k*(1 - site.n)^2/site.n^3);
    result.dGrainEstimated := true;
  end if;
  result.Re_well := rho_inj*v_D_well*result.d_grain/mu_inj;
  Fo_well := thresholds.c_Ergun_inert/thresholds.c_Ergun_visc*result.Re_well/(1 - site.n);
  result.E_well := Fo_well/(1 + Fo_well);
  Fo_max := thresholds.E_Darcy_max/(1 - thresholds.E_Darcy_max);
  result.r_E := r_0*Fo_well/Fo_max; // Fo decreases with 1/r in radial flow
  if result.E_well <= thresholds.E_Darcy_ok then
    result.statusDarcy := 0;
  elseif result.r_E <= r_1 then
    result.statusDarcy := 1; // non-Darcy flow confined to the first control volume
  else
    result.statusDarcy := 2;
  end if;

  // ===================== Local thermal equilibrium =====================

  result.r_LTE := V_flow/(2*pi*H_a*site.n*thresholds.v_s_LTE);
  result.r_LTNE := V_flow/(2*pi*H_a*thresholds.q_LTNE);
  result.fV_LTE := min(1, max(0, (result.r_LTE^2 - r_0^2)/max(result.R_th^2 - r_0^2, Modelica.Constants.eps)));
  if result.d_grain <= thresholds.d_LTE or result.r_LTE <= r_1 then
    result.statusLTE := 0;
  elseif result.d_grain >= thresholds.d_LTNE and result.r_LTNE > r_1 then
    result.statusLTE := 2;
  else
    result.statusLTE := 1;
  end if;

  // ===================== Natural regional groundwater flow =====================

  result.M_mobility := mu_0/mu_inj;
  F_lo := min(result.M_mobility, 2*result.M_mobility/(1 + result.M_mobility));
  F_hi := max(result.M_mobility, 2*result.M_mobility/(1 + result.M_mobility));
  result.N_0 := abs(u_amb)*t_cycle/result.R_th;
  result.N_lo := F_lo*result.N_0;
  result.N_hi := F_hi*result.N_0;
  if result.N_lo > thresholds.N_NRGF_max then
    result.statusNRGF := 2;
  elseif result.N_hi > thresholds.N_NRGF_ok then
    result.statusNRGF := 1;
  else
    result.statusNRGF := 0;
  end if;

  // ===================== Buoyancy switch =====================

  result.Ra := g_n*rho_m^2*cp_m*abs(beta_m)*abs(T_inj - T_0)*site.k_v*H_a/(mu_m*site.lambda_a);
  result.q_0 := sqrt(site.k*site.k_v)*abs(rho_0 - rho_inj)*g_n/(mu_0 + mu_inj);
  if setting.buoyancy then
    result.statusBuoyancy := 0;
  elseif result.Ra >= thresholds.Ra_crit or result.q_0 >= thresholds.q_0_crit then
    result.statusBuoyancy := 2;
  elseif result.Ra >= thresholds.f_warn*thresholds.Ra_crit or result.q_0 >= thresholds.f_warn*thresholds.q_0_crit then
    result.statusBuoyancy := 1;
  else
    result.statusBuoyancy := 0;
  end if;

  result.statusOverall := max({result.statusDarcy, result.statusLTE, result.statusNRGF, result.statusBuoyancy});

  // ===================== Report =====================

  if printReport then
    Modelica.Utilities.Streams.print("====================================================================");
    Modelica.Utilities.Streams.print("ATES_L4 validity analysis");
    Modelica.Utilities.Streams.print("  R_th = " + String(result.R_th, significantDigits=3) + " m, H_a = " + String(H_a, significantDigits=3) + " m, H_a/R_th = " + String(H_a/result.R_th, significantDigits=2)
      + ", m_flow_max = " + String(m_flow_max, significantDigits=3) + " kg/s, T_0 = " + String(T_0 - 273.15, significantDigits=3) + " degC, T_inj = " + String(T_inj - 273.15, significantDigits=3) + " degC");
    Modelica.Utilities.Streams.print("--------------------------------------------------------------------");
    Modelica.Utilities.Streams.print("Darcy's law (creeping flow): " + statusText[result.statusDarcy + 1]);
    Modelica.Utilities.Streams.print("  Re_d(r_0) = " + String(result.Re_well, significantDigits=3) + ", non-Darcy share E(r_0) = " + String(100*result.E_well, significantDigits=3) + " % (fulfilled <= " + String(100*thresholds.E_Darcy_ok, significantDigits=2) + " %)");
    Modelica.Utilities.Streams.print("  E > " + String(100*thresholds.E_Darcy_max, significantDigits=2) + " % for r < " + String(result.r_E, significantDigits=3) + " m, first control volume ends at r = " + String(r_1, significantDigits=3) + " m"
      + (if result.statusDarcy == 1 then " -> affects only the near-well pressure drop" else ""));
    Modelica.Utilities.Streams.print("  d = " + String(1000*result.d_grain, significantDigits=3) + " mm" + (if result.dGrainEstimated then " (estimated from k and n)" else " (input d_50)") + "; Ergun (1952), Zeng and Grigg (2006)");
    Modelica.Utilities.Streams.print("Local thermal equilibrium: " + statusText[result.statusLTE + 1]);
    Modelica.Utilities.Streams.print("  d = " + String(1000*result.d_grain, significantDigits=3) + " mm (LTE for d <= " + String(1000*thresholds.d_LTE, significantDigits=2) + " mm, Gossler et al. 2020)");
    Modelica.Utilities.Streams.print("  seepage velocity > " + String(86400*thresholds.v_s_LTE, significantDigits=2) + " m/d for r < " + String(result.r_LTE, significantDigits=3) + " m (" + String(100*result.fV_LTE, significantDigits=3) + " % of the plume volume)");
    Modelica.Utilities.Streams.print("  Darcy velocity > " + String(86400*thresholds.q_LTNE, significantDigits=3) + " m/d for r < " + String(result.r_LTNE, significantDigits=3) + " m (LTNE > 5 % for d >= " + String(1000*thresholds.d_LTNE, significantDigits=2) + " mm, Lee et al. 2025)");
    Modelica.Utilities.Streams.print("Natural regional groundwater flow: " + statusText[result.statusNRGF + 1]);
    Modelica.Utilities.Streams.print("  N_0 = u*t_cycle/R_th = " + String(result.N_0, significantDigits=3) + ", mobility ratio M = " + String(result.M_mobility, significantDigits=3) + " -> N = " + String(result.N_lo, significantDigits=3) + " ... " + String(result.N_hi, significantDigits=3)
      + " (fulfilled <= " + String(thresholds.N_NRGF_ok, significantDigits=2) + ", violated > " + String(thresholds.N_NRGF_max, significantDigits=2) + ")");
    Modelica.Utilities.Streams.print("  thresholds derived from LT-ATES (Bloemendal and Hartog 2018, Tas et al. 2025), high-temperature bounds after Wheatcraft and Winterberg (1985)");
    Modelica.Utilities.Streams.print("Buoyancy switch: " + statusText[result.statusBuoyancy + 1] + " (buoyancy = " + String(setting.buoyancy) + ")");
    Modelica.Utilities.Streams.print("  Ra = " + String(result.Ra, significantDigits=3) + " (critical " + String(thresholds.Ra_crit, significantDigits=3) + ", Nield and Bejan 2017), q_0 = " + String(86400*result.q_0, significantDigits=3)
      + " m/d (significant >= " + String(86400*thresholds.q_0_crit, significantDigits=2) + " m/d, Beernink et al. 2024)");
    Modelica.Utilities.Streams.print("--------------------------------------------------------------------");
    Modelica.Utilities.Streams.print("Overall: " + statusText[result.statusOverall + 1]);
    Modelica.Utilities.Streams.print("====================================================================");
  end if;

  annotation(Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Pre-simulation validity analysis of the ATES_L4 model (ATES_confinedLayer) for a given site and operating scenario. The function checks whether the scenario lies within the limits of four model assumptions, returns a status per criterion (0 = fulfilled, 1 = warning, 2 = violated) together with the key figures, and prints a report to the log.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>Purely analytical component based on steady radial flow from the well screen. The following model assumptions are checked:</p>
<ul>
<li><b>Darcy's law:</b> share E of the non-Darcy (Forchheimer) term in the pressure gradient, calculated with the Ergun equation at the well screen. As the Forchheimer number decreases with 1/r, the radius r_E up to which E exceeds E_Darcy_max is compared with the first radial control volume.</li>
<li><b>Local thermal equilibrium:</b> grain diameter and seepage velocity thresholds of Gossler et al. (2020), significant LTNE effects after Lee et al. (2025).</li>
<li><b>Natural regional groundwater flow:</b> displacement number N relating the displacement of the thermal plume during one cycle to the thermal radius, with bounds for the higher mobility of the hot water.</li>
<li><b>Buoyancy switch:</b> Rayleigh-Darcy number (Eq. 10 of Gillner et al.) and characteristic buoyancy flow velocity (Hellstr&ouml;m et al. 1988) if buoyancy is switched off in the Setting record.</li>
</ul>
<p>Physical insight: in radial flow with prescribed mass flow rate, the velocity field follows from continuity. Non-Darcy flow near the well therefore mainly affects the pressure drop of the well and hardly the temperature field. The hot water has a lower viscosity than the ambient water, so the regional groundwater flow is drawn into the thermal plume: by the factor 2M/(1+M) for a cylindrical plume over the full aquifer thickness and up to the factor M for a thin hot layer at the top of the aquifer after strong tilting of the thermal front.</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- All key figures are pre-simulation estimates for steady radial flow from a fully penetrating well with uniform inflow. Vertical buoyancy flow is not considered in the criteria on Darcy's law and local thermal equilibrium.</p>
<p>- Fluid properties are evaluated at the initial pressure p_initial (bottom of the aquifer) and at the temperatures T_0, T_inj and T_m = (T_0 + T_inj)/2.</p>
<p>- If no grain diameter is given, it is estimated from permeability and porosity (Kozeny-Carman form of the Ergun equation). This is an effective hydraulic diameter, which is usually smaller than d_50.</p>
<p>- The thresholds for the natural regional groundwater flow were determined for low-temperature ATES with annual cycles (Bloemendal and Hartog 2018; Tas et al. 2025). The generalization to arbitrary cycle durations and the warning threshold 0.1 are derived. The high-temperature effect is represented only by the bounds [2M/(1+M), M]. A tilting angle after Hellstr&ouml;m et al. (1988) is not used, because the initial tilting rate strongly overestimates the tilting in dynamic operation (Auburn case: about 88&deg; after 31 days of injection compared with 25&deg; to 35&deg; in the simulation; cf. Beernink et al. 2024). The drift of residual heat over several cycles is not considered, so the criterion on the natural regional groundwater flow tends to be optimistic for multi-year simulations.</p>
<p>- Not checked: thermal interference between hot and cold well (single-well model), permeability of the confining layers, dispersion, salinity of the formation water, geothermal gradient, grid resolution, heterogeneity of the aquifer, Brinkman term, radiation and viscous dissipation.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><b>Inputs:</b></p>
<p>site &mdash; subsurface properties (Records.Subsurface_Basic or an extending record such as Records.Molz1983)</p>
<p>setting &mdash; grid, geometry and physics settings (Records.Setting); H_a, r_0, the width of the first radial control volume and the buoyancy switch are taken from this record</p>
<p>m_flow_max &mdash; maximum absolute mass flow rate during injection or production [kg/s]</p>
<p>T_inj &mdash; maximum injection temperature [K]</p>
<p>V_inj &mdash; volume injected per cycle, default setting.V_inj [m&sup3;]</p>
<p>t_cycle &mdash; duration of one storage cycle, default 1 year [s]</p>
<p>d_50 &mdash; representative grain diameter, default -1 (estimated) [m]</p>
<p>u_amb &mdash; Darcy flux of the natural regional groundwater flow at ambient temperature, default 0 [m/s]</p>
<p>thresholds &mdash; thresholds of the validity criteria (Records.ValidityThresholds)</p>
<p>vleFluidType &mdash; TILMedia fluid type for the property evaluation, default TILMedia_SplineWater</p>
<p>printReport &mdash; print a report to the log, default true</p>
<p><b>Output:</b></p>
<p>result &mdash; status per criterion and key figures (Records.ValidityResult)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-R_th.png\" alt=\"R_\\mathrm{th}\"/></td>
  <td valign=\"middle\"><code>result.R_th</code></td>
  <td valign=\"middle\">thermal radius of the stored volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-C_w.png\" alt=\"C_\\mathrm{w}\"/></td>
  <td valign=\"middle\"><code>site.C_w</code></td>
  <td valign=\"middle\">volumetric heat capacity of water [J/(m&sup3;&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-C.png\" alt=\"C\"/></td>
  <td valign=\"middle\"><code>site.C</code></td>
  <td valign=\"middle\">volumetric heat capacity of the aquifer [J/(m&sup3;&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-V_inj.png\" alt=\"V_\\mathrm{inj}\"/></td>
  <td valign=\"middle\"><code>V_inj</code></td>
  <td valign=\"middle\">volume injected per cycle [m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-H_a.png\" alt=\"H_\\mathrm{a}\"/></td>
  <td valign=\"middle\"><code>H_a</code></td>
  <td valign=\"middle\">thickness of the aquifer [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-mdot_max.png\" alt=\"\\dot{m}_\\mathrm{max}\"/></td>
  <td valign=\"middle\"><code>m_flow_max</code></td>
  <td valign=\"middle\">maximum absolute mass flow rate during injection or production [kg/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-r.png\" alt=\"r\"/></td>
  <td valign=\"middle\"><code>r</code></td>
  <td valign=\"middle\">radial distance from the well axis [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-r_0.png\" alt=\"r_0\"/></td>
  <td valign=\"middle\"><code>setting.r_0</code></td>
  <td valign=\"middle\">radius of the well screen [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-dr_1.png\" alt=\"\\Delta r_1\"/></td>
  <td valign=\"middle\"><code>dr_1</code></td>
  <td valign=\"middle\">width of the first radial control volume (setting.dx_min or setting.dx_GS[1]) [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-T_0.png\" alt=\"T_0\"/></td>
  <td valign=\"middle\"><code>site.T_initial</code></td>
  <td valign=\"middle\">undisturbed aquifer temperature [K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-T_inj.png\" alt=\"T_\\mathrm{inj}\"/></td>
  <td valign=\"middle\"><code>T_inj</code></td>
  <td valign=\"middle\">maximum injection temperature [K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-T_m.png\" alt=\"T_\\mathrm{m}\"/></td>
  <td valign=\"middle\"><code>T_m</code></td>
  <td valign=\"middle\">mean temperature of undisturbed aquifer and injection [K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-rho_0.png\" alt=\"\\rho_0\"/></td>
  <td valign=\"middle\"><code>rho_0</code></td>
  <td valign=\"middle\">density of water at T_0 [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-rho_inj.png\" alt=\"\\rho_\\mathrm{inj}\"/></td>
  <td valign=\"middle\"><code>rho_inj</code></td>
  <td valign=\"middle\">density of water at T_inj [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-rho_m.png\" alt=\"\\rho_\\mathrm{m}\"/></td>
  <td valign=\"middle\"><code>rho_m</code></td>
  <td valign=\"middle\">density of water at T_m [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-mu_0.png\" alt=\"\\mu_0\"/></td>
  <td valign=\"middle\"><code>mu_0</code></td>
  <td valign=\"middle\">dynamic viscosity of water at T_0 (DynamicViscosityWater) [Pa&middot;s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-mu_inj.png\" alt=\"\\mu_\\mathrm{inj}\"/></td>
  <td valign=\"middle\"><code>mu_inj</code></td>
  <td valign=\"middle\">dynamic viscosity of water at T_inj [Pa&middot;s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-mu_m.png\" alt=\"\\mu_\\mathrm{m}\"/></td>
  <td valign=\"middle\"><code>mu_m</code></td>
  <td valign=\"middle\">dynamic viscosity of water at T_m [Pa&middot;s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-cp_m.png\" alt=\"c_\\mathrm{p,m}\"/></td>
  <td valign=\"middle\"><code>cp_m</code></td>
  <td valign=\"middle\">specific isobaric heat capacity of water at T_m [J/(kg&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-beta_m.png\" alt=\"\\beta_\\mathrm{m}\"/></td>
  <td valign=\"middle\"><code>beta_m</code></td>
  <td valign=\"middle\">isobaric thermal expansion coefficient of water at T_m [1/K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-v_D.png\" alt=\"v_\\mathrm{D}\"/></td>
  <td valign=\"middle\"><code>v_D_well</code></td>
  <td valign=\"middle\">Darcy velocity (evaluated at r_0 in the code) [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-d.png\" alt=\"d\"/></td>
  <td valign=\"middle\"><code>result.d_grain</code></td>
  <td valign=\"middle\">grain diameter, equal to d_50 if given [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-k.png\" alt=\"k\"/></td>
  <td valign=\"middle\"><code>site.k</code></td>
  <td valign=\"middle\">horizontal permeability of the aquifer [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-k_v.png\" alt=\"k_\\mathrm{v}\"/></td>
  <td valign=\"middle\"><code>site.k_v</code></td>
  <td valign=\"middle\">vertical permeability of the aquifer [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-n.png\" alt=\"n\"/></td>
  <td valign=\"middle\"><code>site.n</code></td>
  <td valign=\"middle\">porosity of the aquifer [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-c_visc.png\" alt=\"c_\\mathrm{visc}\"/></td>
  <td valign=\"middle\"><code>thresholds.c_Ergun_visc</code></td>
  <td valign=\"middle\">viscous coefficient of the Ergun equation [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-c_inert.png\" alt=\"c_\\mathrm{inert}\"/></td>
  <td valign=\"middle\"><code>thresholds.c_Ergun_inert</code></td>
  <td valign=\"middle\">inertial coefficient of the Ergun equation [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-Re_d.png\" alt=\"\\mathrm{Re}_\\mathrm{d}\"/></td>
  <td valign=\"middle\"><code>result.Re_well</code></td>
  <td valign=\"middle\">grain Reynolds number at the well screen [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-Fo.png\" alt=\"\\mathrm{Fo}\"/></td>
  <td valign=\"middle\"><code>Fo_well</code></td>
  <td valign=\"middle\">Forchheimer number at the well screen [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-E.png\" alt=\"E\"/></td>
  <td valign=\"middle\"><code>result.E_well</code></td>
  <td valign=\"middle\">non-Darcy share of the pressure gradient at the well screen [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-E_max.png\" alt=\"E_\\mathrm{max}\"/></td>
  <td valign=\"middle\"><code>thresholds.E_Darcy_max</code></td>
  <td valign=\"middle\">non-Darcy share above which Darcy's law is violated [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-r_E.png\" alt=\"r_E\"/></td>
  <td valign=\"middle\"><code>result.r_E</code></td>
  <td valign=\"middle\">radius up to which the non-Darcy share exceeds E_max [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-r_LTE.png\" alt=\"r_\\mathrm{LTE}\"/></td>
  <td valign=\"middle\"><code>result.r_LTE</code></td>
  <td valign=\"middle\">radius up to which the seepage velocity exceeds v_s,LTE [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-v_s_LTE.png\" alt=\"v_\\mathrm{s,LTE}\"/></td>
  <td valign=\"middle\"><code>thresholds.v_s_LTE</code></td>
  <td valign=\"middle\">seepage velocity up to which LTE holds for all grain diameters [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-r_LTNE.png\" alt=\"r_\\mathrm{LTNE}\"/></td>
  <td valign=\"middle\"><code>result.r_LTNE</code></td>
  <td valign=\"middle\">radius up to which the Darcy velocity exceeds q_LTNE [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-q_LTNE.png\" alt=\"q_\\mathrm{LTNE}\"/></td>
  <td valign=\"middle\"><code>thresholds.q_LTNE</code></td>
  <td valign=\"middle\">Darcy velocity from which significant LTNE effects were measured [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-f_V.png\" alt=\"f_\\mathrm{V}\"/></td>
  <td valign=\"middle\"><code>result.fV_LTE</code></td>
  <td valign=\"middle\">fraction of the thermal plume volume in which the seepage velocity exceeds v_s,LTE [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-u.png\" alt=\"u\"/></td>
  <td valign=\"middle\"><code>u_amb</code></td>
  <td valign=\"middle\">Darcy flux of the natural regional groundwater flow at ambient temperature [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-t_cycle.png\" alt=\"t_\\mathrm{cycle}\"/></td>
  <td valign=\"middle\"><code>t_cycle</code></td>
  <td valign=\"middle\">duration of one storage cycle [s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-M.png\" alt=\"M\"/></td>
  <td valign=\"middle\"><code>result.M_mobility</code></td>
  <td valign=\"middle\">mobility ratio of the injected to the ambient water [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-N_0.png\" alt=\"N_0\"/></td>
  <td valign=\"middle\"><code>result.N_0</code></td>
  <td valign=\"middle\">displacement number without high-temperature correction [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-N_lo.png\" alt=\"N_\\mathrm{lo}\"/></td>
  <td valign=\"middle\"><code>result.N_lo</code></td>
  <td valign=\"middle\">lower bound of the displacement number [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-N_hi.png\" alt=\"N_\\mathrm{hi}\"/></td>
  <td valign=\"middle\"><code>result.N_hi</code></td>
  <td valign=\"middle\">upper bound of the displacement number [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-Ra.png\" alt=\"\\mathrm{Ra}\"/></td>
  <td valign=\"middle\"><code>result.Ra</code></td>
  <td valign=\"middle\">Rayleigh-Darcy number of the aquifer [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-g.png\" alt=\"g\"/></td>
  <td valign=\"middle\"><code>g_n</code></td>
  <td valign=\"middle\">gravitational acceleration [m/s&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-lambda_a.png\" alt=\"\\lambda_\\mathrm{a}\"/></td>
  <td valign=\"middle\"><code>site.lambda_a</code></td>
  <td valign=\"middle\">effective thermal conductivity of the aquifer [W/(m&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-sym-q_0.png\" alt=\"q_0\"/></td>
  <td valign=\"middle\"><code>result.q_0</code></td>
  <td valign=\"middle\">characteristic buoyancy flow velocity [m/s]</td>
</tr>
</table>
<p>The thresholds (E_ok, d_LTE, d_LTNE, N_ok, N_max, Ra_crit, q_0,crit, f_warn) are listed in Records.ValidityThresholds.</p>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Thermal radius of the stored volume (Eq. 9 of Gillner et al.):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-Rth.png\" alt=\"R_th = sqrt(C_w*V_inj/(C*pi*H_a))\"/></p>
<p>Darcy velocity in radial flow from the well screen:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-vD.png\" alt=\"v_D(r) = m_flow_max/(2*pi*r*H_a*rho_inj)\"/></p>
<p><b>Darcy's law:</b> grain Reynolds number, Forchheimer number from the Ergun equation and non-Darcy share of the pressure gradient (Zeng and Grigg 2006). If no grain diameter is given, it is estimated from the viscous term of the Ergun equation:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-d.png\" alt=\"d = sqrt(c_visc*k*(1-n)^2/n^3)\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-Re.png\" alt=\"Re_d = rho_inj*v_D(r_0)*d/mu_inj\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-Fo.png\" alt=\"Fo = c_inert/c_visc*Re_d/(1-n), E = Fo/(1+Fo)\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-r_E.png\" alt=\"r_E = r_0*Fo(r_0)*(1-E_max)/E_max\"/></p>
<p><b>Local thermal equilibrium:</b> radii up to which the seepage velocity exceeds v_s,LTE and the Darcy velocity exceeds q_LTNE, and fraction of the plume volume with seepage velocities above v_s,LTE:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-rLTE.png\" alt=\"r_LTE = m_flow_max/(2*pi*H_a*rho_inj*n*v_s_LTE), r_LTNE = m_flow_max/(2*pi*H_a*rho_inj*q_LTNE)\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-fV.png\" alt=\"f_V = (r_LTE^2 - r_0^2)/(R_th^2 - r_0^2)\"/></p>
<p><b>Natural regional groundwater flow:</b> displacement number, mobility ratio and high-temperature bounds (Bloemendal and Hartog 2018; Wheatcraft and Winterberg 1985):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-N.png\" alt=\"N_0 = u*t_cycle/R_th, M = mu_0/mu_inj\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-Nbounds.png\" alt=\"N_lo = min(M, 2M/(1+M))*N_0, N_hi = max(M, 2M/(1+M))*N_0\"/></p>
<p><b>Buoyancy switch:</b> Rayleigh-Darcy number (Eq. 10 of Gillner et al.) and characteristic buoyancy flow velocity (Hellstr&ouml;m et al. 1988; Beernink et al. 2024):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-Ra.png\" alt=\"Ra = g*rho_m^2*cp_m*beta_m*abs(T_inj - T_0)*k_v*H_a/(mu_m*lambda_a)\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-val-q0.png\" alt=\"q_0 = sqrt(k*k_v)*abs(rho_0 - rho_inj)*g/(mu_0 + mu_inj)\"/></p>
<p>Classification (r_1 = r_0 + &Delta;r_1 is the outer radius of the first radial control volume):</p>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"1\">
<tr><td><b>Criterion</b></td><td><b>0 fulfilled</b></td><td><b>1 warning</b></td><td><b>2 violated</b></td></tr>
<tr><td>Darcy's law</td><td>E(r_0) &le; E_ok</td><td>E(r_0) &gt; E_ok and r_E &le; r_1</td><td>r_E &gt; r_1</td></tr>
<tr><td>Local thermal equilibrium</td><td>d &le; d_LTE or r_LTE &le; r_1</td><td>otherwise</td><td>d &ge; d_LTNE and r_LTNE &gt; r_1</td></tr>
<tr><td>Natural regional groundwater flow</td><td>N_hi &le; N_ok</td><td>N_hi &gt; N_ok and N_lo &le; N_max</td><td>N_lo &gt; N_max</td></tr>
<tr><td>Buoyancy switch</td><td>buoyancy = true, or Ra &lt; f_warn&middot;Ra_crit and q_0 &lt; f_warn&middot;q_0,crit</td><td>buoyancy = false and Ra &ge; f_warn&middot;Ra_crit or q_0 &ge; f_warn&middot;q_0,crit</td><td>buoyancy = false and Ra &ge; Ra_crit or q_0 &ge; q_0,crit</td></tr>
</table>
<p>The overall status is the maximum of the four status values.</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Call the function before setting up a simulation, either from the Dymola command line or in a model as parameter binding:</p>
<pre>parameter Records.ValidityResult validity = Function.ValidityAnalysis(
  site = Parameters, setting = setting, m_flow_max = 20, T_inj = 333.15,
  t_cycle = 365*86400, u_amb = 3e-7, vleFluidType = simCenter.fluid1);</pre>
<p>Use the same Subsurface_Basic and Setting records as in ATES_confinedLayer. m_flow_max is the largest absolute mass flow rate of injection or production. V_inj defaults to setting.V_inj; set it explicitly if an individual grid (optimized_grid = false) is used. A measured grain diameter d_50 should be given if available, because the estimate from permeability and porosity is uncertain. u_amb is the Darcy flux of the regional groundwater flow (hydraulic conductivity times hydraulic gradient), not the seepage velocity.</p>
<p>Status 1 (warning) indicates that the assumption is partly violated or that the threshold is uncertain (see section 3); the report states the reason. Status 2 means that the scenario is outside the validity of the model.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;TransiEnt.Storage.Heat.ATES_L4.Check.Check_ValidityAnalysis&quot;. For the Auburn field experiment (Molz et al. 1983), the function reproduces the Rayleigh-Darcy number Ra = 79 reported by Gillner et al.</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Bear, J., 1972: Dynamics of Fluids in Porous Media. American Elsevier, New York.</p>
<p>Beernink, S., Hartog, N., Vardon, P. J., Bloemendal, M., 2024: Heat losses in ATES systems: The impact of processes, storage geometry and temperature. Geothermics 117, 102889, https://doi.org/10.1016/j.geothermics.2023.102889.</p>
<p>Bloemendal, M., Hartog, N., 2018: Analysis of the impact of storage conditions on the thermal recovery efficiency of low-temperature ATES systems. Geothermics 71, 306&ndash;319, https://doi.org/10.1016/j.geothermics.2017.10.009.</p>
<p>Collignon, M., Klemetsdal, &Oslash;. S., M&oslash;yner, O., Alcani&eacute;, M., Rinaldi, A. P., Nilsen, H. M., Lupi, M., 2020: Evaluating thermal losses and storage capacity in high-temperature aquifer thermal energy storage (HT-ATES) systems with well operating limits: insights from a study-case in the Greater Geneva Basin, Switzerland. Geothermics 85, 101773, https://doi.org/10.1016/j.geothermics.2019.101773.</p>
<p>Ergun, S., 1952: Fluid flow through packed columns. Chemical Engineering Progress 48, 89&ndash;94.</p>
<p>Gillner, M., Jin, Y., Speerforck, A.: System-level model for high-temperature aquifer thermal energy storage (HT-ATES) accounting for buoyancy-driven flow. Manuscript.</p>
<p>Gossler, M. A., Bayer, P., Rau, G. C., Einsiedl, F., Zosseder, K., 2020: On the limitations and implications of modeling heat transport in porous aquifers by assuming local thermal equilibrium. Water Resources Research 56, e2020WR027772.</p>
<p>Hellstr&ouml;m, G., Tsang, C.-F., Claesson, J., 1988: Buoyancy flow at a two-fluid interface in a porous medium: analytical studies. Water Resources Research 24, 493&ndash;506, https://doi.org/10.1029/WR024i004p00493.</p>
<p>Lee, H., Gossler, M., Zosseder, K., Blum, P., Bayer, P., Rau, G. C., 2025: Laboratory heat transport experiments reveal grain-size- and flow-velocity-dependent local thermal non-equilibrium effects. Hydrology and Earth System Sciences 29, 1359&ndash;1378, https://doi.org/10.5194/hess-29-1359-2025.</p>
<p>Molz, F. J., Melville, J. G., Parr, A. D., King, D. A., Hopf, M. T., 1983: Aquifer thermal energy storage: a well doublet experiment at increased temperatures. Water Resources Research 19, 149&ndash;160.</p>
<p>Nield, D. A., Bejan, A., 2017: Convection in Porous Media. 5th edition. Springer, New York, https://doi.org/10.1007/978-3-319-49562-0.</p>
<p>Tas, L., et al., 2025: Efficiency and heat transport processes of low-temperature aquifer thermal energy storage systems: new insights from global sensitivity analyses. Geothermal Energy 13, 2, https://doi.org/10.1186/s40517-024-00326-1.</p>
<p>Wheatcraft, S. W., Winterberg, F., 1985: Steady state flow passing through a cylinder of permeability different from the surrounding medium. Water Resources Research 21, 1923&ndash;1929, https://doi.org/10.1029/WR021i012p01923.</p>
<p>Zeng, Z., Grigg, R., 2006: A criterion for non-Darcy flow in porous media. Transport in Porous Media 63, 57&ndash;69, https://doi.org/10.1007/s11242-005-2720-3.</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Function created by Markus Gillner (markus.gillner@tuhh.de) on 01.10.2026</p>
</html>"));

end ValidityAnalysis;
