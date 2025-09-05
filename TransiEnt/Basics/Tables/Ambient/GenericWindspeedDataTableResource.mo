within TransiEnt.Basics.Tables.Ambient;
model GenericWindspeedDataTableResource

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
//________________________________________________________________________________//  extends TransiEnt.Basics.Icons.TableIcon;
  //________________________________________________________________________________//
  // Component of the Models_CyEntEE Library, version: 1.0.0                        //
  //                                                                                //
  //                                                                                //
  // CyEntEE is a I³ Lab research projects supported by the University of           //
  // Technology Hamburg                                                             //
  // Institute of Operations Research (ORIS),                                       //
  // Institute of Telematics,                                                       //
  // Institute of Electrical Power and Energy Technology (ieet)                     //
  //                                                                                //
  // Author: Béla Wiegel (ieet)                                                     //
  //________________________________________________________________________________//

  //This Table outputs the wind speed values of a double (X,2) file after startTime is reached. Before the value will be 0 m/s.

 // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------
  parameter String fileName="NoName" "File where data is stored"
    annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter Real startTime = 0 "Time at which the values of the file are starting";

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------
  TransiEnt.Basics.Interfaces.Ambient.VelocityOut value annotation (Placement(transformation(extent={{90,-12},{110,8}}), iconTransformation(extent={{90,-12},{110,8}})));

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(fileName = Modelica.Utilities.Files.loadResource(fileName), tableName = "default", tableOnFile=true, verboseRead=false,
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,                                                                                                           startTime=startTime,
    timeEvents=Modelica.Blocks.Types.TimeEvents.AtDiscontinuities)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  // ----------------------------------------------------------------------------------------
  //   Equation part
  // ----------------------------------------------------------------------------------------
equation
  connect(combiTimeTable.y[1], value)
    annotation (Line(points={{11,0},{58,0},{58,-2},{100,-2}},
                                             color={0,0,127}));

annotation (Icon(graphics={
        Polygon(
          points={{50,-2},{68,-12},{58,-32},{38,-26},{44,-16},{50,-2}},
          lineColor={255,0,0},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{14,18},{30,10},{18,-18},{0,-12},{6,-2},{14,18}},
          lineColor={255,0,0},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{30,10},{50,-2},{38,-26},{18,-18},{20,-12},{30,10}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{50,-10},{72,-32}},
          lineColor={255,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0}),
        Ellipse(
          extent={{28,0},{56,-26}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{4,12},{38,-18}},
          lineColor={255,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0}),
        Polygon(
          points={{-10,32},{14,18},{0,-12},{-20,-6},{-16,0},{-10,32}},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-12,20},{22,-12}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-32,34},{-4,-6}},
          lineColor={255,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0}),
        Polygon(
          points={{-32,44},{-10,32},{-20,-6},{-46,2},{-46,30},{-32,44}},
          lineColor={255,0,0},
          smooth=Smooth.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-62,48},{-24,2}},
          lineColor={184,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{-74,60},{-66,-60}},
          lineColor={0,0,0},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={255,255,255}),
        Ellipse(
          extent={{-77,64},{-63,56}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={255,255,255}),
        Ellipse(
          extent={{-62,48},{-24,2}},
          lineColor={165,0,0}),
        Line(
          points={{-46,60}},
          color={0,0,0},
          thickness=0.2,
          arrow={Arrow.Filled,Arrow.None}),
        Line(
          points={{-40,48},{-66,56},{-58,58}},
          color={0,0,0},
          thickness=0.2),
        Line(
          points={{-66,56},{-62,50}},
          color={0,0,0},
          thickness=0.2),
        Line(
          points={{-52,4},{-66,10},{-60,12}},
          color={0,0,0},
          thickness=0.2),
        Line(
          points={{-66,10},{-64,4}},
          color={0,0,0},
          thickness=0.2)}),      experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end GenericWindspeedDataTableResource;
