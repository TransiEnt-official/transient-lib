within TransiEnt.Components.Electrical.Grid.Check;
model Check_PiModelComplexEfficient3ph
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
//________________________________________________________________________________//  extends TransiEnt.Basics.Icons.Checkmodel;

  PiModelComplexEfficient3ph piModelComplexEfficient3ph(
    length=1,
    r(displayUnit="Ohm/m") = 0.0002067,
    x(displayUnit="Ohm/m") = 8.0425e-05,
    b(displayUnit="S/m") = 2.60752e-07,
    i_n(displayUnit="A") = 275) annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Boundaries.Electrical.ComplexPower.SlackBoundary slackBoundary(v_gen=400, f_n=50) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={-80,0})));
  Boundaries.Electrical.ComplexPower.PQBoundary pQBoundary(v_n=400) annotation (Placement(transformation(extent={{60,-20},{100,20}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=2e3,
    duration=7200,
    offset=1e3,
    startTime=3600) annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Sources.Ramp ramp_Q(
    height=1e3,
    duration=3600,
    startTime=7200) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,90})));
equation
  connect(ramp.y, pQBoundary.P_el_set) annotation (Line(points={{41,50},{68,50},{68,24}}, color={0,0,127}));
  connect(ramp_Q.y, pQBoundary.Q_el_set) annotation (Line(points={{41,90},{92,90},{92,24}}, color={0,0,127}));
  connect(pQBoundary.epp, piModelComplexEfficient3ph.epp_n) annotation (Line(
      points={{60,0},{20,0}},
      color={28,108,200},
      thickness=0.5));
  connect(piModelComplexEfficient3ph.epp_p, slackBoundary.epp) annotation (Line(
      points={{-20,0},{-60,0}},
      color={28,108,200},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=14400, __Dymola_Algorithm="Dassl"));
end Check_PiModelComplexEfficient3ph;
