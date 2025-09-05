within TransiEnt.Components.Boundaries.FluidFlow;
model FluidSource "Mass flow boundary for new connector"

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
  extends TransiEnt.Basics.Icons.BoundaryVLE_flow;
  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.MassFlowRate m_flow = 1 "Mass flow rate (unused)";
  parameter SI.SpecificEnthalpy h = 60 * 4200 "Specific enthalpy of outgoing mass flow rate (unused)";
  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple port_a annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput m_flow_in  annotation (
    Placement(visible = true, transformation(origin={-80,30},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,30},    extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput h_in  annotation (
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,-20},    extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  port_a.h_outflow = h_in;

  port_a.m_flow = -m_flow_in;

  annotation (                                                                                                                   Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A simple model of a fluid source that can be used as a boundary for fluid simulations. It consists of a fluid outlet. A mass flow flowing out or into the component is set with a RealInput. If the RealInput of the mass flow has a positive sign, the mass flow is flowing out of the boundary. A specific enthalpy is set with a RealInput.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>port_a: fluid outlet</p>
<p>h_in: RealInput for the specifici enthalpy that shall be set</p>
<p>m_flow_in: RealInput for the mass flow rate that is set</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) January 2025</p>
</html>"));
end FluidSource;
