within TransiEnt.Examples.DistributionGrids.MediumVoltageGrids.Check;
model Check_MV_urban_2

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

  extends TransiEnt.Basics.Icons.Checkmodel;
  Components.Boundaries.Electrical.ComplexPower.SlackBoundary               vDelta1(v_gen=110e3, f_n=50)
                    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  MV_urban_2_no_switch mV_urban_2_no_switch(development_scenario="Today") annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(mV_urban_2_no_switch.epp, vDelta1.epp) annotation (Line(
      points={{-20,0},{20,0}},
      color={28,108,200},
      thickness=0.5));
  connect(mV_urban_2_no_switch.controlBus, controlBus) annotation (Line(
      points={{-30,-0.2},{-30,0},{-70,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=172800,
      Tolerance=0.001,
      __Dymola_Algorithm="Cvode"));
end Check_MV_urban_2;
