within TransiEnt.Components.Heat;
model HeatExchanger_TubeBundle_L2 "Simple heat exchanger model"



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




  extends ClaRa.Components.HeatExchangers.TubeBundle_L2;
  extends TransiEnt.Basics.Icons.Heat_Exchanger;
  annotation (Icon(graphics={
        Text(
          extent={{-40,-58},{40,-100}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="L2")}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a tube bundle heat exchanger with one control volume. It is based on the fluid volume L2 from the ClaRa library. Therefore, it is based on the three balance equations of mass, energy and momentum. The model uses a dynamic energy and mass balance and a static momentum balance. &nbsp;It contains two fluid ports for the transport of a heat carrier medium through the heat exchanger and a heat port. The transported heat is transferred through the heat port. In the geometry model, the areas are calculated. The model uses three fluid models from the TIL media to compute the states of the fluid at the inlet, outlet and inside the control volumes of the heat exchanger. </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in the CodingConventions)</p>
<ul>
<li>Thermal inertia</li>
<li>Pressure loss</li>
<li>Physical or generic heat transfer</li>
<li>Mass (density) changes</li>
<li>variable fluid properties</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>Simplified equations for an easier description of the model.</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-L1rYvkbj.png\" alt=\"rho*V*(dh/dt)=m_in*h_in+m_out*h_out+Q_flow-V*(dp/dt)\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-zMs5Xgjs.png\" alt=\"d*rho/dt*V=m_in+m_out\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-yF4JQdyM.png\" alt=\"p_in-p_out=dp\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-NT4T5B8f.png\" alt=\"Q_flow=alpha*A*dT\"/></p>
<p>dp and alpha are calculated by the chosen pressure loss and the chosen heat transfer model.</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was extended from the ClaRa library. Look there for further documentation or verification.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>The model was documented by Jan Westphal (j.westphal@tuhh.de) in January 2025</p>
</html>"));
end HeatExchanger_TubeBundle_L2;
