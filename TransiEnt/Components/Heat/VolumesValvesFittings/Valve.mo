within TransiEnt.Components.Heat.VolumesValvesFittings;
model Valve "Valve model. Extends from ClaRa ValveVLE_L1"



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




  extends ClaRa.Components.VolumesValvesFittings.Valves.GenericValveVLE_L1;
  extends TransiEnt.Basics.Icons.Valve;

  annotation (Icon(graphics,
                   coordinateSystem(extent={{-100,-50},{100,70}}, initialScale=0.1)), Diagram(graphics,
                                                                                              coordinateSystem(extent={{-100,-50},{100,70}}, initialScale=0.1)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a valve, which is used to model a pressure loss. The model uses a steady mass balance and a replaceable pressure loss model. No heat losses are considered, and therefore, the specific enthalpy doesn&rsquo;t change over the valve. An optional input for the opening of the valve is available (0= completely closed, 1=open). </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>static model of a valve. The level of detail depends on the chosen pressure loss model. </p>
<ul>
<li>pressure loss</li>
<li>variable fluid properties</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>Only valid for static issues. </p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Images/Schemes/Valve.jpg\"/></p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-MOWAYCTK.png\" alt=\"0=m_in+m_out\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-DczccXEk.png\" alt=\"h_in=h_out\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-quOP81Oj.png\" alt=\"p_in-p_out=delta_p\"/></p>
<p>delta_p is calculated according to the chosen pressure loss model and the opening of the valve</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was extended from the ClaRa library.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model documented by Jan Westphal (j.westphal@tuhh.de) in January 2025</p>
</html>"));
end Valve;
