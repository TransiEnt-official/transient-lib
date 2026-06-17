within TransiEnt.Storage.Heat.ATES_L4.Base.Function;
function DynamicViscosityWater "calculation of dyn. viscosity of pure water according to IAPWS-R12-08 but not near critical point"

  //near critical point 645.91 K < T < 650.77K and 245.8kg/m³ < rho < 405.3 kg/m³ according to IAPWS-R12-08 [1]
  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Function;
  import Modelica.Units.SI;


  //
  //_____________________________________________
  //
  //                  Interfaces
  //_____________________________________________
  input SI.Temperature T "Temperature of water";
  input SI.Density rho "Density of water";

  output SI.DynamicViscosity eta "Dynamic Viscosity of water";

protected
  constant SI.Temperature T_ref = 647.096 "reference temperature in K";
  constant SI.Density rho_ref = 322.0 "reference density in kg/m³";
  constant SI.DynamicViscosity eta_ref = 1e-06 "reference dynamic viscosity in Pa s";

  constant Real H_0 = 1.67752 "coefficent for zero-density part";
  constant Real H_1 = 2.20462 "coefficent for zero-density part";
  constant Real H_2 = 0.6366564 "coefficent for zero-density part";
  constant Real H_3 = -0.241605 "coefficent for zero-density part";

  constant Real C_00 = 5.20094e-01 "coefficient for density-driven part";
  constant Real C_10 = 8.50895e-02 "coefficient for density-driven part";
  constant Real C_20 = -1.08374 "coefficient for density-driven part";
  constant Real C_30 = -2.89555e-01 "coefficient for density-driven part";
  constant Real C_01 = 2.22531e-01 "coefficient for density-driven part";
  constant Real C_11 = 9.99115e-01 "coefficient for density-driven part";
  constant Real C_21 = 1.88797 "coefficient for density-driven part";
  constant Real C_31 = 1.26613 "coefficient for density-driven part";
  constant Real C_51 = 1.20573e-01 "coefficient for density-driven part";
  constant Real C_02 = -2.81378e-01 "coefficient for density-driven part";
  constant Real C_12 = -9.06851e-01 "coefficient for density-driven part";
  constant Real C_22 = -7.72479e-01 "coefficient for density-driven part";
  constant Real C_32 = -4.89837e-01 "coefficient for density-driven part";
  constant Real C_42 = -2.57040e-01 "coefficient for density-driven part";
  constant Real C_03 = 1.61913e-01 "coefficient for density-driven part";
  constant Real C_13 = 2.57399e-01 "coefficient for density-driven part";
  constant Real C_04 = -3.25372e-02 "coefficient for density-driven part";
  constant Real C_34 = 6.98452e-02 "coefficient for density-driven part";
  constant Real C_45 = 8.72102e-03 "coefficient for density-driven part";
  constant Real C_36 = -4.35673e-03 "coefficient for density-driven part";
  constant Real C_56 = -5.93264e-04 "coefficient for density-driven part";

  SI.DimensionlessRatio T_d;
  SI.DimensionlessRatio rho_d;
  SI.DimensionlessRatio eta_0 "viscosity in zero density limit";
  SI.DimensionlessRatio eta_1 "viscosity due increasing density";

  SI.DimensionlessRatio j0 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j1 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j2 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j3 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j4 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j5 "auxiliary variable for better clarity";


algorithm

  T_d:=T/T_ref;
  rho_d:=rho/rho_ref;

  eta_0:=100*sqrt(T_d)/(H_0/T_d^0 + H_1/T_d + H_2/T_d^2 + H_3/T_d^3);

  j0:= (1/T_d - 1)^0*(C_00*(rho_d-1)^0 + C_01*(rho_d-1) + C_02*(rho_d-1)^2 + C_03*(rho_d-1)^3 + C_04*(rho_d-1)^4);
  j1:= (1/T_d - 1)*(C_10*(rho_d-1)^0 + C_11*(rho_d-1) + C_12*(rho_d-1)^2 + C_13*(rho_d-1)^3);
  j2:= (1/T_d - 1)^2*(C_20*(rho_d-1)^0 + C_21*(rho_d-1) + C_22*(rho_d-1)^2);
  j3:= (1/T_d - 1)^3*(C_30*(rho_d-1)^0 + C_31*(rho_d-1) + C_32*(rho_d-1)^2 + C_34*(rho_d-1)^4 + C_36*(rho_d-1)^6);
  j4:= (1/T_d - 1)^4*(C_42*(rho_d-1)^2 + C_45*(rho_d-1)^5);
  j5:= (1/T_d - 1)^5*(C_51*(rho_d-1) + C_56*(rho_d-1)^6);

  eta_1:=exp(rho_d*(j0+j1+j2+j3+j4+j5));

  eta:=(eta_0 * eta_1) * eta_ref;
  annotation(Documentation(info="<html>
  <h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
  <p>Pure function that computes the dynamic viscosity of ordinary (liquid) water as a function of temperature and density, following the IAPWS-R12-08 formulation. It provides the temperature- and density-dependent viscosity used by the aquifer flow models (ControlVolumeL4, DarcyFlow_horizontal/vertical) instead of a constant value.</p>
  
  <h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
  <p>Purely mathematical component. Implements the first two factors of the IAPWS-R12-08 correlation:</p>
  <ul>
  <li>Zero-density (dilute-gas) limit term eta_0(T).</li>
  <li>Residual term eta_1(T, rho) accounting for the density dependence.</li>
  </ul>
  <p>The critical enhancement factor eta_2 is set to 1 (neglected), so the function is not valid in the immediate vicinity of the critical point.</p>
  
  <h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
  <p>- Not valid near the critical point (645.91 K &lt; T &lt; 650.77 K together with 245.8 kg/m&sup3; &lt; rho &lt; 405.3 kg/m&sup3;), because the critical enhancement term of IAPWS-R12-08 is omitted.</p>
  <p>- Valid for ordinary water (H2O) within the temperature/density range of the IAPWS-R12-08 industrial formulation.</p>
  <p>- The density rho must be the actual water density consistent with the temperature (e.g. taken from a TILMedia property model).</p>
  <p>- All coefficients are constants of the IAPWS-R12-08 release.</p>
  
  <h4><span style=\"color: #008000\">4. Interfaces</span></h4>
  <p><b>Inputs:</b></p>
  <p>T &mdash; temperature of water [K]</p>
  <p>rho &mdash; density of water [kg/m&sup3;]</p>
  <p><b>Output:</b></p>
  <p>eta &mdash; dynamic viscosity of water [Pa&middot;s]</p>
  
  <h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
  <table cellspacing=\"0\" cellpadding=\"4\">
  <tr>
    <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-T.png\" alt=\"T\"/></td>
    <td valign=\"middle\"><code>T</code></td>
    <td valign=\"middle\">temperature of water [K]</td>
  </tr>
  <tr>
    <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-rho.png\" alt=\"\\rho\"/></td>
    <td valign=\"middle\"><code>rho</code></td>
    <td valign=\"middle\">density of water [kg/m&sup3;]</td>
  </tr>
  <tr>
    <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-eta.png\" alt=\"\\eta\"/></td>
    <td valign=\"middle\"><code>eta</code></td>
    <td valign=\"middle\">dynamic viscosity of water [Pa&middot;s] (output)</td>
  </tr>
  </table>
  <p>Reference constants and auxiliary quantities (IAPWS-R12-08):</p>
  <p>T_ref = 647.096 K, rho_ref = 322.0 kg/m&sup3;, eta_ref = 1&times;10<sup>-6</sup> Pa&middot;s &mdash; reference temperature, density and viscosity</p>
  <p>T_d = T / T_ref, rho_d = rho / rho_ref &mdash; reduced (dimensionless) temperature and density</p>
  <p>eta_0 &mdash; viscosity in the zero-density (dilute-gas) limit [-]</p>
  <p>eta_1 &mdash; residual viscosity contribution due to finite density [-]</p>
  <p>H_0 ... H_3 &mdash; coefficients of the zero-density term [-]</p>
  <p>C_ij &mdash; coefficients of the residual (density-dependent) term [-]</p>
  
  <h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
  <p>Reduced variables:</p>
  <p>T_d = T / T_ref,&nbsp;&nbsp;&nbsp;rho_d = rho / rho_ref</p>
  <p>Zero-density (dilute-gas) limit:</p>
  <p>eta_0 = 100 &middot; sqrt(T_d) / ( sum<sub>i=0..3</sub> H_i / T_d<sup>i</sup> )</p>
  <p>Residual (density-dependent) contribution:</p>
  <p>eta_1 = exp( rho_d &middot; sum<sub>i=0..5</sub> (1/T_d &minus; 1)<sup>i</sup> &middot; sum<sub>j</sub> C_ij (rho_d &minus; 1)<sup>j</sup> )</p>
  <p>Dynamic viscosity (critical enhancement factor eta_2 = 1 neglected):</p>
  <p>eta = eta_0 &middot; eta_1 &middot; eta_ref</p>
  
  <h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
  <p>Pure function (no side effects). Pass a density that is consistent with the temperature (e.g. from a TILMedia VLEFluid property record). The result is returned in Pa&middot;s. Used inside ControlVolumeL4 to populate the temperature- and density-dependent viscosity fields f_eta / f_eta_v of the Darcy flow models.</p>
  
  <h4><span style=\"color: #008000\">8. Validation</span></h4>
  <p>Implements the industrial formulation of IAPWS-R12-08; reference values for verification are provided in the IAPWS-R12-08 release. The function is exercised within the ATES aquifer models (e.g. ATES.Validierung.Buoyancy.Val_homogenLayer).</p>
  
  <h4><span style=\"color: #008000\">9. References</span></h4>
  <p>[1] IAPWS (2008): Release on the IAPWS Formulation 2008 for the Viscosity of Ordinary Water Substance. International Association for the Properties of Water and Steam.</p>
  <p>[2] Huber, M. L., Perkins, R. A., Laesecke, A., Friend, D. G., Sengers, J. V., et al. (2009): New International Formulation for the Viscosity of H2O. Journal of Physical and Chemical Reference Data, 38(2), 101&ndash;125. doi:10.1063/1.3088050.</p>
  
  <h4><span style=\"color: #008000\">10. Version History</span></h4>
  <p>Function created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
  <p>Documentation added by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
  </html>"));
end DynamicViscosityWater;
