within TransiEnt.Storage.Heat.ATES_L4.Base;
model Well_L4 "discretised well with variable number of Volumes"

 //import and hierachy
 import Modelica.Units.SI;
 import Modelica.Constants.pi;
 import Modelica.Constants.eps;
 import Modelica.Constants.g_n;

 //parameters
 parameter Integer N_z = 4 "Number  of vertical volume elements";
 parameter SI.Pressure p_initial = 100000 "Initial pressure of all discretised volumes of the well";
 parameter SI.Temperature T_initial = 298.15 "Initial temperature of all discretised volumes of the well";
 parameter SI.Radius r_0 = 0.1 "Radius of the well";
 parameter SI.Length H_cell[N_z] = fill(5,N_z) "Heigth of each discretised element of the well: counting is from bottom to top";
 parameter SI.Volume V_cell[N_z] = {(pi * r_0^2 * H_cell[i]) for i in 1:N_z} "Volume of each discretised element of the well: counting is from bottom to top";
 parameter Integer No_inactive_well_volumes = 0 "Number of well volumes that takes a mass flow out of the aquifer --> only in production phase";
 parameter SI.Volume V_well_prod = sum(V_cell[j] for j in 1+No_inactive_well_volumes:N_z) "Volume of the well taking inactive volumes of well into account";
 parameter SI.Volume V_well = sum(V_cell) "Volume of the well";
 parameter SI.Time t_well_start = 25056000 "start time when in production or injection phase only a part of the well is used";
 parameter SI.Time t_well_end = 28425600 "end time of well beeing shortened";

 final parameter TILMedia.VLEFluidTypes.BaseVLEFluid water=simCenter.fluid1 "Heat carrier";


 //variables
 SI.Pressure p[N_z](each start = p_initial) "pressure of discretised volumes";
 SI.Temperature T[N_z](each start = T_initial) "Temperature of discretised volumes";
 SI.MassFlowRate m_flow_v[N_z](each start = 0.0001) "Mass flow in vertical direction";
 SI.MassFlowRate m_flow_r[N_z](each start = 0.0001) "Mass flow in radial direction";
 SI.SpecificEnthalpy h[N_z](each start=217940) "Specific enthalpy of every volume"; //start value water 100bar and 50°C
 SI.EnthalpyFlowRate H_flow_v[N_z](each start = 21.7940) "Enthalpy Flow Rate in vertical direction at top of volume element";
 SI.EnthalpyFlowRate H_flow_r[N_z](each start = 21.7940) "Enthalpy Flow Rate in radial direction";
 //SI.EnthalpyFlow

 //Interfaces
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn fluidPortIn(Medium=water)  annotation (Placement(transformation(extent={{-10,88},{10,108}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut fluidPortOut_radial[N_z](each Medium=water)  annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  TILMedia.VLEFluid_pT    bulk[N_z](
  p = p,
  T = T,
  each vleFluidType=water)
   annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
  TILMedia.VLEFluid_ph    vleFluidIn(
  p = fluidPortIn.p,
  h = noEvent(actualStream(fluidPortIn.h_outflow)),
  vleFluidType=water) annotation (Placement(transformation(extent={{-10,64},{10,84}})));
  TILMedia.VLEFluid_ph    vleFluid_radial[N_z](
  p = fluidPortOut_radial.p,
  h = noEvent(actualStream(fluidPortOut_radial.h_outflow)),
  each vleFluidType=water) annotation (Placement(transformation(extent={{64,-12},{84,8}})));
  inner ClaRa.SimCenter simCenter annotation (Placement(transformation(extent={{60,80},{100,100}})));


  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a
                        port_a[N_z] annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
equation

  for j in 1:N_z loop
    h[j] = bulk[j].h;
  end for;
  //energy balance equation
  for j in 2:N_z loop
    der(T[j])*V_cell[j]*bulk[j].d*bulk[j].cp = - H_flow_v[j-1] + H_flow_v[j] + H_flow_r[j] + port_a[j].Q_flow;
  end for;
  der(T[1])*V_cell[1]*bulk[1].d*bulk[1].cp = H_flow_v[1] + H_flow_r[1];  //energy equation for first element




  //calculation of enthalpy flow rates
  for j in 1:N_z loop
    H_flow_r[j] = semiLinear(m_flow_r[j],vleFluid_radial[j].h, h[j]);
  end for;
  for j in 1:N_z-1 loop
    H_flow_v[j] = semiLinear(m_flow_v[j], h[j+1], h[j]);
  end for;
  H_flow_v[N_z] = semiLinear(m_flow_v[N_z],vleFluidIn.h, h[N_z]);

  //continuity equation
  if m_flow_v[N_z] < 0 then //production phase
    for j in 2:N_z loop
      m_flow_v[j] - m_flow_v[j-1] + m_flow_r[j] = 0; //-m_flow_v[j] because of vectorization of m_flow_v. When m_flow_v[j] positive, than this is the mass flow that flows out of volume [j+1] into volume [j].
    end for;
    if time >= t_well_start and time < t_well_end then
      for j in 2+No_inactive_well_volumes:N_z loop
        m_flow_r[j] = - (V_cell[j]/V_well_prod) * m_flow_v[N_z]; // fixed Value for mass flow in aquifer
      end for;
      for j in 1:No_inactive_well_volumes loop
        m_flow_r[j] = 0;
      end for;
    else
      for j in 2:N_z loop
        m_flow_r[j] = - (V_cell[j]/V_well) * m_flow_v[N_z]; // fixed Value for mass flow in aquifer
       end for;
    end if;

    m_flow_v[1] + m_flow_r[1] = 0;

  else // injection, rest and storage phase
   for j in 2:N_z loop
      m_flow_v[j] - m_flow_v[j-1] + m_flow_r[j] = 0; //-m_flow_v[j] because of vectorization of m_flow_v. When m_flow_v[j] positive, than this is the mass flow that flows out of volume [j+1] into volume [j].
    end for;
    for j in 2:N_z loop
      m_flow_r[j] = - (V_cell[j]/V_well) * m_flow_v[N_z]; // fixed Value for mass flow in aquifer
    end for;
    m_flow_v[1] + m_flow_r[1] = 0;
  end if;


  fluidPortIn.h_outflow = h[N_z];
  m_flow_v[N_z] = fluidPortIn.m_flow;
  p[N_z] = fluidPortIn.p;
  for j in 1:N_z loop
    m_flow_r[j] = fluidPortOut_radial[j].m_flow;
    p[j] = fluidPortOut_radial[j].p;
    fluidPortOut_radial[j].h_outflow = h[j];
    port_a[j].T = T[j];
  end for;


  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Discretized well model with N_z stacked vertical control volumes. Resolves the temperature and pressure distribution inside the well bore during injection, storage, and production phases. Distributes the total mass flow radially to the aquifer cells proportionally to each cell volume.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4: N_z fully discretized control volumes stacked vertically. Physical effects considered:</p>
<ul>
<li>Enthalpy transport in vertical direction (between adjacent well cells)</li>
<li>Enthalpy exchange with aquifer cells via radial fluid ports</li>
<li>Heat conduction to surrounding medium via heat ports</li>
<li>Volume-proportional radial mass flow distribution during production</li>
<li>Optional partial-well operation: inactive lower cells excluded during a configurable time window</li>
</ul>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Radial mass flow is distributed proportionally to cell volume, not driven by a pressure gradient inside the well.</p>
<p>- No wellbore storage effect (compressibility of fluid in well is neglected).</p>
<p>- Cylindrical well geometry with constant radius r_0.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/Well_L4_interfaces.svg\"
     alt=\"Interface diagram: fluidPortIn at top, fluidPortOut_radial[N_z] on the right, port_a[N_z] on the left\"/></p>
<p>fluidPortIn: fluid inlet/outlet to the surface network — top of well (Fluid, bidirectional)</p>
<p>fluidPortOut_radial[N_z]: radial fluid ports to aquifer control volumes, one per vertical cell (Fluid, outlet)</p>
<p>port_a[N_z]: heat ports to surrounding medium per vertical cell (Heat)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-T.png\" alt=\"T\"/></td>
  <td valign=\"middle\"><code>T[N_z]</code></td>
  <td valign=\"middle\">cell temperature [K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-p.png\" alt=\"p\"/></td>
  <td valign=\"middle\"><code>p[N_z]</code></td>
  <td valign=\"middle\">cell pressure [Pa]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-well-symbol-h.png\" alt=\"h\"/></td>
  <td valign=\"middle\"><code>h[N_z]</code></td>
  <td valign=\"middle\">specific enthalpy of cell fluid [J/kg]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-well-symbol-Hdot_v.png\" alt=\"\\dot{H}_v\"/></td>
  <td valign=\"middle\"><code>H_flow_v[N_z]</code></td>
  <td valign=\"middle\">vertical enthalpy flow rate at top of each cell [W]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-well-symbol-Hdot_r.png\" alt=\"\\dot{H}_r\"/></td>
  <td valign=\"middle\"><code>H_flow_r[N_z]</code></td>
  <td valign=\"middle\">radial enthalpy flow rate from aquifer into cell [W]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-well-symbol-mdot_v.png\" alt=\"\\dot{m}_v\"/></td>
  <td valign=\"middle\"><code>m_flow_v[N_z]</code></td>
  <td valign=\"middle\">vertical mass flow rate at top of each cell [kg/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-well-symbol-mdot_r.png\" alt=\"\\dot{m}_r\"/></td>
  <td valign=\"middle\"><code>m_flow_r[N_z]</code></td>
  <td valign=\"middle\">radial mass flow rate from/to aquifer per cell [kg/s]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-Qdot.png\" alt=\"\\dot{Q}\"/></td>
  <td valign=\"middle\"><code>port_a[j].Q_flow</code></td>
  <td valign=\"middle\">heat flow from surrounding medium into cell [W]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-V.png\" alt=\"V\"/></td>
  <td valign=\"middle\"><code>V_cell[N_z]</code></td>
  <td valign=\"middle\">volume of each well cell [m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-rho.png\" alt=\"\\rho\"/></td>
  <td valign=\"middle\"><code>bulk[j].d</code></td>
  <td valign=\"middle\">fluid density [kg/m&sup3;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-cp.png\" alt=\"c_p\"/></td>
  <td valign=\"middle\"><code>bulk[j].cp</code></td>
  <td valign=\"middle\">specific heat capacity of fluid [J/(kg&middot;K)]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-r0.png\" alt=\"r_0\"/></td>
  <td valign=\"middle\"><code>r_0</code></td>
  <td valign=\"middle\">well bore radius [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-z.png\" alt=\"z\"/></td>
  <td valign=\"middle\"><code>H_cell[N_z]</code></td>
  <td valign=\"middle\">height of each well cell [m]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Energy balance for each well cell j (j = 2 ... N_z; cell j = 1 has no lower vertical neighbour):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-well-energy.png\"
     alt=\"V_j*rho*cp*dT_j/dt = -H_flow_v[j-1] + H_flow_v[j] + H_flow_r[j] + Q_dot_j\"/></p>
<p>Mass continuity for each well cell:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-well-mass.png\"
     alt=\"m_flow_v[j] - m_flow_v[j-1] + m_flow_r[j] = 0\"/></p>
<p>Volume-proportional radial mass flow distribution:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-well-distribution.png\"
     alt=\"m_flow_r[j] = -(V_j / V_well) * m_flow_v[N_z]\"/></p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Cell index j = 1 is the bottommost cell; j = N_z is the topmost cell connected to <code>fluidPortIn</code>. The parameter <code>No_inactive_well_volumes</code> excludes the lowest cells from the radial distribution during a defined time window [<code>t_well_start</code>, <code>t_well_end</code>], allowing partial-screen operation.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested via &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"),
  Icon(graphics={
        Rectangle(
          extent={{-10,100},{10,-80}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-10,60},{-100,-80}},
          lineColor={0,0,0},
          fillColor={102,18,21},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{10,60},{100,-80}},
          lineColor={0,0,0},
          fillColor={102,18,21},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{100,-100},{-100,-80}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={42,7,9},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,60},{-100,80}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={42,7,9},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{100,60},{10,80}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={42,7,9},
          fillPattern=FillPattern.Solid),
        Line(points={{-6,46},{-34,46}}, pattern=LinePattern.None),
        Line(
          points={{-80,90},{-42,92},{-62,86},{-58,94}},
          color={28,108,200},
          pattern=LinePattern.None),
        Line(
          points={{0,-21},{1,-24},{1,4}},
          color={28,108,200},
          thickness=0.5,
          origin={1,76},
          rotation=180,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{0,-21},{0,-21},{0,5}},
          color={28,108,200},
          thickness=0.5,
          origin={-25,50},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{0,-21},{0,-21},{0,5}},
          color={28,108,200},
          thickness=0.5,
          origin={-25,-10},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{0,-21},{0,-21},{0,5}},
          color={28,108,200},
          thickness=0.5,
          origin={-25,-30},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{0,-21},{0,-21},{0,5}},
          color={28,108,200},
          thickness=0.5,
          origin={-25,30},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{0,-21},{0,-21},{0,5}},
          color={28,108,200},
          thickness=0.5,
          origin={-25,10},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{0,-21},{0,-21},{0,5}},
          color={28,108,200},
          thickness=0.5,
          origin={-25,-70},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-8.88178e-16,21},{-8.88178e-16,21},{0,-5}},
          color={28,108,200},
          thickness=0.5,
          origin={25,30},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{0,21},{0,21},{0,-5}},
          color={28,108,200},
          thickness=0.5,
          origin={25,10},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-8.88178e-16,21},{-8.88178e-16,21},{0,-5}},
          color={28,108,200},
          thickness=0.5,
          origin={25,-10},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-8.88178e-16,21},{-8.88178e-16,21},{0,-5}},
          color={28,108,200},
          thickness=0.5,
          origin={25,-30},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-8.88178e-16,21},{-8.88178e-16,21},{0,-5}},
          color={28,108,200},
          thickness=0.5,
          origin={25,-70},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-8.88178e-16,21},{-8.88178e-16,21},{0,-5}},
          color={28,108,200},
          thickness=0.5,
          origin={25,50},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Rectangle(
          extent={{-10,60},{10,40}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Rectangle(
          extent={{-10,40},{10,20}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Rectangle(
          extent={{-10,20},{10,0}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Rectangle(
          extent={{-10,0},{10,-20}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Rectangle(
          extent={{-10,-20},{10,-40}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Rectangle(
          extent={{-10,-40},{10,-60}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Rectangle(
          extent={{-10,-60},{10,-80}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Line(
          points={{0,-21},{0,-21},{0,5}},
          color={28,108,200},
          thickness=0.5,
          origin={-25,-50},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-8.88178e-16,21},{-8.88178e-16,21},{0,-5}},
          color={28,108,200},
          thickness=0.5,
          origin={25,-50},
          rotation=90,
          arrow={Arrow.None,Arrow.Filled})}));
end Well_L4;
