within TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection;
function NusseltInsideCSTR "Model for calculating the nusselt number of a continous stirred tank reactor"





//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.2                             //
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
// Gas- und Wärme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//






  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  import Modelica.Constants.pi;
  extends TransiEnt.Basics.Icons.Function;

  // _____________________________________________
  //
  //                Inputs/Outputs
  // _____________________________________________

  input Modelica.Units.SI.ReynoldsNumber Re "Reynols number inside CSTR";
  input Modelica.Units.SI.PrandtlNumber Pr "Prandtl number of medium at its temperature";
  input Modelica.Units.SI.DynamicViscosity eta "viscosity of medium at its temperature";
  input Modelica.Units.SI.DynamicViscosity eta_w "viscosity of medium at wall temperature";
  input Real C1 "geometrical Coefficient in Nusselt-Equation";
  output Modelica.Units.SI.NusseltNumber Nu "Nusselt number inside CSTR";

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  constant Real a=2/3;
  constant Real b=1/3;
  constant Real c=0.14;

  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

algorithm
  Nu := C1*Re^a*Pr^b*(eta/eta_w)^c;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>Calculates the Nusselt number of an impeller driven flow inside a CSTR. </p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td><h4>Variable</h4></td>
<td><h4>Variable Name</h4></td>
</tr>
<tr>
<td><p>Nu</p></td>
<td><p>Nusselt Number</p></td>
</tr>
<tr>
<td><p>Pr</p></td>
<td><p>Prantl Number</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-9Ob2l1F6.png\" alt=\"C_1\"/></p></td>
<td><p>Geometry Number calculated in function <a href=\"TransiEnt.Producer.Gas.BiogasPlant.Base.PitchedBladeImpeller.PitchedBladeImpeller_C1\">PitchedBladeImpeller_C1</a></p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-wZOjZc9e.png\" alt=\"eta\"/></p></td>
<td><p>Dynamic viscosity of fluid</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-CQp5ThiU.png\" alt=\"eta_w\"/></p></td>
<td><p>Dynamic viscosity of fluid at wall</p></td>
</tr>
<tr>
<td><p>a,b,c</p></td>
<td><p>Constants</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Governing Equations</span></h4></p>
<p><img src=\"modelica://TransiEnt/Images/equations/Nusselt_CSTR.png\"/></p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>[1] Judat, H. and Sperling, R. (2005). W&auml;rme&uuml;bergang im R&uuml;hrkessel. In M. Kraume (Ed.) <i>Mischen und R&uuml;hren </i>(pp. 123-145), Wiley-Blackwell</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by Philipp Jahneke (philipp.koziol@tuhh.de), Sep 2018</p>
<p>Changed documentation by Markus Gillner (markus.gillner@tuhh.de) in Jan 2025</p>
</html>"));
end NusseltInsideCSTR;
