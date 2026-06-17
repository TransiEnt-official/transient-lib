within TransiEnt.Storage.Heat.ATES_L4.Base.Function;
function Discretization "Transform input values for discretization into vectors"


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

  //input Integer NoGS_H "Number of horizontal grid sections";
  input Integer R_GS_H[:] "Length of horizontal grid sections";
  input SI.Length dx_GS[:] "Thicknes of the control volumes within the grid sections";
  input SI.Length r_0 "Radius of pipe in well";

  //input Integer NoGS_VA "Number of vertical grid sections within the aquifer";
  input Integer H_GS_VA[:] "Heigth of vertical grid sections within the aquifer";
  input SI.Length dz_GS_A[:] "Heigth of the control volumes within the grid sections of the aquifer";

  //input Integer NoGS_VC "Number of vertical grid sections within the aquitard, the adjacent layers on top and bottom of the aquifer";
  input Integer H_GS_VC[:] "Heigth of vertical grid sections within the aquitard";
  input SI.Length dz_GS_C[:] "Heigth of the control volumes within the grid sections of the aquitard";


  output SI.Length r[sum(R_GS_H)] "radius to the outer edge of control volumes";
  output SI.Length r_r[sum(R_GS_H),sum(H_GS_VA)] "radius to the center of the control volumes in aquifer";
  output SI.Length r_r_c[sum(R_GS_H),sum(H_GS_VC)]
                                                  "radius to the center of the control volumes in confined layers";
  output SI.Length z_A[sum(R_GS_H),sum(H_GS_VA)]
                                                "height of control volumes in aquifer";
  output SI.Length z_Cu[sum(R_GS_H),sum(H_GS_VC)]
                                                 "height of control volumes in upper confined layer";
  output SI.Length z_Cd[sum(R_GS_H),sum(H_GS_VC)]
                                                 "height of control volumes in lower confined layer";
  output SI.Area A_s[sum(R_GS_H),sum(H_GS_VA)]
                                              "outer surface area of control volumes of aquifer";
  output SI.Area A_q[sum(R_GS_H)]
                                 "cross-sectional area of control volumes of aquifer and confined layer";
  output SI.Volume V[sum(R_GS_H),sum(H_GS_VA)]
                                              "volume of control volumes of aquifer";
  output SI.Area A_s_Cu[sum(R_GS_H),sum(H_GS_VC)]
                                                 "outer surface area of control volumes of upper confined layer";
  output SI.Volume V_Cu[sum(R_GS_H),sum(H_GS_VC)]
                                                 "volume of control volumes of upper confined layer";
  output SI.Area A_s_Cd[sum(R_GS_H),sum(H_GS_VC)]
                                                 "outer surface area of control volumes of lower confined layer";
  output SI.Volume V_Cd[sum(R_GS_H),sum(H_GS_VC)]
                                                 "volume of control volumes of lower confined layer";


protected
  SI.Length vector_dz_A[:] "Vector with heights of all control volumes in z-direction in the aquifer";
  SI.Length vector_dr[:] "Vector with radial length of all control volumes in radial direction in the aquifer and adjacent layers";
  SI.Length vector_dz_Cd[:] "Vector with heights of all control volumes in z-direction in the aquitard underneath the aquifer";
  SI.Length vector_dz_Cu[:] "Vector with heights of all control volumes in z-direction in the upper aquitard";

algorithm

  for i in 1:size(R_GS_H,1) loop
    if i == 1 then
      vector_dr:=fill(dx_GS[i], R_GS_H[i]);
    else
      vector_dr:=cat(1,vector_dr, fill(dx_GS[i], R_GS_H[i]));
    end if;
  end for;

  for i in 1:size(H_GS_VA,1) loop
    if i == 1 then
      vector_dz_A:=fill(dz_GS_A[i], H_GS_VA[i]);
    else
      vector_dz_A:=cat(1, vector_dz_A, fill(dz_GS_A[i], H_GS_VA[i]));
    end if;
  end for;

  for i in 1:size(H_GS_VC,1) loop
    if i == 1 then
      vector_dz_Cu:=fill(dz_GS_C[i], H_GS_VC[i]);
    else
      vector_dz_Cu:=cat(1, vector_dz_Cu, fill(dz_GS_C[i], H_GS_VC[i]));
    end if;
  end for;

  vector_dz_Cd:=Vectors.reverse(vector_dz_Cu);

  // calc of radius to the outer edge of the control volumes
  r[1]:=r_0 + vector_dr[1];  //calc of radius to the outer edge of first control volume after borehole
  for i in 2:size(vector_dr,1) loop
    r[i]:=r[i - 1] + vector_dr[i];
  end for;

  // calc of radius to the center of the control volumes
  for i in 1:size(vector_dz_A,1) loop
    r_r[:,i]:=r - vector_dr/2;
  end for;

  //calc of radius to the center of the control volumes in aquitard
  for i in 1:size(vector_dz_Cu,1) loop
    r_r_c[:,i]:=r - vector_dr/2;
  end for;


   // calc of outer surface area of control volumes of aquifer
  for i in 1:size(vector_dz_A,1) loop
    A_s[:,i]:=2*pi*vector_dz_A[i] .* r;
  end for;

   // calc of outer surface area of control volumes of aquitard
  for i in 1:size(vector_dz_Cu,1) loop
    A_s_Cu[:,i]:=2*pi*vector_dz_Cu[i] .* r;
    A_s_Cd[:,i]:=2*pi*vector_dz_Cd[i] .* r;
  end for;

  //calc of cross-sectional area of all other control volumes for aquifer and aquitard
  A_q[1]:=pi*(r[1]^2 - r_0^2); //calc of cross-sectional area of first control volume after well system
  for i in 2:size(r,1) loop
    A_q[i]:=pi*(r[i]^2 - r[i - 1]^2);
  end for;


   //calc of size of control volumes
  for i in 1:size(vector_dz_A,1) loop
    V[:,i]:=A_q*vector_dz_A[i];
  end for;

  for i in 1:size(vector_dz_Cu,1) loop
    V_Cu[:,i]:=A_q*vector_dz_Cu[i];
    V_Cd[:,i]:=A_q*vector_dz_Cd[i];
  end for;

  for i in 1:sum(R_GS_H) loop
    for j in 1:sum(H_GS_VA) loop
      z_A[i,j]:=vector_dz_A[j];
    end for;
    for k in 1:sum(H_GS_VC) loop
      z_Cu[i,k]:=vector_dz_Cu[k];
      z_Cd[i,k]:=vector_dz_Cd[k];
    end for;
  end for;

  annotation(Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Pure function that transforms user-defined grid section specifications into the complete set of geometric arrays required by the ATES control volume models. Computes radii, heights, surface areas, cross-sectional areas, and volumes for both the aquifer and the overlying and underlying confining (aquitard) layers.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Assumes cylindrical geometry (radial symmetry).</p>
<p>- Confining layer grid is mirrored: upper layer uses the specified section heights, lower layer uses them in reverse order.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><b>Inputs:</b></p>
<p>R_GS_H[:] — number of control volumes in each radial grid section [-]</p>
<p>dx_GS[:] — radial thickness of control volumes per section [m]</p>
<p>r_0 — well screen radius [m]</p>
<p>H_GS_VA[:] — number of control volumes in each vertical aquifer section [-]</p>
<p>dz_GS_A[:] — height of aquifer control volumes per section [m]</p>
<p>H_GS_VC[:] — number of control volumes in each vertical aquitard section [-]</p>
<p>dz_GS_C[:] — height of aquitard control volumes per section [m]</p>
<p><b>Outputs:</b></p>
<p>r[N_r] — outer edge radius of radial control volumes [m]</p>
<p>r_r[N_r, N_z] — centre radius of aquifer control volumes [m]</p>
<p>r_r_c[N_r, N_z_c] — centre radius of aquitard control volumes [m]</p>
<p>z_A[N_r, N_z] — height of aquifer control volumes [m]</p>
<p>z_Cu[N_r, N_z_c] — height of upper aquitard control volumes [m]</p>
<p>z_Cd[N_r, N_z_c] — height of lower aquitard control volumes [m]</p>
<p>A_s[N_r, N_z] — outer lateral surface area of aquifer control volumes [m&sup2;]</p>
<p>A_q[N_r] — cross-sectional (annular) area of control volumes [m&sup2;]</p>
<p>V[N_r, N_z] — volume of aquifer control volumes [m&sup3;]</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-r.png\" alt=\"r\"/></td>
  <td valign=\"middle\"><code>r</code></td>
  <td valign=\"middle\">outer edge radius of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-z.png\" alt=\"z\"/></td>
  <td valign=\"middle\"><code>z_A</code></td>
  <td valign=\"middle\">height of aquifer control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-dh-symbol-As.png\" alt=\"A_s\"/></td>
  <td valign=\"middle\"><code>A_s</code></td>
  <td valign=\"middle\">outer lateral surface area [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Aq.png\" alt=\"A_q\"/></td>
  <td valign=\"middle\"><code>A_q</code></td>
  <td valign=\"middle\">cross-sectional annular area [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-V.png\" alt=\"V\"/></td>
  <td valign=\"middle\"><code>V</code></td>
  <td valign=\"middle\">control volume [m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nr.png\" alt=\"N_r\"/></td>
  <td valign=\"middle\"><code>N_r = sum(R_GS_H)</code></td>
  <td valign=\"middle\">total number of radial control volumes [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nz.png\" alt=\"N_z\"/></td>
  <td valign=\"middle\"><code>N_z = sum(H_GS_VA)</code></td>
  <td valign=\"middle\">total number of vertical aquifer control volumes [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-r0.png\" alt=\"r_0\"/></td>
  <td valign=\"middle\"><code>r_0</code></td>
  <td valign=\"middle\">well screen radius [m]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Called once during initialization via the Geometry model. Not intended for direct instantiation in simulation models.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Check.TestDiscretization&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"));
end Discretization;
