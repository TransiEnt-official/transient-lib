within TransiEnt.Examples.Heat;
model DHN_Tutorial_Step3

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
  //          Imports and Class Hierarchy
  // _____________________________________________

  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{-56,68},{-36,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=6e5) annotation (Placement(transformation(extent={{-84,68},{-64,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=heatpump1.inlet.m_flow*((4186*60) - inStream(heatpump1.inlet.h_outflow)))          annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=0.1e5)
                                                                annotation (Placement(transformation(extent={{-60,42},{-40,62}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=topologyA_Ports.consumer_9.inlet.p - topologyA_Ports.consumer_9.outlet.p)       annotation (Placement(transformation(extent={{-60,22},{-40,42}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10,
    Ti=1000,
    yMax=24e5,
    yMin=0.0001) annotation (Placement(transformation(extent={{-28,42},{-8,62}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump_DHN heatpump1(P_el_max(displayUnit="MW") = 200000000, P_el_min=0.00001) annotation (Placement(transformation(extent={{-14,-20},{6,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=60)                              annotation (Placement(transformation(extent={{-60,4},{-40,24}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyA_Ports topologyA_Ports annotation (Placement(transformation(
        extent={{-31,-16},{31,16}},
        rotation=90,
        origin={153,-17})));
  TransiEnt.Storage.Heat.HotWaterStorage_constProp_L4.HotWaterStorage_constProp_L4 hotWaterStorage_constProp_L4_1(V=35)
                                                                                                                       annotation (Placement(transformation(extent={{64,-28},{84,-8}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter annotation (Placement(transformation(extent={{120,-35},{110,-25}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter1 annotation (Placement(transformation(extent={{102,-19},{92,-9}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{124,76},{144,96}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.5e5)                                                                             annotation (Placement(transformation(extent={{-60,-64},{-40,-44}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter2 annotation (Placement(transformation(extent={{44,-19},{54,-9}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter3
                                                              annotation (Placement(transformation(extent={{44,-33},{54,-23}})));
  TransiEnt.Components.Heat.SimplePump_mflow simplePump2 annotation (Placement(transformation(extent={{22,-12},{38,4}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=18)                                                                                annotation (Placement(transformation(extent={{2,2},{16,17}})));
  TransiEnt.Components.Heat.SimplePump_dp pump_Dp annotation (Placement(transformation(extent={{110,-18},{120,-8}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=0) annotation (Placement(transformation(extent={{50,14},{70,34}})));
equation
  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

  connect(sink.p_in,realExpression. y) annotation (Line(points={{-54,78},{-54,78},{-63,78}},                  color={0,0,127}));
  connect(realExpression6.y,PID. u_s) annotation (Line(points={{-39,52},{-30,52}},     color={0,0,127}));
  connect(realExpression7.y,PID. u_m) annotation (Line(points={{-39,32},{-18,32},{-18,40}},       color={0,0,127}));
  connect(realExpression3.y,heatpump1. T_set_variable) annotation (Line(points={{-39,14},{-8,14},{-8,0}},          color={0,0,127}));
  connect(realExpression9.y,heatpump1. Q_flow_set) annotation (Line(points={{-39,-10},{-12,-10}},                                    color={0,0,127}));
  connect(fluidPortAdapter.fluidPortOut, hotWaterStorage_constProp_L4_1.waterPortIn_grid[1]) annotation (Line(
      points={{110,-30},{92,-30},{92,-22},{84,-22}},
      color={175,0,0},
      thickness=0.5));
  connect(fluidPortAdapter1.fluidPortOut, hotWaterStorage_constProp_L4_1.waterPortOut_grid[1]) annotation (Line(
      points={{92,-14},{84,-14}},
      color={175,0,0},
      thickness=0.5));
  connect(fluidPortAdapter2.fluidPortOut, hotWaterStorage_constProp_L4_1.waterPortIn_prod[1]) annotation (Line(
      points={{54,-14},{64,-14}},
      color={175,0,0},
      thickness=0.5));
  connect(fluidPortAdapter3.fluidPortOut, hotWaterStorage_constProp_L4_1.waterPortOut_prod[1]) annotation (Line(
      points={{54,-28},{64,-28},{64,-22}},
      color={175,0,0},
      thickness=0.5));
  connect(heatpump1.inlet, fluidPortAdapter3.fluidPortIn) annotation (Line(points={{6,-16.2},{38,-16.2},{38,-28},{44,-28}}, color={0,0,0}));
  connect(heatpump1.outlet, simplePump2.inlet) annotation (Line(points={{5.8,-4},{21.84,-4}}, color={0,0,0}));
  connect(fluidPortAdapter2.fluidPortIn, simplePump2.outlet) annotation (Line(points={{44,-14},{38.16,-14},{38.16,-4}}, color={0,0,0}));
  connect(sink.port_a, simplePump2.outlet) annotation (Line(points={{-36,78},{44,78},{44,-4},{38.16,-4}}, color={0,0,0}));
  connect(realExpression4.y, simplePump2.m_flow) annotation (Line(points={{16.7,9.5},{18,9.5},{18,0.8},{22.48,0.8}}, color={0,0,127}));
  connect(fluidPortAdapter.fluidPortIn, topologyA_Ports.outlet) annotation (Line(points={{120,-30},{130,-30},{130,-14},{137.2,-14}}, color={0,0,0}));
  connect(pump_Dp.inlet, fluidPortAdapter1.fluidPortIn) annotation (Line(points={{109.9,-13},{109.9,-14},{102,-14}}, color={0,0,0}));
  connect(pump_Dp.outlet, topologyA_Ports.inlet) annotation (Line(points={{120.1,-13},{132,-13},{132,-19.8},{137.2,-19.8}}, color={0,0,0}));
  connect(PID.y, pump_Dp.delta_p) annotation (Line(points={{-7,52},{115,52},{115,-8}}, color={0,0,127}));
  connect(realExpression1.y, heatpump1.dp) annotation (Line(points={{-39,-54},{-20,-54},{-20,20},{-4,20},{-4,0}}, color={0,0,127}));
  connect(fixedHeatFlow.port, hotWaterStorage_constProp_L4_1.heatPortAmbient) annotation (Line(points={{70,24},{74,24},{74,-9.5}}, color={191,0,0}));
  annotation (experiment(StopTime=172800, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100,-100},{180,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{180,100}}), graphics={
                                   Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-84,-100},{116,100}}),  Polygon(
          origin={38,14},
          lineColor={78,138,73},
          fillColor={0,124,124},
          fillPattern=FillPattern.Solid,
          points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A tutorial for the modeling of district heating networks with the TransiEnt Library. Step 3 is about adding a heat storage to the simulation. </p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The written Tutorial can be found on the TransiEnt website: https://www.tuhh.de/transient-ee/tutorials</p>
</html>"));
end DHN_Tutorial_Step3;
