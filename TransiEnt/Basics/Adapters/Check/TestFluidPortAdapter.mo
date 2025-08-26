within TransiEnt.Basics.Adapters.Check;
model TestFluidPortAdapter "Test model for fluid port adapter"

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
  //          Import and Class Hierachy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Checkmodel;


  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1) annotation (Placement(transformation(extent={{-106,-7},{-86,13}})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_pTxi boundaryVLE_pTxi(variable_p=true) annotation (Placement(transformation(extent={{66,-10},{46,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=60*4186) annotation (Placement(transformation(extent={{-106,-21},{-86,-1}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1e5) annotation (Placement(transformation(extent={{106,-5},{86,15}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{58,72},{78,92}})));
equation
  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(source.port_a, fluidPortAdapter.fluidPortIn) annotation (Line(points={{-56,0},{-10,0}}, color={0,0,0}));
  connect(boundaryVLE_pTxi.fluidPortIn, fluidPortAdapter.fluidPortOut) annotation (Line(
      points={{46,0},{10,0}},
      color={175,0,0},
      thickness=0.5));
  connect(realExpression.y, source.m_flow_in) annotation (Line(points={{-85,3},{-74,3}}, color={0,0,127}));
  connect(realExpression1.y, source.h_in) annotation (Line(points={{-85,-11},{-80,-11},{-80,-2},{-74,-2}}, color={0,0,127}));
  connect(realExpression2.y, boundaryVLE_pTxi.p) annotation (Line(points={{85,5},{74.5,5},{74.5,6},{66,6}}, color={0,0,127}));
  annotation (                              Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A test model for the fluid adapter. Two boundaries are connected to eacht other via the adapter. Compare the pressure, the mass flow rate and the specific enthalpies for verification.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end TestFluidPortAdapter;
