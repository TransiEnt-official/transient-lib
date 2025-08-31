within TransiEnt.Examples.Heat;
model Largescale_DHN



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

    import      Modelica.Units.SI;

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

        parameter Real a=77200;

  // _____________________________________________
  //
  //          Variables
  // _____________________________________________

    Real TestMesh;
    Real TestPressure;
    Boolean turnOffHeatPump( start=false);


  // _____________________________________________
  //
  //          Instances of other Classes
  // _____________________________________________

protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie1_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=90,
        origin={-167,67})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie2_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=90,
        origin={-167,103})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie3_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=90,
        origin={-167,139})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie4_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=90,
        origin={-167,173})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie5_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=90,
        origin={-167,209})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join7 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-124,64})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split7 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-112,52})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join1 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-124,98})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split1 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-110,90})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join2 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-124,134})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split2 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-110,126})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join3 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-124,166})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split3 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-110,158})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join10 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-124,-84})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split10 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-112,-60})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe1_2(
    d=0.63,
    m_flow_nom=1065,
    l=5000,
    MassFlowState=false,
    N_cv=1000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-188,-60})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe1_2R(
    d=0.63,
    m_flow_nom=1065,
    l=5000,
    MassFlowState=false,
    N_cv=1000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-188,-84})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_3(
    d=0.5,
    m_flow_nom=567,
    l=1000,
    MassFlowState=false,
    N_cv=200) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-112,2})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_3R(
    d=0.5,
    m_flow_nom=567,
    l=1000,
    MassFlowState=false,
    N_cv=200) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-124,2})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe3_6R(
    d=0.24,
    m_flow_nom=97.06,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-124,80})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe3_6(
    d=0.24,
    m_flow_nom=97.06,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-110,74})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe6_8R(
    d=0.21,
    m_flow_nom=72.79,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-124,114})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe6_8(
    d=0.21,
    m_flow_nom=72.79,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-110,110})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_10R(
    d=0.18,
    m_flow_nom=48.52,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-124,148})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_10(
    d=0.18,
    m_flow_nom=48.52,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-110,140})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe10_12R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-124,186})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe10_12(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-106,186})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe3_5R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-138,64})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe3_5(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={-138,52})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe6_7R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-138,98})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe6_7(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={-138,90})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_9R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-138,134})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_9(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={-138,126})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe10_11R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-140,166})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe10_11(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={-140,158})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split4 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-112,28})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join4 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-124,40})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie6_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={-54,135})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie8_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={-52,197})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie7_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={24,173})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie9_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={24,233})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie10_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={-52,251})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split5 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={-4,100})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join5 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-18,92})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split6 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={-2,146})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join6 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-16,138})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe14_16(
    d=0.25,
    m_flow_nom=107.1,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={-2,126})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe14_16R(
    d=0.25,
    m_flow_nom=107.1,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-16,118})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe14_15R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={-36,92})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe14_15(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-36,100})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe16_17R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={16,138})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe16_17(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={16,146})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe20_21(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={16,212})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe20_21R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={16,204})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split8 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={-2,178})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join8 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-16,170})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe16_18R(
    d=0.22,
    m_flow_nom=80.33,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-16,154})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe16_18(
    d=0.22,
    m_flow_nom=80.33,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={-2,160})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe18_19R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={-32,170})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe18_19(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-32,178})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe4_13(
    d=0.44,
    m_flow_nom=448.48,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-68,28})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe4_13R(
    d=0.44,
    m_flow_nom=448.48,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-68,40})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join9 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-18,56})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split9 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={-4,68})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe13_14R(
    d=0.27,
    m_flow_nom=133.86,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-18,78})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe13_14(
    d=0.27,
    m_flow_nom=133.86,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={-4,86})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe18_20R(
    d=0.19,
    m_flow_nom=53.55,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-14,190})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe18_20(
    d=0.19,
    m_flow_nom=53.55,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={0,196})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe20_22(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-30,230})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe20_22R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={-30,220})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join11 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-14,220})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split11 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={0,212})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe13_23R(
    d=0.4,
    m_flow_nom=314.6,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={26,40})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe13_23(
    d=0.4,
    m_flow_nom=314.6,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={26,28})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={240,6})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={256,36})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe23_24R(
    d=0.36,
    m_flow_nom=264.4,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={294,36})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe23_24(
    d=0.36,
    m_flow_nom=264.4,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={294,24})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie11_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={308,133})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie13_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={310,195})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie12_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={386,171})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie14_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={386,231})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie15_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={310,249})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split13 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={358,98})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join13 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={344,90})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split14 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={360,144})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join14 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={346,136})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe25_27(
    d=0.25,
    m_flow_nom=107.1,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={360,124})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe25_27R(
    d=0.25,
    m_flow_nom=107.1,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={346,116})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe25_26R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={326,90})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe25_26(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={326,98})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe27_28R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={378,136})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe27_28(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={378,144})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe31_32(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={378,210})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe31_32R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={378,202})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split15 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={360,176})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join15 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={346,168})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe27_29R(
    d=0.22,
    m_flow_nom=80.33,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={346,152})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe27_29(
    d=0.22,
    m_flow_nom=80.33,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={360,158})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe29_30R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={330,168})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe29_30(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={330,176})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join16 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={344,54})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split16 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={358,66})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe24_25R(
    d=0.28,
    m_flow_nom=133.88,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={344,76})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe24_25(
    d=0.28,
    m_flow_nom=133.88,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={358,84})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe29_31R(
    d=0.19,
    m_flow_nom=53.55,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={348,188})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe29_31(
    d=0.19,
    m_flow_nom=53.55,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={362,194})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe31_33(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={332,228})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe31_33R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={332,218})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join17 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={348,218})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split17 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={362,210})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe24_34R(
    d=0.28,
    m_flow_nom=130.53,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={420,34})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe24_34(
    d=0.28,
    m_flow_nom=130.53,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={420,22})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split18 annotation (Placement(transformation(extent={{856,-98},{868,-86}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join18 annotation (Placement(transformation(extent={{862,-112},{850,-100}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join19 annotation (Placement(transformation(extent={{880,-116},{868,-104}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split19 annotation (Placement(transformation(extent={{882,-100},{894,-88}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyB_Ports Topologie16_B annotation (Placement(transformation(extent={{942,-130},{1014,-114}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join20 annotation (Placement(transformation(extent={{988,-76},{976,-64}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split20 annotation (Placement(transformation(extent={{962,-84},{974,-72}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyB_Ports Topologie17_B annotation (Placement(transformation(extent={{1018,-132},{1104,-114}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyB_Ports Topologie18_B annotation (Placement(transformation(extent={{710,-128},{786,-112}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split21 annotation (Placement(transformation(extent={{748,-88},{736,-76}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join21 annotation (Placement(transformation(extent={{748,-92},{760,-80}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe35_39R(
    d=0.2,
    m_flow_nom=65.26,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={800,-82})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe35_39(
    d=0.2,
    m_flow_nom=65.26,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={800,-90})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyB_Ports Topologie19_B annotation (Placement(transformation(extent={{618,-128},{694,-112}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe39_41R(
    d=0.16,
    m_flow_nom=32.63,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={704,-56})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe39_41(
    d=0.16,
    m_flow_nom=32.63,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={706,-70})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split22 annotation (Placement(transformation(extent={{860,-236},{872,-224}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join22 annotation (Placement(transformation(extent={{866,-250},{854,-238}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join23 annotation (Placement(transformation(extent={{884,-254},{872,-242}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split23 annotation (Placement(transformation(extent={{886,-238},{898,-226}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyB_Ports Topologie20_B annotation (Placement(transformation(extent={{946,-268},{1018,-252}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join24 annotation (Placement(transformation(extent={{992,-214},{980,-202}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split24 annotation (Placement(transformation(extent={{966,-222},{978,-210}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyB_Ports Topologie21_B annotation (Placement(transformation(extent={{1022,-270},{1108,-252}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyB_Ports Topologie22_B annotation (Placement(transformation(extent={{714,-266},{790,-250}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split25 annotation (Placement(transformation(extent={{752,-226},{740,-214}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join25 annotation (Placement(transformation(extent={{752,-230},{764,-218}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe43_47R(
    d=0.2,
    m_flow_nom=65.26,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={804,-220})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe43_47(
    d=0.2,
    m_flow_nom=65.26,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={804,-228})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyB_Ports Topologie23_B annotation (Placement(transformation(extent={{622,-266},{698,-250}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe47_49R(
    d=0.16,
    m_flow_nom=32.63,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={708,-194})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe47_49(
    d=0.16,
    m_flow_nom=32.63,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={710,-208})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe23_69R(
    d=0.18,
    m_flow_nom=50.2,
    l=1000,
    L=3e2,
    MassFlowState=true,
    N_cv=200,
    m_flow_start=25) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={256,-66})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe23_69(
    d=0.18,
    m_flow_nom=50.2,
    l=1000,
    L=3e2,
    MassFlowState=true,
    N_cv=200,
    m_flow_start=25) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={240,-66})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe35_42R(
    d=0.15,
    m_flow_nom=31.88,
    l=500,
    L=3e2,
    MassFlowState=true,
    N_cv=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={858,-156})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe35_42(
    d=0.15,
    m_flow_nom=31.88,
    l=500,
    L=3e2,
    MassFlowState=true,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={876,-156})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyA_Ports Topologie33_A annotation (Placement(transformation(extent={{306,-160},{368,-128}})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyA_Ports Topologie34_A annotation (Placement(transformation(extent={{136,-160},{198,-128}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe70_72R(
    d=0.15,
    m_flow_nom=25.1,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={210,-110})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe70_72(
    d=0.15,
    m_flow_nom=25.1,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={210,-102})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe69_71R(
    d=0.15,
    m_flow_nom=25.1,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={286,-110})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe69_71(
    d=0.15,
    m_flow_nom=25.1,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={286,-102})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split26 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={238,-98})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join26 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={242,-116})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split27 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={254,-126})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join27 annotation (Placement(transformation(extent={{270,-124},{258,-112}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe59_69R(
    d=0.15,
    m_flow_nom=31.88,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={242,-152})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe59_69(
    d=0.15,
    m_flow_nom=31.88,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={258,-152})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie28_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={306,-179})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie29_Ca annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=0,
        origin={354,-269})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe60_61R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={304,-204})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe60_61(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={312,-204})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie30_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={386,-181})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe64_65R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={384,-206})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe64_65(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={392,-206})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie32_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={464,-185})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe62_63(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={347,-246})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe62_63R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={355,-246})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie31_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=0,
        origin={428,-269})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe66_67(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={421,-246})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe66_67R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={429,-246})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe66_68(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={450,-232})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe66_68R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={450,-224})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe64_66(
    d=0.19,
    m_flow_nom=53.55,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={408,-232})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe64_66R(
    d=0.19,
    m_flow_nom=53.55,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={408,-222})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe62_64(
    d=0.22,
    m_flow_nom=80.3,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={370,-232})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe62_64R(
    d=0.22,
    m_flow_nom=80.3,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={370,-224})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe60_62(
    d=0.25,
    m_flow_nom=107.1,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={324,-232})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe60_62R(
    d=0.25,
    m_flow_nom=107.1,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={324,-224})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join28 annotation (Placement(transformation(extent={{423,-238},{435,-226}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split28 annotation (Placement(transformation(extent={{425,-230},{413,-218}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join29 annotation (Placement(transformation(extent={{378,-242},{390,-230}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split29 annotation (Placement(transformation(extent={{398,-226},{386,-214}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join30 annotation (Placement(transformation(extent={{348,-234},{360,-222}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split30 annotation (Placement(transformation(extent={{348,-228},{336,-216}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join31 annotation (Placement(transformation(extent={{318,-240},{306,-228}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split31 annotation (Placement(transformation(extent={{296,-230},{308,-218}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe59_60(
    d=0.27,
    m_flow_nom=133.86,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={276,-234})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split32 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={244,-234})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join32 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={258,-248})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie26_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=90,
        origin={515,-315})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie25_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=90,
        origin={591,-317})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie27_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=270,
        origin={515,-419})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyD_Ports Topologie24_D annotation (Placement(transformation(
        extent={{-17,-19},{17,19}},
        rotation=270,
        origin={593,-421})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split33 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={522,-358})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join33 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={508,-360})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split34 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={594,-376})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join34 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={578,-358})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe43_50(
    d=0.27,
    m_flow_nom=130.53,
    l=3000,
    MassFlowState=false,
    N_cv=600,
    m_flow_start=65) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={878,-302})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe43_50R(
    d=0.27,
    m_flow_nom=130.53,
    l=3000,
    MassFlowState=false,
    N_cv=600,
    m_flow_start=65) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={860,-302})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe54_56R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={516,-338})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe54_56(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={506,-338})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe51_53(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={580,-340})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe51_53R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={590,-340})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe55_57R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={510,-394})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe55_57(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={520,-394})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe50_52R(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={582,-394})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe50_52(
    d=0.15,
    m_flow_nom=24.26,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={592,-394})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split35 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={506,-376})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join35 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={528,-376})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split36 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={582,-376})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join36 annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={592,-358})));
protected
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie35_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={-46,-245})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie36_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=0,
        origin={2,-335})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe74_75R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-48,-270})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe74_75(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-40,-270})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie37_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={34,-247})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe78_79R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={32,-272})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe78_79(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={40,-272})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie39_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=180,
        origin={112,-251})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe76_77(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-5,-312})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe76_77R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={3,-312})));
  TransiEnt.Grid.Heat.HeatGridTopology.TopologyC_Ports Topologie38_C annotation (Placement(transformation(
        extent={{-14,-13},{14,13}},
        rotation=0,
        origin={76,-335})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe80_81(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={69,-312})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe80_81R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={77,-312})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe80_82(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={98,-298})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe80_82R(
    d=0.15,
    m_flow_nom=26.77,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={98,-290})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe78_80(
    d=0.19,
    m_flow_nom=53.55,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={56,-298})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe78_80R(
    d=0.19,
    m_flow_nom=53.55,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={56,-288})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe76_78(
    d=0.22,
    m_flow_nom=80.3,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={18,-298})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe76_78R(
    d=0.22,
    m_flow_nom=80.3,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={18,-290})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe74_76(
    d=0.25,
    m_flow_nom=107.1,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={-28,-298})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe74_76R(
    d=0.25,
    m_flow_nom=107.1,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={-28,-290})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join37 annotation (Placement(transformation(extent={{71,-304},{83,-292}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split37 annotation (Placement(transformation(extent={{73,-296},{61,-284}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join38 annotation (Placement(transformation(extent={{26,-308},{38,-296}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split38 annotation (Placement(transformation(extent={{46,-292},{34,-280}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join39 annotation (Placement(transformation(extent={{-4,-300},{8,-288}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split39 annotation (Placement(transformation(extent={{-4,-294},{-16,-282}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join40 annotation (Placement(transformation(extent={{-34,-306},{-46,-294}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split40 annotation (Placement(transformation(extent={{-56,-296},{-44,-284}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe73_74(
    d=0.27,
    m_flow_nom=133.86,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-76,-300})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split41 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-112,-292})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join41 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-124,-314})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_73(
    d=0.46,
    m_flow_nom=495.33,
    l=1000,
    MassFlowState=false,
    N_cv=200) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-112,-128})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_73R(
    d=0.46,
    m_flow_nom=495.33,
    l=1000,
    MassFlowState=false,
    N_cv=200) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-124,-130})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe58_73R(
    d=0.41,
    m_flow_nom=361.46,
    l=2000,
    MassFlowState=false,
    N_cv=400) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-354})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe58_73(
    d=0.41,
    m_flow_nom=361.46,
    l=2000,
    MassFlowState=false,
    N_cv=400) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-116,-354})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe58_59R(
    d=0.27,
    m_flow_nom=133.88,
    l=1000,
    MassFlowState=false,
    N_cv=200) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={258,-294})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe58_59(
    d=0.27,
    m_flow_nom=133.88,
    l=1000,
    MassFlowState=false,
    N_cv=200) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={244,-294})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join42 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={260,-388})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split42 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={244,-370})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe51_54R(
    d=0.3,
    m_flow_nom=179.06,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={550,-358})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe51_54(
    d=0.3,
    m_flow_nom=179.06,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={550,-380})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe55_58R(
    d=0.34,
    m_flow_nom=227.59,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={364,-378})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe55_58(
    d=0.34,
    m_flow_nom=227.59,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={364,-390})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe39_40R(
    d=0.16,
    m_flow_nom=32.63,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={754,-102})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe39_40(
    d=0.16,
    m_flow_nom=32.63,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={742,-98})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe47_48R(
    d=0.16,
    m_flow_nom=32.63,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={758,-240})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe47_48(
    d=0.16,
    m_flow_nom=32.63,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={746,-236})));
public
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe34_36(
    d=0.2,
    m_flow_nom=65.26,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={932,-68})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe34_36R(
    d=0.2,
    m_flow_nom=65.26,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={932,-76})));
public
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe36_38(
    d=0.16,
    m_flow_nom=32.63,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={1006,-62})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe36_38R(
    d=0.16,
    m_flow_nom=32.63,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={1006,-78})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe36_37R(
    d=0.16,
    m_flow_nom=32.63,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={982,-92})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe36_37(
    d=0.16,
    m_flow_nom=32.63,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={968,-94})));
public
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe42_44(
    d=0.2,
    m_flow_nom=65.26,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={936,-206})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe42_44R(
    d=0.2,
    m_flow_nom=65.26,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={936,-214})));
public
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe44_46(
    d=0.16,
    m_flow_nom=32.63,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={1010,-200})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe44_46R(
    d=0.16,
    m_flow_nom=32.63,
    l=300,
    MassFlowState=false,
    N_cv=60) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={1010,-216})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe44_45R(
    d=0.16,
    m_flow_nom=32.63,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={986,-230})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe44_45(
    d=0.16,
    m_flow_nom=32.63,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={972,-232})));
public
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe59_60R(
    d=0.27,
    m_flow_nom=133.86,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={276,-248})));
public
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe73_74R(
    d=0.27,
    m_flow_nom=133.86,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-76,-314})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{-290,10},{-310,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=26e5)
                                                               annotation (Placement(transformation(extent={{-338,10},{-318,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=heatpump1.inlet.m_flow*((4200*trapezoid.y) - inStream(heatpump1.inlet.h_outflow))) annotation (Placement(transformation(extent={{-354,-76},{-334,-56}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=0.1e5)
                                                                annotation (Placement(transformation(extent={{-304,-20},{-284,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=(Topologie17_B.consumer_1.inlet.p - Topologie17_B.consumer_1.outlet.p))         annotation (Placement(transformation(extent={{-286,-42},{-266,-22}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10,
    Ti=1000,
    yMax=24e5,
    yMin=0.0001) annotation (Placement(transformation(extent={{-272,-20},{-252,0}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump_DHN heatpump1(P_el_max(displayUnit="MW") = 200000000, P_el_min=0.00001) annotation (Placement(transformation(extent={{-268,-80},{-248,-60}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=heatpump1.outlet.h_outflow/4186) annotation (Placement(transformation(extent={{-294,-56},{-274,-36}})));
  Modelica.Blocks.Sources.Trapezoid trapezoid(
    amplitude=6,
    rising=3600,
    width=7200,
    falling=3600,
    period=24400,
    nperiod=1,
    offset=60,
    startTime=a)
    annotation (Placement(transformation(extent={{-350,-38},{-330,-18}})));
equation
  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

    when time>=73200 then
 Dymola.Simulation.SetOutputInterval(50);
  end when;
  when time>106400 then
 Dymola.Simulation.SetOutputInterval(3600);
  end when;

 if time >43200 and time<57600 then
   turnOffHeatPump=true;
 else
   turnOffHeatPump=false;
 end if;

  //Test mesh
  TestMesh=pipe2_3.delta_p_fric+pipe4_13.delta_p_fric+pipe13_23.delta_p_fric+pipe23_69.delta_p_fric+
  pipe59_69.delta_p_fric+pipe58_59.delta_p_fric+pipe58_73.delta_p_fric+pipe2_73.delta_p_fric;

  //Test pressure
  TestPressure=pipe2_3.delta_p_fric+pipe4_13.delta_p_fric+pipe13_23.delta_p_fric+pipe23_24.delta_p_fric+pipe24_34.delta_p_fric+
  pipe35_39.delta_p_fric+pipe39_41.delta_p_fric+0.1e5;
  connect(split10.inlet, pipe1_2.outlet) annotation (Line(points={{-122,-60},{-178,-60}}, color={0,0,0}));
  connect(join10.outlet, pipe1_2R.inlet) annotation (Line(points={{-134,-84},{-178,-84}}, color={0,0,0}));
  connect(join1.outlet, pipe3_6R.inlet) annotation (Line(points={{-124,92},{-124,86}}, color={0,0,0}));
  connect(join7.inlet2, pipe3_6R.outlet) annotation (Line(points={{-118.12,64},{-114,64},{-114,70},{-124,70},{-124,74}}, color={0,0,0}));
  connect(split1.inlet, pipe3_6.outlet) annotation (Line(points={{-110,84},{-110,80}}, color={0,0,0}));
  connect(split7.outlet2, pipe3_6.inlet) annotation (Line(points={{-106,52},{-98,52},{-98,60},{-110,60},{-110,68}}, color={0,0,0}));
  connect(join2.outlet, pipe6_8R.inlet) annotation (Line(points={{-124,128},{-124,120}}, color={0,0,0}));
  connect(join1.inlet2, pipe6_8R.outlet) annotation (Line(points={{-118.12,98},{-116,98},{-116,104},{-124,104},{-124,108}}, color={0,0,0}));
  connect(split2.inlet, pipe6_8.outlet) annotation (Line(points={{-110,120},{-110,116}}, color={0,0,0}));
  connect(split1.outlet2, pipe6_8.inlet) annotation (Line(points={{-104,90},{-98,90},{-98,98},{-110,98},{-110,104}}, color={0,0,0}));
  connect(join3.outlet, pipe8_10R.inlet) annotation (Line(points={{-124,160},{-124,154}}, color={0,0,0}));
  connect(join2.inlet2, pipe8_10R.outlet) annotation (Line(points={{-118.12,134},{-114,134},{-114,140},{-124,140},{-124,142}}, color={0,0,0}));
  connect(split3.inlet, pipe8_10.outlet) annotation (Line(points={{-110,152},{-110,146}}, color={0,0,0}));
  connect(split2.outlet2, pipe8_10.inlet) annotation (Line(points={{-104,126},{-96,126},{-96,130},{-110,130},{-110,134}}, color={0,0,0}));
  connect(join3.inlet2, pipe10_12R.outlet) annotation (Line(points={{-118.12,166},{-112,166},{-112,174},{-124,174},{-124,180}}, color={0,0,0}));
  connect(pipe10_12R.inlet, Topologie5_D.outlet) annotation (Line(points={{-124,192},{-124,203.941},{-173.995,203.941}}, color={0,0,0}));
  connect(split3.outlet2, pipe10_12.inlet) annotation (Line(points={{-104,158},{-96,158},{-96,170},{-106,170},{-106,180}}, color={0,0,0}));
  connect(pipe10_12.outlet, Topologie5_D.inlet) annotation (Line(points={{-106,192},{-106,198},{-175.602,198},{-175.602,203.92}}, color={0,0,0}));
  connect(join7.inlet1, pipe3_5R.outlet) annotation (Line(points={{-130,64.12},{-131,64.12},{-131,64},{-132,64}}, color={0,0,0}));
  connect(Topologie1_D.outlet, pipe3_5R.inlet) annotation (Line(points={{-173.995,61.941},{-173.995,56},{-148,56},{-148,64},{-144,64}}, color={0,0,0}));
  connect(split7.outlet1, pipe3_5.inlet) annotation (Line(points={{-117.88,52},{-132,52}}, color={0,0,0}));
  connect(pipe3_5.outlet, Topologie1_D.inlet) annotation (Line(points={{-144,52},{-175.602,52},{-175.602,61.9205}}, color={0,0,0}));
  connect(join1.inlet1, pipe6_7R.outlet) annotation (Line(points={{-130,98.12},{-131,98.12},{-131,98},{-132,98}}, color={0,0,0}));
  connect(pipe6_7R.inlet, Topologie2_D.outlet) annotation (Line(points={{-144,98},{-155.997,98},{-155.997,97.941},{-173.995,97.941}}, color={0,0,0}));
  connect(pipe6_7.outlet, Topologie2_D.inlet) annotation (Line(points={{-144,90},{-175.602,90},{-175.602,97.9205}}, color={0,0,0}));
  connect(pipe6_7.inlet, split1.outlet1) annotation (Line(points={{-132,90},{-115.88,90}}, color={0,0,0}));
  connect(join2.inlet1, pipe8_9R.outlet) annotation (Line(points={{-130,134.12},{-131,134.12},{-131,134},{-132,134}}, color={0,0,0}));
  connect(pipe8_9R.inlet, Topologie3_D.outlet) annotation (Line(points={{-144,134},{-155.997,134},{-155.997,133.941},{-173.995,133.941}}, color={0,0,0}));
  connect(pipe8_9.inlet, split2.outlet1) annotation (Line(points={{-132,126},{-115.88,126}}, color={0,0,0}));
  connect(pipe8_9.outlet, Topologie3_D.inlet) annotation (Line(points={{-144,126},{-175.602,126},{-175.602,133.92}}, color={0,0,0}));
  connect(join3.inlet1, pipe10_11R.outlet) annotation (Line(points={{-130,166.12},{-132,166.12},{-132,166},{-134,166}}, color={0,0,0}));
  connect(pipe10_11R.inlet, Topologie4_D.outlet) annotation (Line(points={{-146,166},{-173.995,166},{-173.995,167.941}}, color={0,0,0}));
  connect(pipe10_11.inlet, split3.outlet1) annotation (Line(points={{-134,158},{-115.88,158}}, color={0,0,0}));
  connect(pipe10_11.outlet, Topologie4_D.inlet) annotation (Line(points={{-146,158},{-175.602,158},{-175.602,167.92}}, color={0,0,0}));
  connect(split4.inlet, pipe2_3.outlet) annotation (Line(points={{-112,22},{-112,8}}, color={0,0,0}));
  connect(join4.outlet, pipe2_3R.inlet) annotation (Line(points={{-124,34},{-124,8}}, color={0,0,0}));
  connect(join4.inlet1, join7.outlet) annotation (Line(points={{-130,40.12},{-134,40.12},{-134,40},{-136,40},{-136,46},{-124,46},{-124,58}}, color={0,0,0}));
  connect(split4.outlet1, split7.inlet) annotation (Line(points={{-117.88,28},{-118,28},{-118,34},{-112,34},{-112,46}}, color={0,0,0}));
  connect(pipe14_16R.inlet, join6.outlet) annotation (Line(points={{-16,124},{-16,132}}, color={0,0,0}));
  connect(pipe14_16.outlet, split6.inlet) annotation (Line(points={{-2,132},{-2,140}}, color={0,0,0}));
  connect(split5.outlet1, pipe14_16.inlet) annotation (Line(points={{1.88,100},{6,100},{6,112},{-2,112},{-2,120}}, color={0,0,0}));
  connect(join5.inlet1, pipe14_16R.outlet) annotation (Line(points={{-12,92.12},{-10,92.12},{-10,96},{-16,96},{-16,112}}, color={0,0,0}));
  connect(pipe14_15R.outlet, join5.inlet2) annotation (Line(points={{-30,92},{-23.88,92}}, color={0,0,0}));
  connect(pipe14_15R.inlet, Topologie6_C.outlet) annotation (Line(points={{-42,92},{-51.7526,92},{-51.7526,122.253}}, color={0,0,0}));
  connect(pipe14_15.inlet, split5.outlet2) annotation (Line(points={{-30,100},{-10,100}}, color={0,0,0}));
  connect(pipe14_15.outlet, Topologie6_C.inlet) annotation (Line(points={{-42,100},{-49.4684,100},{-49.4684,122.253}}, color={0,0,0}));
  connect(pipe16_17.outlet, Topologie7_C.inlet) annotation (Line(points={{22,146},{28.5316,146},{28.5316,160.253}}, color={0,0,0}));
  connect(pipe16_17.inlet, split6.outlet1) annotation (Line(points={{10,146},{3.88,146}}, color={0,0,0}));
  connect(pipe16_17R.outlet, join6.inlet1) annotation (Line(points={{10,138},{10,138.12},{-10,138.12}}, color={0,0,0}));
  connect(pipe16_17R.inlet, Topologie7_C.outlet) annotation (Line(points={{22,138},{26.2474,138},{26.2474,160.253}}, color={0,0,0}));
  connect(pipe20_21R.inlet, Topologie9_C.outlet) annotation (Line(points={{22,204},{26.2474,204},{26.2474,220.253}}, color={0,0,0}));
  connect(pipe20_21.outlet, Topologie9_C.inlet) annotation (Line(points={{22,212},{28.5316,212},{28.5316,220.253}}, color={0,0,0}));
  connect(join8.outlet, pipe16_18R.inlet) annotation (Line(points={{-16,164},{-16,160}}, color={0,0,0}));
  connect(split8.inlet, pipe16_18.outlet) annotation (Line(points={{-2,172},{-2,166}}, color={0,0,0}));
  connect(join6.inlet2, pipe16_18R.outlet) annotation (Line(points={{-21.88,138},{-26,138},{-26,144},{-16,144},{-16,148}}, color={0,0,0}));
  connect(split6.outlet2, pipe16_18.inlet) annotation (Line(points={{-8,146},{-10,146},{-10,150},{-2,150},{-2,154}}, color={0,0,0}));
  connect(pipe18_19R.outlet, join8.inlet2) annotation (Line(points={{-26,170},{-21.88,170}}, color={0,0,0}));
  connect(split8.outlet2, pipe18_19.inlet) annotation (Line(points={{-8,178},{-26,178}}, color={0,0,0}));
  connect(pipe18_19R.inlet, Topologie8_C.outlet) annotation (Line(points={{-38,170},{-49.7526,170},{-49.7526,184.253}}, color={0,0,0}));
  connect(Topologie8_C.inlet, pipe18_19.outlet) annotation (Line(points={{-47.4684,184.253},{-47.4684,178},{-38,178}}, color={0,0,0}));
  connect(join4.inlet2, pipe4_13R.outlet) annotation (Line(points={{-118.12,40},{-78,40}}, color={0,0,0}));
  connect(split4.outlet2, pipe4_13.inlet) annotation (Line(points={{-106,28},{-78,28}}, color={0,0,0}));
  connect(join5.outlet, pipe13_14R.inlet) annotation (Line(points={{-18,86},{-18,84}}, color={0,0,0}));
  connect(split5.inlet, pipe13_14.outlet) annotation (Line(points={{-4,94},{-4,92}}, color={0,0,0}));
  connect(split8.outlet1, pipe18_20.inlet) annotation (Line(points={{3.88,178},{6,178},{6,188},{0,188},{0,190}}, color={0,0,0}));
  connect(join8.inlet1, pipe18_20R.outlet) annotation (Line(points={{-10,170.12},{-10,170},{-8,170},{-8,174},{-14,174},{-14,184}}, color={0,0,0}));
  connect(pipe20_22R.inlet, Topologie10_C.outlet) annotation (Line(points={{-36,220},{-49.7526,220},{-49.7526,238.253}}, color={0,0,0}));
  connect(Topologie10_C.inlet, pipe20_22.outlet) annotation (Line(points={{-47.4684,238.253},{-47.4684,230},{-36,230}}, color={0,0,0}));
  connect(join11.inlet2, pipe20_22R.outlet) annotation (Line(points={{-19.88,220},{-24,220}}, color={0,0,0}));
  connect(join11.outlet, pipe18_20R.inlet) annotation (Line(points={{-14,214},{-14,205},{-14,205},{-14,196}}, color={0,0,0}));
  connect(split11.inlet, pipe18_20.outlet) annotation (Line(points={{-1.11022e-15,206},{-1.11022e-15,204},{1.11022e-15,204},{1.11022e-15,202}}, color={0,0,0}));
  connect(split11.outlet1, pipe20_21.inlet) annotation (Line(points={{5.88,212},{10,212}}, color={0,0,0}));
  connect(split11.outlet2, pipe20_22.inlet) annotation (Line(points={{-6,212},{-10,212},{-10,216},{2,216},{2,230},{-24,230}}, color={0,0,0}));
  connect(join11.inlet1, pipe20_21R.outlet) annotation (Line(points={{-8,220.12},{0,220.12},{0,220},{8,220},{8,204},{10,204}}, color={0,0,0}));
  connect(pipe4_13R.inlet, join9.outlet) annotation (Line(points={{-58,40},{-18,40},{-18,50}}, color={0,0,0}));
  connect(pipe4_13.outlet, split9.inlet) annotation (Line(points={{-58,28},{-4,28},{-4,62}}, color={0,0,0}));
  connect(join9.inlet2, pipe13_14R.outlet) annotation (Line(points={{-23.88,56},{-30,56},{-30,66},{-18,66},{-18,72}}, color={0,0,0}));
  connect(split9.outlet2, pipe13_14.inlet) annotation (Line(points={{-10,68},{-14,68},{-14,76},{-4,76},{-4,80}}, color={0,0,0}));
  connect(join9.inlet1, pipe13_23R.outlet) annotation (Line(points={{-12,56.12},{-8,56.12},{-8,56},{4,56},{4,40},{16,40}}, color={0,0,0}));
  connect(pipe13_23.inlet, split9.outlet1) annotation (Line(points={{16,28},{10,28},{10,68},{1.88,68}}, color={0,0,0}));
  connect(split10.outlet1, pipe2_3.inlet) annotation (Line(points={{-112,-50.2},{-112,-4}}, color={0,0,0}));
  connect(join10.inlet2, pipe2_3R.outlet) annotation (Line(points={{-124,-74.2},{-124,-4}}, color={0,0,0}));
  connect(pipe13_23.outlet, split12.inlet) annotation (Line(points={{36,28},{220,28},{220,6},{230,6}}, color={0,0,0}));
  connect(pipe13_23R.inlet, join12.outlet) annotation (Line(points={{36,40},{178,40},{178,36},{246,36}}, color={0,0,0}));
  connect(pipe25_27R.inlet, join14.outlet) annotation (Line(points={{346,122},{346,130}}, color={0,0,0}));
  connect(pipe25_27.outlet, split14.inlet) annotation (Line(points={{360,130},{360,138}}, color={0,0,0}));
  connect(split13.outlet1, pipe25_27.inlet) annotation (Line(points={{363.88,98},{368,98},{368,110},{360,110},{360,118}}, color={0,0,0}));
  connect(join13.inlet1, pipe25_27R.outlet) annotation (Line(points={{350,90.12},{352,90.12},{352,94},{346,94},{346,110}}, color={0,0,0}));
  connect(pipe25_26R.outlet, join13.inlet2) annotation (Line(points={{332,90},{338.12,90}}, color={0,0,0}));
  connect(pipe25_26R.inlet, Topologie11_C.outlet) annotation (Line(points={{320,90},{310.247,90},{310.247,120.253}}, color={0,0,0}));
  connect(pipe25_26.inlet, split13.outlet2) annotation (Line(points={{332,98},{352,98}}, color={0,0,0}));
  connect(pipe25_26.outlet, Topologie11_C.inlet) annotation (Line(points={{320,98},{312.532,98},{312.532,120.253}}, color={0,0,0}));
  connect(pipe27_28.outlet, Topologie12_C.inlet) annotation (Line(points={{384,144},{390.532,144},{390.532,158.253}}, color={0,0,0}));
  connect(pipe27_28.inlet, split14.outlet1) annotation (Line(points={{372,144},{365.88,144}}, color={0,0,0}));
  connect(pipe27_28R.outlet, join14.inlet1) annotation (Line(points={{372,136},{372,136.12},{352,136.12}}, color={0,0,0}));
  connect(pipe27_28R.inlet, Topologie12_C.outlet) annotation (Line(points={{384,136},{388.247,136},{388.247,158.253}}, color={0,0,0}));
  connect(pipe31_32R.inlet, Topologie14_C.outlet) annotation (Line(points={{384,202},{388.247,202},{388.247,218.253}}, color={0,0,0}));
  connect(pipe31_32.outlet, Topologie14_C.inlet) annotation (Line(points={{384,210},{390.532,210},{390.532,218.253}}, color={0,0,0}));
  connect(join15.outlet, pipe27_29R.inlet) annotation (Line(points={{346,162},{346,158}}, color={0,0,0}));
  connect(split15.inlet, pipe27_29.outlet) annotation (Line(points={{360,170},{360,164}}, color={0,0,0}));
  connect(join14.inlet2, pipe27_29R.outlet) annotation (Line(points={{340.12,136},{336,136},{336,142},{346,142},{346,146}}, color={0,0,0}));
  connect(split14.outlet2, pipe27_29.inlet) annotation (Line(points={{354,144},{352,144},{352,148},{360,148},{360,152}}, color={0,0,0}));
  connect(pipe29_30R.outlet, join15.inlet2) annotation (Line(points={{336,168},{340.12,168}}, color={0,0,0}));
  connect(split15.outlet2, pipe29_30.inlet) annotation (Line(points={{354,176},{336,176}}, color={0,0,0}));
  connect(pipe29_30R.inlet, Topologie13_C.outlet) annotation (Line(points={{324,168},{312.247,168},{312.247,182.253}}, color={0,0,0}));
  connect(Topologie13_C.inlet, pipe29_30.outlet) annotation (Line(points={{314.532,182.253},{314.532,176},{324,176}}, color={0,0,0}));
  connect(join13.outlet, pipe24_25R.inlet) annotation (Line(points={{344,84},{344,82}}, color={0,0,0}));
  connect(split13.inlet, pipe24_25.outlet) annotation (Line(points={{358,92},{358,90}}, color={0,0,0}));
  connect(split15.outlet1, pipe29_31.inlet) annotation (Line(points={{365.88,176},{368,176},{368,186},{362,186},{362,188}}, color={0,0,0}));
  connect(join15.inlet1, pipe29_31R.outlet) annotation (Line(points={{352,168.12},{352,168},{354,168},{354,172},{348,172},{348,182}}, color={0,0,0}));
  connect(pipe31_33R.inlet, Topologie15_C.outlet) annotation (Line(points={{326,218},{312.247,218},{312.247,236.253}}, color={0,0,0}));
  connect(Topologie15_C.inlet, pipe31_33.outlet) annotation (Line(points={{314.532,236.253},{314.532,228},{326,228}}, color={0,0,0}));
  connect(join17.inlet2, pipe31_33R.outlet) annotation (Line(points={{342.12,218},{338,218}}, color={0,0,0}));
  connect(join17.outlet, pipe29_31R.inlet) annotation (Line(points={{348,212},{348,194}}, color={0,0,0}));
  connect(split17.inlet, pipe29_31.outlet) annotation (Line(points={{362,204},{362,200}}, color={0,0,0}));
  connect(split17.outlet1, pipe31_32.inlet) annotation (Line(points={{367.88,210},{372,210}}, color={0,0,0}));
  connect(split17.outlet2, pipe31_33.inlet) annotation (Line(points={{356,210},{352,210},{352,214},{364,214},{364,228},{338,228}}, color={0,0,0}));
  connect(join17.inlet1, pipe31_32R.outlet) annotation (Line(points={{354,218.12},{362,218.12},{362,218},{370,218},{370,202},{372,202}}, color={0,0,0}));
  connect(join16.inlet2, pipe24_25R.outlet) annotation (Line(points={{338.12,54},{332,54},{332,64},{344,64},{344,70}}, color={0,0,0}));
  connect(split16.outlet2, pipe24_25.inlet) annotation (Line(points={{352,66},{348,66},{348,74},{358,74},{358,78}}, color={0,0,0}));
  connect(join12.inlet2, pipe23_24R.outlet) annotation (Line(points={{256,45.8},{256,54},{278,54},{278,36},{284,36}}, color={0,0,0}));
  connect(pipe23_24R.inlet, join16.outlet) annotation (Line(points={{304,36},{344,36},{344,48}}, color={0,0,0}));
  connect(pipe23_24.outlet, split16.inlet) annotation (Line(points={{304,24},{358,24},{358,60}}, color={0,0,0}));
  connect(split12.outlet1, pipe23_24.inlet) annotation (Line(points={{240,15.8},{240,24},{284,24}}, color={0,0,0}));
  connect(join16.inlet1, pipe24_34R.outlet) annotation (Line(points={{350,54.12},{358,54.12},{358,54},{384,54},{384,34},{410,34}}, color={0,0,0}));
  connect(split16.outlet1, pipe24_34.inlet) annotation (Line(points={{363.88,66},{396,66},{396,22},{410,22}}, color={0,0,0}));
  connect(split18.outlet2, split19.inlet) annotation (Line(points={{862,-98},{862,-94},{882,-94}}, color={0,0,0}));
  connect(join19.outlet, join18.inlet2) annotation (Line(points={{868,-110},{868,-111.88},{856,-111.88}}, color={0,0,0}));
  connect(join20.outlet, pipe34_36R.inlet) annotation (Line(points={{976,-70},{958,-70},{958,-76},{938,-76}}, color={0,0,0}));
  connect(pipe34_36.outlet, split20.inlet) annotation (Line(points={{938,-68},{958,-68},{958,-78},{962,-78}}, color={0,0,0}));
  connect(split19.outlet1, pipe34_36.inlet) annotation (Line(points={{888,-88.12},{884,-88.12},{884,-80},{916,-80},{916,-68},{926,-68}}, color={0,0,0}));
  connect(join19.inlet1, pipe34_36R.outlet) annotation (Line(points={{874.12,-104},{904,-104},{904,-76},{926,-76}}, color={0,0,0}));
  connect(join21.outlet, pipe35_39R.inlet) annotation (Line(points={{760,-86},{760,-82},{794,-82}}, color={0,0,0}));
  connect(split21.inlet, pipe35_39.outlet) annotation (Line(points={{748,-82},{748,-78},{784,-78},{784,-90},{794,-90}}, color={0,0,0}));
  connect(pipe35_39.inlet, split18.outlet1) annotation (Line(points={{806,-90},{804,-90},{804,-68},{844,-68},{844,-86.12},{862,-86.12}}, color={0,0,0}));
  connect(join18.inlet1, pipe35_39R.outlet) annotation (Line(points={{856.12,-100},{836,-100},{836,-82},{806,-82}}, color={0,0,0}));
  connect(join18.outlet, pipe24_34R.inlet) annotation (Line(points={{850,-106},{842,-106},{842,34},{430,34}}, color={0,0,0}));
  connect(split18.inlet, pipe24_34.outlet) annotation (Line(points={{856,-92},{852,-92},{852,22},{430,22}}, color={0,0,0}));
  connect(split20.outlet1, pipe36_38.inlet) annotation (Line(points={{968,-72.12},{968,-62},{1000,-62}}, color={0,0,0}));
  connect(pipe36_38.outlet, Topologie17_B.inlet) annotation (Line(points={{1012,-62},{1057.56,-62},{1057.56,-114.078}}, color={0,0,0}));
  connect(join20.inlet1, pipe36_38R.outlet) annotation (Line(points={{982.12,-64},{990,-64},{990,-78},{1000,-78}}, color={0,0,0}));
  connect(pipe36_38R.inlet, Topologie17_B.outlet) annotation (Line(points={{1012,-78},{1059.44,-78},{1059.44,-114.078}}, color={0,0,0}));
  connect(join20.inlet2, pipe36_37R.outlet) annotation (Line(points={{982,-75.88},{982,-86}}, color={0,0,0}));
  connect(pipe36_37R.inlet, Topologie16_B.outlet) annotation (Line(points={{982,-98},{982,-102},{976.691,-102},{976.691,-114.07}}, color={0,0,0}));
  connect(split20.outlet2, pipe36_37.inlet) annotation (Line(points={{968,-84},{968,-88}}, color={0,0,0}));
  connect(pipe36_37.outlet, Topologie16_B.inlet) annotation (Line(points={{968,-100},{968,-104},{975.12,-104},{975.12,-114.07}}, color={0,0,0}));
  connect(pipe39_41.inlet, split21.outlet1) annotation (Line(points={{712,-70},{742,-70},{742,-76.12}}, color={0,0,0}));
  connect(pipe39_41R.outlet, join21.inlet1) annotation (Line(points={{710,-56},{753.88,-56},{753.88,-80}}, color={0,0,0}));
  connect(pipe39_41.outlet, Topologie19_B.inlet) annotation (Line(points={{700,-70},{652.96,-70},{652.96,-112.07}}, color={0,0,0}));
  connect(Topologie19_B.outlet, pipe39_41R.inlet) annotation (Line(points={{654.618,-112.07},{654.618,-56},{698,-56}}, color={0,0,0}));
  connect(split22.outlet2, split23.inlet) annotation (Line(points={{866,-236},{866,-232},{886,-232}}, color={0,0,0}));
  connect(join23.outlet, join22.inlet2) annotation (Line(points={{872,-248},{872,-249.88},{860,-249.88}}, color={0,0,0}));
  connect(join24.outlet, pipe42_44R.inlet) annotation (Line(points={{980,-208},{962,-208},{962,-214},{942,-214}}, color={0,0,0}));
  connect(pipe42_44.outlet, split24.inlet) annotation (Line(points={{942,-206},{962,-206},{962,-216},{966,-216}}, color={0,0,0}));
  connect(split23.outlet1, pipe42_44.inlet) annotation (Line(points={{892,-226.12},{888,-226.12},{888,-218},{920,-218},{920,-206},{930,-206}}, color={0,0,0}));
  connect(join23.inlet1, pipe42_44R.outlet) annotation (Line(points={{878.12,-242},{908,-242},{908,-214},{930,-214}}, color={0,0,0}));
  connect(join25.outlet, pipe43_47R.inlet) annotation (Line(points={{764,-224},{764,-220},{798,-220}}, color={0,0,0}));
  connect(split25.inlet, pipe43_47.outlet) annotation (Line(points={{752,-220},{752,-216},{788,-216},{788,-228},{798,-228}}, color={0,0,0}));
  connect(pipe43_47.inlet, split22.outlet1) annotation (Line(points={{810,-228},{808,-228},{808,-206},{848,-206},{848,-224.12},{866,-224.12}}, color={0,0,0}));
  connect(join22.inlet1, pipe43_47R.outlet) annotation (Line(points={{860.12,-238},{840,-238},{840,-220},{810,-220}}, color={0,0,0}));
  connect(split24.outlet1, pipe44_46.inlet) annotation (Line(points={{972,-210.12},{972,-200},{1004,-200}}, color={0,0,0}));
  connect(pipe44_46.outlet, Topologie21_B.inlet) annotation (Line(points={{1016,-200},{1061.56,-200},{1061.56,-252.078}}, color={0,0,0}));
  connect(join24.inlet1, pipe44_46R.outlet) annotation (Line(points={{986.12,-202},{994,-202},{994,-216},{1004,-216}}, color={0,0,0}));
  connect(pipe44_46R.inlet, Topologie21_B.outlet) annotation (Line(points={{1016,-216},{1063.44,-216},{1063.44,-252.078}}, color={0,0,0}));
  connect(join24.inlet2, pipe44_45R.outlet) annotation (Line(points={{986,-213.88},{986,-224}}, color={0,0,0}));
  connect(pipe44_45R.inlet, Topologie20_B.outlet) annotation (Line(points={{986,-236},{986,-240},{980.691,-240},{980.691,-252.07}}, color={0,0,0}));
  connect(split24.outlet2, pipe44_45.inlet) annotation (Line(points={{972,-222},{972,-226}}, color={0,0,0}));
  connect(pipe44_45.outlet, Topologie20_B.inlet) annotation (Line(points={{972,-238},{972,-242},{979.12,-242},{979.12,-252.07}}, color={0,0,0}));
  connect(pipe47_49.inlet, split25.outlet1) annotation (Line(points={{716,-208},{746,-208},{746,-214.12}}, color={0,0,0}));
  connect(pipe47_49R.outlet, join25.inlet1) annotation (Line(points={{714,-194},{757.88,-194},{757.88,-218}}, color={0,0,0}));
  connect(pipe47_49.outlet, Topologie23_B.inlet) annotation (Line(points={{704,-208},{656.96,-208},{656.96,-250.07}}, color={0,0,0}));
  connect(Topologie23_B.outlet, pipe47_49R.inlet) annotation (Line(points={{658.618,-250.07},{658.618,-194},{702,-194}}, color={0,0,0}));
  connect(split12.outlet2, pipe23_69.inlet) annotation (Line(points={{240,-4},{240,-56}}, color={0,0,0}));
  connect(pipe35_42R.outlet, join19.inlet2) annotation (Line(points={{858,-146},{858,-126},{874,-126},{874,-115.88}}, color={0,0,0}));
  connect(pipe35_42.inlet, split19.outlet2) annotation (Line(points={{876,-146},{876,-124},{888,-124},{888,-100}}, color={0,0,0}));
  connect(join22.outlet, pipe35_42R.inlet) annotation (Line(points={{854,-244},{846,-244},{846,-192},{858,-192},{858,-166}}, color={0,0,0}));
  connect(split22.inlet, pipe35_42.outlet) annotation (Line(points={{860,-230},{858,-230},{858,-204},{876,-204},{876,-166}}, color={0,0,0}));
  connect(Topologie34_A.inlet, pipe70_72.outlet) annotation (Line(points={{164.2,-128.2},{164,-128.2},{164,-102},{204,-102}}, color={0,0,0}));
  connect(pipe70_72R.inlet, Topologie34_A.outlet) annotation (Line(points={{204,-110},{170,-110},{170,-128.2}}, color={0,0,0}));
  connect(pipe69_71.outlet, Topologie33_A.inlet) annotation (Line(points={{292,-102},{334.2,-102},{334.2,-128.2}}, color={0,0,0}));
  connect(pipe69_71R.inlet, Topologie33_A.outlet) annotation (Line(points={{292,-110},{342,-110},{342,-128.2},{340,-128.2}}, color={0,0,0}));
  connect(Topologie28_C.inlet, pipe60_61.outlet) annotation (Line(points={{310.532,-191.747},{312,-191.747},{312,-198}}, color={0,0,0}));
  connect(pipe60_61R.inlet, Topologie28_C.outlet) annotation (Line(points={{304,-198},{304,-191.747},{308.247,-191.747}}, color={0,0,0}));
  connect(Topologie30_C.inlet, pipe64_65.outlet) annotation (Line(points={{390.532,-193.747},{392,-193.747},{392,-200}}, color={0,0,0}));
  connect(pipe64_65R.inlet, Topologie30_C.outlet) annotation (Line(points={{384,-200},{384,-193.747},{388.247,-193.747}}, color={0,0,0}));
  connect(Topologie29_Ca.inlet, pipe62_63.outlet) annotation (Line(points={{349.468,-256.253},{349.468,-256},{347,-256},{347,-252}}, color={0,0,0}));
  connect(pipe62_63R.inlet, Topologie29_Ca.outlet) annotation (Line(points={{355,-252},{356,-252},{356,-256.253},{351.753,-256.253}}, color={0,0,0}));
  connect(Topologie31_C.inlet, pipe66_67.outlet) annotation (Line(points={{423.468,-256.253},{423.468,-256},{421,-256},{421,-252}}, color={0,0,0}));
  connect(pipe66_67R.inlet, Topologie31_C.outlet) annotation (Line(points={{429,-252},{430,-252},{430,-256.253},{425.753,-256.253}}, color={0,0,0}));
  connect(split31.outlet1, pipe60_61.inlet) annotation (Line(points={{302,-218.12},{302,-214},{312,-214},{312,-210}}, color={0,0,0}));
  connect(join31.inlet1, pipe60_61R.outlet) annotation (Line(points={{312.12,-228},{312,-228},{312,-216},{304,-216},{304,-210}}, color={0,0,0}));
  connect(join31.inlet2, pipe60_62R.outlet) annotation (Line(points={{312,-239.88},{312,-244},{316,-244},{316,-224},{318,-224}}, color={0,0,0}));
  connect(split31.outlet2, pipe60_62.inlet) annotation (Line(points={{302,-230},{302,-250},{318,-250},{318,-232}}, color={0,0,0}));
  connect(pipe60_62.outlet, split30.inlet) annotation (Line(points={{330,-232},{350,-232},{350,-222},{348,-222}}, color={0,0,0}));
  connect(split30.outlet2, pipe62_63.inlet) annotation (Line(points={{342,-228},{342,-234},{347,-234},{347,-240}}, color={0,0,0}));
  connect(join30.inlet1, pipe62_64R.outlet) annotation (Line(points={{353.88,-222},{354,-222},{354,-218},{360,-218},{360,-224},{364,-224}}, color={0,0,0}));
  connect(join30.inlet2, pipe62_63R.outlet) annotation (Line(points={{354,-233.88},{354,-236.94},{355,-236.94},{355,-240}}, color={0,0,0}));
  connect(join30.outlet, pipe60_62R.inlet) annotation (Line(points={{360,-228},{362,-228},{362,-212},{332,-212},{332,-224},{330,-224}}, color={0,0,0}));
  connect(split30.outlet1, pipe62_64.inlet) annotation (Line(points={{342,-216.12},{354,-216.12},{354,-216},{358,-216},{358,-232},{364,-232}}, color={0,0,0}));
  connect(pipe62_64.outlet, split29.inlet) annotation (Line(points={{376,-232},{388,-232},{388,-220},{398,-220}}, color={0,0,0}));
  connect(pipe64_65.inlet, split29.outlet1) annotation (Line(points={{392,-212},{392,-214.12}}, color={0,0,0}));
  connect(join29.outlet, pipe62_64R.inlet) annotation (Line(points={{390,-236},{396,-236},{396,-224},{376,-224}}, color={0,0,0}));
  connect(pipe64_65R.outlet, join29.inlet1) annotation (Line(points={{384,-212},{384,-218},{383.88,-218},{383.88,-230}}, color={0,0,0}));
  connect(join29.inlet2, pipe64_66R.outlet) annotation (Line(points={{384,-241.88},{384,-244},{400,-244},{400,-222},{402,-222}}, color={0,0,0}));
  connect(split29.outlet2, pipe64_66.inlet) annotation (Line(points={{392,-226},{392,-232},{402,-232}}, color={0,0,0}));
  connect(pipe64_66R.inlet, join28.outlet) annotation (Line(points={{414,-222},{414,-216},{435,-216},{435,-232}}, color={0,0,0}));
  connect(pipe64_66.outlet, split28.inlet) annotation (Line(points={{414,-232},{425,-232},{425,-224}}, color={0,0,0}));
  connect(split28.outlet2, pipe66_67.inlet) annotation (Line(points={{419,-230},{418,-230},{418,-236},{421,-236},{421,-240}}, color={0,0,0}));
  connect(join28.inlet2, pipe66_67R.outlet) annotation (Line(points={{429,-237.88},{429,-240}}, color={0,0,0}));
  connect(join28.inlet1, pipe66_68R.outlet) annotation (Line(points={{428.88,-226},{428,-226},{428,-224},{444,-224}}, color={0,0,0}));
  connect(pipe66_68.inlet, split28.outlet1) annotation (Line(points={{444,-232},{440,-232},{440,-208},{419,-208},{419,-218.12}}, color={0,0,0}));
  connect(pipe59_60.outlet, split31.inlet) annotation (Line(points={{282,-234},{288,-234},{288,-224},{296,-224}}, color={0,0,0}));
  connect(pipe59_60R.inlet, join31.outlet) annotation (Line(points={{282,-248},{294,-248},{294,-234},{306,-234}}, color={0,0,0}));
  connect(split23.outlet2, pipe43_50.inlet) annotation (Line(points={{892,-238},{892,-268},{878,-268},{878,-292}}, color={0,0,0}));
  connect(join23.inlet2, pipe43_50R.outlet) annotation (Line(points={{878,-253.88},{878,-260},{860,-260},{860,-292}}, color={0,0,0}));
  connect(pipe54_56.outlet, Topologie26_D.inlet) annotation (Line(points={{506,-332},{506,-326.04},{506.398,-326.04},{506.398,-320.08}}, color={0,0,0}));
  connect(pipe54_56R.inlet, Topologie26_D.outlet) annotation (Line(points={{516,-332},{516,-326},{508.005,-326},{508.005,-320.059}}, color={0,0,0}));
  connect(pipe51_53.outlet, Topologie25_D.inlet) annotation (Line(points={{580,-334},{580,-322.08},{582.398,-322.08}}, color={0,0,0}));
  connect(pipe51_53R.inlet, Topologie25_D.outlet) annotation (Line(points={{590,-334},{590,-322.059},{584.005,-322.059}}, color={0,0,0}));
  connect(pipe55_57.outlet, Topologie27_D.inlet) annotation (Line(points={{520,-400},{520,-404},{523.602,-404},{523.602,-413.92}}, color={0,0,0}));
  connect(Topologie27_D.outlet, pipe55_57R.inlet) annotation (Line(points={{521.995,-413.941},{510,-413.941},{510,-400}}, color={0,0,0}));
  connect(pipe50_52R.inlet, Topologie24_D.outlet) annotation (Line(points={{582,-400},{582,-415.941},{599.995,-415.941}}, color={0,0,0}));
  connect(Topologie24_D.inlet, pipe50_52.outlet) annotation (Line(points={{601.602,-415.92},{601.602,-404},{592,-404},{592,-400}}, color={0,0,0}));
  connect(Topologie35_C.inlet, pipe74_75.outlet) annotation (Line(points={{-41.4684,-257.747},{-40,-257.747},{-40,-264}}, color={0,0,0}));
  connect(pipe74_75R.inlet, Topologie35_C.outlet) annotation (Line(points={{-48,-264},{-48,-257.747},{-43.7526,-257.747}}, color={0,0,0}));
  connect(Topologie37_C.inlet, pipe78_79.outlet) annotation (Line(points={{38.5316,-259.747},{40,-259.747},{40,-266}}, color={0,0,0}));
  connect(pipe78_79R.inlet, Topologie37_C.outlet) annotation (Line(points={{32,-266},{32,-259.747},{36.2474,-259.747}}, color={0,0,0}));
  connect(Topologie36_C.inlet, pipe76_77.outlet) annotation (Line(points={{-2.53158,-322.253},{-2.53158,-322},{-5,-322},{-5,-318}}, color={0,0,0}));
  connect(pipe76_77R.inlet, Topologie36_C.outlet) annotation (Line(points={{3,-318},{4,-318},{4,-322.253},{-0.24737,-322.253}}, color={0,0,0}));
  connect(Topologie38_C.inlet, pipe80_81.outlet) annotation (Line(points={{71.4684,-322.253},{71.4684,-322},{69,-322},{69,-318}}, color={0,0,0}));
  connect(pipe80_81R.inlet, Topologie38_C.outlet) annotation (Line(points={{77,-318},{78,-318},{78,-322.253},{73.7526,-322.253}}, color={0,0,0}));
  connect(split40.outlet1, pipe74_75.inlet) annotation (Line(points={{-50,-284.12},{-50,-280},{-40,-280},{-40,-276}}, color={0,0,0}));
  connect(join40.inlet1, pipe74_75R.outlet) annotation (Line(points={{-39.88,-294},{-40,-294},{-40,-282},{-48,-282},{-48,-276}}, color={0,0,0}));
  connect(join40.inlet2, pipe74_76R.outlet) annotation (Line(points={{-40,-305.88},{-40,-310},{-36,-310},{-36,-290},{-34,-290}}, color={0,0,0}));
  connect(split40.outlet2, pipe74_76.inlet) annotation (Line(points={{-50,-296},{-50,-316},{-34,-316},{-34,-298}}, color={0,0,0}));
  connect(pipe74_76.outlet, split39.inlet) annotation (Line(points={{-22,-298},{-2,-298},{-2,-288},{-4,-288}}, color={0,0,0}));
  connect(split39.outlet2, pipe76_77.inlet) annotation (Line(points={{-10,-294},{-10,-300},{-5,-300},{-5,-306}}, color={0,0,0}));
  connect(join39.inlet1, pipe76_78R.outlet) annotation (Line(points={{1.88,-288},{2,-288},{2,-284},{8,-284},{8,-290},{12,-290}}, color={0,0,0}));
  connect(join39.inlet2, pipe76_77R.outlet) annotation (Line(points={{2,-299.88},{2,-302.94},{3,-302.94},{3,-306}}, color={0,0,0}));
  connect(join39.outlet, pipe74_76R.inlet) annotation (Line(points={{8,-294},{10,-294},{10,-278},{-20,-278},{-20,-290},{-22,-290}}, color={0,0,0}));
  connect(split39.outlet1, pipe76_78.inlet) annotation (Line(points={{-10,-282.12},{2,-282.12},{2,-282},{6,-282},{6,-298},{12,-298}}, color={0,0,0}));
  connect(pipe76_78.outlet, split38.inlet) annotation (Line(points={{24,-298},{36,-298},{36,-286},{46,-286}}, color={0,0,0}));
  connect(pipe78_79.inlet, split38.outlet1) annotation (Line(points={{40,-278},{40,-280.12}}, color={0,0,0}));
  connect(join38.outlet, pipe76_78R.inlet) annotation (Line(points={{38,-302},{44,-302},{44,-290},{24,-290}}, color={0,0,0}));
  connect(pipe78_79R.outlet, join38.inlet1) annotation (Line(points={{32,-278},{32,-284},{31.88,-284},{31.88,-296}}, color={0,0,0}));
  connect(join38.inlet2, pipe78_80R.outlet) annotation (Line(points={{32,-307.88},{32,-310},{48,-310},{48,-288},{50,-288}}, color={0,0,0}));
  connect(split38.outlet2, pipe78_80.inlet) annotation (Line(points={{40,-292},{40,-298},{50,-298}}, color={0,0,0}));
  connect(pipe78_80R.inlet, join37.outlet) annotation (Line(points={{62,-288},{62,-282},{83,-282},{83,-298}}, color={0,0,0}));
  connect(pipe78_80.outlet, split37.inlet) annotation (Line(points={{62,-298},{73,-298},{73,-290}}, color={0,0,0}));
  connect(split37.outlet2, pipe80_81.inlet) annotation (Line(points={{67,-296},{66,-296},{66,-302},{69,-302},{69,-306}}, color={0,0,0}));
  connect(join37.inlet2, pipe80_81R.outlet) annotation (Line(points={{77,-303.88},{77,-306}}, color={0,0,0}));
  connect(join37.inlet1, pipe80_82R.outlet) annotation (Line(points={{76.88,-292},{76,-292},{76,-290},{92,-290}}, color={0,0,0}));
  connect(pipe80_82.inlet, split37.outlet1) annotation (Line(points={{92,-298},{88,-298},{88,-274},{67,-274},{67,-284.12}}, color={0,0,0}));
  connect(pipe73_74.outlet, split40.inlet) annotation (Line(points={{-70,-300},{-64,-300},{-64,-290},{-56,-290}}, color={0,0,0}));
  connect(pipe73_74R.inlet, join40.outlet) annotation (Line(points={{-70,-314},{-58,-314},{-58,-300},{-46,-300}}, color={0,0,0}));
  connect(split10.outlet2, pipe2_73.inlet) annotation (Line(points={{-112,-70},{-112,-118}}, color={0,0,0}));
  connect(join10.inlet1, pipe2_73R.outlet) annotation (Line(points={{-123.8,-94},{-123.8,-105},{-124,-105},{-124,-120}}, color={0,0,0}));
  connect(join41.outlet, pipe2_73R.inlet) annotation (Line(points={{-124,-304},{-124,-140}}, color={0,0,0}));
  connect(split41.inlet, pipe2_73.outlet) annotation (Line(points={{-112,-282},{-112,-138}}, color={0,0,0}));
  connect(split41.outlet1, pipe73_74.inlet) annotation (Line(points={{-102.2,-292},{-92,-292},{-92,-300},{-82,-300}}, color={0,0,0}));
  connect(join41.inlet2, pipe73_74R.outlet) annotation (Line(points={{-114.2,-314},{-82,-314}}, color={0,0,0}));
  connect(pipe58_73R.outlet, join41.inlet1) annotation (Line(points={{-130,-344},{-130,-332},{-142,-332},{-142,-314.2},{-134,-314.2}}, color={0,0,0}));
  connect(pipe58_73.inlet, split41.outlet2) annotation (Line(points={{-116,-344},{-116,-326},{-152,-326},{-152,-292},{-122,-292}}, color={0,0,0}));
  connect(pipe58_59.outlet, split32.inlet) annotation (Line(points={{244,-284},{244,-244}}, color={0,0,0}));
  connect(split32.outlet2, pipe59_60.inlet) annotation (Line(points={{254,-234},{270,-234}}, color={0,0,0}));
  connect(pipe59_60R.outlet, join32.inlet1) annotation (Line(points={{270,-248},{269,-248},{269,-247.8},{268,-247.8}}, color={0,0,0}));
  connect(join32.outlet, pipe58_59R.inlet) annotation (Line(points={{258,-258},{258,-284}}, color={0,0,0}));
  connect(split32.outlet1, pipe59_69.inlet) annotation (Line(points={{234.2,-234},{226,-234},{226,-194},{258,-194},{258,-162}}, color={0,0,0}));
  connect(join32.inlet2, pipe59_69R.outlet) annotation (Line(points={{248.2,-248},{216,-248},{216,-182},{242,-182},{242,-162}}, color={0,0,0}));
  connect(pipe58_73R.inlet, join42.outlet) annotation (Line(points={{-130,-364},{-130,-388},{250,-388}}, color={0,0,0}));
  connect(pipe58_59R.outlet, join42.inlet2) annotation (Line(points={{258,-304},{260,-304},{260,-378.2},{260,-378.2}}, color={0,0,0}));
  connect(split42.outlet1, pipe58_59.inlet) annotation (Line(points={{244,-360.2},{244,-304}}, color={0,0,0}));
  connect(pipe58_73.outlet, split42.inlet) annotation (Line(points={{-116,-364},{-116,-370},{234,-370}}, color={0,0,0}));
  connect(join42.inlet1, pipe55_58R.outlet) annotation (Line(points={{260.2,-398},{260,-398},{260,-406},{318,-406},{318,-378},{354,-378}}, color={0,0,0}));
  connect(split42.outlet2, pipe55_58.inlet) annotation (Line(points={{244,-380},{244,-412},{308,-412},{308,-390},{354,-390}}, color={0,0,0}));
  connect(pipe55_58R.inlet, join33.outlet) annotation (Line(points={{374,-378},{470,-378},{470,-360},{502,-360}}, color={0,0,0}));
  connect(pipe55_58.outlet, split35.inlet) annotation (Line(points={{374,-390},{484,-390},{484,-376},{500,-376}}, color={0,0,0}));
  connect(join33.inlet1, pipe54_56R.outlet) annotation (Line(points={{508.12,-354},{508,-354},{508,-348},{516,-348},{516,-344}}, color={0,0,0}));
  connect(split35.outlet1, pipe54_56.inlet) annotation (Line(points={{506,-370.12},{506,-368},{498,-368},{498,-352},{506,-352},{506,-344}}, color={0,0,0}));
  connect(split35.outlet2, split33.inlet) annotation (Line(points={{506,-382},{506,-384},{512,-384},{512,-358},{516,-358}}, color={0,0,0}));
  connect(split33.outlet2, pipe55_57.inlet) annotation (Line(points={{522,-364},{522,-368},{518,-368},{518,-384},{520,-384},{520,-388}}, color={0,0,0}));
  connect(join35.outlet, join33.inlet2) annotation (Line(points={{522,-376},{516,-376},{516,-365.88},{508,-365.88}}, color={0,0,0}));
  connect(pipe55_57R.outlet, join35.inlet2) annotation (Line(points={{510,-388},{510,-386},{528,-386},{528,-381.88}}, color={0,0,0}));
  connect(join35.inlet1, pipe51_54R.outlet) annotation (Line(points={{528.12,-370},{528,-370},{528,-358},{540,-358}}, color={0,0,0}));
  connect(split33.outlet1, pipe51_54.inlet) annotation (Line(points={{522,-352.12},{522,-346},{536,-346},{536,-380},{540,-380}}, color={0,0,0}));
  connect(join34.outlet, pipe51_54R.inlet) annotation (Line(points={{572,-358},{560,-358}}, color={0,0,0}));
  connect(join34.inlet1, pipe51_53R.outlet) annotation (Line(points={{578.12,-352},{578,-352},{578,-350},{590,-350},{590,-346}}, color={0,0,0}));
  connect(split36.inlet, pipe51_54.outlet) annotation (Line(points={{576,-376},{560,-376},{560,-380}}, color={0,0,0}));
  connect(split36.outlet1, pipe51_53.inlet) annotation (Line(points={{582,-370.12},{582,-346},{580,-346}}, color={0,0,0}));
  connect(split36.outlet2, split34.inlet) annotation (Line(points={{582,-382},{582,-384},{588,-384},{588,-376}}, color={0,0,0}));
  connect(split34.outlet2, pipe50_52.inlet) annotation (Line(points={{594,-382},{594,-384},{592,-384},{592,-388}}, color={0,0,0}));
  connect(join34.inlet2, join36.outlet) annotation (Line(points={{578,-363.88},{578,-366},{584,-366},{584,-358},{586,-358}}, color={0,0,0}));
  connect(pipe50_52R.outlet, join36.inlet2) annotation (Line(points={{582,-388},{586,-388},{586,-366},{592,-366},{592,-363.88}}, color={0,0,0}));
  connect(join26.outlet, pipe59_69R.inlet) annotation (Line(points={{242,-122},{242,-142}}, color={0,0,0}));
  connect(join26.inlet2, pipe70_72R.outlet) annotation (Line(points={{236.12,-116},{226.06,-116},{226.06,-110},{216,-110}}, color={0,0,0}));
  connect(join27.outlet, join26.inlet1) annotation (Line(points={{258,-118},{248,-118},{248,-115.88}}, color={0,0,0}));
  connect(join27.inlet2, pipe69_71R.outlet) annotation (Line(points={{264,-123.88},{264,-130},{272,-130},{272,-110},{280,-110}}, color={0,0,0}));
  connect(split27.inlet, pipe59_69.outlet) annotation (Line(points={{254,-132},{254,-137},{258,-137},{258,-142}}, color={0,0,0}));
  connect(split27.outlet1, split26.inlet) annotation (Line(points={{248.12,-126},{234,-126},{234,-124},{224,-124},{224,-106},{238,-106},{238,-104}}, color={0,0,0}));
  connect(split26.outlet1, pipe70_72.inlet) annotation (Line(points={{232.12,-98},{224,-98},{224,-102},{216,-102}}, color={0,0,0}));
  connect(split27.outlet2, pipe69_71.inlet) annotation (Line(points={{260,-126},{274,-126},{274,-102},{280,-102}}, color={0,0,0}));
  connect(join21.inlet2, pipe39_40R.outlet) annotation (Line(points={{754,-91.88},{754,-96}}, color={0,0,0}));
  connect(Topologie18_B.outlet, pipe39_40R.inlet) annotation (Line(points={{746.618,-112.07},{754,-112.07},{754,-108}}, color={0,0,0}));
  connect(split21.outlet2, pipe39_40.inlet) annotation (Line(points={{742,-88},{742,-92}}, color={0,0,0}));
  connect(pipe39_40.outlet, Topologie18_B.inlet) annotation (Line(points={{742,-104},{742,-112.07},{744.96,-112.07}}, color={0,0,0}));
  connect(join25.inlet2, pipe47_48R.outlet) annotation (Line(points={{758,-229.88},{758,-234}}, color={0,0,0}));
  connect(split25.outlet2, pipe47_48.inlet) annotation (Line(points={{746,-226},{746,-230}}, color={0,0,0}));
  connect(pipe47_48.outlet, Topologie22_B.inlet) annotation (Line(points={{746,-242},{746,-250.07},{748.96,-250.07}}, color={0,0,0}));
  connect(Topologie22_B.outlet, pipe47_48R.inlet) annotation (Line(points={{750.618,-250.07},{758,-250.07},{758,-246}}, color={0,0,0}));
  connect(join36.inlet1, pipe43_50R.inlet) annotation (Line(points={{592.12,-352},{860,-352},{860,-312}}, color={0,0,0}));
  connect(split34.outlet1, pipe43_50.outlet) annotation (Line(points={{594,-370.12},{740,-370.12},{740,-370},{878,-370},{878,-312}}, color={0,0,0}));
  connect(pipe66_68R.inlet, Topologie32_C.outlet) annotation (Line(points={{456,-224},{466.247,-224},{466.247,-197.747}}, color={0,0,0}));
  connect(pipe66_68.outlet, Topologie32_C.inlet) annotation (Line(points={{456,-232},{468.532,-232},{468.532,-197.747}}, color={0,0,0}));
  connect(pipe23_69R.outlet, join12.inlet1) annotation (Line(points={{256,-56},{256,-15},{256.2,-15},{256.2,26}}, color={0,0,0}));
  connect(split26.outlet2, pipe23_69.outlet) annotation (Line(points={{244,-98},{248,-98},{248,-86},{240,-86},{240,-76}}, color={0,0,0}));
  connect(join27.inlet1, pipe23_69R.inlet) annotation (Line(points={{264.12,-112},{264,-112},{264,-98},{256,-98},{256,-76}}, color={0,0,0}));
  connect(pipe80_82R.inlet, Topologie39_C.outlet) annotation (Line(points={{104,-290},{114.247,-290},{114.247,-263.747}}, color={0,0,0}));
  connect(Topologie39_C.inlet, pipe80_82.outlet) annotation (Line(points={{116.532,-263.747},{116.532,-298},{104,-298}}, color={0,0,0}));
  connect(sink.p_in,realExpression. y) annotation (Line(points={{-308,19.8},{-304,20},{-317,20}},             color={0,0,127}));
  connect(sink.port_a, pipe1_2.inlet) annotation (Line(points={{-290,20},{-232,20},{-232,-60},{-198,-60}},                     color={0,0,0}));
  connect(PID.y,heatpump1. dp) annotation (Line(points={{-251,-10},{-248,-10},{-248,-32},{-258,-32},{-258,-60}},color={0,0,127}));
  connect(heatpump1.outlet, pipe1_2.inlet) annotation (Line(points={{-248.2,-64},{-248,-60},{-198,-60}},            color={0,0,0}));
  connect(pipe1_2R.outlet,heatpump1. inlet) annotation (Line(points={{-198,-84},{-198,-76.2},{-248,-76.2}},                                  color={0,0,0}));
  connect(realExpression6.y,PID. u_s) annotation (Line(points={{-283,-10},{-274,-10}}, color={0,0,127}));
  connect(realExpression7.y,PID. u_m) annotation (Line(points={{-265,-32},{-262,-32},{-262,-22}}, color={0,0,127}));
  connect(realExpression3.y, heatpump1.T_set_variable) annotation (Line(points={{-273,-46},{-262,-46},{-262,-60}}, color={0,0,127}));
  connect(realExpression9.y, heatpump1.Q_flow_set) annotation (Line(points={{-333,-66},{-312,-66},{-312,-96},{-266,-96},{-266,-70}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-360,-500},{1340,260}})), Icon(coordinateSystem(extent={{-360,-500},{1340,260}}), graphics={
                                   Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-212,-500},{564,256}}), Polygon(
          origin={230,-52},
          lineColor={78,138,73},
          fillColor={0,124,124},
          fillPattern=FillPattern.Solid,
          points={{-224,202},{238,-82},{-224,-332},{-224,202}})}),
    experiment(
      StopTime=172800,
      Interval=3600,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A running example of a large-scale district heating network. This model was used in two publications (see References). Further explanations can be found in the publications. Enable the sparse solver for an efficient simulation. Advanced.Translation.SparseActivate=true</p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model was used in these publications:</p>
<p>[1] Gillner, M.; Westphal, J., et al.; Status of the TransiEnt Library: Transient Simulation of Complex Integrated Energy Systems, 2025, Modelica Conference</p>
<p>[2] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end Largescale_DHN;
