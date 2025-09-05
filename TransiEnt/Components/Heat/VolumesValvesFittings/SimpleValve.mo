within TransiEnt.Components.Heat.VolumesValvesFittings;
model SimpleValve "Simple valve model for calculating a mass flow rate out of a given pressure difference, linear pressure loss, simple fluid ports"

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
  // _____________________________________________
  //
  //          Import and Hierachy
  // _____________________________________________

 import         Modelica.Units.SI;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

 parameter SI.Pressure delta_p_nom "Nominal pressure drop in the valve";
 parameter Real OpeningValve = 0.2 "Opening of the valve between 0 and 1 (unused)";
 parameter SI.MassFlowRate m_flow_nom = 1 "Nominal mass flow rate of the water";
 parameter Boolean useValveInput = true;
 parameter Boolean checkValve=false;

  // _____________________________________________
  //
  //             Variables
  // _____________________________________________

 SI.MassFlowRate m_flow;

  // _____________________________________________
  //
  //         Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
 Modelica.Blocks.Interfaces.RealInput OpeningValveIn  annotation (
   Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation

  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

 //Pressure loss in dependance of the valve opening
 if useValveInput then
   m_flow = OpeningValveIn * m_flow_nom / delta_p_nom * (inlet.p - outlet.p);
 else
   m_flow = OpeningValve * m_flow_nom / delta_p_nom * (inlet.p - outlet.p);
 end if;
 //Mass balance
 0 = inlet.m_flow + outlet.m_flow;
 inlet.m_flow = m_flow;
 //Connectors
  inlet.h_outflow = inStream(outlet.h_outflow);
  outlet.h_outflow = inStream(inlet.h_outflow);
 annotation (
   Icon(graphics={  Line(points = {{-100, 60}, {100, -60}, {100, 60}, {-100, -60}, {-100, 58}, {-100, 60}, {-100, 60}})}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A simple model of a valve with two fluid ports. The pressure loss is dependent on the opening of the valve. The opening of the valve is defined by a Real Input with values between 0 and 1. The pressure loss over the pipe can be influenced by changing the parameters m_flow_nom or delta_p_nom.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in the CodingConventions)</p>
<ul>
<li>static mass balance</li>
<li>constant fluid properties</li>
<li>static energy balance, isenthalp</li>
<li>linear pressure loss depending on the opening of the valve</li>
</ul>
<h4><span style=\"color: #008c48\">Interfaces</span></h4>
<h4><span style=\"color: #008c48\">Governing Equations</span></h4>
<p>m_flow&nbsp;=&nbsp;OpeningValveIn&nbsp;*&nbsp;m_flow_nom&nbsp;/&nbsp;delta_p_nom&nbsp;*&nbsp;(inlet.p&nbsp;-&nbsp;outlet.p)</p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model was used and verified in the following publication:</p>
<p>[1] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end SimpleValve;
