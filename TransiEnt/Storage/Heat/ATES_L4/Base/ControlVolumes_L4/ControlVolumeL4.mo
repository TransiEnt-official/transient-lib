within TransiEnt.Storage.Heat.ATES_L4.Base.ControlVolumes_L4;
model ControlVolumeL4 "Control volume of an aquifer with 2D mass flow"

  //import and hierachy
 import Modelica.Units.SI;
 import Modelica.Constants.pi;
 import Modelica.Constants.eps;
 import Modelica.Constants.g_n;
 extends TransiEnt.Basics.Icons.Fluid_Volume;

 //parameters
 parameter SI.Temperature T_start=Parameters.T_initial "Start value for temperature";
protected
 final parameter Real n=Parameters.n;
 final parameter Real Cp_s=Parameters.Cp_s;
 final parameter Real rho_s=Parameters.rho_s;
 final parameter Integer N_r=geo.N_r;
 final parameter Integer N_z=geo.N_z;
 final parameter TILMedia.VLEFluidTypes.BaseVLEFluid water=simCenter.fluid1 "Heat carrier";
 final parameter Boolean with_buoyancy = setting.buoyancy "logical variable for switching buoyancy physics on (true) or off (false)";
 final parameter Real f_buoyancy = if with_buoyancy then 1 else 0 "factor for switching buoyancy physics on (1) or off (0)";

 //variables
public
 SI.Mass m[N_r,N_z](each start = 10);
 SI.SpecificEnthalpy h[N_r,N_z](each start=217940); //start value water 100bar and 50Â°C
 SI.Temperature T[N_r,N_z](each start=T_start, each fixed = true);
 SI.Pressure p[N_r,N_z](each fixed = false);
 Real drhodt[N_r,N_z](each start = 0);
 Real der_T[N_r,N_z](each start = 0);
 SI.Energy U[N_r,N_z](each start=207856, each fixed = false); //start value water 100 bar and 50Â°C
 SI.SpecificHeatCapacity c_w[N_r,N_z](each start = Parameters.Cp_l);

 //flow model
 SI.EnthalpyFlowRate H_flow[N_r+1,N_z](each start = 217940);
 SI.MassFlowRate m_flow[N_r+1,N_z](each start = 1);
 SI.MassFlowRate m_flow_buoyancy[N_r,N_z+1](each start = 0.1) "mass flow induced by temperature driven density differences";
 SI.EnthalpyFlowRate H_flow_buoyancy[N_r,N_z+1](each start = 21794);

 inner SI.Density rho_FM[N_r+1,N_z](each start = Parameters.rho_l);
 inner SI.Density rho_FM_v[N_r,N_z+1](each start = Parameters.rho_l) "Mean Density at cross surface area of control volumes";
 inner SI.DynamicViscosity f_eta[N_r+2,N_z](each start = Parameters.eta) "temperature and density dependent dynamic viscosity";
 inner SI.PressureDifference delta_p_darcy[N_r+1,N_z](each start=1000);
 inner SI.PressureDifference delta_p_v[N_r,N_z+1](each start = 0)
                                                 "pressure difference between two control volumes in vertical neighbourhood";
 inner SI.DynamicViscosity f_eta_v[N_r,N_z+2](each start = Parameters.eta);



 //instances of other classes
 //Fluid Models
  TILMedia.VLEFluid_ph    fluidEast[N_z](
    p=fluidPortEast.p,
    h=noEvent(actualStream(fluidPortEast.h_outflow)),
    each vleFluidType=water) annotation (Placement(transformation(extent={{-90,-12},{-70,8}})));
  TILMedia.VLEFluid_ph    fluidWest[N_z](
    p=fluidPortWest.p,
    h=noEvent({(if m_flow[N_r+1,j]<0+eps then inStream(fluidPortWest[j].h_outflow) else fluidPortWest[j].h_outflow) for j in 1:N_z}),
    each vleFluidType=water) annotation (Placement(transformation(extent={{72,-12},{92,8}})));
  TILMedia.VLEFluid_pT    bulk[N_r,N_z](
     p=p,
     T=T,
     each vleFluidType=water) annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
  TILMedia.VLEFluid_ph    fluidUp[N_r](
    p=fluidPortUp.p,
    h=noEvent({(if m_flow_buoyancy[j, N_z + 1] < 0 + eps then inStream(fluidPortUp[j].h_outflow) else fluidPortUp[j].h_outflow) for j in 1:N_r}),
    each vleFluidType=water) annotation (Placement(transformation(extent={{-12,68},{8,88}})));
  TILMedia.VLEFluid_ph    fluidDown[N_r](
    p=fluidPortDown.p,
    h=noEvent(actualStream(fluidPortDown.h_outflow)),
    each vleFluidType=water) annotation (Placement(transformation(extent={{-10,-88},{10,-68}})));

  //Interfaces
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn
                         fluidPortEast[N_z](each Medium=water)  annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut
                          fluidPortWest[N_z](each Medium=water)  annotation (Placement(transformation(extent={{92,-10},{112,10}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn
                         fluidPortDown[N_r](each Medium=water, each p(start=Parameters.p_initial)) annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut
                          fluidPortUp[N_r](each Medium=water, each p(start=Parameters.p_initial)) annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  inner ClaRa.SimCenter simCenter annotation (Placement(transformation(extent={{60,80},{100,100}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a
                        port[N_r,N_z] annotation (Placement(transformation(extent={{-108,90},{-88,110}})));

  PressureLoss.DarcyFlow_horizontal darcyFlow_horizontal(
    final k=Parameters.k,
    final eta=Parameters.eta,
    final rho_l = Parameters.rho_l,
    final N_r = N_r,
    final N_z = N_z,
    final A_s = geo.A_s,
    final z_A = geo.z_A,
    final r_r = geo.r_r,
    final r = geo.r,
    final r_0 = setting.r_0) annotation (Placement(transformation(extent={{50,-62},{70,-42}})));
  Records.Subsurface_Basic         Parameters annotation (Placement(transformation(extent={{20,-90},{40,-70}})));
  Geometry geo(
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
      optimized_grid=setting.optimized_grid)) annotation (Placement(transformation(extent={{50,-90},{70,-70}})));


  PressureLoss.DarcyFlow_vertical darcyFlow_vertical(
    final k=Parameters.k_v,
    final with_buoyancy = with_buoyancy,
    final N_r = N_r,
    final N_z = N_z,
    final A_q = geo.A_q,
    final z_A = geo.z_A,
    final rho_l = Parameters.rho_l,
    final n = Parameters.n)  annotation (Placement(transformation(extent={{18,-62},{38,-42}})));
  Modelica.Blocks.Interfaces.RealOutput
                        q_trans[N_r,N_z + 1] annotation (Placement(transformation(extent={{-96,70},{-116,90}})));
  Modelica.Blocks.Interfaces.RealOutput
                        q_long[N_r,N_z] annotation (Placement(transformation(extent={{-96,48},{-116,68}})));
  Records.Setting setting annotation (Placement(transformation(extent={{26,80},{46,100}})));
initial equation

  for i in 1:N_r loop
    p[i,1] = Parameters.p_initial - Parameters.rho_l*g_n*(geo.z_A[i,1]/2)*f_buoyancy;
  end for;
  for i in 1:N_r loop
    for j in 2:N_z loop
      p[i,j]=p[i,j-1] - Parameters.rho_l*g_n*(geo.z_A[i,j-1]/2 + geo.z_A[i,j]/2)*f_buoyancy;
    end for;
  end for;

equation
 //equation
 //Calculating the cell states
 for i in 1:N_r loop
  for j in 1:N_z loop
    der(T[i,j])=der_T[i,j];
    der(T[i,j])*geo.V[i,j]*(n*bulk[i,j].d*bulk[i,j].cp+(1-n)*rho_s*Cp_s)=H_flow[i,j]-H_flow[i+1,j]+H_flow_buoyancy[i,j]-H_flow_buoyancy[i,j+1]+port[i,j].Q_flow-h[i,j]*n*geo.V[i,j]*drhodt[i,j]+der(p[i,j])*geo.V[i,j]*n;
    m[i,j]=(n*bulk[i,j].d+(1-n)*rho_s)*geo.V[i,j];
    h[i,j]=bulk[i,j].h;
    der(U[i,j])=der(T[i,j])*geo.V[i,j]*(n*bulk[i,j].d*bulk[i,j].cp+(1-n)*rho_s*Cp_s)+h[i,j]*geo.V[i,j]*n*drhodt[i,j];
    drhodt[i,j]=(bulk[i,j].drhodh_pxi)*der(h[i,j])+(bulk[i,j].drhodp_hxi)*der(p[i, j]);
    drhodt[i,j]*n*geo.V[i,j]=m_flow[i,j]-m_flow[i+1,j]+m_flow_buoyancy[i,j]-m_flow_buoyancy[i,j+1];
    c_w[i,j]=bulk[i,j].cp;
  end for;
 end for;

 //Calculating the enthalpy flow rates
 for j in 1:N_z loop
  H_flow[1,j]=semiLinear(
      m_flow[1,j],
      fluidEast[j].h,
      h[1, j]);                                                      //like: if m_flow > 0 then fluidIn.h*m_flow else h*m_flow
 end for;
 for i in 2:N_r loop
  for j in 1:N_z loop
    H_flow[i,j]=semiLinear(m_flow[i,j],h[i-1,j],h[i,j]);
  end for;
 end for;
 for j in 1:N_z loop
   H_flow[N_r+1,j]=semiLinear(
      m_flow[N_r+1,j],
      h[N_r, j],
      fluidWest[j].h);
 end for;
 for i in 1:N_r loop
   H_flow_buoyancy[i,1]=semiLinear(
      m_flow_buoyancy[i,1],
      fluidDown[i].h,
      h[i, 1]);
 end for;
 for j in 2:N_z loop
   for i in 1:N_r loop
      H_flow_buoyancy[i,j]=semiLinear(m_flow_buoyancy[i,j],h[i,j-1],h[i,j]);
   end for;
 end for;
 for i in 1:N_r loop
   H_flow_buoyancy[i,N_z+1]=semiLinear(
      m_flow_buoyancy[i,N_z+1],
      h[i, N_z],
      fluidUp[i].h);
 end for;

 //Calculating the density for the flow model
 for j in  1:N_z loop
  rho_FM[1,j]=fluidEast[j].d;// + bulk[1, j].d)/2;
 end for;
 for i in 2:N_r loop
  for j in 1:N_z loop
    rho_FM[i,j]=(bulk[i-1,j].d+bulk[i,j].d)/2;
  end for;
 end for;
 for j in 1:N_z loop
 rho_FM[N_r+1,j]=fluidWest[j].d;//+bulk[N_r, j].d)/2;
 end for;
 for i in 1:N_r loop
   rho_FM_v[i,1] =fluidDown[i].d;  // + bulk[i,1].d)/2;
 end for;
 for i in 1:N_r loop
   for j in 2:N_z loop
     rho_FM_v[i,j] = (bulk[i,j-1].d + bulk[i,j].d)/2;
   end for;
 end for;
 for i in 1:N_r loop
   rho_FM_v[i,N_z+1] =fluidUp[i].d;
 end for;

  //Static momentum balance

  for j in 1:N_z loop
     0=p[N_r, j] - fluidPortWest[j].p - delta_p_darcy[N_r + 1, j];
  end for;
  for j in 1:N_z loop
    for i in 2:N_r loop
      0=p[i-1,j]-p[i,j]-delta_p_darcy[i,j];
    end for;
  end for;
  for j in 1:N_z loop
     0=fluidPortEast[j].p - p[1, j] - delta_p_darcy[1, j];
  end for;
  for i in 1:N_r loop
    0 =p[i, 1] - fluidPortDown[i].p + delta_p_v[i, 1];
  end for;
  for i in 1:N_r loop
    for j in 2:N_z loop
      0 = p[i,j-1] - p[i,j] - delta_p_v[i,j];
    end for;
  end for;
  for i in 1:N_r loop
    0 =p[i, N_z] - fluidPortUp[i].p - delta_p_v[i, N_z + 1];
  end for;

  for j in 1:N_z loop
    for i in 1:N_r+1 loop
      m_flow[i,j]=darcyFlow_horizontal.m_flow[i, j];
                                           //call Darcy equation from model DarcyFlow
    end for;
  end for;

  for i in 1:N_r loop
    for j in 1:N_z+1 loop
      m_flow_buoyancy[i,j]=darcyFlow_vertical.m_flow_buoyancy[i,j];
    end for;
  end for;


 //Dynamic Viscosity
 for j in 1:N_z loop
   f_eta[1,j]=TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(fluidEast[j].T, fluidEast[j].d);
 end for;
 for i in 2:N_r+1 loop
   for j in 1:N_z loop
     f_eta[i,j]=TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(T[i-1,j],bulk[i-1,j].d);
   end for;
 end for;
 for j in 1:N_z loop
   f_eta[N_r+2,j]=TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(T_start, fluidWest[j].d);
 end for;
 for i in 1:N_r loop
   f_eta_v[i,1]=TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(fluidDown[i].T, fluidDown[i].d);
 end for;
 for i in 1:N_r loop
   for j in 2:N_z+1 loop
     f_eta_v[i,j]=TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(T[i,j-1],bulk[i,j-1].d);
   end for;
 end for;
 for i in 1:N_r loop
   f_eta_v[i,N_z+2]=TransiEnt.Storage.Heat.ATES_L4.Base.Function.DynamicViscosityWater(fluidUp[i].T, fluidUp[i].d);
 end for;

 //HeatPort
 for i in 1:N_r loop
  for j in 1:N_z loop
    port[i,j].T=T[i,j];
  end for;
 end for;


 //FluidPorts
  for j in 1:N_z loop
    fluidPortEast[j].h_outflow = h[1, j];
    fluidPortWest[j].h_outflow = h[N_r, j];
    m_flow[N_r+1,j]=-fluidPortWest[j].m_flow; //negative?
    m_flow[1,j]=fluidPortEast[j].m_flow;
  end for;
  for i in 1:N_r loop
    fluidPortUp[i].h_outflow = h[i, N_z];
    fluidPortDown[i].h_outflow = h[i, 1];
    m_flow_buoyancy[i,1] =fluidPortDown[i].m_flow;
    m_flow_buoyancy[i,N_z+1] =-fluidPortUp[i].m_flow;
  end for;


    //Calculation of velocities of main radial mass flow at all surfaces for calculation of dispersion

    for i in 1:N_r loop
      for j in 1:N_z loop
      q_long[i, j] = darcyFlow_horizontal.v_darcy[i+1, j]*geo.r[i]/geo.r_r[i,1];//(log(geo.r[i])/log(geo.r_r[i,1])); //velocities at central of control volume (for longitudinal dispersion)
      end for;
    end for;

    // calculation of radial velocities at north and south surface of control volume for the calculation of transversal dispersion
    for i in 1:N_r loop
      for j in 2:N_z loop
        q_trans[i, j] = geo.z_A[i,j-1]/(geo.z_A[i,j-1]+geo.z_A[i,j])*q_long[i,j] + geo.z_A[i,j]/(geo.z_A[i,j-1]+geo.z_A[i,j])*q_long[i,j];
      end for;
      q_trans[i,1] = 0;
      q_trans[i,N_z+1] = 0;
    end for;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Discretized aquifer control volume model for 2D (radial-vertical) flow. Implements the coupled energy balance, mass continuity, and Darcy pressure equations for an [N_r &times; N_z] grid of aquifer cells. Includes optional buoyancy-driven vertical flow and temperature-dependent fluid properties (density, dynamic viscosity). </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4: Fully discretized control volume array. Each cell is ideally mixed (lumped). Physical effects considered:</p>
<ul>
<li>Radial and vertical mass transport (Darcy flow, buoyancy)</li>
<li>Enthalpy transport by mass flow</li>
<li>Heat conduction via thermal resistors (coupled through port[N_r, N_z])</li>
<li>Temperature-dependent dynamic viscosity and density </li>
</ul>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- No chemical reactions; single-component fluid.</p>
<p>- Density differences at radial cell interfaces are interpolated linearly between adjacent cells.</p>
<p>- Buoyancy switched on/off via Setting record boolean. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/ControlVolumeL4_interfaces.svg\" alt=\"Interface diagram: fluid ports on all four boundaries, internal heat port array, signal outputs q_long and q_trans\"/></p>
<p>fluidPortEast[N_z]: fluid inlet at inner radial boundary (Fluid, inlet)</p>
<p>fluidPortWest[N_z]: fluid outlet at outer radial boundary (Fluid, outlet)</p>
<p>fluidPortUp[N_r]: fluid outlet at top boundary (Fluid, outlet)</p>
<p>fluidPortDown[N_r]: fluid inlet at bottom boundary (Fluid, inlet)</p>
<p>port[N_r, N_z]: internal heat port array, one per cell &mdash; connected externally to the thermal resistor network (Heat)</p>
<p>q_long[N_r, N_z]: radial Darcy velocity output for dispersion calculation (Signal, outlet)</p>
<p>q_trans[N_r, N_z+1]: vertical Darcy velocity output for dispersion calculation (Signal, outlet) </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\"><tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-T.png\" alt=\"T_{i,j}\"/></p></td>
<td valign=\"middle\"><pre>T[N_r, N_z]</pre></td>
<td valign=\"middle\"><p>cell temperature [K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-p.png\" alt=\"p_{i,j}\"/></p></td>
<td valign=\"middle\"><pre>p[N_r, N_z]</pre></td>
<td valign=\"middle\"><p>cell pressure [Pa]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-U.png\" alt=\"U_{i,j}\"/></p></td>
<td valign=\"middle\"><pre>U[N_r, N_z]</pre></td>
<td valign=\"middle\"><p>internal energy of cell [J]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-Hdot.png\" alt=\"\\dot{H}_{i,j}\"/></p></td>
<td valign=\"middle\"><pre>H_flow[N_r+1, N_z]</pre></td>
<td valign=\"middle\"><p>enthalpy flow at radial interfaces [W]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-mdot.png\" alt=\"\\dot{m}_{i,j}\"/></p></td>
<td valign=\"middle\"><pre>m_flow[N_r+1, N_z]</pre></td>
<td valign=\"middle\"><p>radial mass flow rate at interfaces [kg/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-Qdot.png\" alt=\"\\dot{Q}_{i,j}\"/></p></td>
<td valign=\"middle\"><pre>port[i,j].Q_flow</pre></td>
<td valign=\"middle\"><p>heat flow from thermal resistors [W]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-qlong.png\" alt=\"q_\\mathrm{long}\"/></p></td>
<td valign=\"middle\"><pre>q_long[N_r, N_z]</pre></td>
<td valign=\"middle\"><p>radial Darcy velocity at cell centre (for dispersion) [m/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-qtrans.png\" alt=\"q_\\mathrm{trans}\"/></p></td>
<td valign=\"middle\"><pre>q_trans[N_r, N_z+1]</pre></td>
<td valign=\"middle\"><p>vertical Darcy velocity at horizontal cell interface (for dispersion) [m/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-n.png\" alt=\"n\"/></p></td>
<td valign=\"middle\"><pre>n</pre></td>
<td valign=\"middle\"><p>porosity of aquifer [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-rho_s.png\" alt=\"\\rho_s\"/></p></td>
<td valign=\"middle\"><pre>rho_s</pre></td>
<td valign=\"middle\"><p>density of aquifer solid [kg/m&sup3;]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-cps.png\" alt=\"c_{p,s}\"/></p></td>
<td valign=\"middle\"><pre>Cp_s</pre></td>
<td valign=\"middle\"><p>specific heat capacity of aquifer solid [J/(kg&middot;K)]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-V.png\" alt=\"V\"/></p></td>
<td valign=\"middle\"><pre>geo.V[i,j]</pre></td>
<td valign=\"middle\"><p>cell volume [m&sup3;]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-rho_l.png\" alt=\"\\rho_l\"/></p></td>
<td valign=\"middle\"><pre>rho_l</pre></td>
<td valign=\"middle\"><p>fluid density taken from TILMedia [kg/m&sup3;]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-cp_l.png\" alt=\"c_{p,l}\"/></p></td>
<td valign=\"middle\"><pre>Cp_l</pre></td>
<td valign=\"middle\"><p>specific heat capacity of fluid taken from TILMedia [J/(kg&middot;K)]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-Hdot_buoy.png\" alt=\"\\dot{H}_{\\mathrm{buoy}}\"/></p></td>
<td valign=\"middle\"><pre>H_flow_buoyancy[N_r, N_z+1]</pre></td>
<td valign=\"middle\"><p>buoyancy-driven enthalpy flow rate [W]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-mdot_buoy.png\" alt=\"\\dot{m}_{\\mathrm{buoy}}\"/></p></td>
<td valign=\"middle\"><pre>m_flow_buoyancy[N_r, N_z+1]</pre></td>
<td valign=\"middle\"><p>buoyancy-driven mass flow rate [kg/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-dp.png\" alt=\"\\Delta p\"/></p></td>
<td valign=\"middle\"><pre>delta_p_darcy[N_r+1, N_z]</pre></td>
<td valign=\"middle\"><p>Darcy pressure loss at each radial cell interface [Pa]</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Energy balance for each aquifer cell (i,j):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-energy.png\" alt=\"(n*cp*rho_l + (1-n)*rho_s*cp_s)*V*dT/dt = sum H_flow + sum H_buoy + Q_dot\"/></p>
<p>Mass continuity for each aquifer cell:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-mass.png\" alt=\"V * d_rho/dt = sum m_flow + sum m_flow_buoy\"/></p>
<p>Static pressure balance (Darcy pressure loss calculated in DarcyFlow_horizontal):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-pressure.png\" alt=\"0 = p_{i-1,j} - p_{i,j} - Delta_p_Darcy_{i,j}\"/> </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Requires an enclosing model to declare inner Modelica.SimCenter (for fluid type) and inner variables delta_p_darcy, rho_FM, f_eta, delta_p_v, rho_FM_v, f_eta_v (accessed via inner/outer from DarcyFlow sub-models). Thermal resistors are connected externally via port[N_r, N_z]. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Validated in Validation.Buoyancy.Val_homogenLayer.mo </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Model revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Corrected the interface list (removed non-existent port_east/west/up/down; the model has a single internal heat port array port[N_r, N_z]), fixed a character-encoding artifact, and corrected the delta_p_darcy dimension.</p>
</html>"));
end ControlVolumeL4;
