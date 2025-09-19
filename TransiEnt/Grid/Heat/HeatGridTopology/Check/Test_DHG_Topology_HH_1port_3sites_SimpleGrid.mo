within TransiEnt.Grid.Heat.HeatGridTopology.Check;
model Test_DHG_Topology_HH_1port_3sites_SimpleGrid
  import TransiEnt;

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
  // Gas- und WÃ¤rme-Institut Essen						  //
  // and                                                                            //
  // XRG Simulation GmbH (Hamburg, Germany).                                        //
  //________________________________________________________________________________//
  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________
  extends TransiEnt.Basics.Icons.Example;

// _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________
  inner TransiEnt.ModelStatistics modelStatistics
    annotation (Placement(transformation(extent={{-338,240},{-318,260}})));
  inner TransiEnt.SimCenter simCenter(p_nom={420000,460000}) annotation (Placement(transformation(extent={{-358,240},{-338,260}})));
  TransiEnt.Producer.Combined.LargeScaleCHP.ContinuousCHP HKW_Wedel2(
    typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.BlackCoal,
    PQCharacteristics=TransiEnt.Producer.Combined.LargeScaleCHP.Base.Characteristics.PQ_Characteristics_WW2(),
    P_el_n=137e6,
    p_nom=20e5,
    m_flow_nom=1100,
    h_nom=120*4.2) annotation (Placement(transformation(extent={{-334,-112},{-256,-48}})));
    //typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Cogeneration,
  TransiEnt.Producer.Combined.LargeScaleCHP.ContinuousCHP HKW_Tiefstack(
    P_el_n=200e6,
    Q_flow_init=300e6,
    typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.BlackCoal,
    PQCharacteristics=TransiEnt.Producer.Combined.LargeScaleCHP.Base.Characteristics.PQ_Characteristics_WT(),
    p_nom=20e5,
    m_flow_nom=1500,
    h_nom=120*4.2) annotation (Placement(transformation(extent={{340,-50},{272,18}})));
    //typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Cogeneration,
  TransiEnt.Grid.Heat.HeatGridControl.Controllers.SimpleDHNDispatcher simpleHeatDispatcher annotation (Placement(transformation(rotation=0, extent={{-340,168},{-278,230}})));

  TransiEnt.Producer.Heat.Gas2Heat.SimpleGasBoiler.SimpleBoiler HW_HafenCity(typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrierHeat.NaturalGas, p_drop=50000) annotation (Placement(transformation(
        extent={{-19,-18},{19,18}},
        rotation=0,
        origin={-73,-110})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency constantFrequency_L1_3(useInputConnector=false) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-10,136})));
  TransiEnt.Components.Boundaries.Gas.BoundaryRealGas_pTxi gasGrid annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-164})));
  TransiEnt.Grid.Heat.HeatGridTopology.GridConfigurations.DHG_Topology_HH_1port_3sites_SimpleGrid dHN_Topology_HH_SimpleGrid_3sites annotation (Placement(transformation(extent={{-102,-74},{150,100}})));
  TransiEnt.Producer.Combined.LargeScaleCHP.ContinuousCHP HKW_Wedel1(
    typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.BlackCoal,
    PQCharacteristics=TransiEnt.Producer.Combined.LargeScaleCHP.Base.Characteristics.PQ_Characteristics_WW1(),
    P_el_n=150e6,
    p_nom=20e5,
    m_flow_nom=1100,
    h_nom=120*4.2) annotation (Placement(transformation(extent={{-334,-42},{-256,22}})));
    //typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Cogeneration,
  Modelica.Blocks.Sources.RealExpression P_set(y=simpleHeatDispatcher.P_el_WW/2) annotation (Placement(transformation(extent={{-354,32},{-334,52}})));
  Modelica.Blocks.Sources.RealExpression Q_flow_set(y=simpleHeatDispatcher.Q_flow_WW/2) annotation (Placement(transformation(extent={{-318,58},{-298,78}})));
  Modelica.Blocks.Sources.RealExpression m_flow_set(y=-1*simpleHeatDispatcher.m_flow_WW) annotation (Placement(transformation(extent={{-272,-162},{-252,-142}})));
  Modelica.Blocks.Sources.RealExpression m_flow_set1(y=-1*simpleHeatDispatcher.m_flow_peak) annotation (Placement(transformation(extent={{-154,-198},{-134,-178}})));
  Modelica.Blocks.Sources.RealExpression m_flow_set2(y=-1*simpleHeatDispatcher.m_flow_WT) annotation (Placement(transformation(extent={{222,-120},{242,-100}})));
  TransiEnt.Components.Visualization.InfoBoxLargeCHP infoBoxLargeCHP annotation (Placement(transformation(extent={{236,-82},{170,-30}})));
  TransiEnt.Components.Visualization.InfoBoxLargeCHP infoBoxLargeCHP1 annotation (Placement(transformation(extent={{-218,-4},{-154,64}})));
  TransiEnt.Components.Visualization.InfoBoxLargeCHP infoBoxLargeCHP2 annotation (Placement(transformation(extent={{-216,-80},{-156,-18}})));
  Modelica.Blocks.Sources.RealExpression T_return(y=4200*simpleHeatDispatcher.supplyandReturnTemperature.T_set[2])     annotation (Placement(transformation(extent={{-262,-186},{-242,-166}})));
  Modelica.Blocks.Sources.RealExpression T_return1(y=4200*simpleHeatDispatcher.supplyandReturnTemperature.T_set[2])     annotation (Placement(transformation(extent={{-142,-220},{-122,-200}})));
  Modelica.Blocks.Sources.RealExpression T_return2(y=4200*simpleHeatDispatcher.supplyandReturnTemperature.T_set[2])     annotation (Placement(transformation(extent={{232,-138},{252,-118}})));
  TransiEnt.Components.Visualization.DynDisplay Time(
    x1=time/3600,
    unit="h",
    varname="Time") annotation (Placement(transformation(extent={{260,-256},{354,-226}})));
  TransiEnt.Components.Visualization.DynDisplay HeatDemand_Display(
    varname="Heat Demand",
    x1=dHN_Topology_HH_SimpleGrid_3sites.Q_flow_dem/1e6,
    unit="MW") annotation (Placement(transformation(extent={{262,-222},{354,-188}})));
  TransiEnt.Components.Visualization.DynDisplay T_amb_Display(
    varname="T_amb",
    x1=simpleHeatDispatcher.temperatureHH_900s_01012012_0000_31122012_2345.value,
    unit="C") annotation (Placement(transformation(extent={{260,-186},{352,-154}})));

// _____________________________________________
  //
  //           Functions
  // _____________________________________________

   function plotResult
   constant String resultFileName = "Test_DHG_Topology_HH_1port_3sites_SimpleGrid.mat";
   algorithm
    TransiEnt.Basics.Functions.plotResult("resultFileName");
     createPlot(id=2, position={744, 0, 763, 423}, y={"simpleHeatDispatcher.P_el_WW", "simpleHeatDispatcher.P_el_WT"}, range={0.0, 32000000.0, -300000000.0, 0.0}, grid=true, colors={{28,108,200}, {238,46,47}}, filename=resultFileName);
      createPlot(id=2, position={744, 0, 763, 138}, y={"simpleHeatDispatcher.m_flow_WW", "simpleHeatDispatcher.m_flow_WT",
      "simpleHeatDispatcher.m_flow_peak"}, range={0.0, 32000000.0, -2000.0, 0.0}, grid=true, subPlot=3, colors={{28,108,200}, {238,46,47}, {0,140,72}});
      createPlot(id=2, position={744, 0, 763, 137}, y={"simpleHeatDispatcher.Q_flow_WW", "simpleHeatDispatcher.Q_flow_WT",
      "simpleHeatDispatcher.Q_flow_peak"}, range={0.0, 32000000.0, -1000000000.0, 500000000.0}, grid=true, subPlot=2, colors={{28,108,200}, {238,46,47}, {0,140,72}});
      createPlot(id=5, position={-13, 0, 741, 858}, y={"dHN_Topology_HH_SimpleGrid_3sites.Q_flow_dem"}, range={0.0, 32000000.0, -200.0, 1800.0}, autoscale=false, grid=true, colors={{28,108,200}}, range2={0.5599999999999999, 0.82});
      createPlot(id=5, position={-13, 0, 741, 426}, y={"dHN_Topology_HH_SimpleGrid_3sites.Q_dem"}, range={0.0, 32000000.0, -500000000.0, 4000000000.0}, grid=true, subPlot=2, colors={{28,108,200}});
      createPlot(id=6, position={743, 457, 758, 410}, y={"dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerWest.fluidIn.T",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerNorth.fluidIn.T",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerEast.fluidIn.T",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerWest.fluidOut.T",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerNorth.fluidOut.T",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerEast.fluidOut.T",
      "dHN_Topology_HH_SimpleGrid_3sites.supplyandReturnTemperature1.T_set[1]",
      "dHN_Topology_HH_SimpleGrid_3sites.supplyandReturnTemperature1.T_set[2]"}, range={0.0, 32000000.0, 0.0, 150.0}, grid=true, colors={{28,108,200}, {238,46,47}, {0,140,72}, {217,67,180}, {0,0,0}, {162,29,33},
      {244,125,35}, {102,44,145}});
      createPlot(id=6, position={743, 457, 758, 202}, y={"dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerWest.fluidIn.p",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerNorth.fluidIn.p",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerEast.fluidIn.p",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerNorth.fluidOut.p",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerEast.fluidOut.p",
      "dHN_Topology_HH_SimpleGrid_3sites.HeatConsumerWest.fluidOut.p"}, range={0.0, 32000000.0, 4.15, 4.4}, autoscale=false, grid=true, subPlot=2, colors={{28,108,200}, {238,46,47}, {0,140,72}, {217,67,180}, {0,0,0}, {162,29,33}}, range2={0.67, 0.7200000000000001});

   end plotResult;

  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-240,-130})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-118,-152})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter annotation (Placement(transformation(extent={{-214,-23},{-202,-11}})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter1 annotation (Placement(transformation(extent={{-42,-116},{-30,-104}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={256,-86})));
  TransiEnt.Basics.Adapters.FluidPortAdapter fluidPortAdapter2 annotation (Placement(transformation(extent={{242,-30},{230,-18}})));
equation
// _____________________________________________
//
//               Connect Statements
// _____________________________________________
  connect(simpleHeatDispatcher.Q_flow_peak,HW_HafenCity. Q_flow_set)
    annotation (Line(
      points={{-274.9,174.2},{-258,174.2},{-258,174},{-162,174},{-162,-92},{-73,-92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HKW_Tiefstack.epp,constantFrequency_L1_3. epp) annotation (Line(
      points={{273.7,-5.8},{272,-5.8},{272,126},{-10,126}},
      color={0,135,135},
      thickness=0.5,
      smooth=Smooth.None));

  connect(HKW_Wedel2.epp, constantFrequency_L1_3.epp) annotation (Line(
      points={{-257.95,-70.4},{-218.975,-70.4},{-218.975,126},{-10,126}},
      color={0,135,135},
      thickness=0.5,
      smooth=Smooth.None));

  connect(gasGrid.gasPort, HW_HafenCity.gasIn) annotation (Line(
      points={{-70,-154},{-72,-154},{-72,-128},{-72.62,-128}},
      color={255,255,0},
      thickness=0.75));
  connect(simpleHeatDispatcher.Q_flow_WT, HKW_Tiefstack.Q_flow_set) annotation (Line(points={{-274.9,215.12},{293.42,215.12},{293.42,10.0667}},
                                                                                                                                              color={0,0,127}));
  connect(HKW_Tiefstack.P_set, simpleHeatDispatcher.P_el_WT) annotation (Line(points={{326.74,10.0667},{326.74,221.32},{-274.9,221.32}},
                                                                                                                                       color={0,0,127}));
  connect(HKW_Wedel1.epp, constantFrequency_L1_3.epp) annotation (Line(
      points={{-257.95,-0.4},{-236.975,-0.4},{-236.975,126},{-10,126}},
      color={0,135,135},
      thickness=0.5));
  connect(P_set.y, HKW_Wedel1.P_set) annotation (Line(points={{-333,42},{-314,42},{-314,14.5333},{-318.79,14.5333}}, color={0,0,127}));
  connect(P_set.y, HKW_Wedel2.P_set) annotation (Line(points={{-333,42},{-316,42},{-316,-55.4667},{-318.79,-55.4667}}, color={0,0,127}));
  connect(Q_flow_set.y, HKW_Wedel1.Q_flow_set) annotation (Line(points={{-297,68},{-290,68},{-290,14.5333},{-280.57,14.5333}}, color={0,0,127}));
  connect(Q_flow_set.y, HKW_Wedel2.Q_flow_set) annotation (Line(points={{-297,68},{-297,4},{-280.57,4},{-280.57,-55.4667}}, color={0,0,127}));
  connect(HKW_Tiefstack.eye, infoBoxLargeCHP.eye) annotation (Line(points={{268.6,-47.1667},{252,-47.1667},{252,-51.7455},{232.7,-51.7455}}, color={28,108,200}));
  connect(HKW_Wedel1.eye, infoBoxLargeCHP1.eye) annotation (Line(points={{-252.1,-39.3333},{-230,-39.3333},{-230,35.5636},{-214.8,35.5636}}, color={28,108,200}));
  connect(HKW_Wedel2.eye, infoBoxLargeCHP2.eye) annotation (Line(points={{-252.1,-109.333},{-230,-109.333},{-230,-43.9273},{-213,-43.9273}}, color={28,108,200}));
  connect(HKW_Wedel2.outlet, HKW_Wedel1.inlet) annotation (Line(points={{-255.22,-86.9333},{-242,-86.9333},{-242,-24.4},{-255.22,-24.4}}, color={0,0,0}));
  connect(fluidSource.port_a, HKW_Wedel2.inlet) annotation (Line(points={{-240,-120},{-240,-94.4},{-255.22,-94.4}}, color={0,0,0}));
  connect(m_flow_set.y, fluidSource.m_flow_in) annotation (Line(points={{-251,-152},{-251,-148},{-243,-148},{-243,-138}}, color={0,0,127}));
  connect(T_return.y, fluidSource.h_in) annotation (Line(points={{-241,-176},{-238,-176},{-238,-138}}, color={0,0,127}));
  connect(m_flow_set1.y, fluidSource1.m_flow_in) annotation (Line(points={{-133,-188},{-122,-188},{-122,-160},{-121,-160}}, color={0,0,127}));
  connect(T_return1.y, fluidSource1.h_in) annotation (Line(points={{-121,-210},{-116,-210},{-116,-160}}, color={0,0,127}));
  connect(fluidSource1.port_a, HW_HafenCity.inlet) annotation (Line(points={{-118,-142},{-118,-110},{-91.62,-110}}, color={0,0,0}));
  connect(HKW_Wedel1.outlet, fluidPortAdapter.fluidPortIn) annotation (Line(points={{-255.22,-16.9333},{-232,-16.9333},{-232,-17},{-214,-17}}, color={0,0,0}));
  connect(fluidPortAdapter.fluidPortOut, dHN_Topology_HH_SimpleGrid_3sites.fluidPortWest) annotation (Line(
      points={{-202,-17},{-112,-17},{-112,13.2351},{-54.0128,13.2351}},
      color={175,0,0},
      thickness=0.5));
  connect(fluidPortAdapter1.fluidPortIn, HW_HafenCity.outlet) annotation (Line(points={{-42,-110},{-54,-110}}, color={0,0,0}));
  connect(fluidPortAdapter1.fluidPortOut, dHN_Topology_HH_SimpleGrid_3sites.fluidPortCenter) annotation (Line(
      points={{-30,-110},{18.3702,-110},{18.3702,1.00811}},
      color={175,0,0},
      thickness=0.5));
  connect(m_flow_set2.y, fluidSource2.m_flow_in) annotation (Line(points={{243,-110},{243,-104},{253,-104},{253,-94}}, color={0,0,127}));
  connect(T_return2.y, fluidSource2.h_in) annotation (Line(points={{253,-128},{260,-128},{260,-94},{258,-94}}, color={0,0,127}));
  connect(fluidSource2.port_a, HKW_Tiefstack.inlet) annotation (Line(points={{256,-76},{256,-31.3},{271.32,-31.3}}, color={0,0,0}));
  connect(fluidPortAdapter2.fluidPortIn, HKW_Tiefstack.outlet) annotation (Line(points={{242,-24},{256.66,-24},{256.66,-23.3667},{271.32,-23.3667}}, color={0,0,0}));
  connect(fluidPortAdapter2.fluidPortOut, dHN_Topology_HH_SimpleGrid_3sites.fluidPortEast) annotation (Line(
      points={{230,-24},{152,-24},{152,-84},{36.6,-84},{36.6,-3.22432}},
      color={175,0,0},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-360,-260},{360,260}})),
                                          Icon(graphics,
                                               coordinateSystem(extent={{-360,-260},{360,260}})),
    experiment(StopTime=604800),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Tester for DHG_Topology_HH_1port_3sites_SimpleGrid</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end Test_DHG_Topology_HH_1port_3sites_SimpleGrid;
