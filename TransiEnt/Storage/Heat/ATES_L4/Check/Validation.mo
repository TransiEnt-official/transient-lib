within TransiEnt.Storage.Heat.ATES_L4.Check;
model Validation  "Validation of buoyancy flow with a homogenous layer according Molz 1983 and Buscheck 1983"

  extends TransiEnt.Basics.Icons.Checkmodel;

  import Modelica.Units.SI;

  //parameters
  final parameter Integer N_r=geo.N_r;
  final parameter Integer N_z=geo.N_z;
  final parameter Integer N_z_c = geo.N_z_c;

  //variables
  SI.EnthalpyFlowRate H_flow_in;
  SI.EnthalpyFlowRate H_flow_out;
  //Real HRF "Heat Recovery Factor";

  Base.ATES_confinedLayer                           aquiferspeicher(
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
      r_0=setting.r_0,
      NoGS_H=setting.NoGS_H,
      R_GS_H=setting.R_GS_H,
      dx_GS=setting.dx_GS,
      NoGS_VA=setting.NoGS_VA,
      H_GS_VA=setting.H_GS_VA,
      dz_GS_A=setting.dz_GS_A,
      NoGS_VC=setting.NoGS_VC,
      H_GS_VC=setting.H_GS_VC,
      dz_GS_C=setting.dz_GS_C,
      buoyancy = setting.buoyancy,
      dispersion = setting.dispersion)) annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow(each variable_m_flow=true, each variable_T=true) annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    each table=[0,8.68246,333.15; 1727775,8.68246,333.15; 1728275,12.435,331.15; 2332750,12.435,331.15; 2332850,7.1688,325.15; 2678350,7.1688,325.15; 2678450,0,325.15; 5443199,0,325.15; 5443200,-19.356,325.15; 5615950,-19.356,325.15; 5616050,-12.11,325.15; 7430399,-12.11,325.15; 7430400,0,325.15; 9676750,0,325.15; 9676850,10.7,358.15; 10367950,10.7,358.15; 10368050,0,358.15; 12441550,0,358.15; 12441650,6.7427,355.15; 13046350,6.7427,355.15; 13046450,0,355.15; 13391950,0,355.15; 13392050,6.13251,353.15; 20735950,6.13251,353.15; 20736050,0,353.15; 23673599,0,353.15; 23673600,-12.4539,353.15; 24883199,-12.4539,353.15; 24883200,0,353.15; 25055999,0,353.15; 25056000,-12.4539,353.15; 28425600,-12.4539,363.15],
    each smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    each extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
  Base.Geometry     geo(
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
      dx_min=setting.dx_min,
      N_z=setting.N_z,
      N_z_c=setting.N_z_c,
      optimized_grid=setting.optimized_grid)) annotation (Placement(transformation(extent={{-86,-86},{-66,-66}})));
  Base.Records.Molz1983                 Parameters annotation (Placement(transformation(extent={{62,-90},{82,-70}})));

  inner ClaRa.SimCenter simCenter annotation (Placement(transformation(extent={{60,80},{100,100}})));
  Base.Records.Setting setting(
    optimized_grid=true,
    V_inj=66757.36,
    NoGS_H=2,
    R_GS_H={30,1},
    dx_GS={2,10},
    NoGS_VA=3,
    H_GS_VA={1,10,1},
    dz_GS_A={0.5,2,0.5},
    NoGS_VC=2,
    H_GS_VC={6,1},
    dz_GS_C={1,3},
    dispersion=false) annotation (Placement(transformation(extent={{30,-92},{50,-72}})));
equation

  if aquiferspeicher.well.fluidPortIn.m_flow > 0 then
    H_flow_in = aquiferspeicher.well.fluidPortIn.m_flow*inStream(aquiferspeicher.well.fluidPortIn.h_outflow);
    H_flow_out = 0;
  else
    H_flow_in = 0;
    H_flow_out = aquiferspeicher.well.fluidPortIn.m_flow*noEvent(actualStream(aquiferspeicher.fluidPortIn.h_outflow));
  end if;


  connect(combiTimeTable.y[1], boundaryVLE_Txim_flow.m_flow) annotation (Line(points={{-47,0},{-40,0},{-40,6},{-30,6}}, color={0,0,127}));
  connect(combiTimeTable.y[2], boundaryVLE_Txim_flow.T) annotation (Line(points={{-47,0},{-30,0}}, color={0,0,127}));
  connect(boundaryVLE_Txim_flow.steam_a, aquiferspeicher.fluidPortIn) annotation (Line(
      points={{-8,0},{50,0},{50,-20}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));


  annotation (
    experiment(StopTime=9676780, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Validation model that reproduces the well doublet field experiment of Molz et al. (1983). A single-well ATES_confinedLayer model is driven by the measured injection and extraction schedule from the Auburn University experiment. Results are compared against published temperature distributions to validate the buoyancy flow implementation. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4: Full 2D (radial-vertical) simulation with buoyancy. Molz1983 parameter record provides site-specific fluid and solid properties. The injection/extraction schedule is prescribed via a CombiTimeTable covering injection cycle and recovery period. </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Simulation period: 9,676,780 s (approx. 112 days).</p>
<p>- Grid: 31 radial &times; 12 vertical aquifer cells; 2 aquitard sections above and below.</p>
<p>- Dispersion is switched off (<code>dispersion = false</code>). </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no elements &mdash; standalone check model) </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\"><tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-mdot.png\" alt=\"\\dot{m}\"/></p></td>
<td valign=\"middle\"><pre>combiTimeTable.y[1]</pre></td>
<td valign=\"middle\"><p>prescribed mass flow rate [kg/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-T.png\" alt=\"T\"/></p></td>
<td valign=\"middle\"><pre>combiTimeTable.y[2]</pre></td>
<td valign=\"middle\"><p>prescribed injection temperature [K]</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations &mdash; validation check model) </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Simulate with Dassl solver, StopTime = 9,676,780 s. Compare well temperature profile at production with Fig. 5 in Buscheck et al. (1983). An inner ClaRa.SimCenter must be present. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>This model is the validation. It is validated against the field measurements reported in Molz et al. (1983), specifically the well doublet experiment at increased temperatures. </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Molz, F. J., Melville, J. G., Parr, A. D., King, D. A., &amp; Hopf, M. T. (1983): Aquifer thermal energy storage: a well doublet experiment at increased temperatures. Water Resources Research, 19(1), 149&ndash;160. </p>
<p>Buscheck, T. A., Doughty, C., &amp; Tsang, C. F. (1983). Prediction and analysis of a field experiment on a multilayered aquifer thermal energy storage system with strong buoyancy flow. <i>Water Resources Research</i>, <i>19</i>(5), 1307-1315.</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"),
    Diagram(graphics={Text(
          extent={{-96,92},{8,88}},
          textColor={28,108,200},
          textString="Check aquiferspeicher.well.T[end]")}));
end Validation;
