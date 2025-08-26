within TransiEnt.Grid.Heat.HeatGridTopology;
model TopologyB_Ports "A topology for DHN for row houses"

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
  //           Variables
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
        origin={-988,82})));
  TransiEnt.Consumer.Heat.Consumer consumer_1(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-998,266})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe1_2(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-1002,238})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe1_2R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-988,238})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_3R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-1002,114})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_3(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-984,114})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-978,140})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-1002,140})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_4R(
    d=0.05,
    m_flow_nom=1.67,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-938,168},{-918,188}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_4(
    d=0.05,
    m_flow_nom=1.67,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-918,156},{-938,176}})));
  TransiEnt.Consumer.Heat.Consumer consumer_4(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-882,80})));
  TransiEnt.Consumer.Heat.Consumer consumer_3(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-892,264})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe4_6(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-896,236})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe4_6R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-882,236})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe5_7R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-896,112})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe5_7(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-878,112})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-872,138})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-896,138})));
  TransiEnt.Consumer.Heat.Consumer consumer_6(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-788,80})));
  TransiEnt.Consumer.Heat.Consumer consumer_5(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-798,264})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_10(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-802,236})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_10R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-788,236})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe9_11R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-802,110})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe9_11(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-784,110})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-778,138})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-802,138})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe5_8R(
    d=0.065,
    m_flow_nom=3.35,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-842,168},{-822,188}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe5_8(
    d=0.065,
    m_flow_nom=3.35,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-822,154},{-842,174}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe9_12R(
    d=0.08,
    m_flow_nom=5.02,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-740,168},{-720,188}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe9_12(
    d=0.08,
    m_flow_nom=5.02,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-720,154},{-740,174}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-870,206})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-778,208})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-896,204})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-802,210})));
  TransiEnt.Consumer.Heat.Consumer consumer_8(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-676,78})));
  TransiEnt.Consumer.Heat.Consumer consumer_7(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-686,262})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe12_14(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-690,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe12_14R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-676,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe13_15R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-690,108})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe13_15(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-672,108})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-666,136})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join1 annotation (Placement(transformation(
        extent={{-9,-10},{9,10}},
        rotation=0,
        origin={-689,136})));
  TransiEnt.Consumer.Heat.Consumer consumer_10(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-582,78})));
  TransiEnt.Consumer.Heat.Consumer consumer_9(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-592,262})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe16_18(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-596,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe16_18R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-582,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe17_19R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-596,108})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe17_19(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-578,108})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-572,136})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join2 annotation (Placement(transformation(
        extent={{-9,-10},{9,10}},
        rotation=0,
        origin={-595,136})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe13_16R(
    d=0.08,
    m_flow_nom=6.69,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-636,166},{-616,186}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe13_16(
    d=0.08,
    m_flow_nom=6.69,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-616,152},{-636,172}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-664,204})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join9 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-572,206})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-690,202})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split9 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-596,208})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe17_20R(
    d=0.09,
    m_flow_nom=8.37,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-540,168},{-520,188}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe17_20(
    d=0.09,
    m_flow_nom=8.37,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-520,154},{-540,174}})));
  TransiEnt.Consumer.Heat.Consumer consumer_12(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-482,78})));
  TransiEnt.Consumer.Heat.Consumer consumer_11(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-492,262})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe20_22(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-496,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe20_22R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-482,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe21_23R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-496,108})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe21_23(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-478,108})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split10 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-472,136})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join10 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-496,136})));
  TransiEnt.Consumer.Heat.Consumer consumer_14(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-388,78})));
  TransiEnt.Consumer.Heat.Consumer consumer_13(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-398,262})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe24_26(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-402,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe24_26R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-388,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe25_27R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-402,108})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe25_27(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-384,108})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split11 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-378,136})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join11 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-402,136})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe21_24R(
    d=0.1,
    m_flow_nom=10.04,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-442,166},{-422,186}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe21_24(
    d=0.1,
    m_flow_nom=10.04,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-422,152},{-442,172}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe25_28R(
    d=0.1,
    m_flow_nom=11.71,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-340,166},{-320,186}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe25_28(
    d=0.1,
    m_flow_nom=11.71,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-320,152},{-340,172}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-470,204})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join13 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-378,206})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split12 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-496,202})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split13 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-402,208})));
  TransiEnt.Consumer.Heat.Consumer consumer_16(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-276,76})));
  TransiEnt.Consumer.Heat.Consumer consumer_15(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-286,260})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe28_30(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-290,232})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe28_30R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-276,232})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe29_31R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-290,106})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe29_31(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-272,106})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split14 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-266,134})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join14 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-290,134})));
  TransiEnt.Consumer.Heat.Consumer consumer_18(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-182,76})));
  TransiEnt.Consumer.Heat.Consumer consumer_17(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-192,260})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe32_34(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-196,232})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe32_34R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-182,232})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe33_35R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-196,106})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe33_35(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-178,106})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split15 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-172,134})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join15 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-196,134})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe29_32R(
    d=0.11,
    m_flow_nom=13.39,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-236,164},{-216,184}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe29_32(
    d=0.11,
    m_flow_nom=13.39,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-216,150},{-236,170}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe33_36R(
    d=0.12,
    m_flow_nom=15.06,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-134,164},{-114,184}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe33_36(
    d=0.12,
    m_flow_nom=15.06,
    l=42,
    MassFlowState=false,
    N_cv=8) annotation (Placement(transformation(extent={{-114,148},{-134,168}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join16 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-264,202})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join17 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-172,204})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split16 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-290,200})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split17 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-196,206})));
  TransiEnt.Consumer.Heat.Consumer consumer_20(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-90,74})));
  TransiEnt.Consumer.Heat.Consumer consumer_19(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-100,258})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe36_38(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-104,230})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe36_38R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,230})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe37_39R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-104,104})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe37_39(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
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
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe37_40R(
    d=0.12,
    m_flow_nom=16.37,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{-42,162},{-22,182}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe37_40(
    d=0.12,
    m_flow_nom=16.73,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{-22,148},{-42,168}})));
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
        origin={-2,158})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join20 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,172})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe40_42R(
    d=0.12,
    m_flow_nom=15.9,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{80,162},{60,182}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe40_42(
    d=0.12,
    m_flow_nom=15.9,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{58,148},{78,168}})));
  TransiEnt.Consumer.Heat.Consumer consumer_21(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={100,256})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe42_43(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={96,228})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe42_43R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,228})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join22 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,200})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split22 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={96,202})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe42_44R(
    d=0.12,
    m_flow_nom=15.06,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{168,162},{148,182}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe42_44(
    d=0.12,
    m_flow_nom=15.06,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{148,146},{168,166}})));
  TransiEnt.Consumer.Heat.Consumer consumer_23(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={204,70})));
  TransiEnt.Consumer.Heat.Consumer consumer_22(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={194,254})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe44_46(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={190,226})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe44_46R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={204,226})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe45_47R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={190,100})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe45_47(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={208,100})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split23 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={208,128})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join23 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={190,128})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join24 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={214,198})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split24 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={190,200})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe45_48R(
    d=0.12,
    m_flow_nom=13.39,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{262,160},{242,180}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe45_48(
    d=0.12,
    m_flow_nom=13.39,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{242,144},{262,164}})));
  TransiEnt.Consumer.Heat.Consumer consumer_25(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={294,68})));
  TransiEnt.Consumer.Heat.Consumer consumer_24(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={284,252})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe48_50(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={280,224})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe48_50R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={294,224})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe49_51R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={280,98})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe49_51(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={298,98})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split25 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={298,126})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join25 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={280,126})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join26 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={304,196})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split26 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={280,198})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe49_52R(
    d=0.1,
    m_flow_nom=11.71,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{352,158},{332,178}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe49_52(
    d=0.1,
    m_flow_nom=11.71,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{332,142},{352,162}})));
  TransiEnt.Consumer.Heat.Consumer consumer_27(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={388,66})));
  TransiEnt.Consumer.Heat.Consumer consumer_26(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={378,250})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe52_54(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={374,222})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe52_54R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={388,222})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe53_55R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={374,96})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe53_55(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={392,96})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split27 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={392,124})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join27 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={374,124})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join28 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={398,194})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split28 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={374,196})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe53_56R(
    d=0.1,
    m_flow_nom=10.04,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{452,154},{432,174}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe53_56(
    d=0.1,
    m_flow_nom=10.04,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{432,138},{452,158}})));
  TransiEnt.Consumer.Heat.Consumer consumer_29(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={482,64})));
  TransiEnt.Consumer.Heat.Consumer consumer_28(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={472,248})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe56_58(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={468,220})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe56_58R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={482,220})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe57_59R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={468,94})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe57_59(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={486,94})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split29 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={486,122})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join29 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={468,122})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join30 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={492,192})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split30 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={468,194})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe57_60R(
    d=0.09,
    m_flow_nom=8.37,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{540,154},{520,174}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe57_60(
    d=0.09,
    m_flow_nom=8.37,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{520,138},{540,158}})));
  TransiEnt.Consumer.Heat.Consumer consumer_31(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={576,62})));
  TransiEnt.Consumer.Heat.Consumer consumer_30(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={566,246})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe60_62(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={562,218})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe60_62R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={576,218})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe61_63R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={562,92})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe61_63(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={580,92})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split31 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={580,120})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join31 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={562,120})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join32 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={586,190})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split32 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={562,192})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe61_64R(
    d=0.085,
    m_flow_nom=6.69,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{634,152},{614,172}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe61_64(
    d=0.085,
    m_flow_nom=6.69,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{614,136},{634,156}})));
  TransiEnt.Consumer.Heat.Consumer consumer_33(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={666,60})));
  TransiEnt.Consumer.Heat.Consumer consumer_32(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={656,244})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe64_66(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={652,216})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe64_66R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={666,216})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe65_67R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={652,90})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe65_67(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={670,90})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split33 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={670,118})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join33 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={652,118})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join34 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={676,188})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split34 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={652,190})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe65_68R(
    d=0.08,
    m_flow_nom=5.02,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{726,150},{706,170}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe65_68(
    d=0.08,
    m_flow_nom=5.02,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{706,134},{726,154}})));
  TransiEnt.Consumer.Heat.Consumer consumer_35(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={760,58})));
  TransiEnt.Consumer.Heat.Consumer consumer_34(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={750,242})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe68_70(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={746,214})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe68_70R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={760,214})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe69_71R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={746,88})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe69_71(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={764,88})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split35 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={764,116})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join35 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={746,116})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join36 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={770,186})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split36 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={746,188})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe69_72R(
    d=0.065,
    m_flow_nom=3.35,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{826,144},{806,164}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe69_72(
    d=0.065,
    m_flow_nom=3.35,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{806,128},{826,148}})));
  TransiEnt.Consumer.Heat.Consumer consumer_37(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={858,52})));
  TransiEnt.Consumer.Heat.Consumer consumer_36(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={848,236})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe72_74(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={844,208})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe72_74R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={858,208})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe73_75R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={844,82})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe73_75(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={862,82})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split37 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={862,110})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join37 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={844,110})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join38 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={868,180})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split38 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={844,182})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe73_76R(
    d=0.05,
    m_flow_nom=1.67,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{916,142},{896,162}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe73_76(
    d=0.05,
    m_flow_nom=1.67,
    l=42,
    MassFlowState=false) annotation (Placement(transformation(extent={{896,126},{916,146}})));
  TransiEnt.Consumer.Heat.Consumer consumer_39(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={952,50})));
  TransiEnt.Consumer.Heat.Consumer consumer_38(
    multiplicationFactor=6*3.4,
    m_flow_nom=0.84,
    Q_flow_nom(displayUnit="kW") = 105000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={942,234})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe76_77(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={938,206})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe76_77R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={952,206})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe76_78R(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={938,80})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe76_78(
    d=0.04,
    m_flow_nom=0.84,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={956,80})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join39 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={938,108})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split40 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={938,180})));
  TransiEnt.Basics.Interfaces.Thermal.inlet inlet annotation (Placement(transformation(extent={{-38,368},{-18,388}})));
  TransiEnt.Basics.Interfaces.Thermal.outlet outlet annotation (Placement(transformation(extent={{10,368},{30,388}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe40_41R(
    d=0.15,
    m_flow_nom=32.63,
    l=60,
    N_cv=12) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={20,342})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe40_41(
    d=0.15,
    m_flow_nom=32.63,
    l=60,
    MassFlowState=false,
    N_cv=12) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-28,342})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  inlet.m_flow*inStream(inlet.h_outflow) + outlet.m_flow*outlet.h_outflow = Q_flow_A;
  Q_flow_loss=pipe1_2.Q_flow_loss+pipe2_3.Q_flow_loss+pipe2_4.Q_flow_loss+pipe4_6.Q_flow_loss+pipe5_7.Q_flow_loss+pipe5_8.Q_flow_loss+
  pipe8_10.Q_flow_loss+pipe9_11.Q_flow_loss+pipe9_12.Q_flow_loss+pipe12_14.Q_flow_loss+pipe13_15.Q_flow_loss+pipe13_16.Q_flow_loss+
  pipe16_18.Q_flow_loss+pipe17_19.Q_flow_loss+pipe17_20.Q_flow_loss+pipe20_22.Q_flow_loss+pipe21_23.Q_flow_loss+pipe21_24.Q_flow_loss+
  pipe24_26.Q_flow_loss+pipe25_27.Q_flow_loss+pipe25_28.Q_flow_loss+pipe28_30.Q_flow_loss+pipe29_31.Q_flow_loss+pipe29_32.Q_flow_loss+
  pipe32_34.Q_flow_loss+pipe33_35.Q_flow_loss+pipe33_36.Q_flow_loss+pipe36_38.Q_flow_loss+pipe37_39.Q_flow_loss+pipe37_40.Q_flow_loss+
  pipe40_41.Q_flow_loss+pipe40_42.Q_flow_loss+pipe42_43.Q_flow_loss+pipe42_44.Q_flow_loss+pipe44_46.Q_flow_loss+pipe45_47.Q_flow_loss+
  pipe45_48.Q_flow_loss+pipe48_50.Q_flow_loss+pipe49_51.Q_flow_loss+pipe49_52.Q_flow_loss+pipe52_54.Q_flow_loss+pipe53_55.Q_flow_loss+pipe53_56.Q_flow_loss+
  pipe56_58.Q_flow_loss+pipe57_59.Q_flow_loss+pipe57_60.Q_flow_loss+pipe60_62.Q_flow_loss+pipe61_63.Q_flow_loss+pipe61_64.Q_flow_loss+
  pipe64_66.Q_flow_loss+pipe65_67.Q_flow_loss+pipe65_68.Q_flow_loss+pipe68_70.Q_flow_loss+pipe69_71.Q_flow_loss+pipe69_72.Q_flow_loss+
  pipe72_74.Q_flow_loss+pipe73_75.Q_flow_loss+pipe73_76.Q_flow_loss+pipe76_77.Q_flow_loss+pipe76_78.Q_flow_loss+pipe1_2R.Q_flow_loss+
  pipe2_3R.Q_flow_loss+pipe2_4R.Q_flow_loss+pipe4_6R.Q_flow_loss+pipe5_7R.Q_flow_loss+pipe5_8R.Q_flow_loss+
  pipe8_10R.Q_flow_loss+pipe9_11R.Q_flow_loss+pipe9_12R.Q_flow_loss+pipe12_14R.Q_flow_loss+pipe13_15R.Q_flow_loss+pipe13_16R.Q_flow_loss+
  pipe16_18R.Q_flow_loss+pipe17_19R.Q_flow_loss+pipe17_20R.Q_flow_loss+pipe20_22R.Q_flow_loss+pipe21_23R.Q_flow_loss+pipe21_24R.Q_flow_loss+
  pipe24_26R.Q_flow_loss+pipe25_27R.Q_flow_loss+pipe25_28R.Q_flow_loss+pipe28_30R.Q_flow_loss+pipe29_31R.Q_flow_loss+pipe29_32R.Q_flow_loss+
  pipe32_34R.Q_flow_loss+pipe33_35R.Q_flow_loss+pipe33_36R.Q_flow_loss+pipe36_38R.Q_flow_loss+pipe37_39R.Q_flow_loss+pipe37_40R.Q_flow_loss+
  pipe40_41R.Q_flow_loss+pipe40_42R.Q_flow_loss+pipe42_43R.Q_flow_loss+pipe42_44R.Q_flow_loss+pipe44_46R.Q_flow_loss+pipe45_47R.Q_flow_loss+
  pipe45_48R.Q_flow_loss+pipe48_50R.Q_flow_loss+pipe49_51R.Q_flow_loss+pipe49_52R.Q_flow_loss+pipe52_54R.Q_flow_loss+pipe53_55R.Q_flow_loss+pipe53_56R.Q_flow_loss+
  pipe56_58R.Q_flow_loss+pipe57_59R.Q_flow_loss+pipe57_60R.Q_flow_loss+pipe60_62R.Q_flow_loss+pipe61_63R.Q_flow_loss+pipe61_64R.Q_flow_loss+
  pipe64_66R.Q_flow_loss+pipe65_67R.Q_flow_loss+pipe65_68R.Q_flow_loss+pipe68_70R.Q_flow_loss+pipe69_71R.Q_flow_loss+pipe69_72R.Q_flow_loss+
  pipe72_74R.Q_flow_loss+pipe73_75R.Q_flow_loss+pipe73_76R.Q_flow_loss+pipe76_77R.Q_flow_loss+pipe76_78R.Q_flow_loss;

  //pressure drop due to friction
  delta_p_fric=pipe1_2.delta_p_fric+pipe2_3.delta_p_fric+pipe2_4.delta_p_fric+pipe4_6.delta_p_fric+pipe5_7.delta_p_fric+pipe5_8.delta_p_fric+
  pipe8_10.delta_p_fric+pipe9_11.delta_p_fric+pipe9_12.delta_p_fric+pipe12_14.delta_p_fric+pipe13_15.delta_p_fric+pipe13_16.delta_p_fric+
  pipe16_18.delta_p_fric+pipe17_19.delta_p_fric+pipe17_20.delta_p_fric+pipe20_22.delta_p_fric+pipe21_23.delta_p_fric+pipe21_24.delta_p_fric+
  pipe24_26.delta_p_fric+pipe25_27.delta_p_fric+pipe25_28.delta_p_fric+pipe28_30.delta_p_fric+pipe29_31.delta_p_fric+pipe29_32.delta_p_fric+
  pipe32_34.delta_p_fric+pipe33_35.delta_p_fric+pipe33_36.delta_p_fric+pipe36_38.delta_p_fric+pipe37_39.delta_p_fric+pipe37_40.delta_p_fric+
  pipe40_41.delta_p_fric+pipe40_42.delta_p_fric+pipe42_43.delta_p_fric+pipe42_44.delta_p_fric+pipe44_46.delta_p_fric+pipe45_47.delta_p_fric+
  pipe45_48.delta_p_fric+pipe48_50.delta_p_fric+pipe49_51.delta_p_fric+pipe49_52.delta_p_fric+pipe52_54.delta_p_fric+pipe53_55.delta_p_fric+pipe53_56.delta_p_fric+
  pipe56_58.delta_p_fric+pipe57_59.delta_p_fric+pipe57_60.delta_p_fric+pipe60_62.delta_p_fric+pipe61_63.delta_p_fric+pipe61_64.delta_p_fric+
  pipe64_66.delta_p_fric+pipe65_67.delta_p_fric+pipe65_68.delta_p_fric+pipe68_70.delta_p_fric+pipe69_71.delta_p_fric+pipe69_72.delta_p_fric+
  pipe72_74.delta_p_fric+pipe73_75.delta_p_fric+pipe73_76.delta_p_fric+pipe76_77.delta_p_fric+pipe76_78.delta_p_fric+pipe1_2R.delta_p_fric+
  pipe2_3R.delta_p_fric+pipe2_4R.delta_p_fric+pipe4_6R.delta_p_fric+pipe5_7R.delta_p_fric+pipe5_8R.delta_p_fric+
  pipe8_10R.delta_p_fric+pipe9_11R.delta_p_fric+pipe9_12R.delta_p_fric+pipe12_14R.delta_p_fric+pipe13_15R.delta_p_fric+pipe13_16R.delta_p_fric+
  pipe16_18R.delta_p_fric+pipe17_19R.delta_p_fric+pipe17_20R.delta_p_fric+pipe20_22R.delta_p_fric+pipe21_23R.delta_p_fric+pipe21_24R.delta_p_fric+
  pipe24_26R.delta_p_fric+pipe25_27R.delta_p_fric+pipe25_28R.delta_p_fric+pipe28_30R.delta_p_fric+pipe29_31R.delta_p_fric+pipe29_32R.delta_p_fric+
  pipe32_34R.delta_p_fric+pipe33_35R.delta_p_fric+pipe33_36R.delta_p_fric+pipe36_38R.delta_p_fric+pipe37_39R.delta_p_fric+pipe37_40R.delta_p_fric+
  pipe40_41R.delta_p_fric+pipe40_42R.delta_p_fric+pipe42_43R.delta_p_fric+pipe42_44R.delta_p_fric+pipe44_46R.delta_p_fric+pipe45_47R.delta_p_fric+
  pipe45_48R.delta_p_fric+pipe48_50R.delta_p_fric+pipe49_51R.delta_p_fric+pipe49_52R.delta_p_fric+pipe52_54R.delta_p_fric+pipe53_55R.delta_p_fric+pipe53_56R.delta_p_fric+
  pipe56_58R.delta_p_fric+pipe57_59R.delta_p_fric+pipe57_60R.delta_p_fric+pipe60_62R.delta_p_fric+pipe61_63R.delta_p_fric+pipe61_64R.delta_p_fric+
  pipe64_66R.delta_p_fric+pipe65_67R.delta_p_fric+pipe65_68R.delta_p_fric+pipe68_70R.delta_p_fric+pipe69_71R.delta_p_fric+pipe69_72R.delta_p_fric+
  pipe72_74R.delta_p_fric+pipe73_75R.delta_p_fric+pipe73_76R.delta_p_fric+pipe76_77R.delta_p_fric+pipe76_78R.delta_p_fric;

  connect(consumer_2.inlet, pipe2_3.outlet) annotation (Line(points={{-984,94},{-984,104}}, color={0,0,0}));
  connect(pipe2_3R.inlet, consumer_2.outlet) annotation (Line(points={{-1002,104},{-1002,94},{-992,94}}, color={0,0,0}));
  connect(pipe2_3R.outlet, join5.inlet2) annotation (Line(points={{-1002,124},{-1002,130.2}}, color={0,0,0}));
  connect(pipe2_3.inlet, split5.outlet1) annotation (Line(points={{-984,124},{-984,128},{-978,128},{-978,130.2}}, color={0,0,0}));
  connect(join5.outlet, pipe2_4R.inlet) annotation (Line(points={{-992,140},{-984,140},{-984,184},{-952,184},{-952,178},{-938,178}}, color={0,0,0}));
  connect(split5.inlet, pipe2_4.outlet) annotation (Line(points={{-968,140},{-962,140},{-962,166},{-938,166}}, color={0,0,0}));
  connect(consumer_4.inlet, pipe5_7.outlet) annotation (Line(points={{-878,92},{-878,102}}, color={0,0,0}));
  connect(pipe5_7R.inlet, consumer_4.outlet) annotation (Line(points={{-896,102},{-896,92},{-886,92}}, color={0,0,0}));
  connect(pipe5_7R.outlet, join3.inlet2) annotation (Line(points={{-896,122},{-896,128.2}}, color={0,0,0}));
  connect(pipe5_7.inlet, split3.outlet1) annotation (Line(points={{-878,122},{-878,126},{-872,126},{-872,128.2}}, color={0,0,0}));
  connect(consumer_6.inlet, pipe9_11.outlet) annotation (Line(points={{-784,92},{-784,100}}, color={0,0,0}));
  connect(pipe9_11R.inlet, consumer_6.outlet) annotation (Line(points={{-802,100},{-802,92},{-792,92}}, color={0,0,0}));
  connect(pipe9_11R.outlet, join6.inlet2) annotation (Line(points={{-802,120},{-802,128.2}}, color={0,0,0}));
  connect(pipe9_11.inlet, split6.outlet1) annotation (Line(points={{-784,120},{-784,126},{-778,126},{-778,128.2}}, color={0,0,0}));
  connect(join6.outlet, pipe9_12R.inlet) annotation (Line(points={{-792,138},{-784,138},{-784,178},{-740,178}}, color={0,0,0}));
  connect(split6.inlet, pipe9_12.outlet) annotation (Line(points={{-768,138},{-762,138},{-762,164},{-740,164}}, color={0,0,0}));
  connect(consumer_1.outlet, pipe1_2R.inlet) annotation (Line(points={{-994,254},{-988,254},{-988,248}}, color={0,0,0}));
  connect(join5.inlet1, pipe1_2R.outlet) annotation (Line(points={{-1002.2,150},{-1002,150},{-1002,190},{-988,190},{-988,228}}, color={0,0,0}));
  connect(consumer_3.outlet, pipe4_6R.inlet) annotation (Line(points={{-888,252},{-882,252},{-882,246}}, color={0,0,0}));
  connect(pipe4_6R.outlet, join7.inlet1) annotation (Line(points={{-882,226},{-882,216},{-870.2,216}}, color={0,0,0}));
  connect(pipe2_4R.outlet, join7.inlet2) annotation (Line(points={{-918,178},{-870,178},{-870,196.2}}, color={0,0,0}));
  connect(join7.outlet, join3.inlet1) annotation (Line(points={{-860,206},{-854,206},{-854,164},{-896.2,164},{-896.2,148}}, color={0,0,0}));
  connect(join3.outlet, pipe5_8R.inlet) annotation (Line(points={{-886,138},{-882,138},{-882,178},{-842,178}}, color={0,0,0}));
  connect(consumer_5.outlet, pipe8_10R.inlet) annotation (Line(points={{-794,252},{-788,252},{-788,246}}, color={0,0,0}));
  connect(pipe8_10R.outlet, join8.inlet1) annotation (Line(points={{-788,226},{-778.2,226},{-778.2,218}}, color={0,0,0}));
  connect(pipe5_8R.outlet, join8.inlet2) annotation (Line(points={{-822,178},{-778,178},{-778,198.2}}, color={0,0,0}));
  connect(split3.inlet, pipe5_8.outlet) annotation (Line(points={{-862,138},{-848,138},{-848,164},{-842,164}}, color={0,0,0}));
  connect(pipe1_2.outlet, consumer_1.inlet) annotation (Line(points={{-1002,248},{-1002,254}}, color={0,0,0}));
  connect(pipe1_2.inlet, split5.outlet2) annotation (Line(points={{-1002,228},{-1002,198},{-978,198},{-978,150}}, color={0,0,0}));
  connect(pipe4_6.outlet, consumer_3.inlet) annotation (Line(points={{-896,246},{-896,252}}, color={0,0,0}));
  connect(pipe4_6.inlet, split1.outlet2) annotation (Line(points={{-896,226},{-896,214}}, color={0,0,0}));
  connect(pipe2_4.inlet, split1.outlet1) annotation (Line(points={{-918,166},{-896,166},{-896,194.2}}, color={0,0,0}));
  connect(split1.inlet, split3.outlet2) annotation (Line(points={{-886,204},{-876,204},{-876,156},{-872,156},{-872,148}}, color={0,0,0}));
  connect(consumer_5.inlet, pipe8_10.outlet) annotation (Line(points={{-802,252},{-802,246}}, color={0,0,0}));
  connect(pipe8_10.inlet, split2.outlet2) annotation (Line(points={{-802,226},{-802,220}}, color={0,0,0}));
  connect(pipe5_8.inlet, split2.outlet1) annotation (Line(points={{-822,164},{-802,164},{-802,200.2}}, color={0,0,0}));
  connect(split2.inlet, split6.outlet2) annotation (Line(points={{-792,210},{-790,210},{-790,158},{-778,158},{-778,148}}, color={0,0,0}));
  connect(join6.inlet1, join8.outlet) annotation (Line(points={{-802.2,148},{-802,148},{-802,166},{-762,166},{-762,208},{-768,208}}, color={0,0,0}));
  connect(consumer_8.inlet, pipe13_15.outlet) annotation (Line(points={{-672,90},{-672,98}}, color={0,0,0}));
  connect(pipe13_15R.inlet, consumer_8.outlet) annotation (Line(points={{-690,98},{-690,90},{-680,90}}, color={0,0,0}));
  connect(pipe13_15R.outlet, join1.inlet2) annotation (Line(points={{-690,118},{-690,126.2},{-689,126.2}}, color={0,0,0}));
  connect(pipe13_15.inlet, split4.outlet1) annotation (Line(points={{-672,118},{-672,124},{-666,124},{-666,126.2}}, color={0,0,0}));
  connect(consumer_10.inlet, pipe17_19.outlet) annotation (Line(points={{-578,90},{-578,98}}, color={0,0,0}));
  connect(pipe17_19R.inlet, consumer_10.outlet) annotation (Line(points={{-596,98},{-596,90},{-586,90}}, color={0,0,0}));
  connect(pipe17_19R.outlet, join2.inlet2) annotation (Line(points={{-596,118},{-596,126.2},{-595,126.2}}, color={0,0,0}));
  connect(pipe17_19.inlet, split7.outlet1) annotation (Line(points={{-578,118},{-578,124},{-572,124},{-572,126.2}}, color={0,0,0}));
  connect(consumer_7.outlet, pipe12_14R.inlet) annotation (Line(points={{-682,250},{-676,250},{-676,244}}, color={0,0,0}));
  connect(pipe12_14R.outlet, join4.inlet1) annotation (Line(points={{-676,224},{-676,214},{-664.2,214}}, color={0,0,0}));
  connect(join4.outlet, join1.inlet1) annotation (Line(points={{-654,204},{-648,204},{-648,162},{-689.18,162},{-689.18,146}},
                                                                                                                            color={0,0,0}));
  connect(join1.outlet, pipe13_16R.inlet) annotation (Line(points={{-680,136},{-676,136},{-676,176},{-636,176}}, color={0,0,0}));
  connect(consumer_9.outlet, pipe16_18R.inlet) annotation (Line(points={{-588,250},{-582,250},{-582,244}}, color={0,0,0}));
  connect(pipe16_18R.outlet, join9.inlet1) annotation (Line(points={{-582,224},{-572.2,224},{-572.2,216}}, color={0,0,0}));
  connect(pipe13_16R.outlet, join9.inlet2) annotation (Line(points={{-616,176},{-572,176},{-572,196.2}}, color={0,0,0}));
  connect(split4.inlet, pipe13_16.outlet) annotation (Line(points={{-656,136},{-642,136},{-642,162},{-636,162}}, color={0,0,0}));
  connect(pipe12_14.outlet, consumer_7.inlet) annotation (Line(points={{-690,244},{-690,250}}, color={0,0,0}));
  connect(pipe12_14.inlet, split8.outlet2) annotation (Line(points={{-690,224},{-690,212}}, color={0,0,0}));
  connect(split8.inlet, split4.outlet2) annotation (Line(points={{-680,202},{-670,202},{-670,154},{-666,154},{-666,146}}, color={0,0,0}));
  connect(consumer_9.inlet, pipe16_18.outlet) annotation (Line(points={{-596,250},{-596,244}}, color={0,0,0}));
  connect(pipe16_18.inlet, split9.outlet2) annotation (Line(points={{-596,224},{-596,218}}, color={0,0,0}));
  connect(pipe13_16.inlet, split9.outlet1) annotation (Line(points={{-616,162},{-596,162},{-596,198.2}}, color={0,0,0}));
  connect(split9.inlet, split7.outlet2) annotation (Line(points={{-586,208},{-584,208},{-584,156},{-572,156},{-572,146}}, color={0,0,0}));
  connect(join2.inlet1, join9.outlet) annotation (Line(points={{-595.18,146},{-596,146},{-596,164},{-556,164},{-556,206},{-562,206}},color={0,0,0}));
  connect(pipe9_12R.outlet, join4.inlet2) annotation (Line(points={{-720,178},{-664,178},{-664,194.2}}, color={0,0,0}));
  connect(split8.outlet1, pipe9_12.inlet) annotation (Line(points={{-690,192.2},{-690,164},{-720,164}}, color={0,0,0}));
  connect(consumer_12.inlet, pipe21_23.outlet) annotation (Line(points={{-478,90},{-478,98}}, color={0,0,0}));
  connect(pipe21_23R.inlet, consumer_12.outlet) annotation (Line(points={{-496,98},{-496,90},{-486,90}}, color={0,0,0}));
  connect(pipe21_23R.outlet, join10.inlet2) annotation (Line(points={{-496,118},{-496,126.2}}, color={0,0,0}));
  connect(pipe21_23.inlet, split10.outlet1) annotation (Line(points={{-478,118},{-478,124},{-472,124},{-472,126.2}}, color={0,0,0}));
  connect(consumer_14.inlet, pipe25_27.outlet) annotation (Line(points={{-384,90},{-384,98}}, color={0,0,0}));
  connect(pipe25_27R.inlet, consumer_14.outlet) annotation (Line(points={{-402,98},{-402,90},{-392,90}}, color={0,0,0}));
  connect(pipe25_27R.outlet, join11.inlet2) annotation (Line(points={{-402,118},{-402,126.2}}, color={0,0,0}));
  connect(pipe25_27.inlet, split11.outlet1) annotation (Line(points={{-384,118},{-384,124},{-378,124},{-378,126.2}}, color={0,0,0}));
  connect(join11.outlet, pipe25_28R.inlet) annotation (Line(points={{-392,136},{-384,136},{-384,176},{-340,176}}, color={0,0,0}));
  connect(split11.inlet, pipe25_28.outlet) annotation (Line(points={{-368,136},{-362,136},{-362,162},{-340,162}}, color={0,0,0}));
  connect(consumer_11.outlet, pipe20_22R.inlet) annotation (Line(points={{-488,250},{-482,250},{-482,244}}, color={0,0,0}));
  connect(pipe20_22R.outlet, join12.inlet1) annotation (Line(points={{-482,224},{-482,214},{-470.2,214}}, color={0,0,0}));
  connect(pipe17_20R.outlet, join12.inlet2) annotation (Line(points={{-520,178},{-470,178},{-470,194.2}}, color={0,0,0}));
  connect(join12.outlet, join10.inlet1) annotation (Line(points={{-460,204},{-454,204},{-454,162},{-496.2,162},{-496.2,146}}, color={0,0,0}));
  connect(join10.outlet, pipe21_24R.inlet) annotation (Line(points={{-486,136},{-482,136},{-482,176},{-442,176}}, color={0,0,0}));
  connect(consumer_13.outlet, pipe24_26R.inlet) annotation (Line(points={{-394,250},{-388,250},{-388,244}}, color={0,0,0}));
  connect(pipe24_26R.outlet, join13.inlet1) annotation (Line(points={{-388,224},{-378.2,224},{-378.2,216}}, color={0,0,0}));
  connect(pipe21_24R.outlet, join13.inlet2) annotation (Line(points={{-422,176},{-378,176},{-378,196.2}}, color={0,0,0}));
  connect(split10.inlet, pipe21_24.outlet) annotation (Line(points={{-462,136},{-448,136},{-448,162},{-442,162}}, color={0,0,0}));
  connect(pipe20_22.outlet, consumer_11.inlet) annotation (Line(points={{-496,244},{-496,250}}, color={0,0,0}));
  connect(pipe20_22.inlet, split12.outlet2) annotation (Line(points={{-496,224},{-496,212}}, color={0,0,0}));
  connect(pipe17_20.inlet, split12.outlet1) annotation (Line(points={{-520,164},{-496,164},{-496,192.2}}, color={0,0,0}));
  connect(split12.inlet, split10.outlet2) annotation (Line(points={{-486,202},{-476,202},{-476,154},{-472,154},{-472,146}}, color={0,0,0}));
  connect(consumer_13.inlet, pipe24_26.outlet) annotation (Line(points={{-402,250},{-402,244}}, color={0,0,0}));
  connect(pipe24_26.inlet, split13.outlet2) annotation (Line(points={{-402,224},{-402,218}}, color={0,0,0}));
  connect(pipe21_24.inlet, split13.outlet1) annotation (Line(points={{-422,162},{-402,162},{-402,198.2}}, color={0,0,0}));
  connect(split13.inlet, split11.outlet2) annotation (Line(points={{-392,208},{-390,208},{-390,156},{-378,156},{-378,146}}, color={0,0,0}));
  connect(join11.inlet1, join13.outlet) annotation (Line(points={{-402.2,146},{-402,146},{-402,164},{-362,164},{-362,206},{-368,206}}, color={0,0,0}));
  connect(consumer_16.inlet, pipe29_31.outlet) annotation (Line(points={{-272,88},{-272,96}}, color={0,0,0}));
  connect(pipe29_31R.inlet, consumer_16.outlet) annotation (Line(points={{-290,96},{-290,88},{-280,88}}, color={0,0,0}));
  connect(pipe29_31R.outlet, join14.inlet2) annotation (Line(points={{-290,116},{-290,124.2}}, color={0,0,0}));
  connect(pipe29_31.inlet, split14.outlet1) annotation (Line(points={{-272,116},{-272,122},{-266,122},{-266,124.2}}, color={0,0,0}));
  connect(consumer_18.inlet, pipe33_35.outlet) annotation (Line(points={{-178,88},{-178,96}}, color={0,0,0}));
  connect(pipe33_35R.inlet, consumer_18.outlet) annotation (Line(points={{-196,96},{-196,88},{-186,88}}, color={0,0,0}));
  connect(pipe33_35R.outlet, join15.inlet2) annotation (Line(points={{-196,116},{-196,124.2}}, color={0,0,0}));
  connect(pipe33_35.inlet, split15.outlet1) annotation (Line(points={{-178,116},{-178,122},{-172,122},{-172,124.2}}, color={0,0,0}));
  connect(join15.outlet, pipe33_36R.inlet) annotation (Line(points={{-186,134},{-178,134},{-178,176},{-146,176},{-146,174},{-134,174}}, color={0,0,0}));
  connect(split15.inlet, pipe33_36.outlet) annotation (Line(points={{-162,134},{-156,134},{-156,158},{-134,158}}, color={0,0,0}));
  connect(consumer_15.outlet, pipe28_30R.inlet) annotation (Line(points={{-282,248},{-276,248},{-276,242}}, color={0,0,0}));
  connect(pipe28_30R.outlet, join16.inlet1) annotation (Line(points={{-276,222},{-276,212},{-264.2,212}}, color={0,0,0}));
  connect(join16.outlet, join14.inlet1) annotation (Line(points={{-254,202},{-248,202},{-248,160},{-290.2,160},{-290.2,144}}, color={0,0,0}));
  connect(join14.outlet, pipe29_32R.inlet) annotation (Line(points={{-280,134},{-276,134},{-276,174},{-236,174}}, color={0,0,0}));
  connect(consumer_17.outlet, pipe32_34R.inlet) annotation (Line(points={{-188,248},{-182,248},{-182,242}}, color={0,0,0}));
  connect(pipe32_34R.outlet, join17.inlet1) annotation (Line(points={{-182,222},{-172.2,222},{-172.2,214}}, color={0,0,0}));
  connect(pipe29_32R.outlet, join17.inlet2) annotation (Line(points={{-216,174},{-172,174},{-172,194.2}}, color={0,0,0}));
  connect(split14.inlet, pipe29_32.outlet) annotation (Line(points={{-256,134},{-242,134},{-242,160},{-236,160}}, color={0,0,0}));
  connect(pipe28_30.outlet, consumer_15.inlet) annotation (Line(points={{-290,242},{-290,248}}, color={0,0,0}));
  connect(pipe28_30.inlet, split16.outlet2) annotation (Line(points={{-290,222},{-290,210}}, color={0,0,0}));
  connect(split16.inlet, split14.outlet2) annotation (Line(points={{-280,200},{-270,200},{-270,152},{-266,152},{-266,144}}, color={0,0,0}));
  connect(consumer_17.inlet, pipe32_34.outlet) annotation (Line(points={{-196,248},{-196,242}}, color={0,0,0}));
  connect(pipe32_34.inlet, split17.outlet2) annotation (Line(points={{-196,222},{-196,216}}, color={0,0,0}));
  connect(pipe29_32.inlet, split17.outlet1) annotation (Line(points={{-216,160},{-196,160},{-196,196.2}}, color={0,0,0}));
  connect(split17.inlet, split15.outlet2) annotation (Line(points={{-186,206},{-184,206},{-184,154},{-172,154},{-172,144}}, color={0,0,0}));
  connect(join15.inlet1, join17.outlet) annotation (Line(points={{-196.2,144},{-196,144},{-196,162},{-156,162},{-156,204},{-162,204}}, color={0,0,0}));
  connect(pipe25_28R.outlet, join16.inlet2) annotation (Line(points={{-320,176},{-264,176},{-264,192.2}}, color={0,0,0}));
  connect(split16.outlet1, pipe25_28.inlet) annotation (Line(points={{-290,190.2},{-290,162},{-320,162}}, color={0,0,0}));
  connect(split7.inlet, pipe17_20.outlet) annotation (Line(points={{-562,136},{-548,136},{-548,164},{-540,164}}, color={0,0,0}));
  connect(join2.outlet, pipe17_20R.inlet) annotation (Line(points={{-586,136},{-582,136},{-582,178},{-540,178}}, color={0,0,0}));
  connect(consumer_20.inlet, pipe37_39.outlet) annotation (Line(points={{-86,86},{-86,94}}, color={0,0,0}));
  connect(pipe37_39R.inlet, consumer_20.outlet) annotation (Line(points={{-104,94},{-104,86},{-94,86}}, color={0,0,0}));
  connect(pipe37_39R.outlet, join18.inlet2) annotation (Line(points={{-104,114},{-104,122.2}}, color={0,0,0}));
  connect(pipe37_39.inlet, split18.outlet1) annotation (Line(points={{-86,114},{-86,120},{-80,120},{-80,122.2}}, color={0,0,0}));
  connect(join18.outlet, pipe37_40R.inlet) annotation (Line(points={{-94,132},{-86,132},{-86,176},{-54,176},{-54,172},{-42,172}}, color={0,0,0}));
  connect(split18.inlet, pipe37_40.outlet) annotation (Line(points={{-70,132},{-64,132},{-64,158},{-42,158}}, color={0,0,0}));
  connect(consumer_19.outlet, pipe36_38R.inlet) annotation (Line(points={{-96,246},{-90,246},{-90,240}}, color={0,0,0}));
  connect(pipe36_38R.outlet, join19.inlet1) annotation (Line(points={{-90,220},{-80.2,220},{-80.2,212}}, color={0,0,0}));
  connect(consumer_19.inlet, pipe36_38.outlet) annotation (Line(points={{-104,246},{-104,240}}, color={0,0,0}));
  connect(pipe36_38.inlet, split19.outlet2) annotation (Line(points={{-104,220},{-104,214}}, color={0,0,0}));
  connect(split19.inlet, split18.outlet2) annotation (Line(points={{-94,204},{-92,204},{-92,152},{-80,152},{-80,142}}, color={0,0,0}));
  connect(join18.inlet1, join19.outlet) annotation (Line(points={{-104.2,142},{-104,142},{-104,160},{-64,160},{-64,202},{-70,202}}, color={0,0,0}));
  connect(split20.outlet2, pipe37_40.inlet) annotation (Line(points={{-12,158},{-22,158}}, color={0,0,0}));
  connect(pipe37_40R.outlet, join20.inlet1) annotation (Line(points={{-22,172},{-22,171.8},{10,171.8}}, color={0,0,0}));
  connect(pipe33_36R.outlet, join19.inlet2) annotation (Line(points={{-114,174},{-80,174},{-80,192.2}}, color={0,0,0}));
  connect(pipe33_36.inlet, split19.outlet1) annotation (Line(points={{-114,158},{-108,158},{-108,176},{-104,176},{-104,194.2}}, color={0,0,0}));
  connect(consumer_21.outlet, pipe42_43R.inlet) annotation (Line(points={{104,244},{110,244},{110,238}}, color={0,0,0}));
  connect(pipe42_43R.outlet, join22.inlet1) annotation (Line(points={{110,218},{110,214},{119.8,214},{119.8,210}}, color={0,0,0}));
  connect(consumer_21.inlet,pipe42_43. outlet) annotation (Line(points={{96,244},{96,238}}, color={0,0,0}));
  connect(pipe42_43.inlet, split22.outlet2) annotation (Line(points={{96,218},{96,212}}, color={0,0,0}));
  connect(join20.inlet2, pipe40_42R.outlet) annotation (Line(points={{29.8,172},{60,172}}, color={0,0,0}));
  connect(pipe40_42.outlet, split22.inlet) annotation (Line(points={{78,158},{110,158},{110,202},{106,202}}, color={0,0,0}));
  connect(pipe42_44R.outlet, join22.inlet2) annotation (Line(points={{148,172},{120,172},{120,190.2}}, color={0,0,0}));
  connect(pipe40_42.inlet, split20.outlet1) annotation (Line(points={{58,158},{7.8,158}},           color={0,0,0}));
  connect(consumer_23.inlet, pipe45_47.outlet) annotation (Line(points={{208,82},{208,90}}, color={0,0,0}));
  connect(pipe45_47R.inlet, consumer_23.outlet) annotation (Line(points={{190,90},{190,82},{200,82}}, color={0,0,0}));
  connect(pipe45_47R.outlet, join23.inlet2) annotation (Line(points={{190,110},{190,118.2}}, color={0,0,0}));
  connect(pipe45_47.inlet, split23.outlet1) annotation (Line(points={{208,110},{208,118.2}}, color={0,0,0}));
  connect(consumer_22.outlet, pipe44_46R.inlet) annotation (Line(points={{198,242},{204,242},{204,236}}, color={0,0,0}));
  connect(pipe44_46R.outlet, join24.inlet1) annotation (Line(points={{204,216},{204,212},{213.8,212},{213.8,208}}, color={0,0,0}));
  connect(consumer_22.inlet, pipe44_46.outlet) annotation (Line(points={{190,242},{190,236}}, color={0,0,0}));
  connect(pipe44_46.inlet, split24.outlet2) annotation (Line(points={{190,216},{190,210}}, color={0,0,0}));
  connect(split24.outlet1, split23.inlet) annotation (Line(points={{190,190.2},{190,162},{226,162},{226,128},{218,128}}, color={0,0,0}));
  connect(split23.outlet2, pipe45_48.inlet) annotation (Line(points={{208,138},{208,154},{242,154}}, color={0,0,0}));
  connect(pipe45_48R.outlet, join24.inlet2) annotation (Line(points={{242,170},{214,170},{214,188.2}}, color={0,0,0}));
  connect(join24.outlet, join23.inlet1) annotation (Line(points={{224,198},{232,198},{232,144},{189.8,144},{189.8,138}}, color={0,0,0}));
  connect(pipe42_44R.inlet, join23.outlet) annotation (Line(points={{168,172},{200,172},{200,128}}, color={0,0,0}));
  connect(pipe42_44.outlet, split24.inlet) annotation (Line(points={{168,156},{206,156},{206,200},{200,200}}, color={0,0,0}));
  connect(consumer_25.inlet, pipe49_51.outlet) annotation (Line(points={{298,80},{298,88}}, color={0,0,0}));
  connect(pipe49_51R.inlet, consumer_25.outlet) annotation (Line(points={{280,88},{280,80},{290,80}}, color={0,0,0}));
  connect(pipe49_51R.outlet, join25.inlet2) annotation (Line(points={{280,108},{280,116.2}}, color={0,0,0}));
  connect(pipe49_51.inlet, split25.outlet1) annotation (Line(points={{298,108},{298,116.2}}, color={0,0,0}));
  connect(consumer_24.outlet, pipe48_50R.inlet) annotation (Line(points={{288,240},{294,240},{294,234}}, color={0,0,0}));
  connect(pipe48_50R.outlet, join26.inlet1) annotation (Line(points={{294,214},{294,210},{303.8,210},{303.8,206}}, color={0,0,0}));
  connect(consumer_24.inlet, pipe48_50.outlet) annotation (Line(points={{280,240},{280,234}}, color={0,0,0}));
  connect(pipe48_50.inlet, split26.outlet2) annotation (Line(points={{280,214},{280,208}}, color={0,0,0}));
  connect(split26.outlet1, split25.inlet) annotation (Line(points={{280,188.2},{280,160},{316,160},{316,126},{308,126}}, color={0,0,0}));
  connect(split25.outlet2, pipe49_52.inlet) annotation (Line(points={{298,136},{298,152},{332,152}}, color={0,0,0}));
  connect(pipe49_52R.outlet, join26.inlet2) annotation (Line(points={{332,168},{304,168},{304,186.2}}, color={0,0,0}));
  connect(join26.outlet, join25.inlet1) annotation (Line(points={{314,196},{322,196},{322,142},{279.8,142},{279.8,136}}, color={0,0,0}));
  connect(consumer_27.inlet, pipe53_55.outlet) annotation (Line(points={{392,78},{392,86}}, color={0,0,0}));
  connect(pipe53_55R.inlet, consumer_27.outlet) annotation (Line(points={{374,86},{374,78},{384,78}}, color={0,0,0}));
  connect(pipe53_55R.outlet, join27.inlet2) annotation (Line(points={{374,106},{374,114.2}}, color={0,0,0}));
  connect(pipe53_55.inlet, split27.outlet1) annotation (Line(points={{392,106},{392,114.2}}, color={0,0,0}));
  connect(consumer_26.outlet, pipe52_54R.inlet) annotation (Line(points={{382,238},{388,238},{388,232}}, color={0,0,0}));
  connect(pipe52_54R.outlet, join28.inlet1) annotation (Line(points={{388,212},{388,208},{397.8,208},{397.8,204}}, color={0,0,0}));
  connect(consumer_26.inlet, pipe52_54.outlet) annotation (Line(points={{374,238},{374,232}}, color={0,0,0}));
  connect(pipe52_54.inlet, split28.outlet2) annotation (Line(points={{374,212},{374,206}}, color={0,0,0}));
  connect(split28.outlet1, split27.inlet) annotation (Line(points={{374,186.2},{374,158},{410,158},{410,124},{402,124}}, color={0,0,0}));
  connect(join28.outlet, join27.inlet1) annotation (Line(points={{408,194},{416,194},{416,140},{373.8,140},{373.8,134}}, color={0,0,0}));
  connect(pipe49_52R.inlet, join27.outlet) annotation (Line(points={{352,168},{384,168},{384,124}}, color={0,0,0}));
  connect(pipe49_52.outlet, split28.inlet) annotation (Line(points={{352,152},{390,152},{390,196},{384,196}}, color={0,0,0}));
  connect(pipe45_48.outlet, split26.inlet) annotation (Line(points={{262,154},{296,154},{296,198},{290,198}}, color={0,0,0}));
  connect(pipe45_48R.inlet, join25.outlet) annotation (Line(points={{262,170},{290,170},{290,126}}, color={0,0,0}));
  connect(consumer_29.inlet, pipe57_59.outlet) annotation (Line(points={{486,76},{486,84}}, color={0,0,0}));
  connect(pipe57_59R.inlet, consumer_29.outlet) annotation (Line(points={{468,84},{468,76},{478,76}}, color={0,0,0}));
  connect(pipe57_59R.outlet, join29.inlet2) annotation (Line(points={{468,104},{468,112.2}}, color={0,0,0}));
  connect(pipe57_59.inlet, split29.outlet1) annotation (Line(points={{486,104},{486,112.2}}, color={0,0,0}));
  connect(consumer_28.outlet, pipe56_58R.inlet) annotation (Line(points={{476,236},{482,236},{482,230}}, color={0,0,0}));
  connect(pipe56_58R.outlet, join30.inlet1) annotation (Line(points={{482,210},{482,206},{491.8,206},{491.8,202}}, color={0,0,0}));
  connect(consumer_28.inlet, pipe56_58.outlet) annotation (Line(points={{468,236},{468,230}}, color={0,0,0}));
  connect(pipe56_58.inlet, split30.outlet2) annotation (Line(points={{468,210},{468,204}}, color={0,0,0}));
  connect(pipe53_56.outlet, split30.inlet) annotation (Line(points={{452,148},{482,148},{482,194},{478,194}}, color={0,0,0}));
  connect(split30.outlet1, split29.inlet) annotation (Line(points={{468,184.2},{468,156},{504,156},{504,122},{496,122}}, color={0,0,0}));
  connect(split29.outlet2, pipe57_60.inlet) annotation (Line(points={{486,132},{486,148},{520,148}}, color={0,0,0}));
  connect(pipe57_60R.outlet, join30.inlet2) annotation (Line(points={{520,164},{492,164},{492,182.2}}, color={0,0,0}));
  connect(join30.outlet, join29.inlet1) annotation (Line(points={{502,192},{510,192},{510,138},{467.8,138},{467.8,132}}, color={0,0,0}));
  connect(join29.outlet, pipe53_56R.inlet) annotation (Line(points={{478,122},{480,122},{480,164},{452,164}}, color={0,0,0}));
  connect(consumer_31.inlet, pipe61_63.outlet) annotation (Line(points={{580,74},{580,82}}, color={0,0,0}));
  connect(pipe61_63R.inlet, consumer_31.outlet) annotation (Line(points={{562,82},{562,74},{572,74}}, color={0,0,0}));
  connect(pipe61_63R.outlet, join31.inlet2) annotation (Line(points={{562,102},{562,110.2}}, color={0,0,0}));
  connect(pipe61_63.inlet, split31.outlet1) annotation (Line(points={{580,102},{580,110.2}}, color={0,0,0}));
  connect(consumer_30.outlet, pipe60_62R.inlet) annotation (Line(points={{570,234},{576,234},{576,228}}, color={0,0,0}));
  connect(pipe60_62R.outlet, join32.inlet1) annotation (Line(points={{576,208},{576,204},{585.8,204},{585.8,200}}, color={0,0,0}));
  connect(consumer_30.inlet, pipe60_62.outlet) annotation (Line(points={{562,234},{562,228}}, color={0,0,0}));
  connect(pipe60_62.inlet, split32.outlet2) annotation (Line(points={{562,208},{562,202}}, color={0,0,0}));
  connect(split32.outlet1, split31.inlet) annotation (Line(points={{562,182.2},{562,154},{598,154},{598,120},{590,120}}, color={0,0,0}));
  connect(split31.outlet2, pipe61_64.inlet) annotation (Line(points={{580,130},{580,146},{614,146}}, color={0,0,0}));
  connect(pipe61_64R.outlet, join32.inlet2) annotation (Line(points={{614,162},{586,162},{586,180.2}}, color={0,0,0}));
  connect(join32.outlet, join31.inlet1) annotation (Line(points={{596,190},{604,190},{604,136},{561.8,136},{561.8,130}}, color={0,0,0}));
  connect(pipe57_60R.inlet, join31.outlet) annotation (Line(points={{540,164},{572,164},{572,120}}, color={0,0,0}));
  connect(pipe57_60.outlet, split32.inlet) annotation (Line(points={{540,148},{578,148},{578,192},{572,192}}, color={0,0,0}));
  connect(consumer_33.inlet, pipe65_67.outlet) annotation (Line(points={{670,72},{670,80}}, color={0,0,0}));
  connect(pipe65_67R.inlet, consumer_33.outlet) annotation (Line(points={{652,80},{652,72},{662,72}}, color={0,0,0}));
  connect(pipe65_67R.outlet, join33.inlet2) annotation (Line(points={{652,100},{652,108.2}}, color={0,0,0}));
  connect(pipe65_67.inlet, split33.outlet1) annotation (Line(points={{670,100},{670,108.2}}, color={0,0,0}));
  connect(consumer_32.outlet, pipe64_66R.inlet) annotation (Line(points={{660,232},{666,232},{666,226}}, color={0,0,0}));
  connect(pipe64_66R.outlet, join34.inlet1) annotation (Line(points={{666,206},{666,202},{675.8,202},{675.8,198}}, color={0,0,0}));
  connect(consumer_32.inlet, pipe64_66.outlet) annotation (Line(points={{652,232},{652,226}}, color={0,0,0}));
  connect(pipe64_66.inlet, split34.outlet2) annotation (Line(points={{652,206},{652,200}}, color={0,0,0}));
  connect(split34.outlet1, split33.inlet) annotation (Line(points={{652,180.2},{652,152},{688,152},{688,118},{680,118}}, color={0,0,0}));
  connect(split33.outlet2, pipe65_68.inlet) annotation (Line(points={{670,128},{670,144},{706,144}}, color={0,0,0}));
  connect(pipe65_68R.outlet, join34.inlet2) annotation (Line(points={{706,160},{676,160},{676,178.2}}, color={0,0,0}));
  connect(join34.outlet, join33.inlet1) annotation (Line(points={{686,188},{694,188},{694,134},{651.8,134},{651.8,128}}, color={0,0,0}));
  connect(consumer_35.inlet, pipe69_71.outlet) annotation (Line(points={{764,70},{764,78}}, color={0,0,0}));
  connect(pipe69_71R.inlet, consumer_35.outlet) annotation (Line(points={{746,78},{746,70},{756,70}}, color={0,0,0}));
  connect(pipe69_71R.outlet, join35.inlet2) annotation (Line(points={{746,98},{746,106.2}}, color={0,0,0}));
  connect(pipe69_71.inlet, split35.outlet1) annotation (Line(points={{764,98},{764,106.2}}, color={0,0,0}));
  connect(consumer_34.outlet, pipe68_70R.inlet) annotation (Line(points={{754,230},{760,230},{760,224}}, color={0,0,0}));
  connect(pipe68_70R.outlet, join36.inlet1) annotation (Line(points={{760,204},{760,200},{769.8,200},{769.8,196}}, color={0,0,0}));
  connect(consumer_34.inlet, pipe68_70.outlet) annotation (Line(points={{746,230},{746,224}}, color={0,0,0}));
  connect(pipe68_70.inlet, split36.outlet2) annotation (Line(points={{746,204},{746,198}}, color={0,0,0}));
  connect(split36.outlet1, split35.inlet) annotation (Line(points={{746,178.2},{746,150},{782,150},{782,116},{774,116}}, color={0,0,0}));
  connect(join36.outlet, join35.inlet1) annotation (Line(points={{780,186},{788,186},{788,132},{745.8,132},{745.8,126}}, color={0,0,0}));
  connect(pipe65_68R.inlet, join35.outlet) annotation (Line(points={{726,160},{756,160},{756,116}}, color={0,0,0}));
  connect(pipe65_68.outlet, split36.inlet) annotation (Line(points={{726,144},{762,144},{762,188},{756,188}}, color={0,0,0}));
  connect(pipe61_64.outlet, split34.inlet) annotation (Line(points={{634,146},{668,146},{668,190},{662,190}}, color={0,0,0}));
  connect(pipe61_64R.inlet, join33.outlet) annotation (Line(points={{634,162},{662,162},{662,118}}, color={0,0,0}));
  connect(pipe53_56R.outlet, join28.inlet2) annotation (Line(points={{432,164},{398,164},{398,184.2}}, color={0,0,0}));
  connect(split27.outlet2, pipe53_56.inlet) annotation (Line(points={{392,134},{392,148},{432,148}}, color={0,0,0}));
  connect(consumer_37.inlet, pipe73_75.outlet) annotation (Line(points={{862,64},{862,72}}, color={0,0,0}));
  connect(pipe73_75R.inlet, consumer_37.outlet) annotation (Line(points={{844,72},{844,64},{854,64}}, color={0,0,0}));
  connect(pipe73_75R.outlet, join37.inlet2) annotation (Line(points={{844,92},{844,100.2}}, color={0,0,0}));
  connect(pipe73_75.inlet, split37.outlet1) annotation (Line(points={{862,92},{862,100.2}}, color={0,0,0}));
  connect(consumer_36.outlet, pipe72_74R.inlet) annotation (Line(points={{852,224},{858,224},{858,218}}, color={0,0,0}));
  connect(pipe72_74R.outlet, join38.inlet1) annotation (Line(points={{858,198},{858,194},{867.8,194},{867.8,190}}, color={0,0,0}));
  connect(consumer_36.inlet, pipe72_74.outlet) annotation (Line(points={{844,224},{844,218}}, color={0,0,0}));
  connect(pipe72_74.inlet, split38.outlet2) annotation (Line(points={{844,198},{844,192}}, color={0,0,0}));
  connect(split38.outlet1, split37.inlet) annotation (Line(points={{844,172.2},{844,144},{880,144},{880,110},{872,110}}, color={0,0,0}));
  connect(split37.outlet2, pipe73_76.inlet) annotation (Line(points={{862,120},{862,136},{896,136}}, color={0,0,0}));
  connect(pipe73_76R.outlet, join38.inlet2) annotation (Line(points={{896,152},{868,152},{868,170.2}}, color={0,0,0}));
  connect(join38.outlet, join37.inlet1) annotation (Line(points={{878,180},{886,180},{886,126},{843.8,126},{843.8,120}}, color={0,0,0}));
  connect(consumer_39.inlet, pipe76_78.outlet) annotation (Line(points={{956,62},{956,70}}, color={0,0,0}));
  connect(pipe76_78R.inlet, consumer_39.outlet) annotation (Line(points={{938,70},{938,62},{948,62}}, color={0,0,0}));
  connect(pipe76_78R.outlet, join39.inlet2) annotation (Line(points={{938,90},{938,98.2}}, color={0,0,0}));
  connect(consumer_38.outlet, pipe76_77R.inlet) annotation (Line(points={{946,222},{952,222},{952,216}}, color={0,0,0}));
  connect(consumer_38.inlet, pipe76_77.outlet) annotation (Line(points={{938,222},{938,216}}, color={0,0,0}));
  connect(pipe76_77.inlet, split40.outlet2) annotation (Line(points={{938,196},{938,190}}, color={0,0,0}));
  connect(pipe73_76R.inlet, join39.outlet) annotation (Line(points={{916,152},{948,152},{948,108}}, color={0,0,0}));
  connect(pipe73_76.outlet, split40.inlet) annotation (Line(points={{916,136},{954,136},{954,180},{948,180}}, color={0,0,0}));
  connect(pipe69_72.outlet, split38.inlet) annotation (Line(points={{826,138},{860,138},{860,182},{854,182}}, color={0,0,0}));
  connect(pipe69_72R.inlet, join37.outlet) annotation (Line(points={{826,154},{854,154},{854,110}}, color={0,0,0}));
  connect(join36.inlet2, pipe69_72R.outlet) annotation (Line(points={{770,176.2},{770,154},{806,154}}, color={0,0,0}));
  connect(split35.outlet2, pipe69_72.inlet) annotation (Line(points={{764,126},{764,138},{806,138}}, color={0,0,0}));
  connect(join39.inlet1, pipe76_77R.outlet) annotation (Line(points={{937.8,118},{936,118},{936,130},{966,130},{966,190},{952,190},{952,196}}, color={0,0,0}));
  connect(split40.outlet1, pipe76_78.inlet) annotation (Line(points={{938,170.2},{938,158},{956,158},{956,90}}, color={0,0,0}));
  connect(pipe40_42R.inlet, join22.outlet) annotation (Line(points={{80,172},{114,172},{114,178},{136,178},{136,200},{130,200}}, color={0,0,0}));
  connect(split22.outlet1, pipe42_44.inlet) annotation (Line(points={{96,192.2},{96,158},{144,158},{144,156},{148,156}}, color={0,0,0}));
  connect(pipe40_41.inlet, inlet) annotation (Line(points={{-28,352},{-28,378}}, color={0,0,0}));
  connect(pipe40_41R.outlet, outlet) annotation (Line(points={{20,352},{20,378}}, color={0,0,0}));
  connect(pipe40_41.outlet, split20.inlet) annotation (Line(points={{-28,332},{-28,192},{-2,192},{-2,168}}, color={0,0,0}));
  connect(join20.outlet, pipe40_41R.inlet) annotation (Line(points={{20,182},{20,332}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(extent={{-1040,-80},{1160,380}})),Icon(coordinateSystem(extent={{-1040,-80},{1160,380}}), graphics={
                                                                            Rectangle(extent={{-860,216},{-800,156}}), Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-860,216},{-830,256},{-800,216},{-860,216}}),    Rectangle(extent={{-750,216},{-690,156}}),  Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-750,216},{-720,256},{-690,216},{-750,216}}),   Rectangle(extent={{-640,216},{-580,156}}),   Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-640,216},{-610,256},{-580,216},{-640,216}}),      Rectangle(extent={{-860,96},{-800,36}}),  Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-860,96},{-830,136},{-800,96},{-860,96}}),Rectangle(extent={{-750,96},{-690,36}}),   Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-750,96},
              {-720,136},{-690,96},{-750,96}}),                                                                                                                                                                                                        Rectangle(extent={{-640,96},
              {-580,36}}),                                                                                                                                                                                                        Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-640,96},
              {-610,136},{-580,96},{-640,96}}),                             Rectangle(extent={{-508,218},{-448,158}}), Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-508,218},{-478,258},{-448,218},{-508,218}}),    Rectangle(extent={{-398,218},{-338,158}}),  Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-398,218},{-368,258},{-338,218},{-398,218}}),   Rectangle(extent={{-288,218},{-228,158}}),   Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-288,218},{-258,258},{-228,218},{-288,218}}),      Rectangle(extent={{-508,98},{-448,38}}),  Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-508,98},{-478,138},{-448,98},{-508,98}}),Rectangle(extent={{-398,98},{-338,38}}),   Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-398,98},
              {-368,138},{-338,98},{-398,98}}),                                                                                                                                                                                                        Rectangle(extent={{-288,98},
              {-228,38}}),                                                                                                                                                                                                        Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-288,98},
              {-258,138},{-228,98},{-288,98}}),                             Rectangle(extent={{264,216},{324,156}}),   Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{264,216},{294,256},{324,216},{264,216}}),        Rectangle(extent={{374,216},{434,156}}),    Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{374,216},{404,256},{434,216},{374,216}}),       Rectangle(extent={{484,216},{544,156}}),     Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{484,216},{514,256},{544,216},{484,216}}),          Rectangle(extent={{264,96},{324,36}}),    Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{264,96},{294,136},{324,96},{264,96}}),    Rectangle(extent={{374,96},{434,36}}),     Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{374,96},
              {404,136},{434,96},{374,96}}),                                                                                                                                                                                                        Rectangle(extent={{484,96},
              {544,36}}),                                                                                                                                                                                                        Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{484,96},
              {514,136},{544,96},{484,96}}),                                Rectangle(extent={{616,218},{676,158}}),   Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{616,218},{646,258},{676,218},{616,218}}),        Rectangle(extent={{726,218},{786,158}}),    Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{726,218},{756,258},{786,218},{726,218}}),       Rectangle(extent={{836,218},{896,158}}),     Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{836,218},{866,258},{896,218},{836,218}}),          Rectangle(extent={{616,98},{676,38}}),    Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{616,98},{646,138},{676,98},{616,98}}),    Rectangle(extent={{726,98},{786,38}}),     Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{726,98},
              {756,138},{786,98},{726,98}}),                                                                                                                                                                                                        Rectangle(extent={{836,98},
              {896,38}}),                                                                                                                                                                                                        Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{836,98},
              {866,138},{896,98},{836,98}})}),
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a district heating network topology. It represents a topology of row houses.</p>
<p>The model was used in: TransiEnt.Examples.Heat.Largescale_DHN</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>inlet: A fluid inlet for the inflowing heat carrier medium</p>
<p>outlet: A fluid outlet for the outflowing heat carrier medium</p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The topology is based on: </p>
<p>[1] Benthin J, Hagemeier A, Heyer A, Huismann P, Krassowski J, Settgast C, et al. Integranet abschlussbericht. 2020</p>
<p>The model was used in this publication:</p>
<p>[2] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) January 2025</p>
</html>"));
end TopologyB_Ports;
