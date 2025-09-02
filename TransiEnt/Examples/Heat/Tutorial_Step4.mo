within TransiEnt.Examples.Heat;
model Tutorial_Step4

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
  Modelica.Blocks.Sources.RealExpression realExpression9(y=heatpump1.inlet.m_flow*((4200*trapezoid.y) - inStream(heatpump1.inlet.h_outflow))) annotation (Placement(transformation(extent={{-112,-24},{-92,-4}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=0.1e5)
                                                                annotation (Placement(transformation(extent={{-60,42},{-40,62}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=topologyA_Ports.consumer_9.inlet.p - topologyA_Ports.consumer_9.outlet.p)       annotation (Placement(transformation(extent={{-60,22},{-40,42}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10,
    Ti=1000,
    yMax=24e5,
    yMin=0.0001) annotation (Placement(transformation(extent={{-28,42},{-8,62}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump_DHN heatpump1(P_el_max(displayUnit="MW") = 200000000, P_el_min=0.00001) annotation (Placement(transformation(extent={{-66,-24},{-46,-4}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=60)                              annotation (Placement(transformation(extent={{-112,0},{-92,20}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyA_Ports topologyA_Ports annotation (Placement(transformation(
        extent={{-31,-16},{31,16}},
        rotation=90,
        origin={153,-17})));
  TransiEnt.Storage.Heat.HotWaterStorage_constProp_L4.HotWaterStorage_constProp_L4 hotWaterStorage_constProp_L4_1(V=20)
                                                                                                                       annotation (Placement(transformation(extent={{64,-28},{84,-8}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter annotation (Placement(transformation(extent={{120,-39},{110,-29}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter1 annotation (Placement(transformation(extent={{102,-19},{92,-9}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{124,76},{144,96}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.5e5)                                                                             annotation (Placement(transformation(extent={{-88,6},{-68,26}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter2 annotation (Placement(transformation(extent={{44,-19},{54,-9}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter3
                                                              annotation (Placement(transformation(extent={{44,-33},{54,-23}})));
  TransiEnt.Components.Heat.SimplePump_mflow simplePump2 annotation (Placement(transformation(extent={{-28,-16},{-12,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=9)                                                                                 annotation (Placement(transformation(extent={{-42,2},{-28,17}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={22,0})));
  TransiEnt.Components.Heat.SimplePump_mflow simplePump1 annotation (Placement(transformation(extent={{-26,-64},{-10,-48}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=9)                                                                                 annotation (Placement(transformation(extent={{-48,-46},{-34,-31}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split annotation (Placement(transformation(extent={{20,-44},{0,-24}})));
  TransiEnt.Producer.Heat.Gas2Heat.SimpleGasBoiler.SimpleBoiler gasBoiler(useGasPort=false) annotation (Placement(transformation(extent={{-88,-60},{-68,-40}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter4
                                                              annotation (Placement(transformation(extent={{-44,-59},{-54,-49}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter5
                                                              annotation (Placement(transformation(extent={{-36,-81},{-46,-71}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=-gasBoiler.inlet.m_flow*(60*4200 - inStream(gasBoiler.inlet.h_outflow)))           annotation (Placement(transformation(extent={{-102,-38},{-88,-23}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=0) annotation (Placement(transformation(extent={{38,2},{58,22}})));
  TransiEnt.Components.Heat.SimplePump_dp pump_Dp annotation (Placement(transformation(extent={{110,-19},{120,-9}})));
equation

  // _____________________________________________
  //
  //        Characteristic Equations
  // _____________________________________________


  connect(sink.p_in,realExpression. y) annotation (Line(points={{-54,78},{-54,78},{-63,78}},                  color={0,0,127}));
  connect(realExpression6.y,PID. u_s) annotation (Line(points={{-39,52},{-30,52}},     color={0,0,127}));
  connect(realExpression7.y,PID. u_m) annotation (Line(points={{-39,32},{-18,32},{-18,40}},       color={0,0,127}));
  connect(realExpression3.y,heatpump1. T_set_variable) annotation (Line(points={{-91,10},{-60,10},{-60,-4}},       color={0,0,127}));
  connect(realExpression9.y,heatpump1. Q_flow_set) annotation (Line(points={{-91,-14},{-64,-14}},                                    color={0,0,127}));
  connect(fluidPortAdapter.fluidPortOut, hotWaterStorage_constProp_L4_1.waterPortIn_grid[1]) annotation (Line(
      points={{110,-34},{92,-34},{92,-22},{84,-22}},
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
  connect(sink.port_a, simplePump2.outlet) annotation (Line(points={{-36,78},{-2,78},{-2,-8},{-11.84,-8}},color={0,0,0}));
  connect(realExpression4.y, simplePump2.m_flow) annotation (Line(points={{-27.3,9.5},{-27.3,3.15},{-27.52,3.15},{-27.52,-3.2}},
                                                                                                                     color={0,0,127}));
  connect(fluidPortAdapter.fluidPortIn, topologyA_Ports.outlet) annotation (Line(points={{120,-34},{130,-34},{130,-14},{137.2,-14}}, color={0,0,0}));
  connect(realExpression1.y, heatpump1.dp) annotation (Line(points={{-67,16},{-56,16},{-56,-4}}, color={0,0,127}));
  connect(realExpression2.y,simplePump1. m_flow) annotation (Line(points={{-33.3,-38.5},{-25.52,-38.5},{-25.52,-51.2}},
                                                                                                                     color={0,0,127}));
  connect(heatpump1.outlet, simplePump2.inlet) annotation (Line(points={{-46.2,-8},{-28.16,-8}}, color={0,0,0}));
  connect(simplePump2.outlet, join.inlet2) annotation (Line(points={{-11.84,-8},{14,-8},{14,24},{22,24},{22,9.8}}, color={0,0,0}));
  connect(simplePump1.outlet, join.inlet1) annotation (Line(points={{-9.84,-56},{21.8,-56},{21.8,-10}}, color={0,0,0}));
  connect(join.outlet, fluidPortAdapter2.fluidPortIn) annotation (Line(points={{32,-1.22125e-15},{38,-1.22125e-15},{38,-14},{44,-14}}, color={0,0,0}));
  connect(split.inlet, fluidPortAdapter3.fluidPortIn) annotation (Line(points={{20,-34},{38,-34},{38,-28},{44,-28}}, color={0,0,0}));
  connect(split.outlet1, heatpump1.inlet) annotation (Line(points={{10,-24.2},{10,-20.2},{-46,-20.2}}, color={0,0,0}));
  connect(gasBoiler.outlet, fluidPortAdapter4.fluidPortOut) annotation (Line(
      points={{-68,-50},{-68,-54},{-54,-54}},
      color={175,0,0},
      thickness=0.5));
  connect(fluidPortAdapter4.fluidPortIn, simplePump1.inlet) annotation (Line(points={{-44,-54},{-44,-56},{-26.16,-56}}, color={0,0,0}));
  connect(fluidPortAdapter5.fluidPortOut, gasBoiler.inlet) annotation (Line(
      points={{-46,-76},{-102,-76},{-102,-50},{-87.8,-50}},
      color={175,0,0},
      thickness=0.5));
  connect(fluidPortAdapter5.fluidPortIn, split.outlet2) annotation (Line(points={{-36,-76},{10,-76},{10,-44}}, color={0,0,0}));
  connect(realExpression5.y, gasBoiler.Q_flow_set) annotation (Line(points={{-87.3,-30.5},{-78,-30.5},{-78,-40}}, color={0,0,127}));
  connect(fixedHeatFlow.port, hotWaterStorage_constProp_L4_1.heatPortAmbient) annotation (Line(points={{58,12},{74,12},{74,-9.5}}, color={191,0,0}));
  connect(pump_Dp.inlet, fluidPortAdapter1.fluidPortIn) annotation (Line(points={{109.9,-14},{102,-14}}, color={0,0,0}));
  connect(topologyA_Ports.inlet, pump_Dp.outlet) annotation (Line(points={{137.2,-19.8},{120.1,-19.8},{120.1,-14}}, color={0,0,0}));
  connect(PID.y, pump_Dp.delta_p) annotation (Line(points={{-7,52},{115,52},{115,-9}}, color={0,0,127}));
  annotation (experiment(StopTime=172800, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-140,-100},{180,100}})),
    Icon(coordinateSystem(extent={{-140,-100},{180,100}}), graphics={
                                   Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-106,-100},{94,100}}),  Polygon(
          origin={16,14},
          lineColor={78,138,73},
          fillColor={0,124,124},
          fillPattern=FillPattern.Solid,
          points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}));
end Tutorial_Step4;
