within TransiEnt.Storage.Heat.ATES_L4.Base.ControlVolumes_L4;
model HeatCapacitorStone "Same model as HeatCapacitorStone but with FluidModel for density calculation of fluid"
//Import und Hierachie
  import Modelica.Units.SI;
  //extends TransiEnt.Basics.Icons.Fluid_Volume;

  //Parameter
  parameter SI.Density rho_sc "Density of solid in aquitard";
  parameter SI.Density rho_l "Density of liquid in aquitard";
  parameter SI.SpecificHeatCapacity Cp_sc "Specific Heat Capacity of solid in aquitard";
  parameter SI.SpecificHeatCapacity Cp_l "Specific Heat Capacity of liquid in aquitard";
  parameter SI.DimensionlessRatio n_c "porosity of aquitard";
  parameter SI.Temperature T_start "Start temperature of the confining layers";
  parameter SI.Pressure p_initial "initial pressure of confined layer";
  parameter SI.Area A_q "Circular ring area of CV";
  parameter SI.Length z_c "Height of the volume of the confining layer";
  final parameter SI.Mass m=(n_c*rho_l + (1-n_c)*rho_sc)*(A_q*z_c) "Mass of the control volume";
  final parameter SI.HeatCapacity C=(n_c*rho_l*Cp_l + (1-n_c)*rho_sc*Cp_sc)*(A_q*z_c) "Heat capacity of element";
  final parameter TILMedia.VLEFluidTypes.BaseVLEFluid water=simCenter.fluid1 "Heat carrier";

  //Variablen
  SI.Temperature T(start=T_start, displayUnit="degC") "Temperature of element";
  SI.TemperatureSlope der_T(start=0) "Time derivative of temperature (= der(T))";
  SI.Energy U(start=207856) "Inner energy of stone";

  //Interfaces
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port annotation (Placement(transformation(
        origin={0,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));


  inner ClaRa.SimCenter simCenter annotation (Placement(transformation(extent={{60,80},{100,100}})));
  TILMedia.VLEFluid_pT    bulk(
     p=p_initial,
     T=T,
     each vleFluidType=water) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  //Gleichungen
equation
  T = port.T;
  der_T = der(T);
  C*der(T) = port.Q_flow;
  der(U)=C*der(T);
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
        Polygon(
          points={{0,85},{-20,81},{-40,75},{-52,61},{-58,53},{-68,43},{-72,31},{-76,17},{-78,3},{-76,-13},{-76,-25},{-76,-35},{-70,-47},{-64,-55},{-48,-59},{-30,-65},{-18,-65},{-2,-67},{8,-71},{22,-71},{32,-69},{42,-63},{54,-57},{56,-55},{66,-43},{68,-35},{70,-33},{72,-17},{76,-3},{78,5},{78,21},{74,33},{66,43},{54,51},{44,59},{36,75},{26,83},{0,85}},
          lineColor={160,160,164},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-58,53},{-68,43},{-72,31},{-76,17},{-78,3},{-76,-13},{-76,-25},{-76,-35},{-70,-47},{-64,-55},{-48,-59},{-30,-65},{-18,-65},{-2,-67},{8,-71},{22,-71},{32,-69},{42,-63},{54,-57},{42,-59},{40,-59},{30,-61},{20,-63},{18,-63},{10,-63},{2,-59},{-12,-55},{-22,-55},{-30,-53},{-40,-47},{-50,-37},{-56,-25},{-58,-17},{-58,-7},{-60,5},{-60,13},{-60,25},{-58,35},{-56,37},{-52,45},{-48,53},{-44,63},{-40,75},{-58,53}},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-69,25},{71,-6}},
          textString="%C"),
        Text(
          extent={{-150,128},{150,88}},
          textString="%name",
          textColor={0,0,255})}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Lumped thermal capacitor representing one control volume of a saturated confining layer (aquitard). The stored heat is that of the combined solid matrix and pore fluid, computed from a porosity-weighted volumetric heat capacity. The single heat port couples the element to the surrounding thermal resistor network. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2: Single ideally mixed (lumped) control volume with one uniform temperature. Only thermal storage is modeled; heat transport between elements is handled externally by thermal resistors. Heat capacity is constant (no temperature dependency). </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- No internal temperature distribution; the whole volume is at one temperature.</p>
<p>- Constant, porosity-weighted heat capacity (no temperature or pressure dependency).</p>
<p>- No fluid flow (impermeable confining layer); only conductive coupling via the heat port. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>port: heat port to the surrounding thermal resistor network (Heat) </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\"><tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-T.png\" alt=\"T\"/></p></td>
<td valign=\"middle\"><pre>T</pre></td>
<td valign=\"middle\"><p>temperature of the element (state) [K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-Qdot.png\" alt=\"\\dot{Q}\"/></p></td>
<td valign=\"middle\"><pre>port.Q_flow</pre></td>
<td valign=\"middle\"><p>heat flow rate into the element [W]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-cv-symbol-U.png\" alt=\"U\"/></p></td>
<td valign=\"middle\"><pre>U</pre></td>
<td valign=\"middle\"><p>inner energy of the element [J]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-DUE5V66L.png\" alt=\"C\"/></p></td>
<td valign=\"middle\"><pre>C</pre></td>
<td valign=\"middle\"><p>heat capacity of the element [J/K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-n_c.png\" alt=\"n_c\"/></p></td>
<td valign=\"middle\"><pre>n_c</pre></td>
<td valign=\"middle\"><p>porosity of the confining layer [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-rho.png\" alt=\"\\rho_l\"/></p></td>
<td valign=\"middle\"><pre>rho_l</pre></td>
<td valign=\"middle\"><p>density of the pore fluid [kg/m&sup3;]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-rho_sc.png\" alt=\"\\rho_{sc}\"/></p></td>
<td valign=\"middle\"><pre>rho_sc</pre></td>
<td valign=\"middle\"><p>density of the solid in the confining layer [kg/m&sup3;]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-cp.png\" alt=\"c_{p,l}\"/></p></td>
<td valign=\"middle\"><pre>Cp_l</pre></td>
<td valign=\"middle\"><p>specific heat capacity of the pore fluid [J/(kg&middot;K)]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-cp_sc.png\" alt=\"c_{p,sc}\"/></p></td>
<td valign=\"middle\"><pre>Cp_sc</pre></td>
<td valign=\"middle\"><p>specific heat capacity of the solid in the confining layer [J/(kg&middot;K)]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-Aq.png\" alt=\"A_q\"/></p></td>
<td valign=\"middle\"><pre>A_q</pre></td>
<td valign=\"middle\"><p>cross-sectional (annular) area of the control volume [m&sup2;]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-sym-z.png\" alt=\"z_c\"/></p></td>
<td valign=\"middle\"><pre>z_c</pre></td>
<td valign=\"middle\"><p>height of the control volume [m]</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">6. Governing Equations</span></h4></p>
<p>Porosity-weighted heat capacity of the saturated control volume:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-hcs-C.png\" alt=\"C = (n_c*rho_l*Cp_l + (1-n_c)*rho_sc*Cp_sc) * A_q * z_c\"/></p>
<p>Energy balance (lumped capacitor):</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-hcs-energy.png\" alt=\"C * dT/dt = port.Q_flow\"/></p>
<p>Inner energy of the element:</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-hcs-U.png\" alt=\"dU/dt = C * dT/dt\"/> </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Instantiated as an array inside ImpermeableLayer to provide thermal storage for the upper and lower aquitard. The variant HeatCapacitorStone_WithFluidModel adds a fluid property model and is the one actually used by ImpermeableLayer; use this simpler variant where constant fluid properties are sufficient. Material properties are taken from the Subsurface_Basic (Parameters) record. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>Tested in check model &quot;ATES.Validierung.Buoyancy.Val_homogenLayer&quot; </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Markus Gillner (markus.gillner@tuhh.de), May 2026</p>
<p>Model revised by Markus Gillner (markus.gillner@tuhh.de), June 2026</p>
<p>- Replaced the generic Modelica Standard Library documentation with a model-specific 10-section description.</p>
</html>"));
end HeatCapacitorStone;
