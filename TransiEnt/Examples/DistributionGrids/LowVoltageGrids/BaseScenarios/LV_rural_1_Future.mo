within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.BaseScenarios;
model LV_rural_1_Future "Small rural low voltage distribution grid model with future technology penetration"

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

  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String data_local="modelica://TransiEnt/Tables/distribution/" "Directory containing simulation data";

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

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
    loadProfileName="SFH34",
    loadProfileScaleP=4.80121,
    loadProfileScaleQ=4.80121,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST=0.75,
    tappingProfileName="TappingCycle_A_1",
    Q_HP_nom=10274.5,
    A_living=240.06,
    A_wall=106.927,
    A_window=48.0121,
    A_roof=240.06,
    A_ground=240.06,
    V_air=600.151,
    U_wall=0.292076,
    U_window=1.33552,
    U_roof=0.207104,
    U_ground=0.360655,
    thermalMass=31841400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-45.8,-31.73},{-30.8,-16.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_2(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=2.97136,
    loadProfileScaleQ=2.97136,
    usePV=true,
    PV_peakPower=8796.79,
    useBattery=false,
    useEHP=false,
    V_BST=0.5,
    tappingProfileName="TappingCycle_A_2",
    Q_HP_nom=6711.7,
    A_living=148.568,
    A_wall=92.1749,
    A_window=29.7136,
    A_roof=148.568,
    A_ground=148.568,
    V_air=371.42,
    U_wall=0.294812,
    U_window=1.34356,
    U_roof=0.208713,
    U_ground=0.363069,
    thermalMass=22091800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=2,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-45.8,38.27},{-30.8,53.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_3(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=4.06708,
    loadProfileScaleQ=4.06708,
    usePV=true,
    PV_peakPower=12040.7,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST=0.6,
    tappingProfileName="TappingCycle_A_3",
    Q_HP_nom=8736.75,
    A_living=203.354,
    A_wall=101.931,
    A_window=40.6708,
    A_roof=203.354,
    A_ground=203.354,
    V_air=508.385,
    U_wall=0.283437,
    U_window=1.31011,
    U_roof=0.202022,
    U_ground=0.353033,
    thermalMass=28014600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=3,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=4,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{10.2,-31.73},{25.2,-16.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_4(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=3.38319,
    loadProfileScaleQ=3.38319,
    usePV=true,
    PV_peakPower=10016.0,
    useBattery=false,
    useEHP=true,
    V_BST=0.6,
    tappingProfileName="TappingCycle_A_4",
    Q_HP_nom=8910.69,
    A_living=169.159,
    A_wall=96.2294,
    A_window=33.8319,
    A_roof=169.159,
    A_ground=169.159,
    V_air=422.899,
    U_wall=0.421545,
    U_window=1.71631,
    U_roof=0.283262,
    U_ground=0.474893,
    thermalMass=24353500.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=5,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=6,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=7,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{80.2,-31.73},{95.2,-16.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_5(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=4.13378,
    loadProfileScaleQ=4.13378,
    usePV=true,
    PV_peakPower=12238.2,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST=0.75,
    tappingProfileName="TappingCycle_A_5",
    Q_HP_nom=10516.2,
    A_living=206.689,
    A_wall=102.429,
    A_window=41.3378,
    A_roof=206.689,
    A_ground=206.689,
    V_air=516.722,
    U_wall=0.412287,
    U_window=1.68908,
    U_roof=0.277816,
    U_ground=0.466724,
    thermalMass=28366300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=8,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{73.2,3.27},{88.2,18.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_6(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH36",
    loadProfileScaleP=2.28264,
    loadProfileScaleQ=2.28264,
    usePV=true,
    PV_peakPower=6757.82,
    useBattery=false,
    useEHP=false,
    V_BST=0.5,
    tappingProfileName="TappingCycle_A_6",
    Q_HP_nom=6381.04,
    A_living=114.132,
    A_wall=84.0062,
    A_window=22.8264,
    A_roof=114.132,
    A_ground=114.132,
    V_air=285.33,
    U_wall=0.427902,
    U_window=1.73501,
    U_roof=0.287001,
    U_ground=0.480502,
    thermalMass=18182200.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=9,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=10,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{10.2,-66.73},{25.2,-51.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_7(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=5.00053,
    loadProfileScaleQ=5.00053,
    usePV=true,
    PV_peakPower=14804.2,
    useBattery=true,
    Bat_Capacity=8640000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST=0.95,
    tappingProfileName="TappingCycle_A_7",
    Q_HP_nom=12973.2,
    A_living=250.026,
    A_wall=108.117,
    A_window=50.0053,
    A_roof=250.026,
    A_ground=250.026,
    V_air=625.066,
    U_wall=0.446365,
    U_window=1.78931,
    U_roof=0.297862,
    U_ground=0.496793,
    thermalMass=32865100.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=11,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-45.8,-66.73},{-30.8,-51.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_8(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH38",
    loadProfileScaleP=5.91097,
    loadProfileScaleQ=5.91097,
    usePV=true,
    PV_peakPower=17499.6,
    useBattery=false,
    useEHP=true,
    V_BST=0.95,
    tappingProfileName="TappingCycle_A_8",
    Q_HP_nom=14547.0,
    A_living=295.549,
    A_wall=112.806,
    A_window=59.1097,
    A_roof=295.549,
    A_ground=295.549,
    V_air=738.872,
    U_wall=0.415857,
    U_window=1.69958,
    U_roof=0.279916,
    U_ground=0.469874,
    thermalMass=37472700.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=12,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=13,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{129.2,38.27},{144.2,53.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_9(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=2.71967,
    loadProfileScaleQ=2.71967,
    usePV=true,
    PV_peakPower=8051.68,
    useBattery=true,
    Bat_Capacity=8640000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST=0.5,
    tappingProfileName="TappingCycle_A_9",
    Q_HP_nom=6788.15,
    A_living=135.984,
    A_wall=89.4153,
    A_window=27.1967,
    A_roof=135.984,
    A_ground=135.984,
    V_air=339.959,
    U_wall=0.358451,
    U_window=1.53074,
    U_roof=0.246148,
    U_ground=0.419222,
    thermalMass=20683800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=14,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{10.2,38.27},{25.2,53.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_10(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=5.74786,
    loadProfileScaleQ=5.74786,
    usePV=true,
    PV_peakPower=17016.7,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST=0.95,
    tappingProfileName="TappingCycle_A_10",
    Q_HP_nom=14131.2,
    A_living=287.393,
    A_wall=112.048,
    A_window=57.4786,
    A_roof=287.393,
    A_ground=287.393,
    V_air=718.483,
    U_wall=0.41269,
    U_window=1.69026,
    U_roof=0.278053,
    U_ground=0.467079,
    thermalMass=36654800.0,
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
    loadProfileName="SFH16",
    loadProfileScaleP=2.33476,
    loadProfileScaleQ=2.33476,
    usePV=true,
    PV_peakPower=6912.12,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST=0.3,
    tappingProfileName="TappingCycle_A_11",
    Q_HP_nom=5471.64,
    A_living=116.738,
    A_wall=84.6978,
    A_window=23.3476,
    A_roof=116.738,
    A_ground=116.738,
    V_air=291.845,
    U_wall=0.300107,
    U_window=1.35914,
    U_roof=0.211827,
    U_ground=0.367741,
    thermalMass=18484800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=15,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=16,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-45.8,3.27},{-30.8,18.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_12(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    configuration=smartMeterConfiguration,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=3.92714,
    loadProfileScaleQ=3.92714,
    usePV=true,
    PV_peakPower=11626.4,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST=0.75,
    tappingProfileName="TappingCycle_A_12",
    Q_HP_nom=9759.98,
    A_living=196.357,
    A_wall=100.856,
    A_window=39.2714,
    A_roof=196.357,
    A_ground=196.357,
    V_air=490.892,
    U_wall=0.388787,
    U_window=1.61996,
    U_roof=0.263992,
    U_ground=0.445988,
    thermalMass=27273800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=17,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{73.2,38.27},{88.2,53.27}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

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
    usePV=true,
    PV_peakPower=18850.2,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST=0.95,
    tappingProfileName="TappingCycle_A_13",
    Q_HP_nom=13512.0,
    A_living=318.359,
    A_wall=114.754,
    A_window=63.6717,
    A_roof=318.359,
    A_ground=318.359,
    V_air=795.896,
    U_wall=0.30437,
    U_window=1.37168,
    U_roof=0.214335,
    U_ground=0.371503,
    thermalMass=39744700.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=18,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=19,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{10.2,-101.73},{25.2,-86.73}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // ------------------------------------------------------------------------------------------
  //   Interface part
  // ------------------------------------------------------------------------------------------
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-110,40},{-90,60}})));
  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------

  TransiEnt.Components.Electrical.PowerTransformation.SimpleTransformerComplex simpleTransformerComplex(
    UseRatio=false,
    ratio=50,
    U_P=20e3,
    U_S=400,
    epp_p(v(start=20000)),
    epp_n(v(start=400))) annotation (Placement(transformation(extent={{32,136},{52,156}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));

  TransiEnt.Components.Sensors.SmartMeter GridMeter annotation (Placement(transformation(extent={{120,140},{140,160}})));
equation
  // ---- Connect Interfaces ------------------------------------------------------------------
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
      points={{32,146},{0,146},{0,108}},
      color={28,108,200},
      thickness=0.5));

  connect(GridMeter.epp_a, simpleTransformerComplex.epp_n) annotation (Line(
      points={{120.8,150},{104,150},{104,146},{52,146}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_b, node_4.epp) annotation (Line(
      points={{139.2,150},{139.2,90},{14,90},{14,72},{20.7,72},{20.7,80.27}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.controlBus, controlBus.GridMeter) annotation();
  annotation (
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={Rectangle(
          extent={{-240,120},{-120,40}},
          lineColor={102,44,145},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-238,118},{-122,42}},
          textColor={102,44,145},
          horizontalAlignment=TextAlignment.Left,
          textString="Scenario: LV-rural-1
Topology: SimBench 1-LV-rural1--0-sw
Degree of urbanisation: Rural
Technology Mix: Future
Number of Prosumers: 13
Number of PV: 12
Number of BES: 8
Number of EHP: 11
Number of BEV: 19")}),
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
          textString="%LV_rural_1_A")}));
end LV_rural_1_Future;
