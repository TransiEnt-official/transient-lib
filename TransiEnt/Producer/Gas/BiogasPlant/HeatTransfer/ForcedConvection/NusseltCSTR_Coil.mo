within TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection;
function NusseltCSTR_Coil
  "Function calculating Nusselt Number for Heat Transfer from coil to medium"





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
  input Real C2 "geometrical Coefficient in Nusselt-Equation";
  input Modelica.Units.SI.Diameter D "Inner Diameter of Reactor";
  input Modelica.Units.SI.Diameter d "outer diameter of tube of coil";
  output Modelica.Units.SI.NusseltNumber Nu "Nusselt number inside CSTR";

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  constant Real a=0.56;
  constant Real b=1/3;
  constant Real c=0.14;

  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

algorithm
  Nu := C2*(d/D)^(-0.3)*Re^a*Pr^b*(eta/eta_w)^c;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>Calculates the Nusselt number of an impeller driven flow inside a CSTR from coil to medium.</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td><p>Variable</p></td>
<td><p>Variable Name</p></td>
</tr>
<tr>
<td><p>Nu</p></td>
<td><p>Nusselt Number</p></td>
</tr>
<tr>
<td><p>Pr</p></td>
<td><p>Prandtl Number</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-MH5HvdWe.png\" alt=\"D\"/></p></td>
<td><p>Inner diameter of CSTR</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-u8jaqaAx.png\" alt=\"rho\"/></p></td>
<td><p>Density of fluid</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-O8M4VIPp.png\" alt=\"P\"/></p></td>
<td><p>Power of stirrer</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-43d0REzf.png\" alt=\"V\"/></p></td>
<td><p>Volume of CSTR filled with fluid</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-G4CqOM2H.png\" alt=\"eta\"/></p></td>
<td><p>Dynamic viscosity of fluid</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-MEwrcNKl.png\" alt=\"eta_w\"/></p></td>
<td><p>Dynamic viscosity of fluid at the wall</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Governing Equations</span></h4></p>
<p><img src=\"modelica://TransiEnt/Images/equations/Nusselt_CSTR-coil.png\"/></p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>[1] Judat, H. and Sperling, R. (2005). W&auml;rme&uuml;bergang im R&uuml;hrkessel. In M. Kraume (Ed.) <i>Mischen und R&uuml;hren </i>(pp. 123-145), Wiley-Blackwell</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by Philipp Jahneke (philipp.koziol@tuhh.de), Sep 2018</p>
<p>Changed documentation by Markus Gillner (markus.gillner@tuhh.de) in Jan 2025</p>
</html>"));
end NusseltCSTR_Coil;
