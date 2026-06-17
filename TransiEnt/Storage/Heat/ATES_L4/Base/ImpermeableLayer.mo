within TransiEnt.Storage.Heat.ATES_L4.Base;
model ImpermeableLayer "impermeable confined layer only heat transport possible"
//import and class hierachy
  import Modelica.Units.SI;

  //parameters
  parameter SI.Temperature T_start=Parameters.T_initial;
  parameter SI.Area A_q "circular ring area of a volume";
  parameter SI.Length z_c "height of control volume";
  parameter SI.Length r "Radius of outer surface of control volume";
  parameter SI.Length r_d "Radius of the center of the control volume";
  parameter SI.Pressure p_initial=Parameters.p_initial "initial pressure of confined layer";

  Records.Subsurface_Basic         Parameters annotation (Placement(transformation(extent={{76,-86},{96,-66}})));
  Interfaces.HeatPort_a port_east annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Interfaces.HeatPort_a port_up annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Interfaces.HeatPort_b port_west annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Interfaces.HeatPort_b port_down annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  ThermalResistors.ThermalResistorRadial thermalResistorRadial_east(
    lambda=Parameters.lambda_c, r=r, r_r=r_d, z=z_c) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  ThermalResistors.ThermalResistorRadial thermalResistorRadial_west(
    lambda=Parameters.lambda_c, r=r, r_r=r_d, z=z_c) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  ThermalResistors.ThermalResistorVertical thermalResistorVertical_down(lambda=Parameters.lambda_c, A=A_q, z=z_c) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-60})));
  ThermalResistors.ThermalResistorVertical thermalResistorVertical_up(lambda=Parameters.lambda_c, A=A_q, z=z_c) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,60})));
  ControlVolumesL4.HeatCapacitorStone_WithFluidModel heatCapacitorStone(
    rho_sc=Parameters.rho_sc,
    rho_l=Parameters.rho_l,
    Cp_sc=Parameters.Cp_sc,
    Cp_l=Parameters.Cp_l,
    n_c=Parameters.n_c,
    T_start=T_start,
    A_q=A_q,
    z_c=z_c,
    p_initial=p_initial) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
equation
  connect(thermalResistorVertical_down.port_b, heatCapacitorStone.port) annotation (Line(points={{0,-50},{0,0}}, color={191,0,0}));
  connect(thermalResistorRadial_east.port_b, heatCapacitorStone.port) annotation (Line(points={{-50,0},{0,0}}, color={191,0,0}));
  connect(thermalResistorVertical_up.port_a, heatCapacitorStone.port) annotation (Line(points={{0,50},{0,28},{-14,28},{-14,0},{0,0}}, color={191,0,0}));
  connect(thermalResistorRadial_west.port_a, heatCapacitorStone.port) annotation (Line(points={{50,0},{0,0}}, color={191,0,0}));
  connect(port_down, thermalResistorVertical_down.port_a) annotation (Line(points={{0,-100},{0,-70}}, color={191,0,0}));
  connect(port_west, thermalResistorRadial_west.port_b) annotation (Line(points={{100,0},{70,0}}, color={191,0,0}));
  connect(port_up, thermalResistorVertical_up.port_b) annotation (Line(points={{0,100},{0,70}}, color={191,0,0}));
  connect(port_east, thermalResistorRadial_east.port_a) annotation (Line(points={{-100,0},{-70,0}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,40}},
          lineColor={0,0,0},
          fillColor={127,62,18},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5),
        Rectangle(
          extent={{-100,40},{100,-20}},
          lineColor={0,0,0},
          fillColor={127,62,18},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5),
        Rectangle(
          extent={{-100,-20},{100,-100}},
          lineColor={0,0,0},
          fillColor={127,62,18},
          fillPattern=FillPattern.Solid,
          lineThickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Single control volume of an impermeable confining layer (aquitard). Models 2D heat conduction in radial and vertical direction through a saturated stone or clay matrix. Temperature is computed at the cell centre; heat ports at all four surfaces allow coupling to neighbouring cells or boundary conditions.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4: Discretized control volume. Heat conduction in radial and vertical directions is represented by four thermal resistors (two radial, two vertical). Thermal storage is modeled by a lumped heat capacitor. No fluid flow is possible (impermeable layer).</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- No fluid flow or advective heat transport.</p>
<p>- Constant thermal properties of the confining layer solid.</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><img src=\"modelica://ATES/../Resources/Images/ImpermeableLayer_interfaces.svg\"
     alt=\"Interface diagram: port_east (heat in, left), port_west (heat out, right), port_up (heat in, top), port_down (heat out, bottom)\"/></p>
<p>port_east: radial inner heat port (Heat, inlet)</p>
<p>port_west: radial outer heat port (Heat, outlet)</p>
<p>port_up: upper vertical heat port (Heat, inlet)</p>
<p>port_down: lower vertical heat port (Heat, outlet)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\">
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-T.png\" alt=\"T\"/></td>
  <td valign=\"middle\"><code>T_start</code></td>
  <td valign=\"middle\">initial temperature of control volume [K]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Aq.png\" alt=\"A_q\"/></td>
  <td valign=\"middle\"><code>A_q</code></td>
  <td valign=\"middle\">cross-sectional area of control volume [m&sup2;]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-z.png\" alt=\"z\"/></td>
  <td valign=\"middle\"><code>z_c</code></td>
  <td valign=\"middle\">height of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-r.png\" alt=\"r\"/></td>
  <td valign=\"middle\"><code>r</code></td>
  <td valign=\"middle\">outer edge radius of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-tr-symbol-r_r.png\" alt=\"r_r\"/></td>
  <td valign=\"middle\"><code>r_d</code></td>
  <td valign=\"middle\">centre radius of control volume [m]</td>
</tr>
<tr>
  <td width=\"60\" valign=\"middle\"><img height=\"32\" src=\"modelica://ATES/../Resources/Images/equations/equation-sym-Qdot.png\" alt=\"\\dot{Q}\"/></td>
  <td valign=\"middle\"><code>port_east.Q_flow etc.</code></td>
  <td valign=\"middle\">heat flow rate at each port [W]</td>
</tr>
</table>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations — assembly of ThermalResistorRadial, ThermalResistorVertical, and HeatCapacitorStone sub-models)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Instantiated as a [N_r, N_z_c] array in ATES_confinedLayer for the upper and lower aquitard layers. Thermal properties are taken from Parameters (Subsurface_Basic record).</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot;</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
</html>"));
end ImpermeableLayer;
