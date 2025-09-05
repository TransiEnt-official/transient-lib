within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.BaseScenarios;
model LV_rural_1_Today "Small rural low voltage distribution grid model"

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
//________________________________________________________________________________//  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------


  parameter String data_local="modelica://TransiEnt/Tables/distribution/" "Directory containing simulation data" annotation (Evaluate=true, Dialog(group="Scenario"));

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Limit_P "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for battery system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for heating system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for vehicle system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter String weatherLocation="Hamelin" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter String weatherYear="2019" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter String smartMeterConfiguration="Ideal" "choose the basic configuration" annotation (Dialog(group="Metering"), choices(
      choice="Ideal" "Ideal measurements",
      choice="TAF10" "Tarifanwendungsfall 10 (German standard)",
      choice="TAF7" "Tarifanwendungsfall 7 (German standard)"));

  // ------------------------------------------------------------------------------------------
  //   Components
  // ------------------------------------------------------------------------------------------

  // ---- TransiEnt Models (SimCenter and ModelStatistics) ------------------------------------

  inner TransiEnt.SimCenter simCenter(redeclare model Ground_Temperature = TransiEnt.Basics.Tables.Ambient.UndergroundTemperature_Duesseldorf_1m_3600s_TMY (use_absolute_path=true, absolute_path="modelica://TransiEnt/Tables/ambient/UndergroundTemperature_Duesseldorf_1m_2017.txt"), electricityPrice(use_absolute_path=true, absolute_path="modelica://TransiEnt/Tables/electricity/ElectricityPrices_DayAhead_EPEX_Spot_2011.txt")) annotation (Placement(transformation(extent={{-90.0,80.0},{-70.0,100.0}})));
  inner TransiEnt.ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-60.0,80.0},{-40.0,100.0}})));

  // ---- Nodes -------------------------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Node node_1(v_n=400) annotation (Placement(transformation(extent={{109.2,38.27},{114.2,43.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_2(v_n=400) annotation (Placement(transformation(extent={{53.2,38.27},{58.2,43.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_3(v_n=400) annotation (Placement(transformation(extent={{-65.8,-66.73},{-60.8,-61.73}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_4(v_n=400) annotation (Placement(transformation(extent={{18.2,80.27},{23.2,85.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_5(v_n=400) annotation (Placement(transformation(extent={{-9.8,-101.73},{-4.8,-96.73}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_6(v_n=400) annotation (Placement(transformation(extent={{-9.8,-66.73},{-4.8,-61.73}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_7(v_n=400) annotation (Placement(transformation(extent={{-9.8,38.27},{-4.8,43.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_8(v_n=400) annotation (Placement(transformation(extent={{-65.8,38.27},{-60.8,43.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_9(v_n=400) annotation (Placement(transformation(extent={{53.2,3.27},{58.2,8.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_10(v_n=400) annotation (Placement(transformation(extent={{-65.8,-31.73},{-60.8,-26.73}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_11(v_n=400) annotation (Placement(transformation(extent={{-65.8,3.27},{-60.8,8.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_12(v_n=400) annotation (Placement(transformation(extent={{-9.8,10.27},{-4.8,15.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_13(v_n=400) annotation (Placement(transformation(extent={{60.2,-31.73},{65.2,-26.73}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_14(v_n=400) annotation (Placement(transformation(extent={{-9.8,-31.73},{-4.8,-26.73}})));

  // Basic Parameters

  // ---- Lines (between nodes) ---------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_1(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=55.767000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{-65.8,-49.23},{-60.8,-44.23}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_2(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=53.576000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{-9.8,-10.73},{-4.8,-5.73}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_3(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=49.815000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{4.2,59.27},{9.2,64.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_4(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=17.886000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{53.2,20.77},{58.2,25.77}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_5(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=16.089000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{-65.8,20.77},{-60.8,25.77}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_6(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=24.766000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{-65.8,-14.23},{-60.8,-9.23}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_7(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.141000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{-23.8,59.27},{-18.8,64.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_8(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.147000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{-9.8,24.27},{-4.8,29.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_9(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=137.215000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{-9.8,-49.23},{-4.8,-44.23}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_10(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=132.499000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{63.7,59.27},{68.7,64.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_11(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=16.207000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{35.7,59.27},{40.7,64.27}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_12(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=46.015000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{56.7,-14.23},{61.7,-9.23}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_13(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.583000,
    i_n=275,
    parallel=1) annotation (Placement(transformation(extent={{-9.8,-84.23},{-4.8,-79.23}})));

  // Basic Parameters

  // ---- Transformer node --------------------------------------------------------------------

  // Basic Parameters

  // ---- Prosumer ----------------------------------------------------------------------------

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_1(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH39",
    loadProfileScaleP=4.80121,
    loadProfileScaleQ=4.80121,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.75,
    tappingProfileName="TappingCycle_T_1",
    num_BEVs=0) annotation (Placement(transformation(extent={{-45.8,-31.73},{-30.8,-16.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_2(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=2.97136,
    loadProfileScaleQ=2.97136,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.5,
    tappingProfileName="TappingCycle_T_2",
    num_BEVs=0) annotation (Placement(transformation(extent={{-45.8,38.27},{-30.8,53.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_3(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH5",
    loadProfileScaleP=4.06708,
    loadProfileScaleQ=4.06708,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.6,
    tappingProfileName="TappingCycle_T_3",
    num_BEVs=0) annotation (Placement(transformation(extent={{10.2,-31.73},{25.2,-16.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_4(
    PV_peakPower=10015.99,
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH19",
    loadProfileScaleP=3.38319,
    loadProfileScaleQ=3.38319,
    usePV=true,
    useBattery=true,
    useEHP=false,
    V_BST=0.6,
    tappingProfileName="TappingCycle_T_4",
    num_BEVs=0) annotation (Placement(transformation(extent={{80.2,-31.73},{95.2,-16.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_5(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=4.13378,
    loadProfileScaleQ=4.13378,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.75,
    tappingProfileName="TappingCycle_T_5",
    num_BEVs=0) annotation (Placement(transformation(extent={{73.2,3.27},{88.2,18.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_6(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH30",
    loadProfileScaleP=2.28264,
    loadProfileScaleQ=2.28264,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.5,
    tappingProfileName="TappingCycle_T_6",
    num_BEVs=0) annotation (Placement(transformation(extent={{10.2,-66.73},{25.2,-51.73}})));

  // Basic Parameters

  // Photovoltaics
  // ------------------------------------------------------------------------------------------
  //   Components
  // ------------------------------------------------------------------------------------------
  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_7(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH12",
    loadProfileScaleP=5.00053,
    loadProfileScaleQ=5.00053,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.95,
    tappingProfileName="TappingCycle_T_7",
    num_BEVs=0) annotation (Placement(transformation(extent={{-45.8,-66.73},{-30.8,-51.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_8(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH36",
    loadProfileScaleP=5.91097,
    loadProfileScaleQ=5.91097,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.95,
    tappingProfileName="TappingCycle_T_8",
    num_BEVs=0) annotation (Placement(transformation(extent={{129.2,38.27},{144.2,53.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_9(
    PV_peakPower=8051.681,
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH17",
    loadProfileScaleP=2.71967,
    loadProfileScaleQ=2.71967,
    usePV=true,
    useBattery=false,
    useEHP=false,
    V_BST=0.5,
    tappingProfileName="TappingCycle_T_9",
    num_BEVs=0) annotation (Placement(transformation(extent={{10.2,38.27},{25.2,53.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_10(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH16",
    loadProfileScaleP=5.74786,
    loadProfileScaleQ=5.74786,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.95,
    tappingProfileName="TappingCycle_T_10",
    num_BEVs=0) annotation (Placement(transformation(extent={{10.2,10.27},{25.2,25.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_11(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=2.33476,
    loadProfileScaleQ=2.33476,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST=0.3,
    tappingProfileName="TappingCycle_T_11",
    num_BEVs=0) annotation (Placement(transformation(extent={{-45.8,3.27},{-30.8,18.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_12(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=3.92714,
    loadProfileScaleQ=3.92714,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.75,
    tappingProfileName="TappingCycle_T_12",
    num_BEVs=0) annotation (Placement(transformation(extent={{73.2,38.27},{88.2,53.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_13(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH22",
    loadProfileScaleP=6.36717,
    loadProfileScaleQ=6.36717,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST=0.95,
    tappingProfileName="TappingCycle_T_13",
    num_BEVs=0) annotation (Placement(transformation(extent={{10.2,-101.73},{25.2,-86.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-110,40},{-90,60}})));
  // ------------------------------------------------------------------------------------------
  //   Equation part/
  // ------------------------------------------------------------------------------------------

  TransiEnt.Components.Electrical.PowerTransformation.SimpleTransformerComplex simpleTransformerComplex(
    UseRatio=false,
    ratio=50,
    U_P=20e3,
    U_S=400,
    epp_p(v(start=20/000)),
    epp_n(v(start=400))) annotation (Placement(transformation(extent={{44,110},{64,130}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));
  TransiEnt.Components.Sensors.SmartMeter GridMeter annotation (Placement(transformation(extent={{114,110},{134,130}})));
equation

  // ---- Connect Interfaces -----------------------------------------------------------------------
  connect(controlBus.household_1, household_1.controlBus) annotation();
  connect(controlBus.household_2, household_2.controlBus) annotation();
  connect(controlBus.household_3, household_3.controlBus) annotation();
  connect(controlBus.household_4, household_4.controlBus) annotation();
  connect(controlBus.household_5, household_5.controlBus) annotation();
  connect(controlBus.household_6, household_6.controlBus) annotation();
  connect(controlBus.household_7, household_7.controlBus) annotation();
  connect(controlBus.household_8, household_8.controlBus) annotation();
  connect(controlBus.household_9, household_9.controlBus) annotation();
  connect(controlBus.household_10, household_10.controlBus) annotation();
  connect(controlBus.household_11, household_11.controlBus) annotation();
  connect(controlBus.household_12, household_12.controlBus) annotation();
  connect(controlBus.household_13, household_13.controlBus) annotation();

  connect(controlBus.node_1, node_1.controlBus) annotation();
  connect(controlBus.node_2, node_2.controlBus) annotation();
  connect(controlBus.node_3, node_3.controlBus) annotation();
  connect(controlBus.node_4, node_4.controlBus) annotation();
  connect(controlBus.node_5, node_5.controlBus) annotation();
  connect(controlBus.node_6, node_6.controlBus) annotation();
  connect(controlBus.node_7, node_7.controlBus) annotation();
  connect(controlBus.node_8, node_8.controlBus) annotation();
  connect(controlBus.node_9, node_9.controlBus) annotation();
  connect(controlBus.node_10, node_10.controlBus) annotation();
  connect(controlBus.node_11, node_11.controlBus) annotation();
  connect(controlBus.node_12, node_12.controlBus) annotation();
  connect(controlBus.node_13, node_13.controlBus) annotation();
  connect(controlBus.node_14, node_14.controlBus) annotation();
  // ---- Connect lines -----------------------------------------------------------------------

  connect(line_1.epp_p, node_10.epp) annotation (Line(points={{-65.8,-46.73},{-63.3,-31.73}}));
  connect(line_1.epp_n, node_3.epp) annotation (Line(points={{-60.8,-46.73},{-63.3,-66.73}}));
  connect(line_2.epp_p, node_14.epp) annotation (Line(points={{-9.8,-8.23},{-7.3,-31.73}}));
  connect(line_2.epp_n, node_12.epp) annotation (Line(points={{-4.8,-8.23},{-7.3,10.27}}));
  connect(line_3.epp_p, node_7.epp) annotation (Line(points={{4.2,61.77},{-7.3,38.27}}));
  connect(line_3.epp_n, node_4.epp) annotation (Line(points={{9.2,61.77},{20.7,80.27}}));
  connect(line_4.epp_p, node_9.epp) annotation (Line(points={{53.2,23.27},{55.7,3.27}}));
  connect(line_4.epp_n, node_2.epp) annotation (Line(points={{58.2,23.27},{55.7,38.27}}));
  connect(line_5.epp_p, node_8.epp) annotation (Line(points={{-65.8,23.27},{-63.3,38.27}}));
  connect(line_5.epp_n, node_11.epp) annotation (Line(points={{-60.8,23.27},{-63.3,3.27}}));
  connect(line_6.epp_p, node_11.epp) annotation (Line(points={{-65.8,-11.73},{-63.3,3.27}}));
  connect(line_6.epp_n, node_10.epp) annotation (Line(points={{-60.8,-11.73},{-63.3,-31.73}}));
  connect(line_7.epp_p, node_4.epp) annotation (Line(points={{-23.8,61.77},{20.7,80.27}}));
  connect(line_7.epp_n, node_8.epp) annotation (Line(points={{-18.8,61.77},{-63.3,38.27}}));
  connect(line_8.epp_p, node_12.epp) annotation (Line(points={{-9.8,26.77},{-7.3,10.27}}));
  connect(line_8.epp_n, node_7.epp) annotation (Line(points={{-4.8,26.77},{-7.3,38.27}}));
  connect(line_9.epp_p, node_6.epp) annotation (Line(points={{-9.8,-46.73},{-7.3,-66.73}}));
  connect(line_9.epp_n, node_14.epp) annotation (Line(points={{-4.8,-46.73},{-7.3,-31.73}}));
  connect(line_10.epp_p, node_4.epp) annotation (Line(points={{63.7,61.77},{20.7,80.27}}));
  connect(line_10.epp_n, node_1.epp) annotation (Line(points={{68.7,61.77},{111.7,38.27}}));
  connect(line_11.epp_p, node_2.epp) annotation (Line(points={{35.7,61.77},{55.7,38.27}}));
  connect(line_11.epp_n, node_4.epp) annotation (Line(points={{40.7,61.77},{20.7,80.27}}));
  connect(line_12.epp_p, node_13.epp) annotation (Line(points={{56.7,-11.73},{62.7,-31.73}}));
  connect(line_12.epp_n, node_9.epp) annotation (Line(points={{61.7,-11.73},{55.7,3.27}}));
  connect(line_13.epp_p, node_5.epp) annotation (Line(points={{-9.8,-81.73},{-7.3,-101.73}}));
  connect(line_13.epp_n, node_6.epp) annotation (Line(points={{-4.8,-81.73},{-7.3,-66.73}}));

  // ---- Connect households to nodes ---------------------------------------------------------

  connect(node_10.epp, household_1.epp) annotation (Line(points={{-63.3,-31.73},{-38.3,-31.73}}));
  connect(node_8.epp, household_2.epp) annotation (Line(points={{-63.3,38.27},{-38.3,38.27}}));
  connect(node_14.epp, household_3.epp) annotation (Line(points={{-7.3,-31.73},{17.7,-31.73}}));
  connect(node_13.epp, household_4.epp) annotation (Line(points={{62.7,-31.73},{87.7,-31.73}}));
  connect(node_9.epp, household_5.epp) annotation (Line(points={{55.7,3.27},{80.7,3.27}}));
  connect(node_6.epp, household_6.epp) annotation (Line(points={{-7.3,-66.73},{17.7,-66.73}}));
  connect(node_3.epp, household_7.epp) annotation (Line(points={{-63.3,-66.73},{-38.3,-66.73}}));
  connect(node_1.epp, household_8.epp) annotation (Line(points={{111.7,38.27},{136.7,38.27}}));
  connect(node_7.epp, household_9.epp) annotation (Line(points={{-7.3,38.27},{17.7,38.27}}));
  connect(node_12.epp, household_10.epp) annotation (Line(points={{-7.3,10.27},{17.7,10.27}}));
  connect(node_11.epp, household_11.epp) annotation (Line(points={{-63.3,3.27},{-38.3,3.27}}));
  connect(node_2.epp, household_12.epp) annotation (Line(points={{55.7,38.27},{80.7,38.27}}));
  connect(node_5.epp, household_13.epp) annotation (Line(points={{-7.3,-101.73},{17.7,-101.73}}));

  // ---- Connect transformer to node ---------------------------------------------------------

  connect(epp, epp) annotation (Line(
      points={{0,108},{0,108}},
      color={0,127,0},
      thickness=0.5));
  connect(simpleTransformerComplex.epp_p, epp) annotation (Line(
      points={{44,120},{16,120},{16,108},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_b, node_4.epp) annotation (Line(
      points={{133.2,120},{133.2,90},{14,90},{14,72},{20.7,72},{20.7,80.27}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.controlBus, controlBus.GridMeter) annotation();
  connect(simpleTransformerComplex.epp_n, GridMeter.epp_a) annotation (Line(
      points={{64,120},{114.8,120}},
      color={28,108,200},
      thickness=0.5));
  annotation (
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={Rectangle(
          extent={{-240,140},{-120,60}},
          lineColor={102,44,145},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-238,140},{-122,64}},
          textColor={102,44,145},
          horizontalAlignment=TextAlignment.Left,
          textString="Scenario: LV-rural-1
Topology: SimBench 1-LV-rural1--0-sw
Degree of urbanisation: Rural
Technology Mix: Today
Number of Prosumers: 13
Number of PV: 2
Number of BESS: 1
Number of EHP: 1
Number of BEV: 0")}),
    Icon(graphics={
        Ellipse(
          lineColor={0,125,125},
          fillColor=DynamicSelect({255,255,255}, {min(1, max(0, (2 - ((-epp.P - localRenewableProduction.epp.P)/localDemand.epp.P))))*255,min(1, max(0, ((-epp.P - localRenewableProduction.epp.P)/localDemand.epp.P)))*255,0}),
          fillPattern=FillPattern.Solid,
          extent={{-98,-92},{102,108}}),
        Line(
          points={{-80,-32},{-80,-12},{-80,8},{-40,8},{-40,-32}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-86,2},{-60,30},{-34,2}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-32,-12},{-32,8},{-32,28},{8,28},{8,-12}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-38,22},{-12,50},{14,22}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-74,28},{-74,48},{-74,68},{-34,68},{-34,28}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-80,62},{-54,90},{-28,62}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-250,-93},{250,-133}},
          lineColor={0,134,134},
          textString="%LV_rural_1_T")}));
end LV_rural_1_Today;
