within TransiEnt.Storage.Heat.ATES_L4.Base.PressureLoss;
model DarcyFlow_horizontal "Momentum balance (with mass continous equation) of Darcy"

  //Import and class hierachy
  extends ClaRa.Basics.Icons.Delta_p;
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Constants.eps;

  //parameters
  parameter Real k "permeability of aquifer";
  parameter Real eta "viscosity of aquifer";
  parameter SI.Density rho_l "Density of undisturbed or intial fluid";
  parameter Integer N_r;
  parameter Integer N_z;
  parameter SI.Area A_s[N_r,N_z] "outer surface of volume";
  parameter SI.Length z_A[N_r,N_z] "heights of control volumes in aquifer";
  parameter SI.Length r_r[N_r,N_z] "radius of the center of the control volumes to well";
  parameter SI.Length r[N_r] "radius of the outer edge of the control volumes to well";
  parameter SI.Length r_0 "Outer diameter of well screen";

  protected
  parameter SI.Area A_s_well[N_z] = {(r_0*pi*2*z_A[1,j]) for j in 1:N_z} "surface area of well";

  public
  //variables
  outer SI.Pressure delta_p_darcy[N_r+1,N_z] "pressure loss over a representative elementary volume (REV), to be calculated in control volume";
  outer SI.Density rho_FM[N_r+1,N_z] "density of fluid in REV, to be calculated in control volume";
  outer SI.DynamicViscosity f_eta[N_r+2,N_z] "temperature and density dependent dynamic viscosity";
  //SI.DynamicViscosity eta_real[N_r+1,N_z](each start = eta) "dynamic viscosity depending on direction of mass flow";

  SI.MassFlowRate m_flow[N_r+1,N_z](each start = 0.1) "mass flow rate of fluid into a REV";
  SI.Velocity v_darcy[N_r+1,N_z](each start = 0.00001) "Darcy velocity m^2/m^3";

  //replaceable Records.Aquiferspeicher_Standard Parameters annotation (Placement(transformation(extent={{10,-92},{30,-72}})));
  //GeometryATES geo annotation (Placement(transformation(extent={{48,-92},{68,-72}})));
equation

   for j in  1:N_z loop
      m_flow[1,j]=2*pi*z_A[1,j]*rho_FM[1,j]*k * delta_p_darcy[1,j] *1/(log(r_r[1,j])-log(r_0))*1/f_eta[1,j];//
      m_flow[1,j]=v_darcy[1,j]*A_s_well[j]*rho_l;
    end for;

    for  j in 1:N_z loop
      for i in 2:N_r loop
       m_flow[i,j]=2*pi*z_A[i,j]*rho_FM[i,j]*k * delta_p_darcy[i,j] *1/(log(r_r[i,j])-log(r_r[i-1,j]))*1/f_eta[i,j]; //mass flow in radial direction
       m_flow[i,j]=v_darcy[i,j]*A_s[i-1,j]*rho_FM[i,j];
      end for;
    end for;

   for j in 1:N_z loop
    m_flow[N_r+1,j]=2*pi*z_A[N_r,j]*rho_FM[N_r+1,j]*k * delta_p_darcy[N_r+1,j] *1/(log(r[N_r])-log(r_r[N_r,j]))*1/f_eta[N_r+1,j];
    m_flow[N_r+1,j]=v_darcy[N_r+1,j]*A_s[N_r,j]*rho_l;
   end for;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Implements Darcy's law for radial (horizontal) groundwater flow through a porous medium in cylindrical geometry. Computes mass flow rates and Darcy velocities between all N_r+1 radial interfaces of the aquifer grid, including the well-screen interface.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4: Resolved mass flow field for each radial cell interface across the full [N_r+1, N_z] grid. Viscosity and density are provided by the enclosing ControlVolumeL4 via Modelica&apos;s inner/outer mechanism. Inertial effects are neglected (creeping flow assumption).</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Valid for low Reynolds number flow (Darcy regime).</p>
<p>- Isothermal permeability: k is constant, temperature-dependent viscosity is injected via inner/outer.</p>
<p>- No well-bore storage or skin effects modeled.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>No connectable ports. Variables are accessed via Modelica inner/outer mechanism from the enclosing ControlVolumeL4:</p>
<p>delta_p_darcy[N_r+1, N_z] — radial pressure differences (outer, set by ControlVolumeL4)</p>
<p>rho_FM[N_r+1, N_z] — fluid density at cell interfaces (outer)</p>
<p>f_eta[N_r+2, N_z] — dynamic viscosity at cell interfaces (outer)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-mdot.png\" alt=\"\\dot{m}\"/></td>
  <td valign=\"middle\"><code>m_flow[N_r+1, N_z]</code></td>
  <td valign=\"middle\">radial mass flow rate at each interface [kg/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-dv-symbol-vD.png\" alt=\"v_D\"/></td>
  <td valign=\"middle\"><code>v_darcy[N_r+1, N_z]</code></td>
  <td valign=\"middle\">radial Darcy velocity at each interface [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-dp.png\" alt=\"\\Delta p\"/></td>
  <td valign=\"middle\"><code>delta_p_darcy</code></td>
  <td valign=\"middle\">pressure difference driving radial flow [Pa]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-k.png\" alt=\"k\"/></td>
  <td valign=\"middle\"><code>k</code></td>
  <td valign=\"middle\">radial permeability of aquifer [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-eta.png\" alt=\"\\eta\"/></td>
  <td valign=\"middle\"><code>f_eta</code></td>
  <td valign=\"middle\">dynamic viscosity of fluid [Pa&middot;s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-rho.png\" alt=\"\\rho\"/></td>
  <td valign=\"middle\"><code>rho_FM</code></td>
  <td valign=\"middle\">fluid density at interface [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-z.png\" alt=\"z\"/></td>
  <td valign=\"middle\"><code>z_A[N_r, N_z]</code></td>
  <td valign=\"middle\">height of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-tr-symbol-r_r.png\" alt=\"r_r\"/></td>
  <td valign=\"middle\"><code>r_r[N_r, N_z]</code></td>
  <td valign=\"middle\">centre radius of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-dh-symbol-As.png\" alt=\"A_s\"/></td>
  <td valign=\"middle\"><code>A_s[N_r, N_z]</code></td>
  <td valign=\"middle\">outer lateral surface area of control volume [m&sup2;]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Radial Darcy mass flow at inner cell interfaces (i = 1 ... N_r) and outer boundary (i = N_r+1):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-dh-darcy.png\"
     alt=\"m_flow = 2*pi*z*rho*k*Delta_p / (eta*(ln(r_outer)-ln(r_r)))\"/></p>
<p>Darcy velocity from mass flow rate and interface area:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-dh-velocity.png\"
     alt=\"m_flow = v_D * A_s * rho\"/></p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>This model must be instantiated inside ControlVolumeL4 so that the inner/outer variable declarations are satisfied. It cannot be used as a standalone component.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"));
end DarcyFlow_horizontal;
