within TransiEnt.Examples;
package DistributionGrids
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
          extent={{-30,46},{-34,42}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{66,-38},{60,-44}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{0,42},{-4,38}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{18,28},{14,24}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{26,8},{22,4}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{32,-10},{28,-14}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{36,-26},{32,-30}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{70,-38},{64,-44}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{6,-34},{2,-38}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-32,-16},{-36,-20}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-52,26},{-56,22}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-50,2},{-54,-2}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-12,-26},{-16,-30}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{26,-40},{22,-44}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{46,-40},{42,-44}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-30,44},{-4,40},{16,26},{24,6},{30,-12},{34,-28},{44,-42},{24,-42},{4,-36},{-14,-28},{-34,-18},{-52,0},{-54,24},{-46,34},{-46,42}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-32,44},{-42,38}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{16,26},{26,32}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{52,42},{52,34},{60,34},{60,42},{52,42}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{50,40},{56,48},{62,40}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{28,42},{28,34},{36,34},{36,42},{28,42}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{26,40},{32,48},{38,40}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{40,34},{40,26},{48,26},{48,34},{40,34}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{38,32},{44,40},{50,32}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{40,50},{40,42},{48,42},{48,50},{40,50}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{38,48},{44,56},{50,48}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-80,-4},{-80,-12},{-72,-12},{-72,-4},{-80,-4}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-82,-6},{-76,2},{-70,-6}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-68,-14},{-68,-22},{-60,-22},{-60,-14},{-68,-14}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-70,-16},{-64,-8},{-58,-16}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-40,-36},{-40,-44},{-32,-44},{-32,-36},{-40,-36}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-42,-38},{-36,-30},{-30,-38}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-52,-28},{-52,-36},{-44,-36},{-44,-28},{-52,-28}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-54,-30},{-48,-22},{-42,-30}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-56,-4},{-52,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-36,-22},{-34,-18}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{24,60},{66,20}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{44,-42},{48,-42},{56,-42},{60,-42}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{-88,4},{-54,-30}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-60,-20},{-28,-52}},
          lineColor={28,108,200},
          lineThickness=0.5)}));
end DistributionGrids;
