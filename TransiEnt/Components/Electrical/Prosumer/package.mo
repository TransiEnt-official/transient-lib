within TransiEnt.Components.Electrical;
package Prosumer
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
  extends TransiEnt.Basics.Icons.Package;

  annotation (Icon(graphics={
        Polygon(
          points={{-66,-4},{64,-4},{-2,60},{-66,-4}},
          lineColor={0,134,134},
          smooth=Smooth.None,
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-42,14},{40,-54}},
          lineColor={0,134,134},
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{16,-8},{28,-18}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-24,-26},{-8,-48}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}));
end Prosumer;
