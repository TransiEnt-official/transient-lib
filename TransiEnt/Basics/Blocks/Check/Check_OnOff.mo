within TransiEnt.Basics.Blocks.Check;
model Check_OnOff

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

  OnOff                                           onOff
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
protected
  discrete Modelica.Blocks.Interfaces.BooleanInput state;

initial equation
  state = false;
equation
  when time > 5 then
    state = true;
  elsewhen time > 15 then
    state = false;
  elsewhen time > 90 then
    state = true;
  elsewhen time > 150 then
    state = false;
  elsewhen time > 210 then
    state = true;
  elsewhen time > 300 then
    state = false;
  elsewhen time > 301 then
    state = true;
  end when;

  connect(state, onOff.request);

  annotation (experiment(StopTime=420, __Dymola_Algorithm="Dassl"), Diagram(
        graphics={Text(
          extent={{-66,94},{70,50}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Check OnOff Block

Variable \"state\" (assigned in equation part) creates
a defined signal with on and off events. Dependent
on the switching frequency, the state is on hold."), Text(
          extent={{-66,54},{38,24}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="See \"state\" and \"onOff.signal\"")}));
end Check_OnOff;
