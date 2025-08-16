within TransiEnt.Basics.Tables.DrivingProfiles;
model Table_DrivingProfile
  //________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.3                             //
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

  //This Table outputs the connected status and SOC consumption of a double (X,3) file after startTime is reached. Before the values are isConnected = false and SOC_Consumption = 0%.

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.TableIcon;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------
  parameter String fileName="NoName" "File where matrix is stored"
    annotation (Dialog(loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)", caption="Open file in which table is present")));

  parameter Real startTime= 0 "Time at which the table values are starting to be used.";

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------

  Modelica.Blocks.Interfaces.BooleanOutput isConnected annotation (Placement(transformation(
          extent={{80,30},{100,50}}), iconTransformation(extent={{80,30},{100,50}})));
  Modelica.Blocks.Interfaces.RealOutput SOC_Consumption
    annotation (Placement(transformation(extent={{80,-50},{100,-30}})));

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    fileName=Modelica.Utilities.Files.loadResource(fileName),
    tableName="data",
    tableOnFile=true,
    verboseRead=true,
    columns=2:3,
    extrapolation=Modelica.Blocks.Types.Extrapolation.NoExtrapolation,
    startTime=startTime,
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments)
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean annotation (Placement(transformation(extent={{-10,30},{10,50}})));

  // _____________________________________________
  //
  //           Connect Statements
  // _____________________________________________

equation

  connect(combiTimeTable.y[1], realToBoolean.u) annotation (Line(points={{-69,0},{-18,0},{-18,40},{-12,40}}, color={0,0,127}));
  connect(realToBoolean.y, isConnected)
    annotation (Line(points={{11,40},{90,40}}, color={255,0,255}));
  connect(SOC_Consumption, combiTimeTable.y[2])
    annotation (Line(points={{90,-40},{-18,-40},{-18,0},{-69,0}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Implements a driving profile data table for external driving profiles</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>Modelica RealOutput: SOC_consumption</p>
<p>Modelica Boolean: isConnected</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>(no remarks)</p>
</html>"));
end Table_DrivingProfile;
