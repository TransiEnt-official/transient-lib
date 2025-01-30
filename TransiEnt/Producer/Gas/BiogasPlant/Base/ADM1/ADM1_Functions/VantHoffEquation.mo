within TransiEnt.Producer.Gas.BiogasPlant.Base.ADM1.ADM1_Functions;
function VantHoffEquation "applies the van't Hoff Equation to a temperature-sensitive equilibrium constant"




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

  extends TransiEnt.Basics.Icons.Function;
  import Modelica.Constants.R;

  // _____________________________________________
  //
  //                Inputs/Outputs
  // _____________________________________________

  input Real K_ref "Equilibrium constant at reference temperature";
  input Modelica.Units.SI.MolarEnergy deltH0 "Enthalpy of Reaction for determination of equilibrium";
  input Modelica.Units.SI.Temperature T "Temperature at which equilibrium constant is calculated";
  output Real K "Equilibrium constant at Temperature T";

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  final parameter Modelica.Units.SI.Temperature T_ref=298.15 "Reference Temperature for equilibrium constant";
  // ADM1 default value is 298

  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

algorithm
  K := K_ref*exp(deltH0/R*(1/T_ref - 1/T));
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>The function calculates the position of the liquid-gas equilibrium <i>K</i> as a function of temperature and constant pressure. The equation is called Van&apos;t-Hoff-equation.</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td><h4>Variable</h4></td>
<td><h4>Variable Name</h4></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-K8ReTsIV.png\" alt=\"K_ref\"/></p></td>
<td><p>Equilibrium constant at reference temperature</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-H4RAfBOS.png\" alt=\"K\"/></p></td>
<td><p>Equilibrium constant at temperature <i>T </i></p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-AgBaqBJ9.png\" alt=\"T\"/></p></td>
<td><p>Temperature at which equilibrium constant is calculated</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-mTCCqwuA.png\" alt=\"T_ref\"/></p></td>
<td><p>Reference Temperature for equilibrium constant</p></td>
</tr>
<tr>
<td><p>&Delta;H<sub>0 </sub></p></td>
<td><p>Enthalpy of reaction for determination of equilibrium</p></td>
</tr>
</table>
<p><br><br><br>K_ref&nbsp;: &quot;Equilibrium&nbsp;constant&nbsp;at&nbsp;reference&nbsp;temperature&quot;</p>
<p>deltH0:&nbsp;&quot;Enthalpy&nbsp;of&nbsp;Reaction&nbsp;for&nbsp;determination&nbsp;of&nbsp;equilibrium&quot;</p>
<p>T:&nbsp;&quot;Temperature&nbsp;at&nbsp;which&nbsp;equilibrium&nbsp;constant&nbsp;is&nbsp;calculated&quot;</p>
<p>K:&nbsp;&quot;Equilibrium&nbsp;constant&nbsp;at&nbsp;Temperature&nbsp;T&quot;</p>
<p>T_ref&nbsp;=&nbsp;298.15&nbsp;&quot;Reference&nbsp;Temperature&nbsp;for&nbsp;equilibrium&nbsp;constant&quot;</p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>Van&apos;t-Hoff-Equation <img src=\"modelica://TransiEnt/Images/equations/Van'tHoffEquation.png\"/></p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model created by Philipp Jahneke (philipp.koziol@tuhh.de), August 2018</p>
<p>Change documentation by Markus Gillner (markus.gillner@tuhh.de) in Jan 2025</p>
</html>"));
end VantHoffEquation;
