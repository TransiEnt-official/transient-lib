within TransiEnt.Basics.Tables.Ambient;
model GenericDHIDNIDataTableResource
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

  //This Table outputs the irradiation values of a two double (X,2) file after startTime is reached. Before the values will be 0 W/m^2.

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.SolarElectricalModel;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------
  parameter String fileName_dir = "NoName" "Direct irradition file data"
    annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String fileName_diff = "NoName" "Diffuse irradition file data"
    annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter Real startTime = 0 "Time at which the values of the file are starting";

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_dir(
    fileName=Modelica.Utilities.Files.loadResource(fileName_dir),
    tableName="default",
    tableOnFile=true,
    verboseRead=false,
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    startTime=startTime,
    timeEvents=Modelica.Blocks.Types.TimeEvents.AtDiscontinuities)
                         annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  TransiEnt.Basics.Interfaces.Ambient.IrradianceOut direct
    annotation (Placement(transformation(extent={{78,30},{98,50}})));
  TransiEnt.Basics.Interfaces.Ambient.IrradianceOut diffuse
    annotation (Placement(transformation(extent={{78,-50},{98,-30}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable_diff(
    fileName=Modelica.Utilities.Files.loadResource(fileName_diff),
    tableName="default",
    tableOnFile=true,
    verboseRead=false,
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    startTime=startTime,
    timeEvents=Modelica.Blocks.Types.TimeEvents.AtDiscontinuities)
                         annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));

  // ----------------------------------------------------------------------------------------
  //   Equation part
  // ----------------------------------------------------------------------------------------
equation
  connect(combiTimeTable_dir.y[1], direct)
    annotation (Line(points={{11,40},{88,40}}, color={0,0,127}));
  connect(combiTimeTable_diff.y[1], diffuse)
    annotation (Line(points={{11,-40},{88,-40}}, color={0,0,127}));
  annotation (Icon(graphics={
        Text(
          extent={{-140,-95},{160,-135}},
          lineColor={0,134,134},
          textString="%name")}));
end GenericDHIDNIDataTableResource;
