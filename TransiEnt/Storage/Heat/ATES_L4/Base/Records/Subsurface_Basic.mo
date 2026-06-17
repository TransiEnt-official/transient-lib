within TransiEnt.Storage.Heat.ATES_L4.Base.Records;
record Subsurface_Basic "basic subsurface parameters with default values"
 extends TransiEnt.Basics.Icons.Record;

  //Import und Hierachie
  import Modelica.Units.SI;
  import Modelica.Constants.g_n;
  import Modelica.Constants.pi;

   // ==== ground specific properties ====
  //fluid properties
  parameter SI.Density rho_l=988.04 "Density of fluid, default: density of water at 50°C" annotation(Dialog(tab="Property values", group="fluid properties"));
  parameter SI.DynamicViscosity eta=0.466*10^(-3) "Dynamic Viscosity of fluid, default: dynamic viscosity of water at 50°C" annotation(Dialog(tab="Property values", group="fluid properties"));
  parameter SI.SpecificHeatCapacity Cp_l=4181.5 "Specific Heat Capacity of fluid, default: capacity of water at 50 °C" annotation(Dialog(tab="Property values", group="fluid properties"));
  parameter SI.ThermalConductivity lambda_l=0.64 "Heat Conductivity of the fluid, default: conductivity of water at 50°C" annotation(Dialog(tab="Property values", group="fluid properties"));
  parameter Real C_w=4.03*10^6 "volumetric Heat Capacity of fluid, default: capacity of water at 50°C" annotation(Dialog(tab="Property values", group="fluid properties"));

  //aquifer matrix properties
  parameter SI.Density rho_s=2000 "Density of solid" annotation(Dialog(tab="Property values", group="matrix properties in aquifer"));
  parameter SI.SpecificHeatCapacity Cp_s=900 "Specific Heat Capacity of solid" annotation(Dialog(tab="Property values", group="matrix properties in aquifer"));
  parameter SI.ThermalConductivity lambda_s=2.56 "Heat Conductivity of the solid" annotation(Dialog(tab="Property values", group="matrix properties in aquifer"));
  parameter Real n=0.25 "Porosity of the aquifer" annotation(Dialog(tab="Property values", group="matrix properties in aquifer"));
  parameter Real C_a=1.81*10^6 "volumetric Heat Capacity of aquifermatrix" annotation(Dialog(tab="Property values", group="matrix properties in aquifer"));
  parameter SI.Area k_v=0.5*10^(-12) "Vertical permeability of aquifer, mostly kv=0.1*k" annotation(Dialog(tab="Property values", group="matrix properties in aquifer"));
  parameter SI.Area k=25*10^(-12) "Radial permeability of aquifer" annotation(Dialog(tab="Property values", group="matrix properties in aquifer"));

  //confining layer properties
  parameter Real n_c=0.35 "Porosity of the confining layers" annotation(Dialog(tab="Property values", group="property values of solid in confining layers"));
  parameter SI.Density rho_sc=2000 "Density of solid in confing layers" annotation(Dialog(tab="Property values", group="property values of solid in confining layers"));
  parameter SI.SpecificHeatCapacity Cp_sc=900 "Specific Heat Capacity of solid in confining layers" annotation(Dialog(tab="Property values", group="property values of solid in confining layers"));
  parameter SI.ThermalConductivity lambda_sc=2.56 "Heat Conductivity of the solid in confining layers" annotation(Dialog(tab="Property values", group="property values of solid in confining layers"));

  //calculation of aquifer and confining layers properties
  final parameter SI.Density rho=n*rho_l+(1-n)*rho_s "Density of aquifer" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));
  final parameter SI.Density rho_c=n_c*rho_l+(1-n_c)*rho_sc "Density of aquitard" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));
  final parameter SI.SpecificHeatCapacity Cp=n*Cp_l+(1-n)*Cp_s "Specific Heat Capacity of aquifer" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));
  final parameter SI.SpecificHeatCapacity Cp_c=n_c*Cp_l+(1-n_c)*Cp_sc "Specific Heat Capacity of aquitard" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));
  final parameter Real C = n*C_w + (1-n)*C_a "Volumetric heat capacity of aquifer" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));
  final parameter SI.ThermalConductivity lambda_c=n_c*lambda_l + (1 - n_c)*lambda_sc "Heat Conductivity of the aquitard" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));
  final parameter SI.ThermalConductivity lambda_a=n*lambda_l + (1 - n)*lambda_s "Heat Conductivity of the aquifer" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));


  parameter SI.Length d_h=0.7 "horizontal dispersion coefficient" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));
  parameter SI.Length d_v=0.05  "vertical dispersion coefficient" annotation(Dialog(tab="Property values", group="property values of whole aquifer and confining layers"));

    // ==== Initial Values ====
  parameter SI.Pressure p_initial = 1000000 "inital pressure in aquifer at example 100 bar at the lowest point of the well" annotation(Dialog(tab="Property values", group="Initial values"));
  parameter SI.Temperature T_initial = 311.15 "initial temperature in aquifer at t=0s" annotation(Dialog(tab="Property values", group="Initial values"));


  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Base record defining thermophysical and hydrological properties of the aquifer, confining layers, and pore fluid. Provides default values representative of water at 50&deg;C in a sandstone aquifer.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- All properties are constant (temperature and pressure independent).</p>
<p>- Effective properties of aquifer and aquitard are computed as linear porosity-weighted averages.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no elements)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-rho.png\" alt=\"\\rho_l\"/></td>
  <td valign=\"middle\"><code>rho_l</code></td>
  <td valign=\"middle\">fluid density [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-eta.png\" alt=\"\\eta\"/></td>
  <td valign=\"middle\"><code>eta</code></td>
  <td valign=\"middle\">dynamic viscosity of fluid [Pa&middot;s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-cp.png\" alt=\"c_p\"/></td>
  <td valign=\"middle\"><code>Cp_l</code></td>
  <td valign=\"middle\">specific heat capacity of fluid [J/(kg&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-lambda.png\" alt=\"\\lambda_l\"/></td>
  <td valign=\"middle\"><code>lambda_l</code></td>
  <td valign=\"middle\">thermal conductivity of fluid [W/(m&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-rho_s.png\" alt=\"\\rho_s\"/></td>
  <td valign=\"middle\"><code>rho_s</code></td>
  <td valign=\"middle\">density of aquifer solid matrix [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-cps.png\" alt=\"c_{p,s}\"/></td>
  <td valign=\"middle\"><code>Cp_s</code></td>
  <td valign=\"middle\">specific heat capacity of aquifer solid [J/(kg&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-lambda.png\" alt=\"\\lambda_s\"/></td>
  <td valign=\"middle\"><code>lambda_s</code></td>
  <td valign=\"middle\">thermal conductivity of aquifer solid [W/(m&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-n.png\" alt=\"n\"/></td>
  <td valign=\"middle\"><code>n</code></td>
  <td valign=\"middle\">porosity of the aquifer [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-k.png\" alt=\"k\"/></td>
  <td valign=\"middle\"><code>k</code></td>
  <td valign=\"middle\">radial permeability of aquifer [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-dv-symbol-kv.png\" alt=\"k_v\"/></td>
  <td valign=\"middle\"><code>k_v</code></td>
  <td valign=\"middle\">vertical permeability of aquifer [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Tinit.png\" alt=\"T_\\mathrm{init}\"/></td>
  <td valign=\"middle\"><code>T_initial</code></td>
  <td valign=\"middle\">initial temperature of aquifer [K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-pinit.png\" alt=\"p_\\mathrm{init}\"/></td>
  <td valign=\"middle\"><code>p_initial</code></td>
  <td valign=\"middle\">initial pressure of aquifer [Pa]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Cw.png\" alt=\"C_w\"/></td>
  <td valign=\"middle\"><code>C_w</code></td>
  <td valign=\"middle\">volumetric heat capacity of fluid [J/(m&sup3;&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Ca.png\" alt=\"C_a\"/></td>
  <td valign=\"middle\"><code>C_a</code></td>
  <td valign=\"middle\">volumetric heat capacity of aquifer matrix [J/(m&sup3;&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-n_c.png\" alt=\"n_c\"/></td>
  <td valign=\"middle\"><code>n_c</code></td>
  <td valign=\"middle\">porosity of confining layers [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-rho_sc.png\" alt=\"\\rho_{sc}\"/></td>
  <td valign=\"middle\"><code>rho_sc</code></td>
  <td valign=\"middle\">density of solid in confining layers [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-cp_sc.png\" alt=\"c_{p,sc}\"/></td>
  <td valign=\"middle\"><code>Cp_sc</code></td>
  <td valign=\"middle\">specific heat capacity of solid in confining layers [J/(kg&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-lambda_sc.png\" alt=\"\\lambda_{sc}\"/></td>
  <td valign=\"middle\"><code>lambda_sc</code></td>
  <td valign=\"middle\">thermal conductivity of solid in confining layers [W/(m&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-rho_aq.png\" alt=\"\\rho_\\mathrm{aq}\"/></td>
  <td valign=\"middle\"><code>rho</code></td>
  <td valign=\"middle\">effective density of aquifer (porosity-weighted) [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-rho_c.png\" alt=\"\\rho_c\"/></td>
  <td valign=\"middle\"><code>rho_c</code></td>
  <td valign=\"middle\">effective density of aquitard (porosity-weighted) [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-cp_aq.png\" alt=\"c_{p,\\mathrm{aq}}\"/></td>
  <td valign=\"middle\"><code>Cp</code></td>
  <td valign=\"middle\">effective specific heat capacity of aquifer (porosity-weighted) [J/(kg&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-cp_c.png\" alt=\"c_{p,c}\"/></td>
  <td valign=\"middle\"><code>Cp_c</code></td>
  <td valign=\"middle\">effective specific heat capacity of aquitard (porosity-weighted) [J/(kg&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-lambda_aq.png\" alt=\"\\lambda_\\mathrm{aq}\"/></td>
  <td valign=\"middle\"><code>lambda_a</code></td>
  <td valign=\"middle\">effective thermal conductivity of aquifer (porosity-weighted) [W/(m&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-lambda_c.png\" alt=\"\\lambda_c\"/></td>
  <td valign=\"middle\"><code>lambda_c</code></td>
  <td valign=\"middle\">effective thermal conductivity of aquitard (porosity-weighted) [W/(m&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-dh.png\" alt=\"d_h\"/></td>
  <td valign=\"middle\"><code>d_h</code></td>
  <td valign=\"middle\">horizontal dispersion coefficient [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-dv.png\" alt=\"d_v\"/></td>
  <td valign=\"middle\"><code>d_v</code></td>
  <td valign=\"middle\">vertical dispersion coefficient [m]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Extend this record and override parameters to define site-specific aquifer properties. See Molz1983 for an example with literature-validated values.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Model revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Removed a duplicate declaration of the parameter C (volumetric heat capacity of aquifer).</p>
</html>"));
end Subsurface_Basic;
