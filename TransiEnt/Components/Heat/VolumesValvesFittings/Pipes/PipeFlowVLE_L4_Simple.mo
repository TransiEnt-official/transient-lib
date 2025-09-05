within TransiEnt.Components.Heat.VolumesValvesFittings.Pipes;
model PipeFlowVLE_L4_Simple "Model for simulating a pipe flow with a VLE-fluid"



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



  extends ClaRa.Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L4_Simple;
  extends TransiEnt.Basics.Icons.PipeFlow_L4_Simple;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A simple model of a pipe flow with a VLE-fluid (Vapor liquid equilibrium) based on the three balance equations of energy, momentum and mass. The mass and the energy balance are dynamic, while the momentum balance is considered static. The balance equations are discretized with a finite volume method. The model uses n+2 fluid models from the TIL media to compute the fluid states at the inlet, outlet, and inside the control volumes of the pipe. Moreover, it uses a replaceable pressure loss model and a replaceable heat transfer model. Therefore, heat and pressure losses are considered. Heat losses are transferred through a heat port if the heat port is connected. However, the heat port doesn&rsquo;t have to be connected for the model to function. The pipe model can be connected to other models via two fluid ports, which pass the pressure, the specific enthalpy, the mass fraction and the mass flow rate as variables. The model allows reverse flow. In the model are instances of iCom and summary, which are not relevant for the physical understanding of the model. </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4 (defined in the CodingConventions)</p>
<ul>
<li>Heat losses</li>
<li>Pressure losses </li>
<li>Thermal inertia</li>
<li>Variable fluid properties</li>
<li>Mass storage due to density changes</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>The accuracy of the dynamic effects of the model depends on the number of control volumes. The thermal inertia of the pipe wall is neglected. </p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Images/Schemes/PipeL4.jpg\"/></p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>The equations have been simplified for easier description of the model.</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-IlkpaYwK.png\" alt=\"V*rho*(dh/dt)=m_in*h_in+m_out*h_out+Q_flow_out-V*(dp/dt)\"/> (for N_cv control volumes)</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-8ljTUMOU.png\" alt=\"drho/dt=m_in+m_out \"/> (for N_cv control volumes)</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-pUPGVr2z.png\" alt=\"p_in-p_out=delta_p\"/>(for N_cv control volumes)</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-0UuHRCpm.png\" alt=\"drho/dt=a*(dh/dt)+b*(dp/dt)+c*(dxi/dt)
 \"/>(The density change is calculated with the TIL media fluid model. Last term is alway zero as the mass fraction doesn&apos;t change)</p>
<p>T and rho are determined with the fluid models</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>This model is extended from the ClaRa library. Look at the documentation of the ClaRal library for more information.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was documented by Jan Westphal january 2025 (j.westphal@tuhh.de)</p>
</html>"));
end PipeFlowVLE_L4_Simple;
