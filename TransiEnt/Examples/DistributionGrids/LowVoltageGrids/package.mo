within TransiEnt.Examples.DistributionGrids;
package LowVoltageGrids
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
//________________________________________________________________________________//  extends TransiEnt.Basics.Icons.Package;
  annotation (Icon(graphics={
        Ellipse(
          extent={{-10,96},{10,76}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-10,86},{10,66}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{0,98},{0,96}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{0,66},{0,56}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,56},{60,56},{60,36}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-24},{36,-44}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{74,40},{82,32}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{72,38},{78,46},{84,38}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-40},{58,-48}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-42},{54,-34},{60,-42}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-22},{58,-30}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-24},{54,-16},{60,-24}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{66,-40},{74,-48}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{64,-42},{70,-34},{76,-42}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{36,40},{44,32}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{34,38},{40,46},{46,38}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-8,-60},{0,-68}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-10,-62},{-4,-54},{2,-62}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-84,20},{-76,12}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-86,18},{-80,26},{-74,18}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-84,-2},{-76,-10}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-86,-4},{-80,4},{-74,-4}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-44,-60},{-36,-68}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-46,-62},{-40,-54},{-34,-62}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,16},{-60,-44}},
          color={28,108,200},
          thickness=0.5,
          pattern=LinePattern.Dot),
        Line(
          points={{-60,-44},{-60,-64},{-44,-64}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-44},{50,-44}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{58,-44},{66,-44}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{60,36},{74,36}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-26},{50,-26}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{44,36},{60,36}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-62},{58,-70}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-64},{54,-56},{60,-64}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-44},{16,-44},{16,-64},{0,-64}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-44},{36,-66},{50,-66}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,16},{-76,16}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-68,16},{-68,-6},{-76,-6}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,56},{-60,16}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{60,36},{60,32},{60,-4},{36,-4},{36,-24}},
          color={28,108,200},
          thickness=0.5,
          pattern=LinePattern.Dot)}));
end LowVoltageGrids;
