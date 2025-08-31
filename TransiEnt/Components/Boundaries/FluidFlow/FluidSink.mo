within TransiEnt.Components.Boundaries.FluidFlow;
model FluidSink "Pressure boundary for new connector"

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
  //          Imports and Class Hierarchy
  // _____________________________________________

  import         Modelica.Units.SI;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.Pressure p = 1e5 "Pressure in the sink (unused)";
  parameter SI.SpecificEnthalpy h = 60 * 4200 "Specific enthalpy of the water going out of the sink";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple port_a annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput p_in annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={100,0}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={80,-2})));

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  port_a.h_outflow = h;
  port_a.p = p_in;
  annotation (
    Icon(graphics={  Rectangle(fillColor = {85, 85, 0}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A simple model of a fluid sink that is used for fluid simulations. It consists of a fluid inlet. A pressure is set with a RealInput. A specific enthalpy is set with a RealInput.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>port_a: fluid outlet</p>
<p>h_in: RealInput for the specifici enthalpy that shall be set</p>
<p>p_in: RealInput for the pressure that is set [in Pa]</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end FluidSink;
