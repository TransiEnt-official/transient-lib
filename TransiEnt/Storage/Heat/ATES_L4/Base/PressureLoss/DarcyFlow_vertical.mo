within TransiEnt.Storage.Heat.ATES_L4.Base.PressureLoss;
model DarcyFlow_vertical "impulse bilance with buoyancy"
  extends ClaRa.Basics.Icons.Delta_p;

  //Import and class hierachy
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Constants.eps;
  import Modelica.Constants.g_n;

  //parameters
  parameter Real k "permeability of aquifer";
  parameter Integer N_r;
  parameter Integer N_z;
  parameter SI.Area A_q[N_r] "cross-sectional area of control volumes";
  parameter SI.Length z_A[N_r,N_z]  "height of control volumes";
  parameter Boolean with_buoyancy = false "logical variable for switching buoyancy physics on (true) or off (false)";
  parameter SI.Density rho_l "Density of undisturbed or intial fluid";
  //final parameter Real f_buoyancy = if with_buoyancy then 1 else 0 "factor for switching buoyancy physics on (1) or off (0)";
  parameter Real n "porosity of aquifer";
  protected
    final parameter SI.Length z_diff[N_z+1] = cat(1, {0.5*z_A[1,1]}, {0.5*(z_A[1,j]+z_A[1,j+1]) for j in 1:N_z-1}, {0.5*z_A[1,N_z]}) "Shifted vector z_A of grid sections in z-direction";


  //variables
  public
    outer SI.DynamicViscosity f_eta_v[N_r,N_z+2] "temperature and density dependent dynamic viscosity";
    outer SI.PressureDifference delta_p_v[N_r,N_z+1] "pressure difference between two control volumes in vertical neighbourhood";
    outer SI.Density rho_FM_v[N_r,N_z+1] "density at cross sectional area between two controlvolumes";

    SI.MassFlowRate m_flow_buoyancy[N_r,N_z+1](each start = 0.1);

    SI.Velocity v_darcy[N_r,N_z+1](each start = 0.00001) "Darcy velocity V_f/A_q at each cross-sectional area";
    //SI.Acceleration der_v_darcy[N_r,N_z+1] "derivation of darcy velocity";

  public
  //GeometryATES geo annotation (Placement(transformation(extent={{72,-90},{92,-70}})));
  //replaceable Records.Aquiferspeicher_Standard Parameters annotation (Placement(transformation(extent={{40,-90},{60,-70}})));

initial equation


equation
 for i in 1:N_r loop
    -delta_p_v[i,1]/z_diff[1] = - (f_eta_v[i,1]/k)*v_darcy[i,1] - rho_FM_v[i,1]*g_n; //negligence of acceleration
    m_flow_buoyancy[i,1] = v_darcy[i,1]*A_q[i]*rho_l;//rho_FM_v[i,j];//using a reference value at the boundary for better initialization

    -delta_p_v[i,N_z+1]/z_diff[N_z+1] = - (f_eta_v[i,N_z+1]/k)*v_darcy[i,N_z+1] - rho_FM_v[i,N_z+1]*g_n;
    m_flow_buoyancy[i,N_z+1] = v_darcy[i,N_z+1]*A_q[i]*rho_l;//rho_FM_v[i,j];//using a reference value at the boundary for better initialization

    if with_buoyancy then
      for j in 2:N_z loop
        -delta_p_v[i,j]/z_diff[j] = - (f_eta_v[i,j]/k)*v_darcy[i,j] - rho_FM_v[i,j]*g_n;
        m_flow_buoyancy[i,j] = v_darcy[i,j]*A_q[i]*rho_FM_v[i,j];//
      end for;
    else
      for j in 2:N_z loop
        v_darcy[i,j]=0;
        m_flow_buoyancy[i,j] = 0;//
      end for;
    end if;
  end for;

  annotation(Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Implements the vertical Darcy momentum equation including the buoyancy body force. Computes vertical mass flow rates and Darcy velocities at all N_z+1 horizontal interfaces of the aquifer grid. When buoyancy is disabled, vertical flow is set to zero.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4: Resolved vertical flow field for each horizontal cell interface across the full [N_r, N_z+1] grid. Buoyancy is driven by local density differences and can be switched on/off via the Boolean parameter <code>with_buoyancy</code>. Inertial terms are neglected.</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Valid for low Reynolds number flow (Darcy regime).</p>
<p>- With buoyancy disabled, vertical flow is identically zero (no short-circuit between layers).</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>No connectable ports. Variables are accessed via Modelica inner/outer mechanism from the enclosing ControlVolumeL4:</p>
<p>delta_p_v[N_r, N_z+1] — vertical pressure differences (outer, set by ControlVolumeL4)</p>
<p>rho_FM_v[N_r, N_z+1] — fluid density at horizontal interfaces (outer)</p>
<p>f_eta_v[N_r, N_z+2] — dynamic viscosity at interfaces (outer)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-mdot.png\" alt=\"\\dot{m}\"/></td>
  <td valign=\"middle\"><code>m_flow_buoyancy[N_r, N_z+1]</code></td>
  <td valign=\"middle\">vertical mass flow rate at each interface [kg/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-dv-symbol-vD.png\" alt=\"v_D\"/></td>
  <td valign=\"middle\"><code>v_darcy[N_r, N_z+1]</code></td>
  <td valign=\"middle\">vertical Darcy velocity at each interface [m/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-dp.png\" alt=\"\\Delta p\"/></td>
  <td valign=\"middle\"><code>delta_p_v</code></td>
  <td valign=\"middle\">vertical pressure difference [Pa]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-dv-symbol-kv.png\" alt=\"k_v\"/></td>
  <td valign=\"middle\"><code>k</code></td>
  <td valign=\"middle\">vertical permeability [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-eta.png\" alt=\"\\eta\"/></td>
  <td valign=\"middle\"><code>f_eta_v</code></td>
  <td valign=\"middle\">dynamic viscosity [Pa&middot;s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-rho.png\" alt=\"\\rho\"/></td>
  <td valign=\"middle\"><code>rho_FM_v</code></td>
  <td valign=\"middle\">fluid density at interface [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-g.png\" alt=\"g\"/></td>
  <td valign=\"middle\"><code>g_n</code></td>
  <td valign=\"middle\">gravitational acceleration = 9.81 m/s&sup2;</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-z.png\" alt=\"z\"/></td>
  <td valign=\"middle\"><code>z_diff[N_z+1]</code></td>
  <td valign=\"middle\">distance between temperature nodes of adjacent control volumes [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-Aq.png\" alt=\"A_q\"/></td>
  <td valign=\"middle\"><code>A_q[N_r]</code></td>
  <td valign=\"middle\">cross-sectional area of control volume [m&sup2;]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Vertical Darcy momentum equation with gravitational body force:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-dv-darcy.png\"
     alt=\"-Delta_p/z = -(eta/k)*v_Darcy - rho*g\"/></p>
<p>Buoyancy mass flow rate from Darcy velocity and cross-sectional area:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-dv-velocity.png\"
     alt=\"m_flow_buoy = v_D * A_q * rho\"/></p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>This model must be instantiated inside ControlVolumeL4 so that the inner/outer variable declarations are satisfied. It cannot be used as a standalone component. The buoyancy switch is propagated from the Setting record.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"));
end DarcyFlow_vertical;
