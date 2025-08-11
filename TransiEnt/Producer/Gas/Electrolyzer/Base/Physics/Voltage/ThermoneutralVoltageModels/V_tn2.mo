within TransiEnt.Producer.Gas.Electrolyzer.Base.Physics.Voltage.ThermoneutralVoltageModels;
model V_tn2 "PEM V_tn voltage as modeled by Allebrod et al 2013"




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
  extends TransiEnt.Producer.Gas.Electrolyzer.Base.Physics.Voltage.ThermoneutralVoltageModels.PartialThermoneutralVoltageModel;

  import      Modelica.Units.SI;

  // _____________________________________________
  //
  //              Variables
  // _____________________________________________

public
  outer SI.Voltage V_tn "Thermoneutral voltage- at which net heat is 0";

  //Temperature
  outer SI.Temperature T_op "Operating stack temperature";

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  V_tn = 1.485 - 1.49E-4*T_op - 9.84E-8*T_op^2; //Allebrod et al 2013

  annotation (
    defaultConnectionStructurallyInconsistent=true,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>This is a model for thermoneutral voltage of electrolysis.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>Voltage is modeled according to Garc&iacute;a-Valverde et al, 2012 . Voltage depends on stack temperature.</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td><h4>Variable or Parameter</h4></td>
<td><h4>Explanation</h4></td>
<td><h4>Definition in model</h4></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-Yz3amnXv.png\" alt=\"V_tn\"/></p></td>
<td><p>thermoneutral voltage at which net heat is zero</p></td>
<td><p>V_tn</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-p1e7q3cM.png\" alt=\"T_op\"/></p></td>
<td><p>operational stack temperture</p></td>
<td><p>T_op</p></td>
</tr>
</table>
<p><br><h4><span style=\"color: #008000\">Governing Equations</span></h4></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-FX1idsxg.png\" alt=\"V_tn = 1.485 - 1.49E-4*T_op - 9.84E-8*T_op^2\"/></p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>R. Garc&iacute;a-Valverde, N. Espinosa, and A. Urbina. Simple PEM water electrolyzer model and experimental validation. International Journal of Hydrogen Energy, 37(2):1927-1938, 2012. doi:10.1016/j.ijhydene.2011.09.027. </p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by John Webster (jcwebste@edu.uwaterloo.ca) October 2018.</p>
</html>"));
end V_tn2;
