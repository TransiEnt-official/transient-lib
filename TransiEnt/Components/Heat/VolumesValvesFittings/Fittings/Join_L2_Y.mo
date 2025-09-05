within TransiEnt.Components.Heat.VolumesValvesFittings.Fittings;
model Join_L2_Y "Join model extended from the ClaRa library"



//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 3.0.0                             //
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



  extends ClaRa.Components.VolumesValvesFittings.Fittings.JoinVLE_L2_Y;
  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,32},{100,-32}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-32,100},{32,-32}},
          lineColor={28,108,200},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-24,92},{24,-24}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-92,24},{92,-24}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a split/join that is used to split or join mass flow rates in a hydraulic circuit. It is based on the three balance equations of mass, energy, and momentum. It is not discretized and only features one control volume. No heat losses are considered, but a replaceable pressure loss model is implemented. It contains four fluid models from the TIL media that are used to determine the states of the fluid from the specific enthalpy, the mass fractions of the components of the fluid, and the pressure. </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in the CodingConventions)</p>
<ul>
<li>pressure loss</li>
<li>thermal intertia</li>
<li>variable fluid properties</li>
<li>mass storages due to density changes</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>The volume of the split has to be known. Moreover, the chosen pressure loss model has to fit the investigation purpose.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>The model of the split and the join are similiar.</p>
<p><img src=\"modelica://TransiEnt/Images/Schemes/Split.jpg\"/></p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>The equations have been simplified for an easier description of the model.</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-oBLcMls4.png\" alt=\"V*rho*(dh/dt)=m_in*h_in+m_out1*h_out1+m_out2*h_out2\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-FXzuPWqq.png\" alt=\"p_in-p=delta_p(m_flow_in)\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-6uUzFAZS.png\" alt=\"p-p_out1=delta_p(m_flow_out1)\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-J9bMsL8m.png\" alt=\"p-p_out2=delta_p(m_flow_out2)\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-10JezSRV.png\" alt=\"drho/dt*V=m_flow_in+m_flow_out1+m_flow_out2\"/></p>
<p>delta_p is calculated according to the chosen pressure loss model and depends on the mass flow through the inlet/outlet. </p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was extended from the ClaRa library.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was documented by Jan Westphal (j.westphal@tuhh.de) in January 2025</p>
</html>"));
end Join_L2_Y;
