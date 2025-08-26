within TransiEnt.Grid.Heat.HeatGridTopology;
model TopologyC_Ports "A DHN topology for block buildings"

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

    import      Modelica.Units.SI;

  // _____________________________________________
  //
  //          Variables
  // _____________________________________________

    SI.HeatFlowRate Q_flow_A;
    SI.HeatFlowRate Q_flow_loss;
    SI.PressureDifference delta_p_fric;

  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

  TransiEnt.Consumer.Heat.Consumer consumer_2(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-152,74})));
  TransiEnt.Consumer.Heat.Consumer consumer_1(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-162,258})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe1_2(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=true,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-166,228})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe1_2R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-152,228})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe2_3R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-166,102})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe2_3(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-148,102})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-142,130})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-166,130})));
  TransiEnt.Consumer.Heat.Consumer consumer_4(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-90,76})));
  TransiEnt.Consumer.Heat.Consumer consumer_3(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-100,260})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe4_6(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-104,230})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe4_6R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,230})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe5_7(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-86,104})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split18 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-80,132})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join18 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-104,132})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe5_8R(
    d=0.065,
    m_flow_nom=3.35,
    l=40,
    MassFlowState=false) annotation (Placement(transformation(extent={{-42,162},{-22,182}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe5_8(
    d=0.065,
    m_flow_nom=3.35,
    l=40,
    MassFlowState=false) annotation (Placement(transformation(extent={{-22,146},{-42,166}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join19 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,202})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split19 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-104,204})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split20 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,156})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join20 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,172})));
  TransiEnt.Consumer.Heat.Consumer consumer_6(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={106,76})));
  TransiEnt.Consumer.Heat.Consumer consumer_5(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={96,260})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe11_13(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={92,230})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe11_13R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={106,230})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe12_14R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={92,104})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe12_14(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={110,104})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split33 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,132})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join33 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={92,132})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join34 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={116,202})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split34 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={92,204})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe12_15R(
    d=0.08,
    m_flow_nom=5.02,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{164,164},{144,184}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe12_15(
    d=0.08,
    m_flow_nom=5.02,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{144,148},{164,168}})));
  TransiEnt.Consumer.Heat.Consumer consumer_8(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={200,74})));
  TransiEnt.Consumer.Heat.Consumer consumer_7(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={190,258})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe15_17(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={186,228})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe15_17R(
    d=0.02,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={202,228})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe16_18R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={186,102})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe16_18(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={204,102})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split35 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={204,130})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join35 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={186,130})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join36 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,200})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split36 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={186,202})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe16_19R(
    d=0.065,
    m_flow_nom=3.35,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{266,158},{246,178}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe16_19(
    d=0.065,
    m_flow_nom=3.35,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{246,142},{266,162}})));
  TransiEnt.Consumer.Heat.Consumer consumer_10(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={298,68})));
  TransiEnt.Consumer.Heat.Consumer consumer_9(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={288,252})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe19_21(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={286,222})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe19_21R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={300,222})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe20_22R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={284,96})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe20_22(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={302,96})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split37 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={302,124})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join37 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={284,124})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join38 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={308,194})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split38 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={284,196})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe20_23R(
    d=0.05,
    m_flow_nom=1.67,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{356,156},{336,176}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe20_23(
    d=0.05,
    m_flow_nom=1.67,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{336,140},{356,160}})));
  TransiEnt.Consumer.Heat.Consumer consumer_12(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={392,66})));
  TransiEnt.Consumer.Heat.Consumer consumer_11(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={382,250})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe23_24(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={380,220})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe23_24R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={394,220})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe23_25R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={380,94})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe23_25(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={396,94})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join39 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={378,122})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split40 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={378,194})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe2_4(
    d=0.05,
    m_flow_nom=1.67,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{-112,146},{-132,166}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe2_4R(
    d=0.05,
    m_flow_nom=1.67,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{-132,162},{-112,182}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe8_11R(
    d=0.085,
    m_flow_nom=6.69,
    l=40,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{70,162},{50,182}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe8_11(
    d=0.085,
    m_flow_nom=6.69,
    l=40,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{50,146},{70,166}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={34,100})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,128})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe8_26(
    d=0.12,
    m_flow_nom=16.73,
    l=100,
    MassFlowState=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,58})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe8_26R(
    d=0.12,
    m_flow_nom=16.73,
    l=100,
    MassFlowState=false) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={20,58})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-58})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-42})));
  TransiEnt.Consumer.Heat.Consumer consumer_18(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={114,-138})));
  TransiEnt.Consumer.Heat.Consumer consumer_17(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={104,46})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe35_37(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={100,16})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe35_37R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={114,16})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe36_38R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,-110})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe36_38(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={118,-110})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={118,-82})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,-82})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={124,-12})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,-10})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe36_39R(
    d=0.75,
    m_flow_nom=5.02,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{172,-50},{152,-30}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe36_39(
    d=0.75,
    m_flow_nom=5.02,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{152,-66},{172,-46}})));
  TransiEnt.Consumer.Heat.Consumer consumer_20(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={208,-140})));
  TransiEnt.Consumer.Heat.Consumer consumer_19(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={198,44})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe39_41(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={194,14})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe39_41R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={208,14})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe40_42R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={194,-112})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe40_42(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={212,-112})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={212,-84})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={194,-84})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={218,-14})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={194,-12})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe40_43R(
    d=0.065,
    m_flow_nom=3.35,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{274,-56},{254,-36}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe40_43(
    d=0.065,
    m_flow_nom=3.35,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{254,-72},{274,-52}})));
  TransiEnt.Consumer.Heat.Consumer consumer_22(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={306,-146})));
  TransiEnt.Consumer.Heat.Consumer consumer_21(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={296,38})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe43_45(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={292,8})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe43_45R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={306,8})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe44_46R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={292,-118})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe44_46(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={310,-118})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={310,-90})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={292,-90})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join9 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={316,-20})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split9 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={292,-18})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe44_47R(
    d=0.05,
    m_flow_nom=1.67,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{364,-58},{344,-38}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe44_47(
    d=0.05,
    m_flow_nom=1.67,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{344,-74},{364,-54}})));
  TransiEnt.Consumer.Heat.Consumer consumer_24(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={400,-148})));
  TransiEnt.Consumer.Heat.Consumer consumer_23(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={390,36})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe47_48(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={386,6})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe47_48R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={400,6})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe47_49R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={386,-120})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe47_49(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={404,-120})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join10 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={386,-92})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split10 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={386,-20})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe27_35R(
    d=0.085,
    m_flow_nom=6.69,
    l=40,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{78,-52},{58,-32}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe27_35(
    d=0.085,
    m_flow_nom=6.69,
    l=40,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{58,-68},{78,-48}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe5_7R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-104,102})));
  TransiEnt.Consumer.Heat.Consumer consumer_16(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-148,-140})));
  TransiEnt.Consumer.Heat.Consumer consumer_15(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-158,44})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe32_33(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=true,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-162,14})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe32_33R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-148,14})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe32_34R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-162,-112})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe32_34(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-144,-112})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split11 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-138,-84})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join11 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-162,-84})));
  TransiEnt.Consumer.Heat.Consumer consumer_14(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-86,-138})));
  TransiEnt.Consumer.Heat.Consumer consumer_13(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-96,46})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe28_30(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-100,16})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe28_30R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-86,16})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe29_31(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-82,-110})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-76,-82})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,-82})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join13 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-76,-12})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split13 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,-10})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe29_32(
    d=0.5,
    m_flow_nom=1.673,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{-108,-68},{-128,-48}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe29_32R(
    d=0.5,
    m_flow_nom=1.673,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{-128,-52},{-108,-32}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe29_31R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-100,-112})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe26_28(
    d=0.065,
    m_flow_nom=3.35,
    l=40,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-18,-68},{-38,-48}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe26_28R(
    d=0.065,
    m_flow_nom=3.35,
    l=40,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-38,-52},{-18,-32}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join14 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={32,-78})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split14 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={16,-100})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe27_50(
    d=0.085,
    m_flow_nom=6.69,
    l=100,
    MassFlowState=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,-130})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe27_50R(
    d=0.085,
    m_flow_nom=6.69,
    l=100,
    MassFlowState=false) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={18,-130})));
  TransiEnt.Consumer.Heat.Consumer consumer_28(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-146,-356})));
  TransiEnt.Consumer.Heat.Consumer consumer_27(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-156,-172})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe55_56(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=true,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-160,-202})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe55_56R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-146,-202})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe55_57R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-160,-328})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe55_57(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-142,-328})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split15 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-136,-300})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join15 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-160,-300})));
  TransiEnt.Consumer.Heat.Consumer consumer_26(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-84,-354})));
  TransiEnt.Consumer.Heat.Consumer consumer_25(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-94,-170})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe51_53(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-98,-200})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe51_53R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-84,-200})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe52_54(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,-326})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split16 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,-298})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join16 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-98,-298})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join17 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-74,-228})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split17 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-98,-226})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe52_55(
    d=0.05,
    m_flow_nom=1.673,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{-106,-284},{-126,-264}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe52_55R(
    d=0.05,
    m_flow_nom=1.673,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{-126,-268},{-106,-248}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe52_54R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-98,-328})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe50_51(
    d=0.065,
    m_flow_nom=3.35,
    l=40,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-16,-284},{-36,-264}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe50_51R(
    d=0.065,
    m_flow_nom=3.35,
    l=40,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-36,-268},{-16,-248}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe50_58R(
    d=0.065,
    m_flow_nom=3.35,
    l=70,
    MassFlowState=false,
    N_cv=14) annotation (Placement(transformation(extent={{90,-268},{70,-248}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe50_58(
    d=0.065,
    m_flow_nom=3.35,
    l=70,
    MassFlowState=false,
    N_cv=14) annotation (Placement(transformation(extent={{70,-284},{90,-264}})));
  TransiEnt.Consumer.Heat.Consumer consumer_30(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={122,-360})));
  TransiEnt.Consumer.Heat.Consumer consumer_29(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={112,-176})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe58_60(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={108,-204})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe58_60R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={122,-204})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe59_61(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={108,-330})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe59_61R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={126,-330})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split21 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={126,-302})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join21 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={108,-302})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join22 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={132,-232})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split22 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={108,-230})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe59_62R(
    d=0.05,
    m_flow_nom=1.67,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{180,-270},{160,-250}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe59_62(
    d=0.05,
    m_flow_nom=1.67,
    l=21,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(extent={{160,-286},{180,-266}})));
  TransiEnt.Consumer.Heat.Consumer consumer_32(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={216,-362})));
  TransiEnt.Consumer.Heat.Consumer consumer_31(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={206,-178})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe62_63(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={202,-206})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe62_63R(
    d=0.02,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={216,-206})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe62_64R(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    MassFlowState=false,
    N_cv=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={202,-332})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe62_64(
    d=0.04,
    m_flow_nom=0.84,
    l=22,
    N_cv=4) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={220,-332})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join23 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={202,-304})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split23 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={202,-232})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split24 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,-274})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join24 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={18,-258})));
  TransiEnt.Basics.Interfaces.Thermal.inlet inlet annotation (Placement(transformation(extent={{-58,318},{-28,348}}), iconTransformation(extent={{-58,318},{-28,348}})));
  TransiEnt.Basics.Interfaces.Thermal.outlet outlet annotation (Placement(transformation(extent={{4,318},{34,348}}), iconTransformation(extent={{4,318},{34,348}})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe9_10R(
    d=0.15,
    m_flow_nom=26.78,
    l=22,
    MassFlowState=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,204})));
  TransiEnt.Components.Heat.SimplePipe_L4 pipe9_10(
    d=0.15,
    m_flow_nom=26.78,
    l=22,
    MassFlowState=false) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,200})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  inlet.m_flow*inStream(inlet.h_outflow) + outlet.m_flow*outlet.h_outflow = Q_flow_A;

  //heat losses
  Q_flow_loss=pipe1_2.Q_flow_loss+pipe2_3.Q_flow_loss+pipe2_4.Q_flow_loss+pipe4_6.Q_flow_loss+pipe5_7.Q_flow_loss+pipe5_8.Q_flow_loss+
  pipe9_10.Q_flow_loss+pipe8_11.Q_flow_loss+pipe11_13.Q_flow_loss+pipe12_14.Q_flow_loss+pipe12_15.Q_flow_loss+pipe15_17.Q_flow_loss+
  pipe16_18.Q_flow_loss+pipe16_19.Q_flow_loss+pipe19_21.Q_flow_loss+pipe20_22.Q_flow_loss+pipe20_23.Q_flow_loss+pipe23_24.Q_flow_loss+
  pipe23_25.Q_flow_loss+pipe8_26.Q_flow_loss+pipe26_28.Q_flow_loss+pipe28_30.Q_flow_loss+pipe29_31.Q_flow_loss+pipe29_32.Q_flow_loss+
  pipe32_33.Q_flow_loss+pipe32_34.Q_flow_loss+pipe27_35.Q_flow_loss+pipe35_37.Q_flow_loss+pipe36_38.Q_flow_loss+pipe36_39.Q_flow_loss+
  pipe39_41.Q_flow_loss+pipe40_42.Q_flow_loss+pipe40_43.Q_flow_loss+pipe43_45.Q_flow_loss+pipe44_46.Q_flow_loss+pipe44_47.Q_flow_loss+
  pipe47_48.Q_flow_loss+pipe47_49.Q_flow_loss+pipe27_50.Q_flow_loss+pipe50_51.Q_flow_loss+pipe51_53.Q_flow_loss+pipe52_54.Q_flow_loss+
  pipe52_55.Q_flow_loss+pipe55_56.Q_flow_loss+pipe55_57.Q_flow_loss+pipe50_58.Q_flow_loss+pipe58_60.Q_flow_loss+pipe59_61.Q_flow_loss+
  pipe59_62.Q_flow_loss+pipe62_63.Q_flow_loss+pipe62_64.Q_flow_loss+pipe1_2R.Q_flow_loss+pipe2_3R.Q_flow_loss+pipe2_4R.Q_flow_loss+
  pipe4_6R.Q_flow_loss+pipe5_7R.Q_flow_loss+pipe5_8R.Q_flow_loss+
  pipe9_10R.Q_flow_loss+pipe8_11R.Q_flow_loss+pipe11_13R.Q_flow_loss+pipe12_14R.Q_flow_loss+pipe12_15R.Q_flow_loss+pipe15_17R.Q_flow_loss+
  pipe16_18R.Q_flow_loss+pipe16_19R.Q_flow_loss+pipe19_21R.Q_flow_loss+pipe20_22R.Q_flow_loss+pipe20_23R.Q_flow_loss+pipe23_24R.Q_flow_loss+
  pipe23_25R.Q_flow_loss+pipe8_26R.Q_flow_loss+pipe26_28R.Q_flow_loss+pipe28_30R.Q_flow_loss+pipe29_31R.Q_flow_loss+pipe29_32R.Q_flow_loss+
  pipe32_33R.Q_flow_loss+pipe32_34R.Q_flow_loss+pipe27_35R.Q_flow_loss+pipe35_37R.Q_flow_loss+pipe36_38R.Q_flow_loss+pipe36_39R.Q_flow_loss+
  pipe39_41R.Q_flow_loss+pipe40_42R.Q_flow_loss+pipe40_43R.Q_flow_loss+pipe43_45R.Q_flow_loss+pipe44_46R.Q_flow_loss+pipe44_47R.Q_flow_loss+
  pipe47_48R.Q_flow_loss+pipe47_49R.Q_flow_loss+pipe27_50R.Q_flow_loss+pipe50_51R.Q_flow_loss+pipe51_53R.Q_flow_loss+pipe52_54R.Q_flow_loss+
  pipe52_55R.Q_flow_loss+pipe55_56R.Q_flow_loss+pipe55_57R.Q_flow_loss+pipe50_58R.Q_flow_loss+pipe58_60R.Q_flow_loss+pipe59_61R.Q_flow_loss+
  pipe59_62R.Q_flow_loss+pipe62_63R.Q_flow_loss+pipe62_64R.Q_flow_loss;

  //pressure drop due to friction
   delta_p_fric=pipe1_2.delta_p_fric+pipe2_3.delta_p_fric+pipe2_4.delta_p_fric+pipe4_6.delta_p_fric+pipe5_7.delta_p_fric+pipe5_8.delta_p_fric+
  pipe9_10.delta_p_fric+pipe8_11.delta_p_fric+pipe11_13.delta_p_fric+pipe12_14.delta_p_fric+pipe12_15.delta_p_fric+pipe15_17.delta_p_fric+
  pipe16_18.delta_p_fric+pipe16_19.delta_p_fric+pipe19_21.delta_p_fric+pipe20_22.delta_p_fric+pipe20_23.delta_p_fric+pipe23_24.delta_p_fric+
  pipe23_25.delta_p_fric+pipe8_26.delta_p_fric+pipe26_28.delta_p_fric+pipe28_30.delta_p_fric+pipe29_31.delta_p_fric+pipe29_32.delta_p_fric+
  pipe32_33.delta_p_fric+pipe32_34.delta_p_fric+pipe27_35.delta_p_fric+pipe35_37.delta_p_fric+pipe36_38.delta_p_fric+pipe36_39.delta_p_fric+
  pipe39_41.delta_p_fric+pipe40_42.delta_p_fric+pipe40_43.delta_p_fric+pipe43_45.delta_p_fric+pipe44_46.delta_p_fric+pipe44_47.delta_p_fric+
  pipe47_48.delta_p_fric+pipe47_49.delta_p_fric+pipe27_50.delta_p_fric+pipe50_51.delta_p_fric+pipe51_53.delta_p_fric+pipe52_54.delta_p_fric+
  pipe52_55.delta_p_fric+pipe55_56.delta_p_fric+pipe55_57.delta_p_fric+pipe50_58.delta_p_fric+pipe58_60.delta_p_fric+pipe59_61.delta_p_fric+
  pipe59_62.delta_p_fric+pipe62_63.delta_p_fric+pipe62_64.delta_p_fric+pipe1_2R.delta_p_fric+pipe2_3R.delta_p_fric+pipe2_4R.delta_p_fric+
  pipe4_6R.delta_p_fric+pipe5_7R.delta_p_fric+pipe5_8R.delta_p_fric+
  pipe9_10R.delta_p_fric+pipe8_11R.delta_p_fric+pipe11_13R.delta_p_fric+pipe12_14R.delta_p_fric+pipe12_15R.delta_p_fric+pipe15_17R.delta_p_fric+
  pipe16_18R.delta_p_fric+pipe16_19R.delta_p_fric+pipe19_21R.delta_p_fric+pipe20_22R.delta_p_fric+pipe20_23R.delta_p_fric+pipe23_24R.delta_p_fric+
  pipe23_25R.delta_p_fric+pipe8_26R.delta_p_fric+pipe26_28R.delta_p_fric+pipe28_30R.delta_p_fric+pipe29_31R.delta_p_fric+pipe29_32R.delta_p_fric+
  pipe32_33R.delta_p_fric+pipe32_34R.delta_p_fric+pipe27_35R.delta_p_fric+pipe35_37R.delta_p_fric+pipe36_38R.delta_p_fric+pipe36_39R.delta_p_fric+
  pipe39_41R.delta_p_fric+pipe40_42R.delta_p_fric+pipe40_43R.delta_p_fric+pipe43_45R.delta_p_fric+pipe44_46R.delta_p_fric+pipe44_47R.delta_p_fric+
  pipe47_48R.delta_p_fric+pipe47_49R.delta_p_fric+pipe27_50R.delta_p_fric+pipe50_51R.delta_p_fric+pipe51_53R.delta_p_fric+pipe52_54R.delta_p_fric+
  pipe52_55R.delta_p_fric+pipe55_56R.delta_p_fric+pipe55_57R.delta_p_fric+pipe50_58R.delta_p_fric+pipe58_60R.delta_p_fric+pipe59_61R.delta_p_fric+
  pipe59_62R.delta_p_fric+pipe62_63R.delta_p_fric+pipe62_64R.delta_p_fric;

  connect(consumer_2.inlet, pipe2_3.outlet) annotation (Line(points={{-148,86},{-148,92}},           color={0,0,0}));
  connect(pipe2_3R.inlet, consumer_2.outlet) annotation (Line(points={{-166,92},{-166,86},{-156,86}}, color={0,0,0}));
  connect(pipe2_3R.outlet, join5.inlet2) annotation (Line(points={{-166,112},{-166,120.2}},                       color={0,0,0}));
  connect(pipe2_3.inlet, split5.outlet1) annotation (Line(points={{-148,112},{-148,118},{-142,118},{-142,120.2}}, color={0,0,0}));
  connect(consumer_1.outlet, pipe1_2R.inlet) annotation (Line(points={{-158,246},{-152,246},{-152,238}}, color={0,0,0}));
  connect(join5.inlet1, pipe1_2R.outlet) annotation (Line(points={{-166.2,140},{-166,140},{-166,180},{-152,180},{-152,218}}, color={0,0,0}));
  connect(pipe1_2.outlet, consumer_1.inlet) annotation (Line(points={{-166,238},{-166,246}},                       color={0,0,0}));
  connect(pipe1_2.inlet, split5.outlet2) annotation (Line(points={{-166,218},{-166,188},{-142,188},{-142,140}}, color={0,0,0}));
  connect(consumer_4.inlet, pipe5_7.outlet) annotation (Line(points={{-86,88},{-86,94}},          color={0,0,0}));
  connect(pipe5_7.inlet, split18.outlet1) annotation (Line(points={{-86,114},{-86,120},{-80,120},{-80,122.2}}, color={0,0,0}));
  connect(join18.outlet, pipe5_8R.inlet) annotation (Line(points={{-94,132},{-86,132},{-86,176},{-54,176},{-54,172},{-42,172}}, color={0,0,0}));
  connect(split18.inlet, pipe5_8.outlet) annotation (Line(points={{-70,132},{-64,132},{-64,156},{-42,156}}, color={0,0,0}));
  connect(consumer_3.outlet, pipe4_6R.inlet) annotation (Line(points={{-96,248},{-90,248},{-90,240}}, color={0,0,0}));
  connect(pipe4_6R.outlet, join19.inlet1) annotation (Line(points={{-90,220},{-90,216},{-80.2,216},{-80.2,212}}, color={0,0,0}));
  connect(consumer_3.inlet, pipe4_6.outlet) annotation (Line(points={{-104,248},{-104,240}},            color={0,0,0}));
  connect(pipe4_6.inlet, split19.outlet2) annotation (Line(points={{-104,220},{-104,214}},                       color={0,0,0}));
  connect(split19.inlet, split18.outlet2) annotation (Line(points={{-94,204},{-92,204},{-92,152},{-80,152},{-80,142}}, color={0,0,0}));
  connect(join18.inlet1, join19.outlet) annotation (Line(points={{-104.2,142},{-104,142},{-104,160},{-64,160},{-64,202},{-70,202}}, color={0,0,0}));
  connect(split20.outlet2, pipe5_8.inlet) annotation (Line(points={{-12,156},{-22,156}}, color={0,0,0}));
  connect(pipe5_8R.outlet, join20.inlet1) annotation (Line(points={{-22,172},{-22,171.8},{10,171.8}}, color={0,0,0}));
  connect(consumer_6.inlet, pipe12_14.outlet) annotation (Line(points={{110,88},{110,94}},          color={0,0,0}));
  connect(pipe12_14R.inlet, consumer_6.outlet) annotation (Line(points={{92,94},{92,88},{102,88}}, color={0,0,0}));
  connect(pipe12_14R.outlet, join33.inlet2) annotation (Line(points={{92,114},{92,122.2}},                   color={0,0,0}));
  connect(pipe12_14.inlet, split33.outlet1) annotation (Line(points={{110,114},{110,122.2}},                     color={0,0,0}));
  connect(consumer_5.outlet, pipe11_13R.inlet) annotation (Line(points={{100,248},{106,248},{106,240}}, color={0,0,0}));
  connect(pipe11_13R.outlet, join34.inlet1) annotation (Line(points={{106,220},{106,216},{115.8,216},{115.8,212}}, color={0,0,0}));
  connect(consumer_5.inlet, pipe11_13.outlet) annotation (Line(points={{92,248},{92,240}},          color={0,0,0}));
  connect(pipe11_13.inlet, split34.outlet2) annotation (Line(points={{92,220},{92,214}},                   color={0,0,0}));
  connect(split34.outlet1, split33.inlet) annotation (Line(points={{92,194.2},{92,166},{128,166},{128,132},{120,132}}, color={0,0,0}));
  connect(split33.outlet2, pipe12_15.inlet) annotation (Line(points={{110,142},{110,158},{144,158}}, color={0,0,0}));
  connect(pipe12_15R.outlet, join34.inlet2) annotation (Line(points={{144,174},{116,174},{116,192.2}}, color={0,0,0}));
  connect(join34.outlet, join33.inlet1) annotation (Line(points={{126,202},{134,202},{134,148},{91.8,148},{91.8,142}}, color={0,0,0}));
  connect(consumer_8.inlet, pipe16_18.outlet) annotation (Line(points={{204,86},{204,92}},          color={0,0,0}));
  connect(pipe16_18R.inlet, consumer_8.outlet) annotation (Line(points={{186,92},{186,86},{196,86}}, color={0,0,0}));
  connect(pipe16_18R.outlet, join35.inlet2) annotation (Line(points={{186,112},{186,120.2}},                     color={0,0,0}));
  connect(pipe16_18.inlet, split35.outlet1) annotation (Line(points={{204,112},{204,120.2}},                     color={0,0,0}));
  connect(consumer_7.outlet, pipe15_17R.inlet) annotation (Line(points={{194,246},{202,246},{202,238}}, color={0,0,0}));
  connect(pipe15_17R.outlet, join36.inlet1) annotation (Line(points={{202,218},{202,214},{209.8,214},{209.8,210}}, color={0,0,0}));
  connect(consumer_7.inlet, pipe15_17.outlet) annotation (Line(points={{186,246},{186,238}},           color={0,0,0}));
  connect(pipe15_17.inlet, split36.outlet2) annotation (Line(points={{186,218},{186,212}},                     color={0,0,0}));
  connect(split36.outlet1, split35.inlet) annotation (Line(points={{186,192.2},{186,164},{222,164},{222,130},{214,130}}, color={0,0,0}));
  connect(join36.outlet, join35.inlet1) annotation (Line(points={{220,200},{228,200},{228,146},{185.8,146},{185.8,140}}, color={0,0,0}));
  connect(pipe12_15R.inlet, join35.outlet) annotation (Line(points={{164,174},{196,174},{196,130}}, color={0,0,0}));
  connect(pipe12_15.outlet, split36.inlet) annotation (Line(points={{164,158},{202,158},{202,202},{196,202}}, color={0,0,0}));
  connect(consumer_10.inlet, pipe20_22.outlet) annotation (Line(points={{302,80},{302,86}}, color={0,0,0}));
  connect(pipe20_22R.inlet, consumer_10.outlet) annotation (Line(points={{284,86},{284,80},{294,80}}, color={0,0,0}));
  connect(pipe20_22R.outlet, join37.inlet2) annotation (Line(points={{284,106},{284,114.2}}, color={0,0,0}));
  connect(pipe20_22.inlet, split37.outlet1) annotation (Line(points={{302,106},{302,114.2}}, color={0,0,0}));
  connect(consumer_9.outlet, pipe19_21R.inlet) annotation (Line(points={{292,240},{300,240},{300,232}}, color={0,0,0}));
  connect(pipe19_21R.outlet, join38.inlet1) annotation (Line(points={{300,212},{300,208},{307.8,208},{307.8,204}}, color={0,0,0}));
  connect(consumer_9.inlet, pipe19_21.outlet) annotation (Line(points={{284,240},{284,232},{286,232}}, color={0,0,0}));
  connect(pipe19_21.inlet, split38.outlet2) annotation (Line(points={{286,212},{286,210},{284,210},{284,206}}, color={0,0,0}));
  connect(split38.outlet1, split37.inlet) annotation (Line(points={{284,186.2},{284,158},{320,158},{320,124},{312,124}}, color={0,0,0}));
  connect(split37.outlet2, pipe20_23.inlet) annotation (Line(points={{302,134},{302,150},{336,150}}, color={0,0,0}));
  connect(pipe20_23R.outlet, join38.inlet2) annotation (Line(points={{336,166},{308,166},{308,184.2}}, color={0,0,0}));
  connect(join38.outlet, join37.inlet1) annotation (Line(points={{318,194},{326,194},{326,140},{283.8,140},{283.8,134}}, color={0,0,0}));
  connect(consumer_12.inlet, pipe23_25.outlet) annotation (Line(points={{396,78},{396,84}}, color={0,0,0}));
  connect(pipe23_25R.inlet, consumer_12.outlet) annotation (Line(points={{380,84},{380,78},{388,78}}, color={0,0,0}));
  connect(pipe23_25R.outlet, join39.inlet2) annotation (Line(points={{380,104},{380,108},{378,108},{378,112.2}}, color={0,0,0}));
  connect(consumer_11.outlet, pipe23_24R.inlet) annotation (Line(points={{386,238},{394,238},{394,230}}, color={0,0,0}));
  connect(consumer_11.inlet, pipe23_24.outlet) annotation (Line(points={{378,238},{378,230},{380,230}}, color={0,0,0}));
  connect(pipe23_24.inlet, split40.outlet2) annotation (Line(points={{380,210},{380,208},{378,208},{378,204}}, color={0,0,0}));
  connect(pipe20_23R.inlet, join39.outlet) annotation (Line(points={{356,166},{388,166},{388,122}}, color={0,0,0}));
  connect(pipe20_23.outlet, split40.inlet) annotation (Line(points={{356,150},{394,150},{394,194},{388,194}}, color={0,0,0}));
  connect(pipe16_19.outlet, split38.inlet) annotation (Line(points={{266,152},{300,152},{300,196},{294,196}}, color={0,0,0}));
  connect(pipe16_19R.inlet, join37.outlet) annotation (Line(points={{266,168},{294,168},{294,124}}, color={0,0,0}));
  connect(join36.inlet2, pipe16_19R.outlet) annotation (Line(points={{210,190.2},{210,168},{246,168}}, color={0,0,0}));
  connect(split35.outlet2, pipe16_19.inlet) annotation (Line(points={{204,140},{204,152},{246,152}}, color={0,0,0}));
  connect(join39.inlet1, pipe23_24R.outlet) annotation (Line(points={{377.8,132},{376,132},{376,144},{406,144},{406,204},{394,204},{394,210}}, color={0,0,0}));
  connect(split40.outlet1, pipe23_25.inlet) annotation (Line(points={{378,184.2},{378,172},{396,172},{396,104}}, color={0,0,0}));
  connect(pipe8_11.outlet, split34.inlet) annotation (Line(points={{70,156},{108,156},{108,204},{102,204}}, color={0,0,0}));
  connect(pipe8_11R.inlet, join33.outlet) annotation (Line(points={{70,172},{102,172},{102,132}}, color={0,0,0}));
  connect(split20.outlet1, split1.inlet) annotation (Line(points={{7.8,156},{12,156},{12,138},{20,138}}, color={0,0,0}));
  connect(split1.outlet1, pipe8_11.inlet) annotation (Line(points={{29.8,128},{38,128},{38,156},{50,156}}, color={0,0,0}));
  connect(join20.inlet2, join1.outlet) annotation (Line(points={{29.8,172},{34,172},{34,110}}, color={0,0,0}));
  connect(join1.inlet2, pipe8_11R.outlet) annotation (Line(points={{43.8,100},{44,100},{44,172},{50,172}}, color={0,0,0}));
  connect(join1.inlet1, pipe8_26R.outlet) annotation (Line(points={{24,99.8},{20,99.8},{20,68}}, color={0,0,0}));
  connect(pipe8_26.inlet, split1.outlet2) annotation (Line(points={{1.77636e-15,68},{0,68},{0,128},{10,128}}, color={0,0,0}));
  connect(pipe8_26.outlet, split2.inlet) annotation (Line(points={{-1.77636e-15,48},{-1.77636e-15,-1},{1.77636e-15,-1},{1.77636e-15,-48}}, color={0,0,0}));
  connect(pipe8_26R.inlet, join2.outlet) annotation (Line(points={{20,48},{20,-32}}, color={0,0,0}));
  connect(consumer_18.inlet, pipe36_38.outlet) annotation (Line(points={{118,-126},{118,-120}}, color={0,0,0}));
  connect(pipe36_38R.inlet, consumer_18.outlet) annotation (Line(points={{100,-120},{100,-126},{110,-126}}, color={0,0,0}));
  connect(pipe36_38R.outlet, join3.inlet2) annotation (Line(points={{100,-100},{100,-91.8}}, color={0,0,0}));
  connect(pipe36_38.inlet, split3.outlet1) annotation (Line(points={{118,-100},{118,-91.8}}, color={0,0,0}));
  connect(consumer_17.outlet, pipe35_37R.inlet) annotation (Line(points={{108,34},{114,34},{114,26}}, color={0,0,0}));
  connect(pipe35_37R.outlet, join4.inlet1) annotation (Line(points={{114,6},{114,2},{123.8,2},{123.8,-2}}, color={0,0,0}));
  connect(consumer_17.inlet, pipe35_37.outlet) annotation (Line(points={{100,34},{100,26}}, color={0,0,0}));
  connect(pipe35_37.inlet, split4.outlet2) annotation (Line(points={{100,6},{100,0}}, color={0,0,0}));
  connect(split4.outlet1, split3.inlet) annotation (Line(points={{100,-19.8},{100,-48},{136,-48},{136,-82},{128,-82}}, color={0,0,0}));
  connect(split3.outlet2, pipe36_39.inlet) annotation (Line(points={{118,-72},{118,-56},{152,-56}}, color={0,0,0}));
  connect(pipe36_39R.outlet, join4.inlet2) annotation (Line(points={{152,-40},{124,-40},{124,-21.8}}, color={0,0,0}));
  connect(join4.outlet, join3.inlet1) annotation (Line(points={{134,-12},{142,-12},{142,-66},{99.8,-66},{99.8,-72}}, color={0,0,0}));
  connect(consumer_20.inlet, pipe40_42.outlet) annotation (Line(points={{212,-128},{212,-122}}, color={0,0,0}));
  connect(pipe40_42R.inlet, consumer_20.outlet) annotation (Line(points={{194,-122},{194,-128},{204,-128}}, color={0,0,0}));
  connect(pipe40_42R.outlet, join6.inlet2) annotation (Line(points={{194,-102},{194,-93.8}}, color={0,0,0}));
  connect(pipe40_42.inlet, split6.outlet1) annotation (Line(points={{212,-102},{212,-93.8}}, color={0,0,0}));
  connect(consumer_19.outlet, pipe39_41R.inlet) annotation (Line(points={{202,32},{208,32},{208,24}}, color={0,0,0}));
  connect(pipe39_41R.outlet, join7.inlet1) annotation (Line(points={{208,4},{208,0},{217.8,0},{217.8,-4}}, color={0,0,0}));
  connect(consumer_19.inlet, pipe39_41.outlet) annotation (Line(points={{194,32},{194,24}}, color={0,0,0}));
  connect(pipe39_41.inlet, split7.outlet2) annotation (Line(points={{194,4},{194,-2}}, color={0,0,0}));
  connect(split7.outlet1, split6.inlet) annotation (Line(points={{194,-21.8},{194,-50},{230,-50},{230,-84},{222,-84}}, color={0,0,0}));
  connect(join7.outlet, join6.inlet1) annotation (Line(points={{228,-14},{236,-14},{236,-68},{193.8,-68},{193.8,-74}}, color={0,0,0}));
  connect(pipe36_39R.inlet, join6.outlet) annotation (Line(points={{172,-40},{204,-40},{204,-84}}, color={0,0,0}));
  connect(pipe36_39.outlet, split7.inlet) annotation (Line(points={{172,-56},{210,-56},{210,-12},{204,-12}}, color={0,0,0}));
  connect(consumer_22.inlet, pipe44_46.outlet) annotation (Line(points={{310,-134},{310,-128}}, color={0,0,0}));
  connect(pipe44_46R.inlet, consumer_22.outlet) annotation (Line(points={{292,-128},{292,-134},{302,-134}}, color={0,0,0}));
  connect(pipe44_46R.outlet, join8.inlet2) annotation (Line(points={{292,-108},{292,-99.8}}, color={0,0,0}));
  connect(pipe44_46.inlet, split8.outlet1) annotation (Line(points={{310,-108},{310,-99.8}}, color={0,0,0}));
  connect(consumer_21.outlet, pipe43_45R.inlet) annotation (Line(points={{300,26},{306,26},{306,18}}, color={0,0,0}));
  connect(pipe43_45R.outlet, join9.inlet1) annotation (Line(points={{306,-2},{306,-6},{315.8,-6},{315.8,-10}}, color={0,0,0}));
  connect(consumer_21.inlet, pipe43_45.outlet) annotation (Line(points={{292,26},{292,18}}, color={0,0,0}));
  connect(pipe43_45.inlet, split9.outlet2) annotation (Line(points={{292,-2},{292,-8}}, color={0,0,0}));
  connect(split9.outlet1, split8.inlet) annotation (Line(points={{292,-27.8},{292,-56},{328,-56},{328,-90},{320,-90}}, color={0,0,0}));
  connect(split8.outlet2, pipe44_47.inlet) annotation (Line(points={{310,-80},{310,-64},{344,-64}}, color={0,0,0}));
  connect(pipe44_47R.outlet, join9.inlet2) annotation (Line(points={{344,-48},{316,-48},{316,-29.8}}, color={0,0,0}));
  connect(join9.outlet, join8.inlet1) annotation (Line(points={{326,-20},{334,-20},{334,-74},{291.8,-74},{291.8,-80}}, color={0,0,0}));
  connect(consumer_24.inlet, pipe47_49.outlet) annotation (Line(points={{404,-136},{404,-130}}, color={0,0,0}));
  connect(pipe47_49R.inlet, consumer_24.outlet) annotation (Line(points={{386,-130},{386,-136},{396,-136}}, color={0,0,0}));
  connect(pipe47_49R.outlet, join10.inlet2) annotation (Line(points={{386,-110},{386,-101.8}}, color={0,0,0}));
  connect(consumer_23.outlet, pipe47_48R.inlet) annotation (Line(points={{394,24},{400,24},{400,16}}, color={0,0,0}));
  connect(consumer_23.inlet, pipe47_48.outlet) annotation (Line(points={{386,24},{386,16}}, color={0,0,0}));
  connect(pipe47_48.inlet, split10.outlet2) annotation (Line(points={{386,-4},{386,-10}}, color={0,0,0}));
  connect(pipe44_47R.inlet, join10.outlet) annotation (Line(points={{364,-48},{396,-48},{396,-92}}, color={0,0,0}));
  connect(pipe44_47.outlet, split10.inlet) annotation (Line(points={{364,-64},{402,-64},{402,-20},{396,-20}}, color={0,0,0}));
  connect(pipe40_43.outlet, split9.inlet) annotation (Line(points={{274,-62},{308,-62},{308,-18},{302,-18}}, color={0,0,0}));
  connect(pipe40_43R.inlet, join8.outlet) annotation (Line(points={{274,-46},{302,-46},{302,-90}}, color={0,0,0}));
  connect(join7.inlet2, pipe40_43R.outlet) annotation (Line(points={{218,-23.8},{218,-46},{254,-46}}, color={0,0,0}));
  connect(split6.outlet2, pipe40_43.inlet) annotation (Line(points={{212,-74},{212,-62},{254,-62}}, color={0,0,0}));
  connect(join10.inlet1, pipe47_48R.outlet) annotation (Line(points={{385.8,-82},{384,-82},{384,-70},{414,-70},{414,-10},{400,-10},{400,-4}}, color={0,0,0}));
  connect(split10.outlet1, pipe47_49.inlet) annotation (Line(points={{386,-29.8},{386,-42},{404,-42},{404,-110}}, color={0,0,0}));
  connect(pipe27_35.outlet, split4.inlet) annotation (Line(points={{78,-58},{116,-58},{116,-10},{110,-10}}, color={0,0,0}));
  connect(pipe27_35R.inlet, join3.outlet) annotation (Line(points={{78,-42},{110,-42},{110,-82}}, color={0,0,0}));
  connect(join5.outlet, pipe2_4R.inlet) annotation (Line(points={{-156,130},{-154,130},{-154,172},{-132,172}}, color={0,0,0}));
  connect(split5.inlet, pipe2_4.outlet) annotation (Line(points={{-132,130},{-128,130},{-128,128},{-126,128},{-126,144},{-138,144},{-138,156},{-132,156}}, color={0,0,0}));
  connect(pipe2_4.inlet, split19.outlet1) annotation (Line(points={{-112,156},{-108,156},{-108,162},{-104,162},{-104,194.2}}, color={0,0,0}));
  connect(pipe5_7R.outlet, join18.inlet2) annotation (Line(points={{-104,112},{-104,122.2}},                       color={0,0,0}));
  connect(pipe5_7R.inlet, consumer_4.outlet) annotation (Line(points={{-104,92},{-104,88},{-94,88}}, color={0,0,0}));
  connect(pipe2_4R.outlet, join19.inlet2) annotation (Line(points={{-112,172},{-80,172},{-80,192.2}}, color={0,0,0}));
  connect(consumer_16.inlet, pipe32_34.outlet) annotation (Line(points={{-144,-128},{-144,-122}}, color={0,0,0}));
  connect(pipe32_34R.inlet, consumer_16.outlet) annotation (Line(points={{-162,-122},{-162,-128},{-152,-128}}, color={0,0,0}));
  connect(pipe32_34R.outlet, join11.inlet2) annotation (Line(points={{-162,-102},{-162,-93.8}}, color={0,0,0}));
  connect(pipe32_34.inlet, split11.outlet1) annotation (Line(points={{-144,-102},{-144,-96},{-138,-96},{-138,-93.8}}, color={0,0,0}));
  connect(consumer_15.outlet, pipe32_33R.inlet) annotation (Line(points={{-154,32},{-148,32},{-148,24}}, color={0,0,0}));
  connect(join11.inlet1, pipe32_33R.outlet) annotation (Line(points={{-162.2,-74},{-162,-74},{-162,-34},{-148,-34},{-148,4}}, color={0,0,0}));
  connect(pipe32_33.outlet, consumer_15.inlet) annotation (Line(points={{-162,24},{-162,32}}, color={0,0,0}));
  connect(pipe32_33.inlet, split11.outlet2) annotation (Line(points={{-162,4},{-162,-26},{-138,-26},{-138,-74}}, color={0,0,0}));
  connect(consumer_14.inlet, pipe29_31.outlet) annotation (Line(points={{-82,-126},{-82,-120}}, color={0,0,0}));
  connect(pipe29_31.inlet, split12.outlet1) annotation (Line(points={{-82,-100},{-82,-94},{-76,-94},{-76,-91.8}}, color={0,0,0}));
  connect(join12.outlet, pipe26_28R.inlet) annotation (Line(points={{-90,-82},{-82,-82},{-82,-38},{-50,-38},{-50,-42},{-38,-42}}, color={0,0,0}));
  connect(split12.inlet, pipe26_28.outlet) annotation (Line(points={{-66,-82},{-60,-82},{-60,-58},{-38,-58}}, color={0,0,0}));
  connect(consumer_13.outlet, pipe28_30R.inlet) annotation (Line(points={{-92,34},{-86,34},{-86,26}}, color={0,0,0}));
  connect(pipe28_30R.outlet, join13.inlet1) annotation (Line(points={{-86,6},{-86,2},{-76.2,2},{-76.2,-2}}, color={0,0,0}));
  connect(consumer_13.inlet, pipe28_30.outlet) annotation (Line(points={{-100,34},{-100,26}}, color={0,0,0}));
  connect(pipe28_30.inlet, split13.outlet2) annotation (Line(points={{-100,6},{-100,0}}, color={0,0,0}));
  connect(split13.inlet, split12.outlet2) annotation (Line(points={{-90,-10},{-88,-10},{-88,-62},{-76,-62},{-76,-72}}, color={0,0,0}));
  connect(join12.inlet1, join13.outlet) annotation (Line(points={{-100.2,-72},{-100,-72},{-100,-54},{-60,-54},{-60,-12},{-66,-12}}, color={0,0,0}));
  connect(join11.outlet, pipe29_32R.inlet) annotation (Line(points={{-152,-84},{-150,-84},{-150,-42},{-128,-42}}, color={0,0,0}));
  connect(split11.inlet, pipe29_32.outlet) annotation (Line(points={{-128,-84},{-124,-84},{-124,-86},{-122,-86},{-122,-70},{-134,-70},{-134,-58},{-128,-58}}, color={0,0,0}));
  connect(pipe29_32.inlet, split13.outlet1) annotation (Line(points={{-108,-58},{-104,-58},{-104,-52},{-100,-52},{-100,-19.8}}, color={0,0,0}));
  connect(pipe29_31R.outlet, join12.inlet2) annotation (Line(points={{-100,-102},{-100,-91.8}}, color={0,0,0}));
  connect(pipe29_31R.inlet, consumer_14.outlet) annotation (Line(points={{-100,-122},{-100,-126},{-90,-126}}, color={0,0,0}));
  connect(pipe29_32R.outlet, join13.inlet2) annotation (Line(points={{-108,-42},{-76,-42},{-76,-21.8}}, color={0,0,0}));
  connect(pipe26_28R.outlet, join2.inlet1) annotation (Line(points={{-18,-42},{-16,-42},{-16,-42.2},{10,-42.2}}, color={0,0,0}));
  connect(pipe26_28.inlet, split2.outlet2) annotation (Line(points={{-18,-58},{-10,-58}}, color={0,0,0}));
  connect(join2.inlet2, join14.outlet) annotation (Line(points={{29.8,-42},{32,-42},{32,-68}}, color={0,0,0}));
  connect(join14.inlet2, pipe27_35R.outlet) annotation (Line(points={{41.8,-78},{48,-78},{48,-42},{58,-42}}, color={0,0,0}));
  connect(split2.outlet1, split14.inlet) annotation (Line(points={{9.8,-58},{9.8,-59},{16,-59},{16,-90}}, color={0,0,0}));
  connect(split14.outlet1, pipe27_35.inlet) annotation (Line(points={{25.8,-100},{52,-100},{52,-58},{58,-58}}, color={0,0,0}));
  connect(pipe27_50R.outlet, join14.inlet1) annotation (Line(points={{18,-120},{18,-78.2},{22,-78.2}}, color={0,0,0}));
  connect(split14.outlet2, pipe27_50.inlet) annotation (Line(points={{6,-100},{-2,-100},{-2,-120}}, color={0,0,0}));
  connect(consumer_28.inlet, pipe55_57.outlet) annotation (Line(points={{-142,-344},{-142,-338}}, color={0,0,0}));
  connect(pipe55_57R.inlet, consumer_28.outlet) annotation (Line(points={{-160,-338},{-160,-344},{-150,-344}}, color={0,0,0}));
  connect(pipe55_57R.outlet, join15.inlet2) annotation (Line(points={{-160,-318},{-160,-309.8}}, color={0,0,0}));
  connect(pipe55_57.inlet, split15.outlet1) annotation (Line(points={{-142,-318},{-142,-312},{-136,-312},{-136,-309.8}}, color={0,0,0}));
  connect(consumer_27.outlet, pipe55_56R.inlet) annotation (Line(points={{-152,-184},{-146,-184},{-146,-192}}, color={0,0,0}));
  connect(join15.inlet1, pipe55_56R.outlet) annotation (Line(points={{-160.2,-290},{-160,-290},{-160,-250},{-146,-250},{-146,-212}}, color={0,0,0}));
  connect(pipe55_56.outlet, consumer_27.inlet) annotation (Line(points={{-160,-192},{-160,-184}}, color={0,0,0}));
  connect(pipe55_56.inlet, split15.outlet2) annotation (Line(points={{-160,-212},{-160,-242},{-136,-242},{-136,-290}}, color={0,0,0}));
  connect(consumer_26.inlet, pipe52_54.outlet) annotation (Line(points={{-80,-342},{-80,-336}}, color={0,0,0}));
  connect(pipe52_54.inlet, split16.outlet1) annotation (Line(points={{-80,-316},{-80,-310},{-74,-310},{-74,-307.8}}, color={0,0,0}));
  connect(join16.outlet, pipe50_51R.inlet) annotation (Line(points={{-88,-298},{-80,-298},{-80,-254},{-48,-254},{-48,-258},{-36,-258}}, color={0,0,0}));
  connect(split16.inlet, pipe50_51.outlet) annotation (Line(points={{-64,-298},{-58,-298},{-58,-274},{-36,-274}}, color={0,0,0}));
  connect(consumer_25.outlet, pipe51_53R.inlet) annotation (Line(points={{-90,-182},{-84,-182},{-84,-190}}, color={0,0,0}));
  connect(pipe51_53R.outlet, join17.inlet1) annotation (Line(points={{-84,-210},{-84,-214},{-74.2,-214},{-74.2,-218}}, color={0,0,0}));
  connect(consumer_25.inlet, pipe51_53.outlet) annotation (Line(points={{-98,-182},{-98,-190}}, color={0,0,0}));
  connect(pipe51_53.inlet, split17.outlet2) annotation (Line(points={{-98,-210},{-98,-216}}, color={0,0,0}));
  connect(split17.inlet, split16.outlet2) annotation (Line(points={{-88,-226},{-86,-226},{-86,-278},{-74,-278},{-74,-288}}, color={0,0,0}));
  connect(join16.inlet1, join17.outlet) annotation (Line(points={{-98.2,-288},{-98,-288},{-98,-270},{-58,-270},{-58,-228},{-64,-228}}, color={0,0,0}));
  connect(join15.outlet, pipe52_55R.inlet) annotation (Line(points={{-150,-300},{-148,-300},{-148,-258},{-126,-258}}, color={0,0,0}));
  connect(split15.inlet, pipe52_55.outlet) annotation (Line(points={{-126,-300},{-122,-300},{-122,-302},{-120,-302},{-120,-286},{-132,-286},{-132,-274},{-126,-274}}, color={0,0,0}));
  connect(pipe52_55.inlet, split17.outlet1) annotation (Line(points={{-106,-274},{-102,-274},{-102,-268},{-98,-268},{-98,-235.8}}, color={0,0,0}));
  connect(pipe52_54R.outlet, join16.inlet2) annotation (Line(points={{-98,-318},{-98,-307.8}}, color={0,0,0}));
  connect(pipe52_54R.inlet, consumer_26.outlet) annotation (Line(points={{-98,-338},{-98,-342},{-88,-342}}, color={0,0,0}));
  connect(pipe52_55R.outlet, join17.inlet2) annotation (Line(points={{-106,-258},{-74,-258},{-74,-237.8}}, color={0,0,0}));
  connect(consumer_30.inlet, pipe59_61R.outlet) annotation (Line(points={{126,-348},{126,-340}}, color={0,0,0}));
  connect(pipe59_61.inlet, consumer_30.outlet) annotation (Line(points={{108,-340},{108,-348},{118,-348}}, color={0,0,0}));
  connect(pipe59_61.outlet, join21.inlet2) annotation (Line(points={{108,-320},{108,-311.8}}, color={0,0,0}));
  connect(pipe59_61R.inlet, split21.outlet1) annotation (Line(points={{126,-320},{126,-311.8}}, color={0,0,0}));
  connect(consumer_29.outlet, pipe58_60R.inlet) annotation (Line(points={{116,-188},{122,-188},{122,-194}}, color={0,0,0}));
  connect(pipe58_60R.outlet, join22.inlet1) annotation (Line(points={{122,-214},{122,-218},{131.8,-218},{131.8,-222}}, color={0,0,0}));
  connect(consumer_29.inlet, pipe58_60.outlet) annotation (Line(points={{108,-188},{108,-194}}, color={0,0,0}));
  connect(pipe58_60.inlet, split22.outlet2) annotation (Line(points={{108,-214},{108,-220}}, color={0,0,0}));
  connect(split22.outlet1, split21.inlet) annotation (Line(points={{108,-239.8},{108,-268},{144,-268},{144,-302},{136,-302}}, color={0,0,0}));
  connect(split21.outlet2, pipe59_62.inlet) annotation (Line(points={{126,-292},{126,-276},{160,-276}}, color={0,0,0}));
  connect(pipe59_62R.outlet, join22.inlet2) annotation (Line(points={{160,-260},{132,-260},{132,-241.8}}, color={0,0,0}));
  connect(join22.outlet, join21.inlet1) annotation (Line(points={{142,-232},{150,-232},{150,-286},{107.8,-286},{107.8,-292}}, color={0,0,0}));
  connect(consumer_32.inlet, pipe62_64.outlet) annotation (Line(points={{220,-350},{220,-342}}, color={0,0,0}));
  connect(pipe62_64R.inlet, consumer_32.outlet) annotation (Line(points={{202,-342},{202,-350},{212,-350}}, color={0,0,0}));
  connect(pipe62_64R.outlet, join23.inlet2) annotation (Line(points={{202,-322},{202,-313.8}}, color={0,0,0}));
  connect(consumer_31.outlet, pipe62_63R.inlet) annotation (Line(points={{210,-190},{216,-190},{216,-196}}, color={0,0,0}));
  connect(consumer_31.inlet, pipe62_63.outlet) annotation (Line(points={{202,-190},{202,-196}}, color={0,0,0}));
  connect(pipe62_63.inlet, split23.outlet2) annotation (Line(points={{202,-216},{202,-222}}, color={0,0,0}));
  connect(pipe59_62R.inlet, join23.outlet) annotation (Line(points={{180,-260},{212,-260},{212,-304}}, color={0,0,0}));
  connect(pipe59_62.outlet, split23.inlet) annotation (Line(points={{180,-276},{218,-276},{218,-232},{212,-232}}, color={0,0,0}));
  connect(pipe50_58.outlet, split22.inlet) annotation (Line(points={{90,-274},{124,-274},{124,-230},{118,-230}}, color={0,0,0}));
  connect(pipe50_58R.inlet, join21.outlet) annotation (Line(points={{90,-258},{118,-258},{118,-302}}, color={0,0,0}));
  connect(join23.inlet1, pipe62_63R.outlet) annotation (Line(points={{201.8,-294},{200,-294},{200,-282},{230,-282},{230,-222},{216,-222},{216,-216}}, color={0,0,0}));
  connect(split23.outlet1, pipe62_64.inlet) annotation (Line(points={{202,-241.8},{202,-254},{220,-254},{220,-322}}, color={0,0,0}));
  connect(pipe50_51.inlet, split24.outlet2) annotation (Line(points={{-16,-274},{-12,-274}}, color={0,0,0}));
  connect(split24.inlet, pipe27_50.outlet) annotation (Line(points={{-2,-264},{-2,-202},{-2,-202},{-2,-140}}, color={0,0,0}));
  connect(pipe50_51R.outlet, join24.inlet1) annotation (Line(points={{-16,-258},{-16,-258.2},{8,-258.2}}, color={0,0,0}));
  connect(join24.outlet, pipe27_50R.inlet) annotation (Line(points={{18,-248},{18,-140}}, color={0,0,0}));
  connect(join24.inlet2, pipe50_58R.outlet) annotation (Line(points={{27.8,-258},{70,-258}}, color={0,0,0}));
  connect(split24.outlet1, pipe50_58.inlet) annotation (Line(points={{7.8,-274},{70,-274}}, color={0,0,0}));
  connect(pipe9_10R.inlet, join20.outlet) annotation (Line(points={{20,194},{20,182}}, color={0,0,0}));
  connect(split20.inlet, pipe9_10.outlet) annotation (Line(points={{-2,166},{0,166},{0,190}}, color={0,0,0}));
  connect(inlet, pipe9_10.inlet) annotation (Line(points={{-43,333},{-43,230},{0,230},{0,210}}, color={0,0,0}));
  connect(pipe9_10R.outlet, outlet) annotation (Line(points={{20,214},{19,220},{19,333}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(extent={{-300,-380},{460,340}})), Icon(coordinateSystem(extent={{-300,-380},{460,340}}), graphics={
        Rectangle(extent={{-132,110},{-92,70}},   lineColor={0,0,0}),
        Polygon(points={{-132,110},{-112,144},{-92,110},{-132,110}},  lineColor={0,0,0}),
        Rectangle(extent={{108,110},{148,70}},  lineColor={0,0,0}),
        Polygon(points={{108,110},{128,144},{148,110},{108,110}}, lineColor={0,0,0}),
        Rectangle(extent={{60,110},{100,70}}, lineColor={0,0,0}),
        Polygon(points={{60,110},{80,144},{100,110},{60,110}},lineColor={0,0,0}),
        Rectangle(extent={{12,110},{52,70}}, lineColor={0,0,0}),
        Polygon(points={{12,110},{32,144},{52,110},{12,110}},
                                                            lineColor={0,0,0}),
        Rectangle(extent={{-36,110},{4,70}},   lineColor={0,0,0}),
        Polygon(points={{-36,110},{-16,144},{4,110},{-36,110}},  lineColor={0,0,0}),
        Rectangle(extent={{-84,110},{-44,70}},  lineColor={0,0,0}),
        Polygon(points={{-84,110},{-64,144},{-44,110},{-84,110}}, lineColor={0,0,0}),
        Rectangle(extent={{-132,34},{-92,-6}},  lineColor={0,0,0}),
        Polygon(points={{-132,34},{-112,68},{-92,34},{-132,34}},  lineColor={0,0,0}),
        Rectangle(extent={{108,34},{148,-6}}, lineColor={0,0,0}),
        Polygon(points={{108,34},{128,68},{148,34},{108,34}}, lineColor={0,0,0}),
        Rectangle(extent={{60,34},{100,-6}},lineColor={0,0,0}),
        Polygon(points={{60,34},{80,68},{100,34},{60,34}},lineColor={0,0,0}),
        Rectangle(extent={{12,34},{52,-6}},lineColor={0,0,0}),
        Polygon(points={{12,34},{32,68},{52,34},{12,34}},
                                                        lineColor={0,0,0}),
        Rectangle(extent={{-36,34},{4,-6}},  lineColor={0,0,0}),
        Polygon(points={{-36,34},{-16,68},{4,34},{-36,34}},  lineColor={0,0,0}),
        Rectangle(extent={{-84,34},{-44,-6}}, lineColor={0,0,0}),
        Polygon(points={{-84,34},{-64,68},{-44,34},{-84,34}}, lineColor={0,0,0}),
        Rectangle(extent={{-132,-42},{-92,-82}},  lineColor={0,0,0}),
        Polygon(points={{-132,-42},{-112,-8},{-92,-42},{-132,-42}},  lineColor={0,0,0}),
        Rectangle(extent={{108,-42},{148,-82}}, lineColor={0,0,0}),
        Polygon(points={{108,-42},{128,-8},{148,-42},{108,-42}}, lineColor={0,0,0}),
        Rectangle(extent={{60,-42},{100,-82}},lineColor={0,0,0}),
        Polygon(points={{60,-42},{80,-8},{100,-42},{60,-42}},lineColor={0,0,0}),
        Rectangle(extent={{12,-42},{52,-82}},lineColor={0,0,0}),
        Polygon(points={{12,-42},{32,-8},{52,-42},{12,-42}},
                                                           lineColor={0,0,0}),
        Rectangle(extent={{-36,-42},{4,-82}},  lineColor={0,0,0}),
        Polygon(points={{-36,-42},{-16,-8},{4,-42},{-36,-42}},  lineColor={0,0,0}),
        Rectangle(extent={{-84,-42},{-44,-82}}, lineColor={0,0,0}),
        Polygon(points={{-84,-42},{-64,-8},{-44,-42},{-84,-42}}, lineColor={0,0,0}),
        Rectangle(extent={{-132,-118},{-92,-158}}, lineColor={0,0,0}),
        Polygon(points={{-132,-118},{-112,-84},{-92,-118},{-132,-118}},
                                                                      lineColor={0,0,0}),
        Rectangle(extent={{108,-118},{148,-158}},lineColor={0,0,0}),
        Polygon(points={{108,-118},{128,-84},{148,-118},{108,-118}},
                                                                  lineColor={0,0,0}),
        Rectangle(extent={{60,-118},{100,-158}},
                                               lineColor={0,0,0}),
        Polygon(points={{60,-118},{80,-84},{100,-118},{60,-118}},
                                                              lineColor={0,0,0}),
        Rectangle(extent={{12,-118},{52,-158}},
                                              lineColor={0,0,0}),
        Polygon(points={{12,-118},{32,-84},{52,-118},{12,-118}},
                                                            lineColor={0,0,0}),
        Rectangle(extent={{-36,-118},{4,-158}}, lineColor={0,0,0}),
        Polygon(points={{-36,-118},{-16,-84},{4,-118},{-36,-118}},
                                                                 lineColor={0,0,0}),
        Rectangle(extent={{-84,-118},{-44,-158}},lineColor={0,0,0}),
        Polygon(points={{-84,-118},{-64,-84},{-44,-118},{-84,-118}},
                                                                  lineColor={0,0,0}),
        Rectangle(extent={{206,110},{246,70}},  lineColor={0,0,0}),
        Polygon(points={{206,110},{226,144},{246,110},{206,110}}, lineColor={0,0,0}),
        Rectangle(extent={{158,110},{198,70}},lineColor={0,0,0}),
        Polygon(points={{158,110},{178,144},{198,110},{158,110}},
                                                              lineColor={0,0,0}),
        Rectangle(extent={{206,34},{246,-6}}, lineColor={0,0,0}),
        Polygon(points={{206,34},{226,68},{246,34},{206,34}}, lineColor={0,0,0}),
        Rectangle(extent={{158,34},{198,-6}},
                                            lineColor={0,0,0}),
        Polygon(points={{158,34},{178,68},{198,34},{158,34}},
                                                          lineColor={0,0,0}),
        Rectangle(extent={{206,-42},{246,-82}}, lineColor={0,0,0}),
        Polygon(points={{206,-42},{226,-8},{246,-42},{206,-42}}, lineColor={0,0,0}),
        Rectangle(extent={{158,-42},{198,-82}},
                                              lineColor={0,0,0}),
        Polygon(points={{158,-42},{178,-8},{198,-42},{158,-42}},
                                                             lineColor={0,0,0}),
        Rectangle(extent={{206,-118},{246,-158}},lineColor={0,0,0}),
        Polygon(points={{206,-118},{226,-84},{246,-118},{206,-118}},
                                                                  lineColor={0,0,0}),
        Rectangle(extent={{158,-118},{198,-158}},
                                               lineColor={0,0,0}),
        Polygon(points={{158,-118},{178,-84},{198,-118},{158,-118}},
                                                              lineColor={0,0,0})}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a district heating network topology. It represents a topology of block buildings.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>inlet: A fluid inlet for the inflowing heat carrier medium</p>
<p>outlet: A fluid outlet for the outflowing heat carrier medium</p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model was used in this publication:</p>
<p>[1] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) January 2025</p>
</html>"));
end TopologyC_Ports;
