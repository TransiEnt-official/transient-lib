within TransiEnt.Producer.Heat.Power2Heat.Heatpump.Check;
model TestHeatPumpPartialLoad "Test of HeatPumpPartialLoad for variable temperature lift and partial load"
  HeatPumpPartialLoad heatPumpPartialLoad1(
    heatSourceType="Liquid",
    useCustomizedParameter=false,
    selectHP=1) "Partial load test: variable heat flow set point, constant source temperature" annotation (Placement(transformation(extent={{-48,-50},{-28,-30}})));
  inner TransiEnt.SimCenter simCenter(redeclare TILMedia.VLEFluidTypes.TILMedia_Water fluid1) "Global settings; fluid1 = TILMedia water as heat sink medium" annotation (Placement(transformation(extent={{68,78},{88,98}})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_pTxi boundaryVLE_pTxi(boundaryConditions(p_const(displayUnit="bar") = 400000, T_const=310)) "Partial load test: heat sink inlet, water at 4 bar and 310 K" annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow(variable_m_flow=false, boundaryConditions(m_flow_const=-0.5, T_const=310)) "Partial load test: heat sink outlet, imposed mass flow rate of 0.5 kg/s" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-10,-80})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=280) "Partial load test: constant source temperature of 280 K" annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=15e3,
    f=1/100,
    offset=-45e3) "Partial load test: heat flow set point -45 kW +/- 15 kW, period 100 s" annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  HeatPumpPartialLoad heatPumpPartialLoad(
    heatSourceType="Liquid",
    useCustomizedParameter=false,
    selectHP=1) "Temperature lift test: constant heat flow set point, variable source temperature" annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_pTxi boundaryVLE_pTxi1(boundaryConditions(p_const(displayUnit="bar") = 400000, T_const=310)) "Temperature lift test: heat sink inlet, water at 4 bar and 310 K"
                                                                                                                                                    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow1(variable_m_flow=false, boundaryConditions(m_flow_const=-0.5, T_const=310)) "Temperature lift test: heat sink outlet, imposed mass flow rate of 0.5 kg/s"
                                                                                                                                                                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-10,20})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=-50e3) "Temperature lift test: constant heat flow set point of -50 kW"
                                                               annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=15,
    f=1/100,
    offset=280) "Temperature lift test: source temperature 280 K +/- 15 K, period 100 s" annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  HeatPumpPartialLoad heatPumpPartialLoad2(
    heatSourceType="Liquid",
    useCustomizedParameter=false,
    selectHP=1) "Combined test: variable heat flow set point and source temperature" annotation (Placement(transformation(extent={{52,-44},{72,-24}})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_pTxi boundaryVLE_pTxi2(boundaryConditions(p_const(displayUnit="bar") = 400000, T_const=310)) "Combined test: heat sink inlet, water at 4 bar and 310 K"
                                                                                                                                                    annotation (Placement(transformation(extent={{20,-90},{40,-70}})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow2(variable_m_flow=false, boundaryConditions(m_flow_const=-0.5, T_const=310)) "Combined test: heat sink outlet, imposed mass flow rate of 0.5 kg/s"
                                                                                                                                                                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,-80})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=15e3,
    f=1/100,
    offset=-45e3) "Combined test: heat flow set point -45 kW +/- 15 kW, period 100 s" annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
  Modelica.Blocks.Sources.Sine sine3(
    amplitude=15,
    f=1/100,
    offset=280) "Combined test: source temperature 280 K +/- 15 K, period 100 s (in phase with sine2)" annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
equation
  // Partial load test (heatPumpPartialLoad1): heat sink inlet boundary to portA
  connect(boundaryVLE_pTxi.fluidPortIn, heatPumpPartialLoad1.portA) annotation (Line(
      points={{-60,-80},{-45,-80},{-45,-50}},
      color={175,0,0},
      thickness=0.5));
  // Partial load test: portB to heat sink outlet boundary with imposed mass flow rate
  connect(heatPumpPartialLoad1.portB, boundaryVLE_Txim_flow.fluidPortOut) annotation (Line(
      points={{-31,-50},{-32,-50},{-32,-80},{-20,-80}},
      color={175,0,0},
      thickness=0.5));
  // Partial load test: constant source temperature
  connect(realExpression.y, heatPumpPartialLoad1.sourceTemperature) annotation (Line(points={{-79,-50},{-58,-50},{-58,-44},{-48.8,-44}}, color={0,0,127}));
  // Partial load test: sinusoidal heat flow set point
  connect(sine.y, heatPumpPartialLoad1.heatFlowSet) annotation (Line(points={{-79,-20},{-58,-20},{-58,-36},{-48.8,-36}}, color={0,0,127}));
  // Temperature lift test (heatPumpPartialLoad): heat sink inlet boundary to portA
  connect(boundaryVLE_pTxi1.fluidPortIn, heatPumpPartialLoad.portA) annotation (Line(
      points={{-60,20},{-47,20},{-47,60}},
      color={175,0,0},
      thickness=0.5));
  // Temperature lift test: portB to heat sink outlet boundary with imposed mass flow rate
  connect(heatPumpPartialLoad.portB, boundaryVLE_Txim_flow1.fluidPortOut) annotation (Line(
      points={{-33,60},{-34,60},{-34,20},{-20,20}},
      color={175,0,0},
      thickness=0.5));
  // Combined test (heatPumpPartialLoad2): heat sink inlet boundary to portA
  connect(boundaryVLE_pTxi2.fluidPortIn, heatPumpPartialLoad2.portA) annotation (Line(
      points={{40,-80},{55,-80},{55,-44}},
      color={175,0,0},
      thickness=0.5));
  // Combined test: portB to heat sink outlet boundary with imposed mass flow rate
  connect(heatPumpPartialLoad2.portB, boundaryVLE_Txim_flow2.fluidPortOut) annotation (Line(
      points={{69,-44},{69,-80},{80,-80}},
      color={175,0,0},
      thickness=0.5));
  // Combined test: sinusoidal heat flow set point
  connect(sine2.y, heatPumpPartialLoad2.heatFlowSet) annotation (Line(points={{21,-20},{42,-20},{42,-30},{51.2,-30}}, color={0,0,127}));
  // Combined test: sinusoidal source temperature, in phase with the heat flow set point
  connect(sine3.y, heatPumpPartialLoad2.sourceTemperature) annotation (Line(points={{21,-50},{44,-50},{44,-38},{51.2,-38}}, color={0,0,127}));
  // Temperature lift test: constant heat flow set point
  connect(realExpression1.y, heatPumpPartialLoad.heatFlowSet) annotation (Line(points={{-79,80},{-60,80},{-60,74},{-50.8,74}}, color={0,0,127}));
  // Temperature lift test: sinusoidal source temperature
  connect(sine1.y, heatPumpPartialLoad.sourceTemperature) annotation (Line(points={{-79,50},{-60,50},{-60,66},{-50.8,66}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                   Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}), Polygon(
          points={{-32,-20},{-36,-24},{-6,-50},{2,-50},{34,54},{28,56},{-2,-42},{-4,-42},{-32,-20}},
          smooth=Smooth.Bezier,
          fillColor={0,124,124},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for HeatPumpPartialLoad. Three instances show the coefficient of performance (COP) for a variable temperature lift, a variable partial load and the combination of both.</p>

<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>

<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no elements)</p>

<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>

<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>

<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>Test cases:</p>
<ul>
<li><code>heatPumpPartialLoad</code> (temperature lift test): constant heat flow set point of -50 kW, source temperature 280 K &plusmn; 15 K (sine, period 100 s); shows the influence of the temperature lift.</li>
<li><code>heatPumpPartialLoad1</code> (partial load test): heat flow set point -45 kW &plusmn; 15 kW (sine, period 100 s), constant source temperature of 280 K; shows the influence of the partial load.</li>
<li><code>heatPumpPartialLoad2</code> (combined test): both sine sources as above and in phase, i.e. the lowest heat demand (30 kW) coincides with the highest source temperature (295 K); shows the combined influence.</li>
</ul>
<p>All instances use parameter set 1 (<code>selectHP = 1</code>, 60 kW brine to water) with <code>heatSourceType = \"Liquid\"</code>. On the heat sink side, water (TILMedia_Water) enters portA at 4 bar and 310 K; the mass flow rate of 0.5 kg/s is imposed by the boundary at portB. The simulation covers one sine period (0 s to 100 s, Dassl).</p>
<p>Recommended variables for plotting: <code>COP</code>, <code>electricConsumption</code>, <code>T_hot</code>, <code>T_cold</code> and <code>sinkTemperature</code> of the three instances.</p>
<p>Expected trends: The COP increases with the source temperature (temperature lift test). It decreases with increasing heat flow rate (partial load test), because the tested range of 30 kW to 60 kW lies above the heat flow rate of maximum COP/COP<sub>Carnot</sub> (1/b<sub>2</sub> = 26.7 kW for parameter set 1). In the combined test both effects add up.</p>

<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>

<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>

<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Michael Vieth (michael.vieth@tuhh.de) on 02.10.2026</p>
</html>"));

end TestHeatPumpPartialLoad;
