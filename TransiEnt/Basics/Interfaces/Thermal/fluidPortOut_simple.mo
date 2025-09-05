within TransiEnt.Basics.Interfaces.Thermal;
connector FluidPortOut_simple "Outlet for hydraulic grid simulations"
//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 3.0.0                             //
//                                                                                //
// Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
// Copyright 2021, Hamburg University of Technology.                              //
//________________________________________________________________________________//
//                                                                                //
// TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
// supported by the German Federal Ministry of Economics and Energy               //
// (FKZ 03ET4003, 03ET4048, 0324027 and 03EI1008).                                //
// The TransiEnt Library research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
// Institute of Energy Systems (Hamburg University of Technology),                //
// Institute of Electrical Power and Energy Technology                            //
// (Hamburg University of Technology)                                             //
// Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//
  // _____________________________________________
  //
  //          Import and Hierachy
  // _____________________________________________

  import         Modelica.Units.SI;

   // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  flow SI.MassFlowRate m_flow;
  SI.Pressure p;
  stream SI.SpecificEnthalpy h_outflow;
  annotation (
    Icon(graphics={  Ellipse(origin = {0, 1}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{100, -101}, {-100, 99}}, endAngle = 360), Ellipse(origin = {15, -16}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-85, 84}, {55, -52}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>This connector is used for fluid flow between components, especially for district heating networks. It does not feature a mass fraction of the fluid. The specific enthalpy is declared as a stream variable and therefore linked to the mass flow of the fluid. In the components using these fluid ports, normally only the specific enthalpy flowing out of the component is defined. Use the &quot;inStream()&quot; operator to get the specific enthalpy flowing into the component.</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<p>m_flow Mass flow rate in [kg/s]</p>
<p>p Absolute pressure in the connection point in [Pa]</p>
<p>h_outflow Specific thermodynamic enthalpy close to the connection point if m_flow &lt; 0 [J/kg]</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by Jan Westphal (j.westphal@tuhh.de), August 2025</p>
</html>"));
end FluidPortOut_simple;
