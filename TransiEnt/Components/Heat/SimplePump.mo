within TransiEnt.Components.Heat;
model SimplePump "Simple model of a pump"

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

  import   Modelica.Units.SI;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.Density rho = 1000 "Density of the fluid";
  parameter Real eta_mech=0.98;
  parameter Real eta_el=0.97;
  parameter Real delta_p_eps=100 "small pressure difference for linearization around zero";

  // _____________________________________________
  //
  //             Variables
  // _____________________________________________

  SI.PressureDifference delta_p;
  SI.VolumeFlowRate V_flow;
  SI.Power P_hyd;
  SI.Power P_el;

  // _____________________________________________
  //
  //         Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-98,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-102,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={102,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput m_flow annotation (
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-94, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation

  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

inlet.m_flow+outlet.m_flow=0;
outlet.p-inlet.p=delta_p;
V_flow= P_hyd/(delta_p+delta_p_eps);
inlet.m_flow=m_flow;
P_el=P_hyd/eta_mech/eta_el;
m_flow=V_flow*rho;
inlet.h_outflow = inStream(outlet.h_outflow);
outlet.h_outflow = inStream(inlet.h_outflow);

  annotation (Icon(graphics={Ellipse(
          extent={{100,-100},{-100,100}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>This model represents a fluid pump. It is a simple model of a pump that can be used to calculate the electric power necessary to set a given mass flow rate. It uses a static mass and momentum balance. No enthalpy changes over the pump are considered.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>The model was changed to work with changing compositions and a constant electrical efficiency was added. Also, more inputs are available. </p>
<ul>
<li>mechanical and electrical efficiency of the pump</li>
<li>no enthalpy changes over the pump considered</li>
<li>constant fluid properties</li>
<li>static mass balance</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>Only valid for fluids and positive pressure differences. Variable efficiencies and time-dependent behavior are not considered.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>m_flow: input for mass flow rate in kg/s</p>
<p>inlet: for inflowing fluid</p>
<p>outlet: for outflowing fluid</p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>Mass balance: m_in+m_out=0</p>
<p>V_flow=m_flow/rho</p>
<p>P_el=P_hyd/eta_mech/eta_el</p>
<p>V_flow=P_hyd/delta_p; (delta_p is normally given by the fluid ports, m_flow is an input, therefore V_flow is known)</p>
<p><br>The electrical power is determined using the mechanical and electrical efficiencies.</p>
<h4><span style=\"color: #008000\">Validation</span></h4>
<p>The model was verified in this publication:</p>
<p>[1] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was used in several publications:</p>
<p>[1] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<p>[2]Vieth, J.; Westphal, J.; Speerforck, A.; District heating network topology optimization and optimal co-planning using dynamic simulations; Advances in Applied Energy; 2025</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model created by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end SimplePump;
