within TransiEnt.Basics.Tables.ElectricGrid.Electromobility;
model SoCTable
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
  // Author: Tom Steffen (ieet)                                                     //
  //________________________________________________________________________________//

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________


  extends TransiEnt.Basics.Tables.ElectricGrid.Electromobility.Base.SoCTable;


  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------

  parameter String tableName="data" "Table name on file or in function usertab (see docu)"
                                                           annotation(Evaluate=true, HideResult=true, Dialog(group="Basics"));

  parameter Boolean multiple_outputs = false "If set true multiple outputs are enabled (but useage of MultiSum block will fail)"
                                                                                              annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(group="Basics"));

  parameter Integer columns[:]=2:3 "columns of table to be interpolated (*** has to be modified before usage! ***)"
                                                                                        annotation(Evaluate=true, HideResult=true, Dialog(enable=multiple_outputs, group="Basics"));

  parameter DataPrivacy datasource=DataPrivacy.isPublic "Source of table data"   annotation (
    Evaluate=true,
    HideResult=true,
    Dialog(enable=not use_absolute_path, group="Data location"));

  final parameter String environment_variable_name=if datasource ==DataPrivacy.isPublic then Types.PUBLIC_DATA else Types.PRIVATE_DATA  annotation(Evaluate=true, HideResult=true, Dialog(enable=not use_absolute_path, group="Data location"));

  parameter String relativepath = "emobility/CarProfile_SoC.txt" "Path relative to source directory"
                                                                                                    annotation(Evaluate=true, HideResult=true, Dialog(enable=not use_absolute_path, group="Data location"));

  parameter Boolean use_absolute_path = false "Should only be used for testing purposes" annotation (Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true), Dialog(group="Data location"));
  parameter String absolute_path = ""
  annotation(Evaluate=true, HideResult=true, Dialog(enable=use_absolute_path, group="Data location"));

  parameter Boolean change_of_sign = false "Change sign of output signal relative to table data"
        annotation(choices(__Dymola_checkBox=true), Dialog(group="Basics"));
  parameter Real constantfactor = 1.0 "Multiply output with constant factor"
        annotation(Dialog(tab="Advanced", group="table data interpretation"));

  parameter Modelica.Blocks.Types.Extrapolation extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints "Extrapolation of data outside the definition range"
        annotation(Dialog(tab="Advanced", group="table data interpretation"));

  parameter SI.Time startTime=0       annotation(Dialog(tab="Advanced", group="table data interpretation"));

  parameter Modelica.Units.SI.Time shiftTime=startTime "Shift time of first table column" annotation (Dialog(group="Table data interpretation"));

  parameter Modelica.Blocks.Types.TimeEvents timeEvents=Modelica.Blocks.Types.TimeEvents.AtDiscontinuities
    "Time event handling of table interpolation"
    annotation (Dialog(group="Table data interpretation", enable=smoothness == Modelica.Blocks.Types.Smoothness.LinearSegments));

  final parameter String complete_relative_path = Functions.fullPathName(               Modelica.Utilities.System.getEnvironmentVariable(environment_variable_name) + relativepath);

  final parameter String genericFileName = if use_absolute_path then absolute_path else complete_relative_path;

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------

  Modelica.Blocks.Interfaces.BooleanOutput isConnected annotation (Placement(transformation(
          extent={{80,30},{100,50}}), iconTransformation(extent={{80,30},{100,50}})));
  Modelica.Blocks.Interfaces.RealOutput SoC_consumption
    annotation (Placement(transformation(extent={{80,-50},{100,-30}})));

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    fileName=genericFileName,
    tableOnFile=true,
    verboseRead=true,
    columns=columns,
    extrapolation=extrapolation,
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    startTime=startTime,
    tableName=tableName,
    shiftTime=shiftTime,
    timeEvents=timeEvents)
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
  connect(SoC_consumption, combiTimeTable.y[2])
    annotation (Line(points={{90,-40},{-18,-40},{-18,0},{-69,0}}, color={0,0,127}));
  annotation (experiment(
      StopTime=86400,
      Interval=5184000,
      __Dymola_Algorithm="Dassl"));
end SoCTable;
