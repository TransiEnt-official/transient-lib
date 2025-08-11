within TransiEnt.Producer.Gas.Electrolyzer.Base.Physics.Voltage.ConductivityModels;
model PEMconductivity3
  "PEM conductivity as modeled by Abdin 2015"




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

  extends TransiEnt.Producer.Gas.Electrolyzer.Base.Physics.Voltage.ConductivityModels.PartialPEMConductivity;

  import      Modelica.Units.SI;

  // _____________________________________________
  //
  //              Visible Parameters
  // _____________________________________________
public
  parameter Real humidity_const=14 "constant humidity";

  // _____________________________________________
  //
  //              Variables
  // _____________________________________________

  //Humidity
  Real mem_humidity "lambda, 14 typical, 22 for fully hydrated membrane"; //humidity factor should be 14-16 for vapor, 22 for liquid water. See Abdin 2015 paper

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  mem_humidity = humidity_const;

  //Ohmic Overpotential
  mem_conductivity = (0.005139*mem_humidity - 0.00326)*exp(1268*(1/303 - 1/T_op))*100; //Uses S/m and thickness in m; verified in Abdin 2015 (conversion factor missing), found in Springer 1991

  annotation (
    defaultConnectionStructurallyInconsistent=true,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>PEM Conductivity as per Abdin 2015</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>PEM Conductivity as modeled by Abdin et al, 2015. (Originally from Springer et al. 1991, conversion factor (*100) found from there)</p>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>Original model developed and validated in the range of 20-60 &deg;C with operating pressure of 15-35 bar. </p>
<p><b><span style=\"color: #008000;\">Nomenclature</span></b> </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td><h4>Variable</h4></td>
<td><h4>Explanation</h4></td>
<td><h4>Definition in model</h4></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-A9Ghf5DY.png\" alt=\"lambda_mem\"/></p></td>
<td><p>conductivity of membrane</p></td>
<td><p>mem_conductivity</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-RsaC1Vkp.png\" alt=\"s_humidity\"/></p></td>
<td><p>humidity of memebrane, 14-16 for vapor. 22 for liquid water</p></td>
<td><p>mem_humidity</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-UWblB0X6.png\" alt=\"T_op\"/></p></td>
<td><p>operating stack temperature</p></td>
<td><p>T_op</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Governing Equations</span></h4></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-y7PyKkFl.png\" alt=\"lambda_mem = (0.005139*s_humdity - 0.00326)*exp(1268*(1/303 - 1/T_op))*100\"/></p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>Z. Abdin, C.J. Webb, and E. MacA. Gray. Modelling and simulation of a proton exchange membrane (PEM) electrolyzer cell. <i>International Journal of Hydrogen Energy</i>, 40(39):13243-13257, 2015. doi:<a href=\"https://www.sciencedirect.com/science/article/pii/S0360319915019321\">10.1016/j.ijhydene.2015.07.129</a>. </p>
<p>T. E. Springer, T. A. Zawodzinski, and S. Gottesfeld, &ldquo;Polymer Electrolyte Fuel Cell Model,&rdquo; <i>J. Electrochem. Soc.</i>, vol. 138, no. 8, pp. 2334&ndash;2342, 1991.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by John Webster (jcwebste@edu.uwaterloo.ca) October 2018.</p>
<p>Fixed by Carsten Bode (c.bode@tuhh.de) January 2019</p>
</html>"));
end PEMconductivity3;
