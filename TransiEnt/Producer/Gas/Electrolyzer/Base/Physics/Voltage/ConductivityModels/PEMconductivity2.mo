within TransiEnt.Producer.Gas.Electrolyzer.Base.Physics.Voltage.ConductivityModels;
model PEMconductivity2
  "PEM conductivity as modeled by N.V.Dale 2008"




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

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  //Ohmic Overpotential
  mem_conductivity = (0.0480257 + 8.15178e-4*(T_op-273.15) + 5.11692e-7*(T_op-273.15)^2)*100; // Units S/m; Linear regression from experimental data; N.V.Dale 2008, 6kW Nafion PEM

  annotation (
    defaultConnectionStructurallyInconsistent=true,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>PEM Conductivity model N.V.Dale 2008 for a Nafion 117 membrane. </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>PEM Conductivity as modeled by N.V.Dale et al, 2008.</p>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>Original model developed and validated in the range of 20-60 &deg;C with operating pressure of 15-35 bar.  </p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
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
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-UWblB0X6.png\" alt=\"T_op\"/></p></td>
<td><p>operating stack temperature</p></td>
<td><p>T_op</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Governing Equations</span></h4></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-8ougsNDt.png\" alt=\"lambda_mem = (0.0480257 + 8.15178e-4*(T_op-273.15) + 5.11692e-7*(T_op-273.15)^2)*100\"/></p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>N.V. Dale et al. Semiempirical model based on thermodynamic principles for determining 6&nbsp;kW proton exchange membrane electrolyzer stack characteristics. <i>Journal of Power Sources</i>, 185(2):1348-1353, 2008. DOI: <span style=\"font-family: Arial;\"><a href=\"https://doi.org/10.1016/j.jpowsour.2008.08.054\">https://doi.org/10.1016/j.jpowsour.2008.08.054</a></span> </p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by John Webster (jcwebste@edu.uwaterloo.ca) October 2018.</p>
<p>Fixed by Carsten Bode (c.bode@tuhh.de) January 2019</p>
</html>"));
end PEMconductivity2;
