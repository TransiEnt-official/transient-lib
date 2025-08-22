within TransiEnt.Components.Heat;
model HeatFlowMultiplier "Heat Flow Multiplier"



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
  //              Visible Parameters
  // _____________________________________________

  parameter Real factor=1 "Factor with which the heat flow rate is supposed to be scaled";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________
equation
  port_a.T=port_b.T;
  port_b.Q_flow=-factor*port_a.Q_flow;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Polygon(
          points={{-10,80},{10,80},{40,-80},{-40,-80},{-10,80}},
          lineColor={191,0,0},
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>The model contains to heat ports. It simply multiplies the heat flow at port_a with a given factor to determin the heat flow at port b. The temperature of the heat flow doesn&apos;t change. </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>It is a purely technical component. No physical behaviour is considered. </p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>port_a: input heat flow to be multiplied</p>
<p>port_b: output heat flow (multiplied)</p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-pWZrhxqu.png\" alt=\"-factor*Q_flow_a=Q_flow_b\"/></p>
<h4><span style=\"color: #008000\">Remarks for Usage</span></h4>
<p>This model can lead to unphysical behavior since it contains an invalid energy balance.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model created by Carsten Bode (c.bode@tuhh.de), Jun 2019</p>
<p>Model documented by Jan Westphal (j.westphal@tuhh.de) January 2025</p>
</html>"));
end HeatFlowMultiplier;
