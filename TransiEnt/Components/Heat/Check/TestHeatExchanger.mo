within TransiEnt.Components.Heat.Check;
model TestHeatExchanger "Test model for the heat exchanger"

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

  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

  Modelica.Blocks.Sources.RealExpression realExpression2(y=1e5)
                                                             annotation (Placement(transformation(extent={{26,44},{46,64}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink1 annotation (Placement(transformation(extent={{38,20},{58,40}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi(p_const=1e5)   annotation (Placement(transformation(extent={{64,-96},{44,-76}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{84,96},{104,116}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source annotation (Placement(transformation(extent={{-92,20},{-72,40}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=0.1)
                                                             annotation (Placement(transformation(extent={{124,9},{144,29}})));
  Modelica.Blocks.Sources.Step step(
    height=10*4200,
    offset=60*4200,
    startTime=43200) annotation (Placement(transformation(extent={{-132,0},{-112,20}})));
  ClaRa.Components.HeatExchangers.IdealShell_L2 idealShell_L2_1(redeclare model HeatTransfer = ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L2 (alpha_nom=1591.55, temperatureDifference="Outlet")) annotation (Placement(transformation(extent={{-18,-96},{2,-76}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_hxim_flow boundaryVLE_hxim_flow(
    variable_m_flow=true,                                                         variable_h=true, m_flow_const=0.1) annotation (Placement(transformation(extent={{-86,-96},{-66,-76}})));
  Modelica.Blocks.Sources.Step step1(
    height=10*4200,
    offset=60*4200,
    startTime=43200) annotation (Placement(transformation(extent={{-128,-96},{-108,-76}})));
  TransiEnt.Components.Heat.HeatExchanger heatExchanger(
    V=0.992146,
    rho=995.6,
    n=1) annotation (Placement(transformation(extent={{-22,20},{-2,40}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=-5000)
                                                             annotation (Placement(transformation(extent={{118,28},{138,48}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=-5000)
                                                             annotation (Placement(transformation(extent={{116,74},{136,94}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=293.15) annotation (Placement(transformation(extent={{-48,-66},{-28,-46}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T=293.15) annotation (Placement(transformation(extent={{-54,64},{-34,84}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi1(p_const=1e5)  annotation (Placement(transformation(extent={{72,-190},{52,-170}})));
  ClaRa.Components.HeatExchangers.IdealShell_L2 idealShell_L2_2(redeclare model HeatTransfer = ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L2 (alpha_nom=1591.55, temperatureDifference="Logarithmic mean - smoothed")) annotation (Placement(transformation(extent={{-10,-190},{10,-170}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_hxim_flow boundaryVLE_hxim_flow1(
    variable_m_flow=true,                                                          variable_h=true, m_flow_const=0.1) annotation (Placement(transformation(extent={{-78,-190},{-58,-170}})));
  Modelica.Blocks.Sources.Step step2(
    height=10*4200,
    offset=60*4200,
    startTime=43200) annotation (Placement(transformation(extent={{-120,-190},{-100,-170}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T=293.15) annotation (Placement(transformation(extent={{-40,-160},{-20,-140}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=10)
                                                             annotation (Placement(transformation(extent={{120,50},{140,70}})));
  Modelica.Blocks.Sources.Step step5(
    height=0.1,
    offset=0.1,
    startTime=60000)
                    annotation (Placement(transformation(extent={{-142,-58},{-122,-38}})));
  Modelica.Blocks.Sources.Step step6(
    height=0.1,
    offset=0.1,
    startTime=60000)
                    annotation (Placement(transformation(extent={{-134,-160},{-114,-140}})));
  Modelica.Blocks.Sources.Step step7(
    height=0.1,
    offset=0.1,
    startTime=60000)
                    annotation (Placement(transformation(extent={{-140,34},{-120,54}})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(realExpression2.y, sink1.p_in) annotation (Line(points={{47,54},{72,54},{72,29.8},{56,29.8}},                       color={0,0,127}));
  connect(step.y, source.h_in) annotation (Line(points={{-111,10},{-96,10},{-96,28},{-90,28}},     color={0,0,127}));
  connect(boundaryVLE_pTxi.steam_a, idealShell_L2_1.outlet) annotation (Line(
      points={{44,-86},{2,-86}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(idealShell_L2_1.inlet, boundaryVLE_hxim_flow.steam_a) annotation (Line(
      points={{-18,-86},{-66,-86}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(boundaryVLE_hxim_flow.h, step1.y) annotation (Line(points={{-88,-86},{-107,-86}},   color={0,0,127}));
  connect(source.port_a, heatExchanger.inlet) annotation (Line(points={{-72,30},{-22,30}},   color={0,0,0}));
  connect(sink1.port_a, heatExchanger.outlet) annotation (Line(points={{38,30},{-2,30}},  color={0,0,0}));
  connect(fixedTemperature.port, idealShell_L2_1.heat) annotation (Line(points={{-28,-56},{-8,-56},{-8,-76}}, color={191,0,0}));
  connect(fixedTemperature1.port, heatExchanger.heatPort) annotation (Line(points={{-34,74},{-12,74},{-12,40}},
                                                                                                              color={191,0,0}));
  connect(boundaryVLE_pTxi1.steam_a, idealShell_L2_2.outlet) annotation (Line(
      points={{52,-180},{10,-180}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(idealShell_L2_2.inlet, boundaryVLE_hxim_flow1.steam_a) annotation (Line(
      points={{-10,-180},{-58,-180}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(boundaryVLE_hxim_flow1.h, step2.y) annotation (Line(points={{-80,-180},{-99,-180}}, color={0,0,127}));
  connect(fixedTemperature2.port, idealShell_L2_2.heat) annotation (Line(points={{-20,-150},{0,-150},{0,-170}}, color={191,0,0}));
  connect(step5.y, boundaryVLE_hxim_flow.m_flow) annotation (Line(points={{-121,-48},{-92,-48},{-92,-80},{-88,-80}},   color={0,0,127}));
  connect(boundaryVLE_hxim_flow1.m_flow, step6.y) annotation (Line(points={{-80,-174},{-92,-174},{-92,-150},{-113,-150}}, color={0,0,127}));
  connect(source.m_flow_in, step7.y) annotation (Line(points={{-90,33},{-114,33},{-114,44},{-119,44}},   color={0,0,127}));
  annotation (
    Icon(graphics={  Polygon(fillColor = {0, 85, 0}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, -100}, {-100, 100}, {-88, 94}, {-100, 100}})}, coordinateSystem(initialScale = 0.1, extent={{-180,-200},{140,140}})),
                                                                                                                                                                                                        experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-180,-200},{140,140}}), graphics={
        Text(
          extent={{-142,112},{6,90}},
          textColor={28,108,200},
          textString="Test model for heat exchanger"),
        Text(
          extent={{-146,-10},{28,-26}},
          textColor={28,108,200},
          textString="ClaRa heat exchanger model (return)"),
        Text(
          extent={{-148,-108},{46,-128}},
          textColor={28,108,200},
          textString="ClaRa heat exchanger model (logarithmic)")}),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model:</span></h4>
<p>Test model for the verification of the heat exchanger model.</p>
<h4><span style=\"color: #1c6cc8\">Compare this variables for the verification of the heat exchanger</span></h4>
<p>heatExchanger.T_in</p>
<p>heatExchanger.T_out</p>
<p>idealShell_L2_1.fluidIn.T</p>
<p>idealShell_L2_1.fluidOut.T</p>
<p>idealShell_L2_2.fluidOut.T</p>
<p>heatExchanger.heatPort.Q_flow</p>
<p>idealShell_L2_1.heat.Q_flow</p>
<h4><span style=\"color: #1c6cc8\">For physical behaviour check difference between</span></h4>
<p>idealShell_L2_1.fluidOut.T</p>
<p>idealShell_L2_2.fluidOut.T</p>
<p>one uses a logarithmic temperature difference and one a temperature difference based on the return temperature</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>The model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end TestHeatExchanger;
