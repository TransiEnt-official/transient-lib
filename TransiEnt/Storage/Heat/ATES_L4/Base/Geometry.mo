within TransiEnt.Storage.Heat.ATES_L4.Base;
model Geometry "With Function Discretization the necessary geometry values are calculated"

  //Import und Hierachie
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Constants.eps;

  //Parameters

  parameter Real C_w "volumetric heat capacity of fluid";
  parameter Real C "volumetric heat capacity of aquifer";

  parameter Integer N_r = setting.N_r "number of radial control volumes";
  parameter Integer N_z = setting.N_z "number of vertical control volumes";
  parameter Integer N_z_c = setting.N_z_c  "number of vertical control volumes for the confining layers";

  parameter SI.Area A_s[N_r,N_z](fixed=false) "outer surface area of control volumes";
  parameter SI.Area A_q[N_r](fixed=false) "cross-section area of control volumes";
  parameter SI.Volume V[N_r,N_z](fixed=false) "size of control volumes";
  parameter SI.Length r[N_r](fixed=false) "radius of the outer edge of the control volumes to well";
  parameter SI.Length r_r[N_r,N_z](fixed=false) "radius of the center of the control volumes to well";
  parameter SI.Area A_s_Cu[N_r,N_z_c](fixed=false) "outer surface area of control volumes of upper aquitard";
  parameter SI.Volume V_Cu[N_r,N_z_c](fixed=false) "size of control volumes of upper aquitard";
  parameter SI.Area A_s_Cd[N_r,N_z_c](fixed=false) "outer surface area of control volumes of lower aquitard";
  parameter SI.Volume V_Cd[N_r,N_z_c](fixed=false) "size of control volumes of lower aquitard";
  parameter SI.Length z_A[N_r,N_z](fixed=false) "heights of control volumes in aquifer";
  parameter SI.Length z_Cu[N_r,N_z_c](fixed=false) "heights of control volumes in upper layer aquitard";
  parameter SI.Length z_Cd[N_r,N_z_c](fixed=false) "heights of control volumes in lower layer aquitard";
  parameter SI.Length r_r_c[N_r,N_z_c](fixed=false) "radius of the center of the control volumes to well in aquitard";

  parameter Integer R_GS_H_opt[N_r]( fixed=false) "new calculated vector with lot of 1";
  parameter SI.Length dx_GS_opt[N_r]( fixed=false) "vector of optimized radial discretization";
  parameter Integer H_GS_VA_opt[N_z]( fixed=false) "new calculated vector with lot of 1";
  parameter SI.Length dz_GS_A_opt[N_z]( fixed=false) "vector of optimized vertical discretization";
  parameter Integer H_GS_VC_opt[N_z_c]( fixed=false) "new calculated vector with lot of 1";
  parameter SI.Length dz_GS_C_opt[N_z_c]( fixed=false) "vector of vertical discretization in adjacend layers";

//   parameter SI.Length R = r[N_r] "total radius of the discretized aquifer";
//   parameter SI.Length H_a = sum(z_A[1,:])/N_z "total height of the discretized aquifer";
//   parameter SI.Length H_c = sum(z_Cu[1,:])/N_z_c "total height of the dicretized aquitard";



  //Interfaces

  parameter Records.Setting setting annotation (Placement(transformation(extent={{-82,-88},{-62,-68}})));
initial equation

  if setting.optimized_grid then
     (R_GS_H_opt, dx_GS_opt, H_GS_VA_opt, dz_GS_A_opt, H_GS_VC_opt, dz_GS_C_opt) =
      Base.Functions.GridGenerator(C_w, C, setting.H_a, setting.H_c, setting.V_inj, setting.r_0, setting.domain_factor, setting.N_r, setting.N_z, setting.N_z_c);

     (r,r_r,r_r_c,z_A,z_Cu,z_Cd,A_s,A_q,V,A_s_Cu,V_Cu,A_s_Cd,V_Cd)=Base.Functions.Discretization(
      R_GS_H_opt,
      dx_GS_opt,
      setting.r_0,
      H_GS_VA_opt,
      dz_GS_A_opt,
      H_GS_VC_opt,
      dz_GS_C_opt);


  else
    R_GS_H_opt = setting.R_GS_H;
    dx_GS_opt = setting.dx_GS;
    H_GS_VA_opt = setting.H_GS_VA;
    dz_GS_A_opt = setting.dz_GS_A;
    H_GS_VC_opt = setting.H_GS_VC;
    dz_GS_C_opt = setting.dz_GS_C;


    (r,r_r,r_r_c,z_A,z_Cu,z_Cd,A_s,A_q,V,A_s_Cu,V_Cu,A_s_Cd,V_Cd)=Base.Functions.Discretization(
      R_GS_H_opt,
      dx_GS_opt,
      setting.r_0,
      H_GS_VA_opt,
      dz_GS_A_opt,
      H_GS_VC_opt,
      dz_GS_C_opt);


  end if;

equation


  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                                                Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid), Ellipse(
          extent={{-90,90},{90,-90}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          closure=EllipseClosure.Radial),
        Text(
          extent={{-150,-96},{160,-154}},
          textColor={0,0,255},
          textString="%name")}),            Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Wrapper model that builds the grid during initialization and exposes the resulting geometry arrays as accessible parameters. Provides a single shared geometry object that is referenced by AquiferL4 and ATES_confinedLayer.</p>
<p>Depending on the Setting flag <code>optimized_grid</code>, the initial equation chooses the grid source and then calls the Discretization function:</p>
<ul>
<li><code>optimized_grid = true</code>: the grid section vectors are generated automatically by the GridGenerator function from physical parameters (H_a, H_c, V_inj, r_0, domain_factor, N_r, N_z, N_z_c). N_r must be pre-computed with GridGenerator_SizeOnly.</li>
<li><code>optimized_grid = false</code>: the manual grid section vectors from the Setting record (R_GS_H, dx_GS, H_GS_VA, dz_GS_A, H_GS_VC, dz_GS_C) are used directly.</li>
</ul>
<p>In both cases the selected section vectors are passed to Discretization, which returns the per-cell radii, heights, areas, and volumes.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Geometry is fixed at initialization; no dynamic change of grid geometry.</p>
<p>- Relies on an embedded Setting record to define the grid.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>No connectable ports. Geometry arrays are accessed by name from the enclosing ATES model.</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nr.png\" alt=\"N_r\"/></td>
  <td valign=\"middle\"><code>N_r</code></td>
  <td valign=\"middle\">total number of radial control volumes [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nz.png\" alt=\"N_z\"/></td>
  <td valign=\"middle\"><code>N_z</code></td>
  <td valign=\"middle\">total number of vertical aquifer control volumes [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-r.png\" alt=\"r\"/></td>
  <td valign=\"middle\"><code>r[N_r]</code></td>
  <td valign=\"middle\">outer edge radius of radial control volumes [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-dh-symbol-As.png\" alt=\"A_s\"/></td>
  <td valign=\"middle\"><code>A_s[N_r, N_z]</code></td>
  <td valign=\"middle\">outer lateral surface area of aquifer control volumes [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Aq.png\" alt=\"A_q\"/></td>
  <td valign=\"middle\"><code>A_q[N_r]</code></td>
  <td valign=\"middle\">cross-sectional annular area [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-V.png\" alt=\"V\"/></td>
  <td valign=\"middle\"><code>V[N_r, N_z]</code></td>
  <td valign=\"middle\">volume of aquifer control volumes [m&sup3;]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Instantiate once at the top level of ATES_confinedLayer or AquiferL4. Pass the same Setting record to Geometry and to all sub-models to ensure a consistent grid.</p>
<p>When using the optimized grid (<code>setting.optimized_grid = true</code>), determine the required number of radial control volumes N_r beforehand with GridGenerator_SizeOnly (or the AutoConfigureN_r.mos script) and enter it into the Setting record. The geometry arrays are sized from N_r, N_z and N_z_c, which are structural parameters and therefore require re-translation when changed.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Check.TestDiscretization&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Model revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Documented the optimized vs. individual grid branch of the initial equation and removed nomenclature rows for the commented-out parameters R and H_a.</p>
</html>"));
end Geometry;
