within TransiEnt.Consumer.Heat;
model TappingCycles "Tapping Cycles with external data input and heat port"

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String profile = "";

  // ------------------------------------------------------------------------------------------
  //   Instances of other classes
  // ------------------------------------------------------------------------------------------

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------
  constant Real T_ref = 10 "Reference temperature";

  TransiEnt.Basics.Tables.HeatGrid.Table_TappingCycle table_TappingCycle(fileName=
        profile)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput temperatureSufficient
    annotation (Placement(transformation(extent={{96,-90},{116,-70}})));

equation
  // calculate heat flow rate
  heatPort.Q_flow = 4180 * table_TappingCycle.massFlow * (table_TappingCycle.temperature - T_ref);

  temperatureSufficient = heatPort.T >= table_TappingCycle.temperature;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{52,-70},{52,20},{42,20},{42,40},{-10,40},{-10,30},{32,30},{32,
              20},{-44,20},{-60,10},{-44,0},{-34,0},{-34,-6},{-20,-6},{-20,0},{32,
              0},{32,-70},{52,-70}},
          color={149,149,149},
          smooth=Smooth.Bezier),
        Polygon(
          points={{-36,-6},{-44,-48},{-10,-48},{-18,-6},{-36,-6}},
          smooth=Smooth.Bezier,
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}),
      Diagram(coordinateSystem(preserveAspectRatio=false)));
end TappingCycles;
