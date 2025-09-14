within TransiEnt.Components.Boundaries.Heat.Check;
model Test_Heatflow_L1 "Model for testing Heatflow_L1"




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
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Checkmodel;

  // _____________________________________________
  //
  //           Instances of other Classes
  // ____________________________________________

  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  TransiEnt.Components.Boundaries.Heat.Heatflow_L1 constantHeatflow_L1_1(
    p_drop=0,
    use_Q_flow_in=true,
    change_sign=false) annotation (Placement(transformation(extent={{12,22},{32,42}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=-100e3) annotation (Placement(transformation(extent={{-16,40},{4,60}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(extent={{-30,-4},{-10,16}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=1)     annotation (Placement(transformation(extent={{-86,-1},{-66,19}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=400e3) annotation (Placement(transformation(extent={{-86,-17},{-66,3}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink fluidSink(h=400e3) annotation (Placement(transformation(extent={{68,-30},{48,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1000000)
                                                                  annotation (Placement(transformation(extent={{92,-30},{72,-10}})));
equation

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(realExpression.y, constantHeatflow_L1_1.Q_flow_prescribed) annotation (Line(points={{5,50},{10,50},{10,40},{16,40}},     color={0,0,127}));
  connect(realExpression1.y, fluidSource.m_flow_in) annotation (Line(points={{-65,9},{-28,9}}, color={0,0,127}));
  connect(realExpression2.y, fluidSource.h_in) annotation (Line(points={{-65,-7},{-36,-7},{-36,4},{-28,4}}, color={0,0,127}));
  connect(realExpression3.y, fluidSink.p_in) annotation (Line(points={{71,-20},{66,-20}}, color={0,0,127}));
  connect(fluidSource.port_a, constantHeatflow_L1_1.fluidPortIn) annotation (Line(points={{-10,6},{16,6},{16,22}}, color={0,0,0}));
  connect(fluidSink.port_a, constantHeatflow_L1_1.fluidPortOut) annotation (Line(points={{48,-20},{28,-20},{28,22}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for Heatflow_L1. This model contains the necessary components and connections for simulating the heatflow model</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end Test_Heatflow_L1;
