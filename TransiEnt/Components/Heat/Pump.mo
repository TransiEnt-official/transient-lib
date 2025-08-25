within TransiEnt.Components.Heat;
model Pump "Pump model. Extends from ClaRa Pump_L2_shaftQuadratic"



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




  extends ClaRa.Components.TurboMachines.Pumps.PumpVLE_L2_affinity;
  extends TransiEnt.Basics.Icons.Pump;
  annotation (Icon(graphics={
        Text(
          extent={{-22,-58},{22,-100}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="L2")}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>This model is a combination of a fluid volume L2 and a pump model that can be used to calculate the efficiency and the needed power of a pump. It contains two fluid ports to model the fluid flow through the pump. Both fluid ports should be connected with a port that sets the pressure. The volume flow rate can then be calculated via the given pressure difference. &nbsp;A static mass and momentum balance are used. The specific enthalpy at the outlet of the pump is calculated via an isentropic dependence. There are no changes of composition in this component. The model does not support flow reversal. </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in CodingConventions)</p>
<ul>
<li>Thermal inertia</li>
<li>Variable fluid properties</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>Reverse flow is not supported</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Images/Schemes/Pump2.jpg\"/></p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was extended from the ClaRa library. Look there for further documentation or verfication.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was documented by Jan Westphal (j.westphal@tuhh.de) in January 2025</p>
</html>"));
end Pump;
