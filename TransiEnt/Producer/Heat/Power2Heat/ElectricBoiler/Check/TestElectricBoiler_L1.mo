within TransiEnt.Producer.Heat.Power2Heat.ElectricBoiler.Check;
model TestElectricBoiler_L1
  import TransiEnt;



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
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//




  extends TransiEnt.Basics.Icons.Checkmodel;
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency electricGrid(useInputConnector=false) annotation (Placement(transformation(extent={{8,20},{28,40}})));
  TransiEnt.Producer.Heat.Power2Heat.ElectricBoiler.ElectricBoiler simpleElectricBoiler(
    Q_flow_n=140e6,
    usePowerPort=true,
    useFluidPorts=false,
    useHeatPort=true)    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-50e6,
    offset=-100e6,
    startTime=3600,
    duration=900)
    annotation (Placement(transformation(extent={{-54,70},{-34,90}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency electricGrid1(useInputConnector=false) annotation (Placement(transformation(extent={{8,-62},{28,-42}})));
  TransiEnt.Producer.Heat.Power2Heat.ElectricBoiler.ElectricBoiler simpleElectricBoiler1(
    Q_flow_n=140e6,
    usePowerPort=true,
    useFluidPorts=true) annotation (Placement(transformation(extent={{-10,-32},{10,-12}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=-50e6,
    offset=-100e6,
    startTime=3600,
    duration=900)
    annotation (Placement(transformation(extent={{-54,-12},{-34,8}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=283.15) annotation (Placement(transformation(extent={{40,50},{20,70}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency electricGrid2(useInputConnector=false) annotation (Placement(transformation(extent={{28,-130},{48,-110}})));
  TransiEnt.Producer.Heat.Power2Heat.ElectricBoiler.ElectricBoiler simpleElectricBoiler2(
    usePelset=true,
    Q_flow_n=140e6,
    usePowerPort=true,
    useFluidPorts=false) annotation (Placement(transformation(extent={{-8,-122},{12,-102}})));
  Modelica.Blocks.Sources.Ramp ramp2(
    height=-50e6,
    offset=-100e6,
    startTime=3600,
    duration=900)
    annotation (Placement(transformation(extent={{-50,-106},{-30,-86}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(extent={{-52,-50},{-32,-30}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=400) annotation (Placement(transformation(extent={{-78,-47},{-58,-27}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=60*4200) annotation (Placement(transformation(extent={{-78,-63},{-58,-43}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink fluidSink annotation (Placement(transformation(extent={{54,-32},{34,-12}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=17e5) annotation (Placement(transformation(extent={{86,-32},{66,-12}})));
equation

  connect(ramp.y, simpleElectricBoiler.Q_flow_set) annotation (Line(
      points={{-33,80},{-10.4,80},{-10.4,61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(electricGrid.epp, simpleElectricBoiler.epp) annotation (Line(
      points={{8,30},{0,30},{0,49.8}},
      color={0,135,135},
      thickness=0.5));
  connect(ramp1.y, simpleElectricBoiler1.Q_flow_set) annotation (Line(
      points={{-33,-2},{-10.4,-2},{-10.4,-21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(electricGrid1.epp, simpleElectricBoiler1.epp) annotation (Line(
      points={{8,-52},{0,-52},{0,-32.2}},
      color={0,135,135},
      thickness=0.5));
  connect(fixedTemperature.port, simpleElectricBoiler.heat) annotation (Line(points={{20,60},{16,60},{16,63.8},{10.4,63.8}},
                                                                                                       color={191,0,0}));
  connect(electricGrid2.epp,simpleElectricBoiler2. epp) annotation (Line(
      points={{28,-120},{16,-120},{16,-126},{2,-126},{2,-122.2}},
      color={0,135,135},
      thickness=0.5));
  connect(ramp2.y, simpleElectricBoiler2.P_el_set) annotation (Line(points={{-29,-96},{-7.6,-96},{-7.6,-114.4}}, color={0,0,127}));
  connect(fluidSource.port_a, simpleElectricBoiler1.fluidPortIn) annotation (Line(points={{-32,-40},{-16,-40},{-16,-22},{-10.4,-22}}, color={0,0,0}));
  connect(realExpression.y, fluidSource.m_flow_in) annotation (Line(points={{-57,-37},{-50,-37}}, color={0,0,127}));
  connect(realExpression1.y, fluidSource.h_in) annotation (Line(points={{-57,-53},{-57,-48},{-50,-48},{-50,-42}}, color={0,0,127}));
  connect(realExpression2.y, fluidSink.p_in) annotation (Line(points={{65,-22},{52,-22}}, color={0,0,127}));
  connect(fluidSink.port_a, simpleElectricBoiler1.fluidPortOut) annotation (Line(points={{34,-22},{10.2,-22}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{100,100}})),
                                experiment(StopTime=7200),
    Icon(coordinateSystem(extent={{-100,-140},{100,100}})));
end TestElectricBoiler_L1;
