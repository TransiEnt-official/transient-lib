within TransiEnt.Basics.Tables.Ambient;
model GenericTemperatureDataTableResource
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

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Temperature;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------
  parameter String fileName="NoName" "File where matrix is stored"
    annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
      //group="Table data definition",
      //enable=tableOnFile,

  parameter Real startTime = 0 "Time at which the values of the file are starting";

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------
  Interfaces.General.TemperatureOut Kelvin annotation (Placement(transformation(extent={{80,20},{100,40}}), iconTransformation(extent={{80,20},{100,40}})));

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    fileName = Modelica.Utilities.Files.loadResource(fileName),
    tableName = "default",
    tableOnFile=true,
    verboseRead=false,
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    startTime=startTime,
    timeEvents=Modelica.Blocks.Types.TimeEvents.AtDiscontinuities)
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));

  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold=200) "If Temperature smaller than 200 K" annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Modelica.Blocks.Logical.Switch Kelvin_Switch annotation (Placement(transformation(extent={{20,20},{40,40}})));

  // ----------------------------------------------------------------------------------------
  //   Equation part
  // ----------------------------------------------------------------------------------------
  Modelica.Blocks.Logical.Switch Celsius_Switch annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Blocks.Sources.RealExpression Transformer(y=273.15) annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Math.Add to_Kelvin annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Math.Add to_Celsius(k1=-1) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Interfaces.General.TemperatureCelsiusOut Celsius annotation (Placement(transformation(extent={{80,-40},{100,-20}}), iconTransformation(extent={{80,-40},{100,-20}})));
initial equation

equation
  connect(combiTimeTable.y[1], lessEqualThreshold.u) annotation (Line(points={{-79,0},{-44,0}}, color={0,0,127}));
  connect(lessEqualThreshold.y, Kelvin_Switch.u2) annotation (Line(points={{-21,0},{8,0},{8,30},{18,30}}, color={255,0,255}));
  connect(lessEqualThreshold.y, Celsius_Switch.u2) annotation (Line(points={{-21,0},{8,0},{8,-30},{18,-30}}, color={255,0,255}));
  connect(Transformer.y, to_Kelvin.u1) annotation (Line(points={{-79,50},{-56,50},{-56,56},{-42,56}}, color={0,0,127}));
  connect(combiTimeTable.y[1], to_Kelvin.u2) annotation (Line(points={{-79,0},{-66,0},{-66,44},{-42,44}}, color={0,0,127}));
  connect(Transformer.y, to_Celsius.u1) annotation (Line(points={{-79,50},{-56,50},{-56,-44},{-42,-44}}, color={0,0,127}));
  connect(combiTimeTable.y[1], to_Celsius.u2) annotation (Line(points={{-79,0},{-66,0},{-66,-56},{-42,-56}}, color={0,0,127}));
  connect(Kelvin_Switch.y, Kelvin) annotation (Line(points={{41,30},{90,30}}, color={0,0,127}));
  connect(Celsius_Switch.y, Celsius) annotation (Line(points={{41,-30},{90,-30}}, color={0,0,127}));
  connect(Kelvin_Switch.u3, combiTimeTable.y[1]) annotation (Line(points={{18,22},{-66,22},{-66,0},{-79,0}}, color={0,0,127}));
  connect(Kelvin_Switch.u1, to_Kelvin.y) annotation (Line(points={{18,38},{-14,38},{-14,50},{-19,50}}, color={0,0,127}));
  connect(Celsius_Switch.u1, combiTimeTable.y[1]) annotation (Line(points={{18,-22},{10,-22},{10,22},{-66,22},{-66,0},{-79,0}}, color={0,0,127}));
  connect(Celsius_Switch.u3, to_Celsius.y) annotation (Line(points={{18,-38},{-14,-38},{-14,-50},{-19,-50}}, color={0,0,127}));
end GenericTemperatureDataTableResource;
