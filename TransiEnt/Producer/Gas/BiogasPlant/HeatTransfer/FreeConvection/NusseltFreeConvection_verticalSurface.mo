within TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.FreeConvection;
function NusseltFreeConvection_verticalSurface "Function for calculating the nusselt number"





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

  extends TransiEnt.Basics.Icons.Function;

  // _____________________________________________
  //
  //                Inputs/Outputs
  // _____________________________________________

  input Modelica.Units.SI.RayleighNumber Ra "Rayleight number calculated with properties of medium";
  input Modelica.Units.SI.PrandtlNumber Pr "Prandtl number (property of medium)";
  output Modelica.Units.SI.NusseltNumber Nu "Nusselt Number calculated by the correlation";

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

protected
  Real f=(1 + (0.492/Pr)^(9/16))^(-16/9);

  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

algorithm
  Nu := (0.825 + 0.387*(Ra*f)^(1/6))^2;
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>Evaluates the Nusselt Correlation for Natural Convection Heat Transfer at rectangular vertical surfaces. </p>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>L (characteristic lenght) must be height of surface</p>
<p>10^-1 &lt; Ra &lt; 10^12 </p>
<p>10^-3 &lt; Pr </p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<p>Ra := Rayleigh number,</p>
<p>Pr := Prandtl number</p>
<p>Nu := Nusselt number</p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-0GrbABGM.png\" alt=\"Nusselt = (0.825 + 0.387*(Ra*f(Pr))^(1/6))^2\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-kw8E8hcp.png\" alt=\"f=(1 + (0.492/Pr)^(9/16))^(-16/9)\"/></p>
<h4><span style=\"color: #008000\">Remarks for Usage</span></h4>
<p>use together with functions calculating correct Rayleigh and Prandtl numbers</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>[1] Klan, H., &amp; Thess, A. (2013). F2 W&auml;rme&uuml;bertragung durch freie Konvektion: Au&szlig;enstr&ouml;mung. In <i>VDI-W&auml;rmeatlas</i> (pp. 757-764). Springer Vieweg, Berlin, Heidelberg.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by Philipp Jahneke (philipp.koziol@tuhh.de) in Aug 2018</p>
<p>Changed documentation by Markus Gillner (markus.gillner@tuhh.de) in Jan 2025</p>
</html>"));
end NusseltFreeConvection_verticalSurface;
