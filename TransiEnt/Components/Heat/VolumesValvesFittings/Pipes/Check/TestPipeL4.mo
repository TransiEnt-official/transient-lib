within TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.Check;
model TestPipeL4 "Test model for the simplePipeL4"

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
  //          Import and Hierachy
  // _____________________________________________

    extends TransiEnt.Basics.Icons.Checkmodel;
        final parameter Modelica.Units.SI.MassFlowRate m_flow_nominal=3
    "Mass flow rate";

  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

  ClaRa.Components.BoundaryConditions.BoundaryVLE_hxim_flow boundaryVLE_hxim_flow(
    variable_m_flow=false,
    variable_h=true,
    m_flow_const=10,
    h_const=60*4200) annotation (Placement(transformation(extent={{-104,-68},{-84,-48}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi(p_const(displayUnit="bar") = 100000, T_const(displayUnit="degC") = 333.15) annotation (Placement(transformation(extent={{2,-68},{-18,-48}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=10)
                                                             annotation (Placement(transformation(extent={{-144,98},{-124,118}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source annotation (Placement(transformation(extent={{-114,88},{-94,108}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{-16,88},{-36,108}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=1e5)
                                                             annotation (Placement(transformation(extent={{14,88},{-6,108}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.DHN_Pipe_L4 simplePipe_L4_1(
    cp=4185,
    l=100,
    N_cv=20,
    u=0.000001,
    m_flow_start=10) annotation (Placement(transformation(extent={{-74,88},{-54,108}})));
  ClaRa.Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L4_Simple pipeFlowVLE_L4_Simple(
    initOption=208,
    length=100,
    N_cv=20)  annotation (Placement(transformation(extent={{-68,-62},{-40,-52}})));
  Modelica.Blocks.Sources.Step step(
    height=10*4186,
    offset=60*4186,
    startTime=3600) annotation (Placement(transformation(extent={{-146,76},{-126,96}})));
  Modelica.Blocks.Sources.Step step1(
    height=10*4185,
    offset=60*4185,
    startTime=3600) annotation (Placement(transformation(extent={{-140,-68},{-120,-48}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.DHN_Pipe_L4 simplePipe_L4_2(
    cp=4185,
    l=100,
    N_cv=20,
    u=0.0001,
    m_flow_start=10,
    c_pipe=0.001) annotation (Placement(transformation(extent={{-66,10},{-86,30}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink1 annotation (Placement(transformation(extent={{-30,10},{-50,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1e5)
                                                             annotation (Placement(transformation(extent={{0,10},{-20,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=10)
                                                             annotation (Placement(transformation(extent={{-144,20},{-124,40}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource source1 annotation (Placement(transformation(extent={{-114,10},{-94,30}})));
  Modelica.Blocks.Sources.Step step2(
    height=10*4185,
    offset=60*4185,
    startTime=3600) annotation (Placement(transformation(extent={{-146,-2},{-126,18}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.SinglePipe_L2 singlePipe_LX(
    p_start=simCenter.p_nom[1],
    T_start=333.15,
    m_flow_start=10,
    v_nom=1.1,
    activate_volumes=true,
    length=100,
    calc_initial_dstrb=true,
    diameter_i(displayUnit="m") = 0.1,
    z_in=0.5,
    z_out=0.5,
    K=1e-3,
    pipe_wall_capacity=1900)
             annotation (Placement(transformation(extent={{149,46},{187,78}})));
  inner TransiEnt.SimCenter
                  simCenter(
    activate_volumes=true,
    calc_initial_dstrb=true,
    T_supply=333.15,
    T_return=333.15,
    m_flow_min=0.0001,
    v_nom=1.1,
    lambda_ground=1.2)      annotation (Placement(transformation(extent={{66,134},{76,144}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow(
    variable_m_flow=false,
    variable_T=true,
    m_flow_const=10,
    T_const(displayUnit="degC") = 363.15)                                                                                               annotation (Placement(transformation(extent={{86,52},{106,72}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_ground(T=283.15)
    annotation (Placement(transformation(extent={{140,92},{160,112}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T T_supply_in(unitOption=2) annotation (Placement(transformation(extent={{116,72},{136,92}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T T_supply_out(unitOption=2) annotation (Placement(transformation(extent={{191,72},{221,92}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi1(p_const=1e5, T_const(displayUnit="degC") = 363.15)
                                                                                                  annotation (Placement(transformation(extent={{246,52},{226,72}})));
  Modelica.Blocks.Sources.Step step3(
    height=10,
    offset=60 + 273.15,
    startTime=3600) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={62,62})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(sink.p_in, realExpression1.y) annotation (Line(points={{-18,98},{-12.5,98},{-12.5,98},{-7,98}},  color={0,0,127}));
  connect(source.port_a, simplePipe_L4_1.inlet) annotation (Line(points={{-94,98},{-74,98}}, color={0,0,0}));
  connect(sink.port_a, simplePipe_L4_1.outlet) annotation (Line(points={{-36,98},{-54,98}},
                                                                                          color={0,0,0}));
  connect(boundaryVLE_hxim_flow.steam_a, pipeFlowVLE_L4_Simple.inlet) annotation (Line(
      points={{-84,-58},{-84,-57},{-68,-57}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(boundaryVLE_pTxi.steam_a, pipeFlowVLE_L4_Simple.outlet) annotation (Line(
      points={{-18,-58},{-20,-58},{-20,-57},{-40,-57}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(source.h_in, step.y) annotation (Line(points={{-112,96},{-120,96},{-120,86},{-125,86}},
                                                                                              color={0,0,127}));
  connect(source.m_flow_in, realExpression2.y) annotation (Line(points={{-112,101},{-123,101},{-123,108}},
                                                                                                     color={0,0,127}));
  connect(boundaryVLE_hxim_flow.h, step1.y) annotation (Line(points={{-106,-58},{-119,-58}},
                                                                                           color={0,0,127}));
  connect(sink1.port_a, simplePipe_L4_2.inlet) annotation (Line(points={{-50,20},{-66,20}},
                                                                                         color={0,0,0}));
  connect(realExpression3.y, sink1.p_in) annotation (Line(points={{-21,20},{-26.5,20},{-26.5,20},{-32,20}},
                                                                                                          color={0,0,127}));
  connect(source1.h_in, step2.y) annotation (Line(points={{-112,18},{-120,18},{-120,8},{-125,8}},
                                                                                              color={0,0,127}));
  connect(source1.m_flow_in, realExpression4.y) annotation (Line(points={{-112,23},{-123,23},{-123,30}},
                                                                                                      color={0,0,127}));
  connect(source1.port_a, simplePipe_L4_2.outlet) annotation (Line(points={{-94,20},{-86,20}}, color={0,0,0}));
  connect(T_supply_in.port,boundaryVLE_Txim_flow. steam_a) annotation (Line(
      points={{126,72},{126,68},{106,68},{106,62}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(T_supply_out.port,boundaryVLE_pTxi1. steam_a) annotation (Line(
      points={{206,72},{206,68},{226,68},{226,62}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(boundaryVLE_Txim_flow.steam_a,singlePipe_LX. waterPortIn) annotation (Line(
      points={{106,62},{149,62}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(singlePipe_LX.waterPortOut,boundaryVLE_pTxi1. steam_a) annotation (Line(
      points={{187,62},{226,62}},
      color={175,0,0},
      thickness=0.5));
  connect(T_ground.port,singlePipe_LX. heat) annotation (Line(points={{160,102},{168,102},{168,78}},
                                                                                               color={191,0,0}));
  connect(step3.y,boundaryVLE_Txim_flow. T) annotation (Line(points={{73,62},{84,62}},               color={0,0,127}));
  annotation (
    Icon(                                                                                                                                                                                  coordinateSystem(initialScale = 0.1, extent={{-220,-260},{340,160}})),
                                                                                                                                                                                                        experiment(
      StopTime=10800,
      Interval=2,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-220,-260},{340,160}}), graphics={
        Text(
          extent={{-156,-16},{-90,-24}},
          textColor={28,108,200},
          textString="ClaRa L4 Pipe"),
        Text(
          extent={{42,110},{108,102}},
          textColor={28,108,200},
          textString="PlugFlowPipe
"),     Text(
          extent={{-156,58},{-80,42}},
          textColor={28,108,200},
          textString="Reverse Flow Test
"),     Text(
          extent={{-160,144},{-84,128}},
          textColor={28,108,200},
          textString="Test pipe model")}),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model:</span></h4>
<p>Test model for the validation of the district heating network pipes.</p>
<h4><span style=\"color: #1c6cc8\">Compare the following variables for the verification of the thermal behaviour:</span></h4>
<h4>PlugFlowPipe</h4>
<p>T_supply_in.T_celsius</p>
<p>T_supply_out.T_celsius</p>
<h4>Pipe model</h4>
<p>simplePipe_L4_1.controlVolumeL4_HeatLoss.T[1]</p>
<p>simplePipe_L4_1.controlVolumeL4_HeatLoss.T[200]</p>
<h4>Pipe model reverse flow</h4>
<p>simplePipe_L4_2.controlVolumeL4_HeatLoss.T[1]</p>
<p>simplePipe_L4_2.controlVolumeL4_HeatLoss.T[200]</p>
<h4>ClaRa pipe model</h4>
<p>pipeFlowVLE_L4_Simple.fluid[1].T</p>
<p>pipeFlowVLE_L4_Simple.fluid[200].T</p>
<p>2. Compare the following variables for the verification of the pressure loss:</p>
<h4>PlugFlowPipe</h4>
<p>simplePipe_L4_1.inlet.p</p>
<p>simplePipe_L4_1.outlet.p</p>
<p>singlePipe_LX.waterPortIn.p</p>
<p>singlePipe_LX.waterPortOut.p</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>The model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end TestPipeL4;
