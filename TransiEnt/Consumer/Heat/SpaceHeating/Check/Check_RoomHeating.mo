within TransiEnt.Consumer.Heat.SpaceHeating.Check;
model Check_RoomHeating

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
  extends TransiEnt.Basics.Icons.Checkmodel;

  parameter Real k_P = 10000 "Gain of PI controller";
  parameter Real k_Ti=3000 "Integrator time constant of PI controller";
  parameter Modelica.Units.SI.Temperature T_amb = 273.15 + 10;

  RoomHeating roomHeating(
    U_total=0.35,
    k_P=k_P,
    k_Ti=k_Ti,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    PI(
      controllerType=Modelica.Blocks.Types.SimpleController.PI,
      k=k_P,
      Ti=k_Ti,
      Ni=0.2)) annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
  Modelica.Blocks.Sources.RealExpression T_amb_(y=T_amb)
    annotation (Placement(transformation(extent={{-90,-16},{-64,4}})));
  Modelica.Blocks.Sources.Step           T_room_set(
    height=2,
    offset=273.15 + 21,
    startTime=86400/2)
    annotation (Placement(transformation(extent={{-88,18},{-66,40}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-48,-50},{-28,-30}})));
  Modelica.Blocks.Sources.RealExpression T_stor(y=273.15 + 40)
    annotation (Placement(transformation(extent={{-90,-50},{-64,-30}})));
equation

  connect(T_amb_.y, roomHeating.T_amb)
    annotation (Line(points={{-62.7,-6},{-10.8,-6}}, color={0,0,127}));
  connect(T_room_set.y, roomHeating.T_room_set)
    annotation (Line(points={{-64.9,29},{-18,29},{-18,10},{-10.6,10}},
                                                     color={0,0,127}));
  connect(prescribedTemperature.port, roomHeating.heatPort_supply)
    annotation (Line(points={{-28,-40},{0,-40},{0,-7.8}}, color={191,0,0}));
  connect(prescribedTemperature.T, T_stor.y)
    annotation (Line(points={{-50,-40},{-62.7,-40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end Check_RoomHeating;
