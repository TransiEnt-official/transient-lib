within TransiEnt.Examples.Heat;
model DHN_Tutorial_Step5

//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 3.0.0                             //
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
  Modelica.Blocks.Sources.RealExpression realExpression9(y=heatpump1.inlet.m_flow*((4186*60) - inStream(heatpump1.inlet.h_outflow)))          annotation (Placement(transformation(extent={{-112,-24},{-92,-4}})));
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
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.5e5)                                                                             annotation (Placement(transformation(extent={{-88,6},{-68,26}})));
  TransiEnt.Components.Heat.SimplePump_mflow simplePump2 annotation (Placement(transformation(extent={{-28,-16},{-12,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=15)                                                                                annotation (Placement(transformation(extent={{-50,2},{-36,17}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={22,0})));
  TransiEnt.Components.Heat.SimplePump_mflow simplePump1 annotation (Placement(transformation(extent={{-26,-64},{-10,-48}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=9)                                                                                 annotation (Placement(transformation(extent={{-48,-46},{-34,-31}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split annotation (Placement(transformation(extent={{20,-44},{0,-24}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow(Q_flow=0) annotation (Placement(transformation(extent={{38,2},{58,22}})));
  TransiEnt.Components.Heat.SimplePump_dp pump_Dp annotation (Placement(transformation(extent={{110,-19},{120,-9}})));
  TransiEnt.Producer.Heat.SolarThermal.SolarCollector_L1_constProp solarCollector(
    area=5000,
    c_eff=5000,
    eta_0=0.793,
    a1=4.04,
    a2=0.0182,
    redeclare model Skymodel = TransiEnt.Producer.Heat.SolarThermal.Base.Skymodel_isotropicDiffuse,
    Q_flow_n=2e3,
    G_min=150)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-64,-74})));
  TransiEnt.Producer.Heat.SolarThermal.Control.ControllerPumpSolarCollectorDeltaT controller(PID(
      y_max=40/3600*solarCollector.area,
      y_min=8/3600*solarCollector.area,
      k=(controller.PID.y_max - controller.PID.y_min)/(90 - 75)), Tau_out=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-66,-48})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter annotation (Placement(transformation(extent={{-94,-78},{-86,-70}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter1 annotation (Placement(transformation(extent={{-40,-78},{-48,-70}})));
  inner TransiEnt.SimCenter simCenter(redeclare TILMedia.VLEFluidTypes.TILMedia_SplineWater fluid1, ambientConditions(
      redeclare TransiEnt.Basics.Tables.Ambient.GHI_Hamburg_3600s_2012_TMY globalSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.DNI_Hamburg_3600s_2012_TMY directSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.DHI_Hamburg_3600s_2012_TMY diffuseSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.Temperature_Berlin_3600s_2012 temperature,
      redeclare TransiEnt.Basics.Tables.Ambient.Wind_Hamburg_Fuhlsbuettel_3600s_2012 wind))         annotation (Placement(transformation(extent={{144,74},{164,94}})));
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
  connect(sink.port_a, simplePump2.outlet) annotation (Line(points={{-36,78},{-2,78},{-2,-8},{-11.84,-8}},color={0,0,0}));
  connect(realExpression4.y, simplePump2.m_flow) annotation (Line(points={{-35.3,9.5},{-36,9.5},{-36,10},{-27.52,10},{-27.52,-3.2}},
                                                                                                                     color={0,0,127}));
  connect(realExpression1.y, heatpump1.dp) annotation (Line(points={{-67,16},{-56,16},{-56,-4}}, color={0,0,127}));
  connect(heatpump1.outlet, simplePump2.inlet) annotation (Line(points={{-46.2,-8},{-28.16,-8}}, color={0,0,0}));
  connect(simplePump2.outlet, join.inlet2) annotation (Line(points={{-11.84,-8},{14,-8},{14,24},{22,24},{22,9.8}}, color={0,0,0}));
  connect(simplePump1.outlet, join.inlet1) annotation (Line(points={{-9.84,-56},{21.8,-56},{21.8,-10}}, color={0,0,0}));
  connect(split.outlet1, heatpump1.inlet) annotation (Line(points={{10,-24.2},{10,-20.2},{-46,-20.2}}, color={0,0,0}));
  connect(fixedHeatFlow.port, hotWaterStorage_constProp_L4_1.heatPortAmbient) annotation (Line(points={{58,12},{74,12},{74,-9.5}}, color={191,0,0}));
  connect(topologyA_Ports.inlet, pump_Dp.outlet) annotation (Line(points={{137.2,-19.8},{120.1,-19.8},{120.1,-14}}, color={0,0,0}));
  connect(PID.y, pump_Dp.delta_p) annotation (Line(points={{-7,52},{115,52},{115,-9}}, color={0,0,127}));
  connect(join.outlet, hotWaterStorage_constProp_L4_1.waterPortIn_prod[1]) annotation (Line(points={{32,0},{40,0},{40,-14},{64,-14}}, color={0,0,0}));
  connect(split.inlet, hotWaterStorage_constProp_L4_1.waterPortOut_prod[1]) annotation (Line(points={{20,-34},{40,-34},{40,-22},{64,-22}}, color={0,0,0}));
  connect(hotWaterStorage_constProp_L4_1.waterPortIn_grid[1], topologyA_Ports.outlet) annotation (Line(points={{84,-22},{84,-26},{132,-26},{132,-14},{137.2,-14}}, color={0,0,0}));
  connect(hotWaterStorage_constProp_L4_1.waterPortOut_grid[1], pump_Dp.inlet) annotation (Line(points={{84,-14},{109.9,-14}}, color={0,0,0}));
  connect(solarCollector.T_in,controller. T_solar_in) annotation (Line(points={{-69.1,-65.9},{-69.1,-61.95},{-70,-61.95},{-70,-58}},
                                                                                                            color={0,0,127}));
  connect(controller.T_solar_out,solarCollector. T_out) annotation (Line(points={{-62,-58},{-62,-65},{-58,-65}},
                                                                                                            color={0,0,127}));
  connect(fluidPortAdapter.fluidPortOut, solarCollector.waterPortIn) annotation (Line(
      points={{-86,-74},{-72,-74}},
      color={175,0,0},
      thickness=0.5));
  connect(fluidPortAdapter1.fluidPortOut, solarCollector.waterPortOut) annotation (Line(
      points={{-48,-74},{-56,-74}},
      color={175,0,0},
      thickness=0.5));
  connect(fluidPortAdapter1.fluidPortIn, simplePump1.inlet) annotation (Line(points={{-40,-74},{-32,-74},{-32,-56},{-26.16,-56}}, color={0,0,0}));
  connect(fluidPortAdapter.fluidPortIn, split.outlet2) annotation (Line(points={{-94,-74},{-102,-74},{-102,-98},{10,-98},{10,-44}}, color={0,0,0}));
  connect(controller.y, simplePump1.m_flow) annotation (Line(points={{-66,-37},{-66,-34},{-52,-34},{-52,-51.2},{-25.52,-51.2}}, color={0,0,127}));
  annotation (experiment(
      StartTime=13140000,
      StopTime=15768000,
      __Dymola_Algorithm="Dassl"),
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
          points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A tutorial for the modeling of district heating networks with the TransiEnt Library. In Step 5 a solar thermal collector is added to the simulation. The difference to the other heat producer is that the solar thermal producer calculates a heat flow rate from given ambient conditions, while the heat flow rate of the other consumers is set. The supply temperature provided by the solar thermal collector is set with a controller that sets the mass flow rate of the pump so that a given temperature is achieved. </p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The written Tutorial can be found on the TransiEnt website: https://www.tuhh.de/transient-ee/tutorials</p>
</html>"));
end DHN_Tutorial_Step5;
