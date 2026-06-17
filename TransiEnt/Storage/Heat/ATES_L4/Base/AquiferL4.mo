within TransiEnt.Storage.Heat.ATES_L4.Base;
model AquiferL4 "matrix of control volumes and thermal resistors"

 //import and hierachy
 import Modelica.Units.SI;
 import Modelica.Constants.pi;

  //parameters
  parameter Integer N_r;
  parameter Integer N_z;
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid water=simCenter.fluid1 "Heat carrier";
  //parameter SI.Pressure p_start[N_z] "Start value for pressure";
  parameter SI.Temperature T_start=Parameters.T_initial "Start value for temperature";
  parameter SI.Length r[N_r, N_z] "Radius of outer edge of control volume";
  parameter SI.Length r_r[N_r,N_z] "Radius of center of control volume";
  parameter SI.Length z[N_r,N_z] "height of control volume";
  parameter SI.Area A[N_r,N_z];
  parameter Boolean dispersion = setting.dispersion "whether dispersion is considered or not";


  Base.ControlVolumesL4.ControlVolumesL4_2D.ControlVolumeL4    controlVolumeL4(Parameters(
      rho_l=Parameters.rho_l,
      rho_s=Parameters.rho_s,
      rho_sc=Parameters.rho_sc,
      k_v=Parameters.k_v,
      k=Parameters.k,
      eta=Parameters.eta,
      Cp_l=Parameters.Cp_l,
      Cp_s=Parameters.Cp_s,
      Cp_sc=Parameters.Cp_sc,
      lambda_s=Parameters.lambda_s,
      lambda_l=Parameters.lambda_l,
      lambda_sc=Parameters.lambda_sc,
      n=Parameters.n,
      n_c=Parameters.n_c,
      C_a=Parameters.C_a,
      C_w=Parameters.C_w,
      p_initial=Parameters.p_initial,
      T_initial=Parameters.T_initial,
      d_h = Parameters.d_h,
      d_v = Parameters.d_v),
      setting(
      NoGS_H=setting.NoGS_H,
      R_GS_H=setting.R_GS_H,
      dx_GS=setting.dx_GS,
      NoGS_VA=setting.NoGS_VA,
      H_GS_VA=setting.H_GS_VA,
      dz_GS_A=setting.dz_GS_A,
      NoGS_VC=setting.NoGS_VC,
      H_GS_VC=setting.H_GS_VC,
      dz_GS_C=setting.dz_GS_C,
      r_0=setting.r_0,
      H_a=setting.H_a,
      H_c=setting.H_c,
      V_inj=setting.V_inj,
      domain_factor=setting.domain_factor,
      N_r=setting.N_r,
      N_z=setting.N_z,
      N_z_c=setting.N_z_c,
      optimized_grid=setting.optimized_grid,
      buoyancy = setting.buoyancy,
      dispersion = setting.dispersion)) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Interfaces.FluidPortOut fluidPortWest[N_z](each Medium = water) annotation (Placement(transformation(extent={{90,-30},{110,-10}})));
  Interfaces.FluidPortOut fluidPortUp[N_r](each Medium=water) annotation (Placement(transformation(extent={{10,90},{30,110}})));
  Interfaces.FluidPortIn fluidPortEast[N_z](each Medium = water) annotation (Placement(transformation(extent={{-112,-30},{-92,-10}})));
  Interfaces.FluidPortIn fluidPortDown[N_r](each Medium=water) annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
  Interfaces.HeatPort_b port_down[N_r] annotation (Placement(transformation(extent={{-30,-110},{-10,-90}})));
  Interfaces.HeatPort_b port_west[N_z] annotation (Placement(transformation(extent={{90,10},{110,30}})));
  Interfaces.HeatPort_a port_east[N_z] annotation (Placement(transformation(extent={{-110,10},{-90,30}})));
  Interfaces.HeatPort_a port_up[N_r] annotation (Placement(transformation(extent={{-30,90},{-10,110}})));
  Base.ThermalResistors.Dispersion.ThermalResistorRadial_withDispersion
                                              thermalResistorRadial_withDispersion
                                                                        [N_r,N_z](
    each lambda=Parameters.lambda_a,r=r,r_r=r_r,z=z, each dispersion = dispersion, each disp_length = Parameters.d_h, each n = Parameters.n, each C_f = Parameters.C_w, each C_s = Parameters.C_a) annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
  Base.ThermalResistors.Dispersion.ThermalResistorRadial_withDispersion
                                              thermalResistorRadial_withDispersion1
                                                                        [N_r,N_z](
    each lambda=Parameters.lambda_a,r=r,r_r=r_r,z=z, each dispersion = dispersion,  each disp_length = Parameters.d_h, each n = Parameters.n, each C_f = Parameters.C_w, each C_s = Parameters.C_a) annotation (Placement(transformation(extent={{50,10},{70,30}})));
  Base.ThermalResistors.Dispersion.ThermalResistorVertical_withDispersion
                                                thermalResistorVertical_withDispersion
                                                                            [N_r,N_z](
    each lambda=Parameters.lambda_a, A=A, z=z, each dispersion = dispersion,  each disp_length = Parameters.d_v, each n = Parameters.n, each C_f = Parameters.C_w, each C_s = Parameters.C_a) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-60})));
  Base.ThermalResistors.Dispersion.ThermalResistorVertical_withDispersion
                                                thermalResistorVertical_withDispersion1
                                                                          [N_r,N_z](
    each lambda=Parameters.lambda_a, A=A, z=z, each dispersion = dispersion,  each disp_length = Parameters.d_v, each n = Parameters.n, each C_f = Parameters.C_w, each C_s = Parameters.C_a) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,60})));
  inner ClaRa.SimCenter simCenter annotation (Placement(transformation(extent={{60,80},{100,100}})));
  Base.Records.Subsurface_Basic Parameters                     annotation (Placement(transformation(extent={{66,-88},{86,-68}})));
  Base.Records.Setting setting annotation (Placement(transformation(extent={{34,80},{54,100}})));
equation

  //connect both radial resistors with their respective heat port
  for j in 1:N_z loop
    connect(port_east[j], thermalResistorRadial_withDispersion[1, j].port_a) annotation (Line(points={{-100,20},{-70,20}}, color={191,0,0}));
    connect(port_west[j], thermalResistorRadial_withDispersion1[N_r, j].port_b) annotation (Line(points={{100,20},{70,20}}, color={191,0,0}));
  end for;

  //connect both vertical resistors with their respective heat port
  for i in 1:N_r loop
    connect(port_up[i], thermalResistorVertical_withDispersion1[i, N_z].port_a) annotation (Line(points={{-20,100},{-20,70}}, color={191,0,0}));
    connect(port_down[i], thermalResistorVertical_withDispersion[i, 1].port_b) annotation (Line(points={{-20,-100},{-20,-70}}, color={191,0,0}));
  end for;

  for i in 2:N_r loop
    for j in 1:N_z loop
      connect(thermalResistorRadial_withDispersion[i, j].port_a, thermalResistorRadial_withDispersion1[i - 1, j].port_b);
    end for;
  end for;

  for i in 1:N_r loop
    for j in 2:N_z loop
      connect(thermalResistorVertical_withDispersion[i, j].port_b, thermalResistorVertical_withDispersion1[i, j - 1].port_a);
    end for;
  end for;

  //connect resistors with control volume
  for i in 1:N_r loop
    for j in 1:N_z loop
      connect(thermalResistorRadial_withDispersion[i, j].port_b, controlVolumeL4.port[i, j]) annotation (Line(points={{-50,20},{-30,20},{-30,10},{-9.8,10}}, color={191,0,0}));
      connect(thermalResistorVertical_withDispersion1[i, j].port_b, controlVolumeL4.port[i, j]) annotation (Line(points={{-20,50},{-16,50},{-16,10},{-9.8,10}}, color={191,0,0}));
      connect(thermalResistorRadial_withDispersion1[i, j].port_a, controlVolumeL4.port[i, j]) annotation (Line(points={{50,20},{20,20},{20,10},{-9.8,10}}, color={191,0,0}));
      connect(thermalResistorVertical_withDispersion[i, j].port_a, controlVolumeL4.port[i, j]) annotation (Line(points={{-20,-50},{-16,-50},{-16,10},{-9.8,10}}, color={191,0,0}));
    end for;
  end for;

  //connect fluid ports with control volume
  for j in 1:N_z loop
    connect(fluidPortEast[j], controlVolumeL4.fluidPortEast[j]) annotation (Line(points={{-102,-20},{-60,-20},{-60,0},{-10,0}},color={175,0,0},thickness=0.5));
    connect(controlVolumeL4.fluidPortWest[j], fluidPortWest[j]) annotation (Line(points={{10.2,0},{60,0},{60,-20},{100,-20}},color={175,0,0},thickness=0.5));
  end for;

  for i in 1:N_r loop
    connect(fluidPortUp[i], controlVolumeL4.fluidPortUp[i]) annotation (Line(points={{20,100},{20,40},{0,40},{0,10}},color={175,0,0},thickness=0.5));
    connect(fluidPortDown[i], controlVolumeL4.fluidPortDown[i]) annotation (Line(
        points={{20,-100},{20,-40},{0,-40},{0,-9.8}},
        color={175,0,0},
        thickness=0.5));
  end for;

  //connecting Darcy velocity for calculation of new thermal conductivity

    for i in 1:N_r loop
      for j in 1:N_z loop
        connect(controlVolumeL4.q_trans[i, j], thermalResistorVertical_withDispersion[i, j].q_v) annotation (Line(points={{-10.6,8},{-12,8},{-12,-49.4},{-14,-49.4}}, color={0,0,127}));
        connect(controlVolumeL4.q_trans[i, j + 1], thermalResistorVertical_withDispersion1[i, j].q_v) annotation (Line(points={{-10.6,8},{-12,8},{-12,70.6},{-14,70.6}}, color={0,0,127}));
        connect(controlVolumeL4.q_long[i, j], thermalResistorRadial_withDispersion[i, j].q_r) annotation (Line(points={{-10.6,5.8},{-41.3,5.8},{-41.3,25.8},{-70.6,25.8}}, color={0,0,127}));
        connect(controlVolumeL4.q_long[i, j], thermalResistorRadial_withDispersion1[i, j].q_r) annotation (Line(points={{-10.6,5.8},{-12.3,5.8},{-12.3,25.8},{49.4,25.8}}, color={0,0,127}));
      end for;
    end for;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Assembly model of the full 2D aquifer discretization. Connects the [N_r &times; N_z] array of ControlVolumeL4 cells to the surrounding thermal resistor networks (radial and vertical, with optional dispersion). Exposes fluid and heat ports at all four boundaries of the cylindrical aquifer domain.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4: Fully discretized 2D (radial-vertical) aquifer model. Each cell is connected to its radial and vertical neighbours via thermal resistors. Fluid enters and exits through boundary port arrays. Physics toggles (buoyancy, dispersion) are propagated from the Setting record.</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- No confinement layer; couple with ImpermeableLayer arrays via ATES_confinedLayer for a full ATES model.</p>
<p>- Outer radial boundary requires pressure and temperature boundary conditions from the enclosing model.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><img src=\"modelica://ATES/../Resources/Images/AquiferL4_interfaces.svg\"
     alt=\"Interface diagram: fluidPortEast/West/Up/Down (blue) and port_east/west/up/down (red)\"/></p>
<p>fluidPortEast[N_z]: fluid inlet at inner radial boundary (Fluid, inlet)</p>
<p>fluidPortWest[N_z]: fluid outlet at outer radial boundary (Fluid, outlet)</p>
<p>fluidPortUp[N_r]: fluid outlet at top boundary (Fluid, outlet)</p>
<p>fluidPortDown[N_r]: fluid inlet at bottom boundary (Fluid, inlet)</p>
<p>port_east[N_z]: heat port at inner radial boundary (Heat, inlet)</p>
<p>port_west[N_z]: heat port at outer radial boundary (Heat, outlet)</p>
<p>port_up[N_r]: heat port at top boundary (Heat, outlet)</p>
<p>port_down[N_r]: heat port at bottom boundary (Heat, inlet)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nr.png\" alt=\"N_r\"/></td>
  <td valign=\"middle\"><code>N_r</code></td>
  <td valign=\"middle\">number of radial control volumes [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Nz.png\" alt=\"N_z\"/></td>
  <td valign=\"middle\"><code>N_z</code></td>
  <td valign=\"middle\">number of vertical aquifer control volumes [-]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-T.png\" alt=\"T\"/></td>
  <td valign=\"middle\"><code>T_start</code></td>
  <td valign=\"middle\">initial temperature [K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-mdot.png\" alt=\"\\dot{m}\"/></td>
  <td valign=\"middle\"><code>fluidPortEast[j].m_flow</code></td>
  <td valign=\"middle\">inlet mass flow rate [kg/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Qdot.png\" alt=\"\\dot{Q}\"/></td>
  <td valign=\"middle\"><code>port_east[j].Q_flow</code></td>
  <td valign=\"middle\">boundary heat flow rate [W]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations — assembly model; governing equations are implemented in ControlVolumeL4, ThermalResistorRadial_withDispersion, and ThermalResistorVertical_withDispersion)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Geometry arrays r, r_r, z, A must be provided from an external Geometry instance. Parameters and Setting records are passed by modification.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested via &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"),
  Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={127,0,0},
          fillColor={74,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-36,2},{36,-20}},
          lineColor={162,29,33},
          fillColor={162,29,33},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-80,10},{80,-32}},
          lineColor={28,108,200},
          fillColor={74,0,0},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Ellipse(
          extent={{-36,2},{36,-20}},
          lineColor={162,29,33},
          fillColor={162,29,33},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-3,90},{3,-6}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end AquiferL4;
