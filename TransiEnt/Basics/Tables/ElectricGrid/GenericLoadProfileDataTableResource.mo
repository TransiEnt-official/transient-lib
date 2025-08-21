within TransiEnt.Basics.Tables.ElectricGrid;
model GenericLoadProfileDataTableResource "Table with load Resource for FMU export"

  extends TransiEnt.Basics.Icons.TableIcon;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------

  parameter String fileName="" "Two-column data file" annotation (Dialog(
        loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present"), group="Data"));

  parameter Boolean useQ=true
    "=true, if reactive power should be read from table"
    annotation (choices(__Dymola_checkBox=true), Dialog(group="Data"));

  parameter Boolean constantSegments=false
    "=false: linear interpolation, =true: constant segments"
    annotation (choices(__Dymola_checkBox=true), Dialog(group="Data"));

  parameter String tableName=if useQ then "p_q" else "p"
    annotation (Dialog(group="Data"));

  parameter Modelica.Units.SI.ActivePower powerScaleP(displayUnit="kW") = 1
    "Factor to scale P" annotation (Dialog(group="Scaling"));

  parameter Modelica.Units.SI.ReactivePower powerScaleQ(displayUnit="kvar") = 1
    "Factor to scale Q" annotation (Dialog(enable=useQ, group="Scaling"));

  parameter Modelica.Units.SI.Time startTime=0
    "Time at which the table values are starting to be used."
    annotation (Dialog(group="Initialization"));

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P "Active Power"
    annotation (Placement(transformation(extent={{78,30},{98,50}})));
  TransiEnt.Basics.Interfaces.Electrical.ReactivePowerOut Q if useQ
    "Reactive Power"
    annotation (Placement(transformation(extent={{78,-50},{98,-30}})));

  // ----------------------------------------------------------------------------------------
  //   Components
  // ----------------------------------------------------------------------------------------

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    fileName=Modelica.Utilities.Files.loadResource(fileName),
    tableName=tableName,
    tableOnFile=true,
    verboseRead=false,
    columns=if useQ then 2:3 else 2:2,
    smoothness=if constantSegments then Modelica.Blocks.Types.Smoothness.ConstantSegments
         else Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
    startTime=startTime,
    timeEvents=Modelica.Blocks.Types.TimeEvents.AtDiscontinuities)
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));

  Modelica.Blocks.Math.Gain gainP(k=powerScaleP)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));

  Modelica.Blocks.Math.Gain gainQ(k=powerScaleQ) if useQ
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));

  // ----------------------------------------------------------------------------------------
  //   Equation part
  // ----------------------------------------------------------------------------------------

equation
  connect(combiTimeTable.y[1], gainP.u) annotation (Line(points={{-69,0},{-18,0},
          {-18,20},{-12,20}}, color={0,0,127}));
  connect(gainQ.u, combiTimeTable.y[2])
    annotation (Line(points={{-12,-20},{-18,-20},{-18,0},{-69,0}}, color={0,0,127}));
  connect(gainP.y, P)
    annotation (Line(points={{11,20},{88,20},{88,40}}, color={0,0,127}));
  connect(gainQ.y, Q) annotation (Line(points={{11,-20},{88,-20},{88,-40}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{58,50},{76,30}},
          textColor={28,108,200},
          textString="P"), Text(
          extent={{58,-30},{76,-50}},
          textColor={28,108,200},
          textString="Q")}), Documentation(info="<html>
<p>This Table outputs the active and reactive load values of a double (X,3) file after startTime is reached. Before the values are 0 W / VAr.</p>
</html>"));
end GenericLoadProfileDataTableResource;
