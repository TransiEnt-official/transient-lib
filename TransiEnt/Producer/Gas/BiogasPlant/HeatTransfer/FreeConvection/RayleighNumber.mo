within TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.FreeConvection;
function RayleighNumber "function for calculating the rayleigh number"





//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.3                             //
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
  //          Imports and Class Hierarchy
  // _____________________________________________

  import g = Modelica.Constants.g_n;
  extends TransiEnt.Basics.Icons.Function;

  // _____________________________________________
  //
  //                Inputs/Outputs
  // _____________________________________________

  input Modelica.Units.SI.Length l;
  input Modelica.Units.SI.LinearExpansionCoefficient beta;
  input Modelica.Units.SI.TemperatureDifference dT;
  input Modelica.Units.SI.PrandtlNumber Pr;
  input Modelica.Units.SI.KinematicViscosity nue;
  output Modelica.Units.SI.RayleighNumber Ra;

  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

algorithm
  Ra := g*beta*dT*(l^3)*Pr/(nue^2);
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model calculates the rayleigh number <i>Ra</i> for the heat models of the CSTR.</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td><p>Variable</p></td>
<td><p>Variable name</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-ykbuKgri.png\" alt=\"nu\"/></p></td>
<td><p>Kinematic viscosity</p></td>
</tr>
<tr>
<td><p>Re</p></td>
<td><p>Rayleigh Number</p></td>
</tr>
<tr>
<td><p>Pr</p></td>
<td><p>Prantl Number</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-ms3CR7QM.png\" alt=\"dT\"/></p></td>
<td><p>Temperature difference</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-UfDfqwjB.png\" alt=\"beta\"/></p></td>
<td><p>linear expansion coefficient</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-0A64F49w.png\" alt=\"l\"/></p></td>
<td><p>characteristic length</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-C25R3wLT.png\" alt=\"g\"/></p></td>
<td><p>gravitational constant</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Governing Equations</span></h4></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-KGh44rQZ.png\" alt=\"Ra = g*beta * dT* l^3*Pr/nu^2\"/></p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model created by Philipp Jahneke (philipp.koziol@tuhh.de) in August 2018</p>
<p>Change documentation by Markus Gillner (markus.gillner@tuhh.de) in Jan 2025</p>
</html>"));
end RayleighNumber;
