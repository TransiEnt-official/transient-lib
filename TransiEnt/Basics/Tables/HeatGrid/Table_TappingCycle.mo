within TransiEnt.Basics.Tables.HeatGrid;
model Table_TappingCycle
  "Data input with discrete tapping events for tapping cycles"

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------

  parameter String fileName="NoName" "Tapping cycle file data" annotation (
      Dialog(loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));

  // ----------------------------------------------------------------------------------------
  //   Instances of other classes
  // ----------------------------------------------------------------------------------------

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    tableName="data",
    fileName=Modelica.Utilities.Files.loadResource(fileName),
    columns=2:3,
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.NoExtrapolation)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------

  Modelica.Blocks.Interfaces.RealOutput massFlow(displayUnit="kg/s")
    annotation (Placement(transformation(extent={{90,40},{130,80}})));

  Modelica.Blocks.Interfaces.RealOutput temperature(displayUnit="degC")
    annotation (Placement(transformation(extent={{90,-80},{130,-40}})));

  // ----------------------------------------------------------------------------------------
  //   Equation part
  // ----------------------------------------------------------------------------------------

equation
  connect(combiTimeTable.y[1], massFlow) annotation (Line(
      points={{11,0},{84,0},{84,60},{110,60}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(combiTimeTable.y[2], temperature) annotation (Line(
      points={{11,0},{84,0},{84,-60},{110,-60}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(graphics={
        Text(
          extent={{-140,-95},{160,-135}},
          lineColor={0,134,134},
          textString="%name"),
        Polygon(
          points={{-16,60},{-60,-40},{0,-80},{60,-40},{16,60},{-16,60}},
          smooth=Smooth.Bezier,
          fillColor={67,214,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
end Table_TappingCycle;
