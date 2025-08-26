within TransiEnt.Grid.Heat.HeatGridTopology;
model TopologyA_Ports "A district heating network topology for large buildings"

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
  //             Variables
  // _____________________________________________

    SI.HeatFlowRate Q_flow_A;
    SI.HeatFlowRate Q_flow_loss;
    SI.PressureDifference delta_p_fric;

  // _____________________________________________
  //
  //           Instances of other classes
  // _____________________________________________

  TransiEnt.Consumer.Heat.Consumer consumer_6(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=180,
        origin={-36,-125})));
  TransiEnt.Consumer.Heat.Consumer consumer_5(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=180,
        origin={-232,130})));
  TransiEnt.Consumer.Heat.Consumer consumer_3(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-248,-136})));
  TransiEnt.Consumer.Heat.Consumer consumer_4(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=0,
        origin={-54,60})));
  TransiEnt.Consumer.Heat.Consumer consumer_2(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={-258,48})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe10_11R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    N_cv=32) annotation (Placement(transformation(extent={{-208,124},{-188,144}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe10_11(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(extent={{-188,110},{-208,130}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe15_16R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false) annotation (Placement(transformation(extent={{-14,-125},{6,-106}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe15_16(
    d=0.065,
    m_flow_nom=2.8,
    l=156) annotation (Placement(transformation(extent={{6,-139},{-14,-119}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe3_5(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    N_cv=32) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-262,20})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe3_5R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-248,20})));
  TransiEnt.Consumer.Heat.Consumer consumer_7(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={116,54})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe17_18(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    N_cv=32) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={112,24})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe17_18R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={126,24})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={112,-4})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={136,-4})));
  TransiEnt.Consumer.Heat.Consumer consumer_9(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=90,
        origin={236,50})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe21_22(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    N_cv=32) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={232,20})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe21_22R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={246,20})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe4_6R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-262,-106})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe4_6(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    N_cv=32) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-244,-106})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-238,-78})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-262,-78})));
  TransiEnt.Consumer.Heat.Consumer consumer_1(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={-312,-136})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe1_2R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-326,-106})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe1_2(
    d=0.065,
    m_flow_nom=2.8,
    delta_p_nom=150,
    l=156,
    N_cv=32) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-308,-106})));
  TransiEnt.Consumer.Heat.Consumer consumer_8(
    multiplicationFactor=20*3.4,
    m_flow_nom=2.8,
    Q_flow_nom(displayUnit="kW") = 350000) annotation (Placement(transformation(
        extent={{-12,-10},{12,10}},
        rotation=270,
        origin={186,-144})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe19_20R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={172,-114})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe19_20(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    N_cv=32) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={190,-114})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split7 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={190,-42})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join7 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={172,-68})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_9(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    N_cv=32) annotation (Placement(transformation(extent={{-94,54},{-74,74}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_9R(
    d=0.065,
    m_flow_nom=2.8,
    l=156,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(extent={{-74,40},{-94,60}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-110,64})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-110,42})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_3R(
    d=0.065,
    m_flow_nom=2.8,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{-302,-48},{-282,-28}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe2_3(
    d=0.065,
    m_flow_nom=2.8,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{-282,-62},{-302,-42}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_10(
    d=0.065,
    m_flow_nom=2.8,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-156,96})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe8_10R(
    d=0.065,
    m_flow_nom=2.8,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-136,96})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe7_8(
    d=0.08,
    m_flow_nom=5.58,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-154,28})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe7_8R(
    d=0.08,
    m_flow_nom=5.58,
    l=500,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-132,28})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe19_21R(
    d=0.065,
    m_flow_nom=2.8,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{224,-66},{204,-46}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe19_21(
    d=0.065,
    m_flow_nom=2.8,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{204,-52},{224,-32}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe4_7R(
    d=0.1,
    m_flow_nom=8.36,
    l=100,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(extent={{-198,-48},{-178,-28}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe4_7(
    d=0.1,
    m_flow_nom=8.36,
    l=100,
    MassFlowState=false,
    N_cv=32) annotation (Placement(transformation(extent={{-178,-62},{-198,-42}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe14_15R(
    d=0.065,
    m_flow_nom=2.8,
    l=100,
    MassFlowState=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-92})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe14_15(
    d=0.065,
    m_flow_nom=2.8,
    l=100,
    MassFlowState=false) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,-92})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe17_19(
    d=0.08,
    m_flow_nom=5.58,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{134,-52},{154,-32}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe17_19R(
    d=0.08,
    m_flow_nom=5.58,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{154,-66},{134,-46}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe14_17R(
    d=0.1,
    m_flow_nom=8.73,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{84,-66},{64,-46}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe14_17(
    d=0.1,
    m_flow_nom=8.37,
    l=100,
    MassFlowState=false,
    N_cv=20) annotation (Placement(transformation(extent={{64,-52},{84,-32}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-154,-38})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-134,-52})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe7_12R(
    d=0.11,
    m_flow_nom=13.94,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(extent={{-78,-46},{-98,-26}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe7_12(
    d=0.11,
    m_flow_nom=13.94,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(extent={{-96,-60},{-76,-40}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,-36})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={20,-66})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-36})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-50})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe12_14(
    d=0.125,
    m_flow_nom=11.16,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(extent={{-10,-46},{10,-26}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe12_14R(
    d=0.125,
    m_flow_nom=11.16,
    l=50,
    MassFlowState=false,
    N_cv=10) annotation (Placement(transformation(extent={{10,-60},{-10,-40}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Join join9 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-238,-10})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Fittings.Split split2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-262,-14})));
  TransiEnt.Basics.Interfaces.Thermal.inlet inlet annotation (Placement(transformation(extent={{-68,148},{-48,168}})));
  TransiEnt.Basics.Interfaces.Thermal.outlet outlet annotation (Placement(transformation(extent={{-10,148},{10,168}})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe12_13R(
    d=0.15,
    m_flow_nom=25.1,
    l=50,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-30,16})));
  TransiEnt.Components.Heat.DHN_Pipe_L4 pipe12_13(
    d=0.15,
    m_flow_nom=25.1,
    l=50,
    MassFlowState=false,
    N_cv=100) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,16})));
equation

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  Q_flow_A=inlet.m_flow*inStream(inlet.h_outflow) + outlet.m_flow*outlet.h_outflow;
  Q_flow_loss=pipe1_2.Q_flow_loss + pipe2_3.Q_flow_loss + pipe3_5.Q_flow_loss + pipe4_6.Q_flow_loss + pipe4_7.Q_flow_loss + pipe7_8.Q_flow_loss + pipe8_9.Q_flow_loss + pipe8_10.Q_flow_loss + pipe10_11.Q_flow_loss + pipe7_12.Q_flow_loss + pipe12_13.Q_flow_loss + pipe12_14.Q_flow_loss + pipe14_15.Q_flow_loss + pipe15_16.Q_flow_loss + pipe14_17.Q_flow_loss + pipe17_18.Q_flow_loss + pipe17_19.Q_flow_loss+pipe19_20.Q_flow_loss+pipe19_21.Q_flow_loss+pipe21_22.Q_flow_loss+pipe1_2R.Q_flow_loss + pipe2_3R.Q_flow_loss + pipe3_5R.Q_flow_loss + pipe4_6R.Q_flow_loss + pipe4_7R.Q_flow_loss + pipe7_8R.Q_flow_loss + pipe8_9R.Q_flow_loss + pipe8_10R.Q_flow_loss + pipe10_11R.Q_flow_loss + pipe7_12R.Q_flow_loss + pipe12_13R.Q_flow_loss + pipe12_14R.Q_flow_loss + pipe14_15R.Q_flow_loss + pipe15_16R.Q_flow_loss + pipe14_17R.Q_flow_loss + pipe17_18R.Q_flow_loss + pipe17_19R.Q_flow_loss+pipe19_20R.Q_flow_loss+pipe19_21R.Q_flow_loss+pipe21_22R.Q_flow_loss;
  delta_p_fric=pipe1_2.delta_p_fric + pipe2_3.delta_p_fric + pipe3_5.delta_p_fric + pipe4_6.delta_p_fric + pipe4_7.delta_p_fric + pipe7_8.delta_p_fric + pipe8_9.delta_p_fric + pipe8_10.delta_p_fric + pipe10_11.delta_p_fric + pipe7_12.delta_p_fric + pipe12_13.delta_p_fric + pipe12_14.delta_p_fric + pipe14_15R.delta_p_fric + pipe15_16.delta_p_fric + pipe14_17.delta_p_fric + pipe17_18.delta_p_fric + pipe17_19.delta_p_fric+pipe19_20.delta_p_fric+pipe19_21.delta_p_fric+pipe21_22.delta_p_fric;
  connect(consumer_5.outlet, pipe10_11R.inlet) annotation (Line(points={{-220,134},{-208,134}}, color={0,0,0}));
  connect(consumer_5.inlet, pipe10_11.outlet) annotation (Line(points={{-220,126},{-214,126},{-214,120},{-208,120}}, color={0,0,0}));
  connect(consumer_6.outlet, pipe15_16R.inlet) annotation (Line(points={{-24,-121},{-24,-115.5},{-14,-115.5}}, color={0,0,0}));
  connect(pipe15_16.outlet, consumer_6.inlet) annotation (Line(points={{-14,-129},{-24,-129}}, color={0,0,0}));
  connect(consumer_7.inlet, pipe17_18.inlet) annotation (Line(points={{112,42},{112,34}}, color={0,0,0}));
  connect(consumer_7.outlet, pipe17_18R.outlet) annotation (Line(points={{120,42},{122,42},{122,34},{126,34}}, color={0,0,0}));
  connect(pipe17_18.outlet, join3.inlet1) annotation (Line(points={{112,14},{112,10},{111.8,10},{111.8,6}}, color={0,0,0}));
  connect(pipe17_18R.inlet, split3.outlet2) annotation (Line(points={{126,14},{126,6},{136,6}}, color={0,0,0}));
  connect(consumer_3.inlet, pipe4_6.outlet) annotation (Line(points={{-244,-124},{-244,-116}}, color={0,0,0}));
  connect(pipe4_6R.inlet, consumer_3.outlet) annotation (Line(points={{-262,-116},{-262,-124},{-252,-124}}, color={0,0,0}));
  connect(pipe4_6R.outlet, join5.inlet2) annotation (Line(points={{-262,-96},{-262,-87.8}}, color={0,0,0}));
  connect(pipe4_6.inlet, split5.outlet1) annotation (Line(points={{-244,-96},{-244,-90},{-238,-90},{-238,-87.8}}, color={0,0,0}));
  connect(consumer_1.inlet, pipe1_2.outlet) annotation (Line(points={{-308,-124},{-308,-116}}, color={0,0,0}));
  connect(pipe1_2R.inlet, consumer_1.outlet) annotation (Line(points={{-326,-116},{-326,-124},{-316,-124}}, color={0,0,0}));
  connect(consumer_8.inlet, pipe19_20.outlet) annotation (Line(points={{190,-132},{190,-124}}, color={0,0,0}));
  connect(pipe19_20R.inlet, consumer_8.outlet) annotation (Line(points={{172,-124},{172,-132},{182,-132}}, color={0,0,0}));
  connect(pipe19_20R.outlet, join7.inlet2) annotation (Line(points={{172,-104},{172,-77.8}}, color={0,0,0}));
  connect(pipe19_20.inlet, split7.outlet1) annotation (Line(points={{190,-104},{190,-51.8}}, color={0,0,0}));
  connect(pipe8_9.outlet, consumer_4.inlet) annotation (Line(points={{-74,64},{-66,64}}, color={0,0,0}));
  connect(consumer_4.outlet, pipe8_9R.inlet) annotation (Line(points={{-66,56},{-68,56},{-68,50},{-74,50}}, color={0,0,0}));
  connect(pipe8_9.inlet, split8.outlet1) annotation (Line(points={{-94,64},{-100.2,64}}, color={0,0,0}));
  connect(join8.inlet2, pipe8_9R.outlet) annotation (Line(points={{-100.2,42},{-98,42},{-98,50},{-94,50}}, color={0,0,0}));
  connect(pipe10_11R.outlet, pipe8_10R.inlet) annotation (Line(points={{-188,134},{-136,134},{-136,106}}, color={0,0,0}));
  connect(pipe10_11.inlet, pipe8_10.outlet) annotation (Line(points={{-188,120},{-156,120},{-156,106}}, color={0,0,0}));
  connect(split8.outlet2, pipe8_10.inlet) annotation (Line(points={{-120,64},{-156,64},{-156,86}}, color={0,0,0}));
  connect(join8.inlet1, pipe8_10R.outlet) annotation (Line(points={{-120,41.8},{-136,41.8},{-136,86}}, color={0,0,0}));
  connect(pipe7_8.outlet, split8.inlet) annotation (Line(points={{-154,38},{-154,76},{-110,76},{-110,74}}, color={0,0,0}));
  connect(pipe7_8R.inlet, join8.outlet) annotation (Line(points={{-132,38},{-132,56},{-110,56},{-110,52}}, color={0,0,0}));
  connect(pipe1_2R.outlet, pipe2_3R.inlet) annotation (Line(points={{-326,-96},{-326,-38},{-302,-38}}, color={0,0,0}));
  connect(pipe2_3.outlet, pipe1_2.inlet) annotation (Line(points={{-302,-52},{-308,-52},{-308,-96}}, color={0,0,0}));
  connect(pipe15_16R.outlet, pipe14_15R.inlet) annotation (Line(points={{6,-115.5},{20,-115.5},{20,-102}}, color={0,0,0}));
  connect(pipe15_16.inlet, pipe14_15.outlet) annotation (Line(points={{6,-129},{40,-129},{40,-102}}, color={0,0,0}));
  connect(consumer_9.inlet, pipe21_22.outlet) annotation (Line(points={{232,38},{232,30}}, color={0,0,0}));
  connect(pipe19_21.outlet, pipe21_22.inlet) annotation (Line(points={{224,-42},{232,-42},{232,10}}, color={0,0,0}));
  connect(consumer_9.outlet, pipe21_22R.inlet) annotation (Line(points={{240,38},{246,38},{246,30}}, color={0,0,0}));
  connect(pipe19_21R.inlet, pipe21_22R.outlet) annotation (Line(points={{224,-56},{246,-56},{246,10}}, color={0,0,0}));
  connect(pipe19_21.inlet, split7.outlet2) annotation (Line(points={{204,-42},{204,-26},{190,-26},{190,-32}}, color={0,0,0}));
  connect(join7.inlet1, pipe19_21R.outlet) annotation (Line(points={{172.2,-58},{172.2,-56},{204,-56}}, color={0,0,0}));
  connect(pipe17_19.outlet, split7.inlet) annotation (Line(points={{154,-42},{180,-42}}, color={0,0,0}));
  connect(pipe17_19R.inlet, join7.outlet) annotation (Line(points={{154,-56},{158,-56},{158,-68},{162,-68}}, color={0,0,0}));
  connect(pipe17_19R.outlet, split3.inlet) annotation (Line(points={{134,-56},{128,-56},{128,-22},{152,-22},{152,-4},{146,-4}}, color={0,0,0}));
  connect(split3.outlet1, pipe14_17R.inlet) annotation (Line(points={{136,-13.8},{136,-30},{106,-30},{106,-56},{84,-56}}, color={0,0,0}));
  connect(pipe14_17.outlet, join3.inlet2) annotation (Line(points={{84,-42},{112,-42},{112,-13.8}}, color={0,0,0}));
  connect(join3.outlet, pipe17_19.inlet) annotation (Line(points={{122,-4},{122,-42},{134,-42}}, color={0,0,0}));
  connect(join5.outlet, pipe4_7R.inlet) annotation (Line(points={{-252,-78},{-244,-78},{-244,-34},{-212,-34},{-212,-38},{-198,-38}}, color={0,0,0}));
  connect(split5.inlet, pipe4_7.outlet) annotation (Line(points={{-228,-78},{-222,-78},{-222,-52},{-198,-52}}, color={0,0,0}));
  connect(pipe4_7.inlet, split1.outlet2) annotation (Line(points={{-178,-52},{-170,-52},{-170,-38},{-164,-38}}, color={0,0,0}));
  connect(split1.outlet1, pipe7_8.inlet) annotation (Line(points={{-144.2,-38},{-138,-38},{-138,-4},{-154,-4},{-154,18}}, color={0,0,0}));
  connect(pipe4_7R.outlet, join1.inlet1) annotation (Line(points={{-178,-38},{-172,-38},{-172,-52.2},{-144,-52.2}}, color={0,0,0}));
  connect(pipe7_8R.outlet, join1.inlet2) annotation (Line(points={{-132,18},{-132,-30},{-112,-30},{-112,-52},{-124.2,-52}}, color={0,0,0}));
  connect(pipe7_12R.outlet, split1.inlet) annotation (Line(points={{-98,-36},{-102,-36},{-102,-14},{-154,-14},{-154,-28}}, color={0,0,0}));
  connect(split4.outlet2, pipe14_15.inlet) annotation (Line(points={{40,-46},{40,-82}}, color={0,0,0}));
  connect(split4.outlet1, pipe14_17.inlet) annotation (Line(points={{40,-26.2},{40,-14},{54,-14},{54,-42},{64,-42}}, color={0,0,0}));
  connect(pipe14_15R.outlet, join4.inlet1) annotation (Line(points={{20,-82},{20,-75},{20.2,-75},{20.2,-76}}, color={0,0,0}));
  connect(join4.inlet2, pipe14_17R.outlet) annotation (Line(points={{20,-56.2},{20,-56},{64,-56}}, color={0,0,0}));
  connect(split6.outlet2, pipe7_12R.inlet) annotation (Line(points={{-60,-36},{-78,-36}}, color={0,0,0}));
  connect(split6.outlet1, pipe12_14.inlet) annotation (Line(points={{-40.2,-36},{-10,-36}}, color={0,0,0}));
  connect(pipe12_14.outlet, split4.inlet) annotation (Line(points={{10,-36},{30,-36}}, color={0,0,0}));
  connect(join1.outlet, pipe7_12.inlet) annotation (Line(points={{-134,-42},{-134,-38},{-116,-38},{-116,-50},{-96,-50}}, color={0,0,0}));
  connect(pipe7_12.outlet, join6.inlet1) annotation (Line(points={{-76,-50},{-40,-50},{-40,-50.2}}, color={0,0,0}));
  connect(join6.inlet2, pipe12_14R.outlet) annotation (Line(points={{-20.2,-50},{-10,-50}}, color={0,0,0}));
  connect(join4.outlet, pipe12_14R.inlet) annotation (Line(points={{10,-66},{6,-66},{6,-56},{14,-56},{14,-50},{10,-50}}, color={0,0,0}));
  connect(consumer_2.outlet, pipe3_5R.inlet) annotation (Line(points={{-254,36},{-248,36},{-248,30}}, color={0,0,0}));
  connect(pipe3_5R.outlet, join9.inlet1) annotation (Line(points={{-248,10},{-248,4},{-238.2,4},{-238.2,0}}, color={0,0,0}));
  connect(pipe2_3R.outlet, join9.inlet2) annotation (Line(points={{-282,-38},{-238,-38},{-238,-19.8}}, color={0,0,0}));
  connect(join5.inlet1, join9.outlet) annotation (Line(points={{-262.2,-68},{-262.2,-54},{-222,-54},{-222,-10},{-228,-10}}, color={0,0,0}));
  connect(pipe3_5.inlet, split2.outlet2) annotation (Line(points={{-262,10},{-262,-4}}, color={0,0,0}));
  connect(pipe2_3.inlet, split2.outlet1) annotation (Line(points={{-282,-52},{-262,-52},{-262,-23.8}}, color={0,0,0}));
  connect(split2.inlet, split5.outlet2) annotation (Line(points={{-252,-14},{-248,-14},{-248,-48},{-238,-48},{-238,-68}}, color={0,0,0}));
  connect(consumer_2.inlet, pipe3_5.outlet) annotation (Line(points={{-262,36},{-262,30}}, color={0,0,0}));
  connect(pipe12_13.outlet, split6.inlet) annotation (Line(points={{-50,6},{-50,-26}}, color={0,0,0}));
  connect(pipe12_13.inlet, inlet) annotation (Line(points={{-50,26},{-46,26},{-46,134},{-58,134},{-58,158}}, color={0,0,0}));
  connect(join6.outlet, pipe12_13R.inlet) annotation (Line(points={{-30,-40},{-30,6}}, color={0,0,0}));
  connect(outlet, pipe12_13R.outlet) annotation (Line(points={{0,158},{0,32},{-30,32},{-30,26}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(extent={{-340,-160},{280,160}})), Icon(coordinateSystem(extent={{-340,-160},{280,160}}), graphics={
                                                                            Rectangle(extent={{-170,60},{-110,0}}),    Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-170,60},{-140,100},{-110,60},{-170,60}}),       Rectangle(extent={{-60,60},{0,0}}),         Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-60,60},{-30,100},{0,60},{-60,60}}),            Rectangle(extent={{50,60},{110,0}}),         Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{50,60},{80,100},{110,60},{50,60}}),                Rectangle(extent={{-170,-60},{-110,-120}}),
                                                                                                                                                                                                        Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-170,-60},{-140,-20},{-110,-60},{-170,-60}}),
                                                                                                                                                                                                        Rectangle(extent={{-60,-60},{0,-120}}),    Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{-60,-60},
              {-30,-20},{0,-60},{-60,-60}}),                                                                                                                                                                                                        Rectangle(extent={{50,-60},
              {110,-120}}),                                                                                                                                                                                                        Polygon(lineColor = {28, 108, 200}, fillColor = {238, 46, 47}, fillPattern = FillPattern.Solid, points={{50,-60},
              {80,-20},{110,-60},{50,-60}})}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a district heating network topology. It represents a topology of large buildings like skyscrappers appearing in the downtown of a city.</p>
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
end TopologyA_Ports;
