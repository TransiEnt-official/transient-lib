within TransiEnt.Storage.Heat.ATES_L4.Base;
model ATES_confinedLayer
  import Modelica.Units.SI;
  import Modelica.Constants.g_n;

  //parameters
  final parameter Integer N_r=geo.N_r;
  final parameter Integer N_z=geo.N_z;
  final parameter Integer N_z_c = geo.N_z_c;
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid water=simCenter.fluid1 "Heat carrier";
  parameter SI.Pressure p_Boundary=Parameters.p_initial "Pressure of the fluid boundary in bar";
  parameter SI.Temperature T_Boundary=Parameters.T_initial "Temperature of the temperatur boundaries in degree celsius";
  final parameter SI.Length r_new[N_r,N_z_c]={{geo.r[j] for i in 1:N_z_c} for j in 1:N_r}; //transform radius vector to matrix for better initialization STONE
  final parameter SI.Length r_newA[N_r,N_z]={{geo.r[j] for i in 1:N_z} for j in 1:N_r}; //transform radius vector to matrix for better initialization AQUIFER
  final parameter SI.Area A_q_new[N_r,N_z_c]={{geo.A_q[j] for i in 1:N_z_c} for j in 1:N_r}; //transform Area vector to matrix for better initialization STONE
  final parameter  SI.Area A_q_newA[N_r,N_z]={{geo.A_q[j] for i in 1:N_z} for j in 1:N_r}; //transform Area vector to matrix for better initialization AQUIFER
  final parameter Boolean with_buoyancy = setting.buoyancy "logical variable for switching buoyancy physics on (true) or off (false)";
  final parameter Real f_buoyancy = if with_buoyancy then 1 else 0 "factor for switching buoyancy physics on (1) or off (0)";
  parameter SI.Length H_cell[N_z] = {geo.z_A[1,j] for j in 1:N_z};


protected
  final parameter SI.Length z_diff[N_z+1] = cat(1, {0.5*geo.z_A[1,1]}, {0.5*(geo.z_A[1,j]+geo.z_A[1,j+1]) for j in 1:N_z-1}, {0.5*geo.z_A[1,N_z]}) "Shifted vector z_A of grid sections in z-direction to the central of each CV";

public
  AquiferL4                                       aquiferspeicher(
    Parameters(
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
      dispersion = setting.dispersion),
    r=r_newA,
    r_r=geo.r_r,
    z=geo.z_A,
    A=A_q_newA,
    N_r=N_r,
    N_z=N_z) annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature_west[N_z](each T=T_Boundary) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,20})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi_west[N_z](
    each variable_p=true,                                                              each p_const(displayUnit="bar") = Parameters.p_initial,  each T_const(displayUnit="degC")=T_Boundary) annotation (Placement(transformation(extent={{60,-30},{40,-10}})));
  Base.Geometry  geo(
    C_w=Parameters.C_w,
    C=Parameters.C,
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
      dispersion = setting.dispersion)) annotation (Placement(transformation(extent={{-96,-90},{-76,-70}})));
  inner ClaRa.SimCenter simCenter annotation (Placement(transformation(extent={{60,80},{100,100}})));

  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow_Down[N_r](each m_flow_const=0, each T_const=T_Boundary) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={86,-58})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow_Up[N_r](each m_flow_const=0, each T_const=T_Boundary) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={86,54})));

  Modelica.Blocks.Sources.Constant hydraulicPressureGradient[N_z](k={(p_Boundary - Parameters.rho_l*g_n*sum(z_diff[1:j])*f_buoyancy) for j in 1:N_z})    annotation (Placement(transformation(extent={{94,-28},{74,-8}})));
  ImpermeableLayer stoneUp[N_r,N_z_c](
    each final Parameters(
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
    r=r_new,
    r_d=geo.r_r_c,
    z_c=geo.z_Cu,
    A_q=A_q_new) annotation (Placement(transformation(extent={{-10,36},{10,58}})));
  ImpermeableLayer stoneDown[N_r,N_z_c](
    each final Parameters(
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
    r=r_new,
    r_d=geo.r_r_c,
    z_c=geo.z_Cd,
    A_q=A_q_new) annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow
                           fixedHeatFlow_east_upper[N_z_c](each Q_flow=0) annotation (Placement(transformation(extent={{-40,38},{-20,58}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow
                           fixedHeatFlow_east_lower[N_z_c](each Q_flow=0) annotation (Placement(transformation(extent={{-40,-58},{-20,-38}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature_west_upper[N_z_c](each T=T_Boundary) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,54})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature_west_lower[N_z_c](each T=T_Boundary) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-54})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature_lower[N_r](each T=T_Boundary) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-86})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature_upper[N_r](each T=T_Boundary) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,74})));
  Base.Records.Subsurface_Basic  Parameters annotation (Placement(transformation(extent={{-70,-90},{-50,-70}})));
  Well_L4 well(
  N_z = N_z,
  p_initial = Parameters.p_initial,
  T_initial = Parameters.T_initial,
  r_0 = setting.r_0,
  H_cell = H_cell,
  No_inactive_well_volumes = 0) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn fluidPortIn(Medium=water) annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Base.Records.Setting setting annotation (Placement(transformation(extent={{-44,-92},{-24,-72}})));
equation


  //-------------------------------------------------------------
  // Connection
  //-------------------------------------------------------------

  for i in 1:N_r loop
    connect(boundaryVLE_Txim_flow_Up[i].steam_a, aquiferspeicher.fluidPortUp[i]) annotation (Line(
        points={{86,44},{86,34},{2,34},{2,12}},
        color={0,131,169},
        pattern=LinePattern.Solid,
        thickness=0.5));
    connect(boundaryVLE_Txim_flow_Down[i].steam_a, aquiferspeicher.fluidPortDown[i]) annotation (Line(
        points={{86,-48},{86,-36},{2,-36},{2,-8}},
        color={0,131,169},
        pattern=LinePattern.Solid,
        thickness=0.5));
  end for;

  for j in 1:N_z loop
    connect(aquiferspeicher.port_west[j], fixedTemperature_west[j].port) annotation (Line(points={{10,4},{28,4},{28,20},{40,20}}, color={191,0,0}));
    connect(aquiferspeicher.fluidPortWest[j], boundaryVLE_pTxi_west[j].steam_a) annotation (Line(
        points={{10,0},{28,0},{28,-20},{40,-20}},
        color={175,0,0},
        thickness=0.5));
    connect(hydraulicPressureGradient[j].y, boundaryVLE_pTxi_west[j].p) annotation (Line(points={{73,-18},{68,-18},{68,-14},{60,-14}}, color={0,0,127}));
    connect(well.fluidPortOut_radial[j], aquiferspeicher.fluidPortEast[j]) annotation (Line(points={{-80,0},{-10.2,0}},color={175,0,0},thickness=0.5));
    connect(well.port_a[j], aquiferspeicher.port_east[j]) annotation (Line(points={{-80,-4},{-70,-4},{-70,4},{-10,4}}, color={191,0,0}));
  end for;

  //connect upper and lower Stone models to boundaries
  for j in 1:N_z_c loop
    connect(fixedHeatFlow_east_lower[j].port,stoneDown [1, j].port_east) annotation (Line(points={{-20,-48},{-20,-50},{-10,-50}},
                                                                                                                        color={191,0,0}));
    connect(fixedHeatFlow_east_upper[j].port,stoneUp [1, j].port_east) annotation (Line(points={{-20,48},{-20,47},{-10,47}},          color={191,0,0}));
    connect(fixedTemperature_west_upper[j].port,stoneUp [N_r, j].port_west) annotation (Line(points={{40,54},{26,54},{26,47},{10,47}}, color={191,0,0}));
    connect(fixedTemperature_west_lower[j].port,stoneDown [N_r, j].port_west) annotation (Line(points={{40,-54},{26,-54},{26,-50},{10,-50}}, color={191,0,0}));
  end for;
  for i in 1:N_r loop
    connect(stoneDown[i, N_z_c].port_up, aquiferspeicher.port_down[i]) annotation (Line(points={{0,-40},{0,-23},{-2,-23},{-2,-8}}, color={191,0,0}));
    connect(stoneUp[i, 1].port_down, aquiferspeicher.port_up[i]) annotation (Line(points={{0,36},{-2,36},{-2,12}}, color={191,0,0}));
    connect(fixedTemperature_lower[i].port,stoneDown [i, 1].port_down) annotation (Line(points={{0,-76},{0,-60}}, color={191,0,0}));
    connect(fixedTemperature_upper[i].port,stoneUp [i, N_z_c].port_up) annotation (Line(points={{0,64},{0,58}}, color={191,0,0}));
  end for;

  //connect upper and lower Stone models with themselves
  for j in 1:N_z_c-1 loop
    for i in 1:N_r loop
      connect(stoneUp[i, j].port_up,stoneUp [i, j + 1].port_down);
      connect(stoneDown[i, j].port_up,stoneDown [i, j + 1].port_down);
    end for;
  end for;
  for i in 1:N_r-1 loop
    for j in 1:N_z_c loop
      connect(stoneUp[i, j].port_west,stoneUp [i + 1, j].port_east);
      connect(stoneDown[i, j].port_west,stoneDown [i + 1, j].port_east);
    end for;
  end for;

  connect(fluidPortIn, well.fluidPortIn) annotation (Line(
      points={{0,100},{0,90},{-90,90},{-90,9.8}},
      color={175,0,0},
      thickness=0.5));

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Top-level assembly model of a confined high-temperature aquifer thermal energy storage (HT-ATES) system. Couples the aquifer (AquiferL4) with upper and lower impermeable confining layers (ImpermeableLayer arrays) and the injection/extraction well (Well_L4). Provides a single fluid inlet port for connection to the district heating network.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4: Full 2D (radial-vertical) discretization of aquifer and aquitards. Boundary conditions at the outer radial and top/bottom thermal boundaries are represented by fixed temperature sources. Hydrostatic pressure gradient is applied at the outer radial fluid boundary. Physics toggles (buoyancy, dispersion) are propagated from the Setting record.</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Outer radial boundary: fixed pressure (hydrostatic) and fixed temperature.</p>
<p>- Top and bottom thermal boundaries of the aquitard: fixed temperature.</p>
<p>- No capillary effects or multi-phase flow.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><img src=\"modelica://ATES/../Resources/Images/ATES_confinedLayer_interfaces.svg\"
     alt=\"Interface diagram: fluidPortIn (fluid inlet, top)\"/></p>
<p>fluidPortIn: fluid inlet/outlet connection to external network (Fluid, bidirectional via well)</p>

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
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-mdot.png\" alt=\"\\dot{m}\"/></td>
  <td valign=\"middle\"><code>fluidPortIn.m_flow</code></td>
  <td valign=\"middle\">injection/extraction mass flow rate [kg/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-T.png\" alt=\"T\"/></td>
  <td valign=\"middle\"><code>T_Boundary</code></td>
  <td valign=\"middle\">far-field boundary temperature [K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-p.png\" alt=\"p\"/></td>
  <td valign=\"middle\"><code>p_Boundary</code></td>
  <td valign=\"middle\">reference pressure at aquifer top [Pa]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations — assembly model; governing equations are implemented in sub-models AquiferL4, ImpermeableLayer, Well_L4)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Pass site-specific material properties via the Parameters record (e.g., Molz1983) and grid specification via the Setting record. An inner ClaRa.SimCenter must be present in the enclosing model.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"),
  Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={127,0,0},
          fillColor={74,0,0},
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
end ATES_confinedLayer;
