within TransiEnt.Consumer.Electrical;
package ElectricVehicle

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
//________________________________________________________________________________//  extends .TransiEnt.Basics.Icons.Package;

  annotation (Icon(graphics={
        Text(
          extent={{-150,-105},{150,-145}},
          lineColor={0,134,134},
          textString="%name"),
        Polygon(
          visible=DynamicSelect(false, isDriving),
          points={{-40,-10},{-40,-10}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={163,163,163},
          fillPattern=FillPattern.None),
        Polygon(
          points={{-114,0},{-114,0}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.None),
        Polygon(
          points={{-48,-14},{-58,-14},{-68,-8},{-72,0},{-66,6},{-50,10},{-36,12},{-12,28},{6,30},{30,28},{38,24},{42,22},{48,16},{52,14},{60,12},{66,2},{66,-6},{64,-12},{60,-14},{6,-14},{-48,-14}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{-48,-4},{-28,-24}},
          lineColor={0,0,0},
          fillColor={43,43,43},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-44,-8},{-32,-20}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{30,-4},{50,-24}},
          lineColor={0,0,0},
          fillColor={43,43,43},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{34,-8},{46,-20}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-26,12},{-16,12},{12,12},{46,12},{38,20},{28,24},{10,26},{-2,26},{-10,24},{-18,20},{-24,16},{-26,12}},
          lineColor={0,0,0},
          smooth=Smooth.Bezier,
          fillColor={206,206,206},
          fillPattern=FillPattern.Solid),
        Line(
          points={{10,26},{10,18},{12,-4}},
          color={0,0,0},
          smooth=Smooth.Bezier)}));
end ElectricVehicle;
