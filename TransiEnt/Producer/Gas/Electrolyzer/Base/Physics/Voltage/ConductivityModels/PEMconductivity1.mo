within TransiEnt.Producer.Gas.Electrolyzer.Base.Physics.Voltage.ConductivityModels;
model PEMconductivity1 "PEM conductivity as modeled by Espinosa, 2018"




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
  import const = Modelica.Constants;

  // _____________________________________________
  //
  //              Visible Parameters
  // _____________________________________________
public
  outer parameter SI.Temperature T_std "STD temperature";

  //Electrolyzer system specific parameters
  outer parameter SI.ChemicalPotential E_pro "Temperature independent parameter for activation energy in proton transport, Espinosa 2018";

  outer parameter SI.Conductivity mem_conductivity_ref "S/m, Membrane conductivity reference value at T_std,Espinosa 2018; typically [0.058,0.096]S/cm, 283(Agbli 2011)";

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  //Ohmic Overpotential
  mem_conductivity = mem_conductivity_ref*exp(-(E_pro/const.R)*((1/T_op) - (1/T_std))); //Units S/m ; used in Espinosa 2018

  annotation (
    defaultConnectionStructurallyInconsistent=true,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>This is a model for PEM conductivity.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>PEM Conductivity as modeled by Espinosa-Lopez et al, 2018.</p>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>Original model developed and validated in the range of 20-60 &deg;C with operating pressure of 15-35 bar. </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
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
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-ZSxD5FBg.png\" alt=\"lambda_ref\"/></p></td>
<td><p>reference conductivity of membrane</p></td>
<td><p>mem_conductivity_ref</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-G5aWG9PG.png\" alt=\"E_pro\"/></p></td>
<td><p>chemical potential </p></td>
<td><p>E_pro</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-AJQJT737.png\" alt=\"R\"/></p></td>
<td><p>molar gas constant</p></td>
<td><p>Modelica.Constants.R</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-UWblB0X6.png\" alt=\"T_op\"/></p></td>
<td><p>operating stack temperature</p></td>
<td><p>T_op</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-oUFg4WAG.png\" alt=\"T_std\"/></p></td>
<td><p>STD temperature</p></td>
<td><p>T_std</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-beZltq55.png\" alt=\"lambda_mem = lambda_ref*exp(-(E_pro/R)*((1/T_op) - (1/T_std)))\"/></p>
<h4><span style=\"color: #008000\">Validation</span></h4>
<p>Results have been validated against Espinosa-L&oacute;pez et al 2018 published figures. </p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>Manuel Espinosa-L&oacute;pez, Philippe Baucour, Serge Besse, Christophe Darras, Raynal Glises, Philippe Poggi, Andr&eacute; Rakotondrainibe, and Pierre Serre-Combe. Modelling and experimental validation of a 46 kW PEM high pressure water electrolyser. <i>Renewable Energy, </i>119, pp. 160-173, 2018. doi: <a href=\"https://doi.org/10.1016/J.RENENE.2017.11.081\">10.1016/J.RENENE.2017.11.081</a>. </p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by John Webster (jcwebste@edu.uwaterloo.ca) October 2018.</p>
</html>"));
end PEMconductivity1;
