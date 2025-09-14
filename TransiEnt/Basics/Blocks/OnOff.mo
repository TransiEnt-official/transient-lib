within TransiEnt.Basics.Blocks;
model OnOff "OnOff - Latching on/off with minimum hold times"

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
// Gas- und WÃ¤rme-Institut Essen                                                  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter Modelica.Units.SI.Time t_holdOff=60
    "Time while the off state is locked";

  parameter Modelica.Units.SI.Time t_holdOn=30
    "Time while the on state is locked";

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------

  Modelica.Blocks.Interfaces.BooleanInput request
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

  discrete Modelica.Blocks.Interfaces.BooleanOutput signal
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

  discrete Modelica.Blocks.Interfaces.BooleanOutput blocked
    "True if heat pump state is blocked (on or off state)" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-100})));

  discrete Modelica.Blocks.Interfaces.BooleanOutput blocked_on
    "True if heat pump state is blocked at on state" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-100})));

  discrete Modelica.Blocks.Interfaces.BooleanOutput blocked_off
    "True if heat pump state is blocked at off state" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-100})));

  // ------------------------------------------------------------------------------------------
  //   Variables
  // ------------------------------------------------------------------------------------------

  discrete Modelica.Units.SI.Time t_lastChange;

  // ------------------------------------------------------------------------------------------
  //   Equations
  // ------------------------------------------------------------------------------------------

initial equation
  // initial request
  signal = request;

  // assume that a change is directly possible after simulation start
  t_lastChange = -t_holdOff;
  blocked = false;
  blocked_on = false;
  blocked_off = false;

algorithm
  when request and not pre(signal) and not pre(blocked) then
     signal :=true;
     blocked :=true;
     blocked_on :=true;
     t_lastChange :=time;
  elsewhen not request and pre(signal) and not pre(blocked) then
     signal :=false;
     blocked :=true;
     blocked_off :=true;
     t_lastChange :=time;
  end when;

  // block after a state change, and unblock after edge specific time
  when not pre(signal) and time > pre(t_lastChange) + t_holdOff then
    blocked :=false;
    blocked_off :=false;
  elsewhen pre(signal) and time > pre(t_lastChange) + t_holdOn then
    blocked :=false;
    blocked_on :=false;
  end when;

end OnOff;
