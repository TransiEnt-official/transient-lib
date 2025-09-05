within TransiEnt.Components.Heat.VolumesValvesFittings.Fittings;
model Junction "Simple model of a junction with no pressure loss, static mass balance and dynamic energy balance"

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
  //          Visible Parameters
  // _____________________________________________

  parameter Integer n_ports=3 "number of edges this junction is connected to";
  parameter SI.MassFlowRate m_flow_nom = 1 "Nominal mass flow rate of the water";
  parameter SI.PressureDifference delta_p_nom = 0.1e1 "Nominal pressure drop in the junction";
  parameter SI.Volume V = 0.005 "Volume of the junction";
  parameter SI.Density rho = 983 "Density of the water";

  // _____________________________________________
  //
  //          Variables
  // _____________________________________________

  SI.SpecificEnthalpy h(start = 60*4200, nominal=4200*60);
  SI.Pressure p;

  // _____________________________________________
  //
  //         Instances of other classes
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple fluidPort[n_ports] annotation (Placement(
      visible=true,
      transformation(extent={{-10,-10},{10,10}}, rotation=0),
      iconTransformation(
        origin={-2,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  // _____________________________________________
  //
  //       Characteristic Equations
  // _____________________________________________

  //Energy balance
  V * rho * der(h) = sum(fluidPort[i].m_flow*actualStream(fluidPort[i].h_outflow) for i in 1:n_ports);
  //Mass balance
  0 = sum(fluidPort[i].m_flow for i in 1:n_ports);
  //No pressure loss
  for i in 1:n_ports loop
    fluidPort[i].p = p;
    fluidPort[i].h_outflow = h;
  end for;


  annotation (
    Icon(graphics={  Rectangle(origin = {-1, 0}, fillColor = {85, 85, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-39, 100}, {41, -100}}), Rectangle(origin = {30, -10}, fillColor = {85, 85, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-70, 50}, {70, -30}})}, coordinateSystem(initialScale = 0.1)), Documentation(info="<html>
<p><br><b><span style=\"color: #008000;\">Purpose of model</span></b></p>
<p>A model of a split/join that is used to split or join mass flow rates in a hydraulic circuit. It is based on the three balance equations of mass, energy, and momentum. It is not discretized and only features one control volume. No heat losses and no pressure losses are considered. The model is mainly used for the simulation of district heating networks.</p>
<p>The model is used as a junction in district heating networks and dwelling heat systems. It contains n-ports. The number of ports can be set by the user.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in the CodingConventions)</p>
<ul>
<li>No pressure losses considered</li>
<li>Consideration of thermal inertia</li>
<li>Constant fluid properties</li>
<li>Static mass balance</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>The volume of the split has to be known. </p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>The equations have been simplified for an easier description of the model.</p>
<p>V*rho*dh/dt=m_in*h_in+m_out1*h_out1+m_out2*h_out2</p>
<p>0=m_flow_in+m_flow_out1+m_flow_out2</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was used in the following publication:</p>
<p>[1]Vieth, J.; Westphal, J.; Speerforck, A.; District heating network topology optimization and optimal co-planning using dynamic simulations; Advances in Applied Energy; 2025</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end Junction;
