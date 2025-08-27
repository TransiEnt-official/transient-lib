within TransiEnt.Components.Heat.VolumesValvesFittings.Fittings;
model Split "Simple model of a split with linear pressure loss, static mass balance and dynamic energy balance"

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
// Gas- und WÃ¤rme-Institut Essen                                                  //
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

  parameter SI.MassFlowRate m_flow_nom = 1 "Nominal mass flow rate of the water";
  parameter SI.PressureDifference delta_p_nom = 0.1e1 "Nominal pressure drop in the junction";
  parameter SI.Volume V = 0.005 "Volume of the junction";
  parameter SI.Density rho = 983 "Density of the junction";

  // _____________________________________________
  //
  //             Variables
  // _____________________________________________

  SI.SpecificEnthalpy h(start = 60*4200,nominal=60*4200);
  SI.Pressure p;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.inlet inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.outlet outlet1 annotation (Placement(
      visible=true,
      transformation(
        origin={0,100},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,98},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.outlet outlet2 annotation (Placement(
      visible=true,
      transformation(
        origin={0,-100},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,-100},
        extent={{-10,-10},{10,10}},
        rotation=0)));

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  //Energy balance
  V * rho * der(h) =inlet.m_flow*actualStream(inlet.h_outflow) + outlet1.m_flow*actualStream(outlet1.h_outflow) + outlet2.m_flow*actualStream(outlet2.h_outflow);
  //Static momentum balance
  p - outlet1.p =  -outlet1.m_flow * delta_p_nom / m_flow_nom;
  p - outlet2.p =  -outlet2.m_flow * delta_p_nom / m_flow_nom;
  inlet.p-p=inlet.m_flow*delta_p_nom/m_flow_nom;
  //Static mass balance
  0 = inlet.m_flow + outlet1.m_flow + outlet2.m_flow;
  //Connectors
  h =outlet1.h_outflow;
  h =outlet2.h_outflow;
  h =inlet.h_outflow;

  annotation (
    Icon(graphics={  Rectangle(origin = {-1, 0}, fillColor = {85, 85, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-39, 100}, {41, -100}}), Rectangle(origin = {-30, -10}, fillColor = {85, 85, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-70, 50}, {70, -30}})}, coordinateSystem(initialScale = 0.1)), Documentation(info="<html>
<p><br><b><span style=\"color: #008000;\">Purpose of model</span></b></p>
<p>A model of a split/join that is used to split or join mass flow rates in a hydraulic circuit. It is based on the three balance equations of mass, energy, and momentum. It is not discretized and only features one control volume. No heat losses are considered, but a linear pressure loss model is implemented. The model is mainly used for the simulation of district heating networks.</p>
<p>The model is used as a junction in district heating networks and dwelling heat systems.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in the CodingConventions)</p>
<ul>
<li>linear pressure loss</li>
<li>thermal intertia</li>
<li>constant fluid properties</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>The volume of the split has to be known. Moreover, the chosen pressure loss model has to fit the investigation purpose.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>The equations have been simplified for an easier description of the model.</p>
<p><br>The equations have been simplified for an easier description of the model.</p>
<p>V*rho*dh/dt=m_in*h_in+m_out1*h_out1+m_out2*h_out2</p>
<p>p_in-p=delta_p(m_flow_in)</p>
<p>p-p_out1=delta_p(m_flow_out1)</p>
<p>p-p_out2=delta_p(m_flow_out2)</p>
<p>0=m_flow_in+m_flow_out1+m_flow_out2</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was used and verified in the following publication:</p>
<p>[1] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end Split;
