within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_TIA;
model LV_urban_6_T
  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String condition_scenario="";

  parameter String data_local="modelica://Scenarios_CyEntEE/LocalData/" + "LV_urban_6/" + condition_scenario + "/" "Directory containing simulation data";

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for battery system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for heating system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for vehicle system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter String weatherLocation = "Hamelin" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter String weatherYear = "2019" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter Boolean useTTEC=false "If lines shall use transient thermal equivalent circuit" annotation (
    Evaluate=true,
    Dialog(group="Line"),
    choices(__Dymola_checkBox=true));

  parameter Boolean useUndergroundTemperature=false "If lines shall use transient thermal equivalent circuit" annotation (
    Evaluate=true,
    Dialog(group="Line"),
    choices(__Dymola_checkBox=true));

  parameter Boolean useUndergroundMoisture=false "If lines shall use transient thermal equivalent circuit" annotation (
    Evaluate=true,
    Dialog(group="Line"),
    choices(__Dymola_checkBox=true));


  // ------------------------------------------------------------------------------------------
  //   Components
  // ------------------------------------------------------------------------------------------

  // ---- TransiEnt Models (SimCenter and ModelStatistics) ------------------------------------

  inner TransiEnt.SimCenter simCenter(redeclare model Ground_Temperature = TransiEnt.Basics.Tables.Ambient.UndergroundTemperature_Duesseldorf_1m_3600s_TMY (use_absolute_path=true, absolute_path="modelica://TransiEnt/Tables/ambient/UndergroundTemperature_Duesseldorf_1m_2017.txt"), electricityPrice(use_absolute_path=true, absolute_path="modelica://TransiEnt/Tables/electricity/ElectricityPrices_DayAhead_EPEX_Spot_2011.txt")) annotation (Placement(transformation(extent={{-90.0,80.0},{-70.0,100.0}})));
  inner TransiEnt.ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-60.0,80.0},{-40.0,100.0}})));

  // ---- Nodes -------------------------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Base.Node node_1(v_n=400) annotation (Placement(transformation(extent={{-33.93,155.9},{-28.93,160.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_2(v_n=400) annotation (Placement(transformation(extent={{-5.93,-159.1},{-0.93,-154.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_3(v_n=400) annotation (Placement(transformation(extent={{-12.93,-12.1},{-7.93,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_4(v_n=400) annotation (Placement(transformation(extent={{15.07,78.9},{20.07,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_5(v_n=400) annotation (Placement(transformation(extent={{71.07,57.9},{76.07,62.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_6(v_n=400) annotation (Placement(transformation(extent={{127.07,-110.1},{132.07,-105.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_7(v_n=400) annotation (Placement(transformation(extent={{-5.93,-40.1},{-0.93,-35.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_8(v_n=400) annotation (Placement(transformation(extent={{-5.93,-138.1},{-0.93,-133.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_9(v_n=400) annotation (Placement(transformation(extent={{127.07,-131.1},{132.07,-126.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_10(v_n=400) annotation (Placement(transformation(extent={{71.07,78.9},{76.07,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_11(v_n=400) annotation (Placement(transformation(extent={{-12.93,36.9},{-7.93,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_12(v_n=400) annotation (Placement(transformation(extent={{15.07,99.9},{20.07,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_13(v_n=400) annotation (Placement(transformation(extent={{-103.93,36.9},{-98.93,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_14(v_n=400) annotation (Placement(transformation(extent={{218.07,-12.1},{223.07,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_15(v_n=400) annotation (Placement(transformation(extent={{218.07,8.9},{223.07,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_16(v_n=400) annotation (Placement(transformation(extent={{-12.93,8.9},{-7.93,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_17(v_n=400) annotation (Placement(transformation(extent={{1.07,57.9},{6.07,62.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_18(v_n=400) annotation (Placement(transformation(extent={{-5.93,-180.1},{-0.93,-175.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_19(v_n=400) annotation (Placement(transformation(extent={{120.07,-229.1},{125.07,-224.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_20(v_n=400) annotation (Placement(transformation(extent={{127.07,-82.1},{132.07,-77.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_21(v_n=400) annotation (Placement(transformation(extent={{-89.93,57.9},{-84.93,62.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_22(v_n=400) annotation (Placement(transformation(extent={{-5.93,-61.1},{-0.93,-56.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_23(v_n=400) annotation (Placement(transformation(extent={{120.07,-180.1},{125.07,-175.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_24(v_n=400) annotation (Placement(transformation(extent={{176.07,29.9},{181.07,34.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_25(v_n=400) annotation (Placement(transformation(extent={{127.07,-61.1},{132.07,-56.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_26(v_n=400) annotation (Placement(transformation(extent={{155.07,78.9},{160.07,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_27(v_n=400) annotation (Placement(transformation(extent={{29.07,36.9},{34.07,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_28(v_n=400) annotation (Placement(transformation(extent={{71.07,99.9},{76.07,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_29(v_n=400) annotation (Placement(transformation(extent={{120.07,-33.1},{125.07,-28.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_30(v_n=400) annotation (Placement(transformation(extent={{-5.93,-110.1},{-0.93,-105.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_31(v_n=400) annotation (Placement(transformation(extent={{71.07,36.9},{76.07,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_32(v_n=400) annotation (Placement(transformation(extent={{155.07,8.9},{160.07,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_33(v_n=400) annotation (Placement(transformation(extent={{-82.93,78.9},{-77.93,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_34(v_n=400) annotation (Placement(transformation(extent={{127.07,-208.1},{132.07,-203.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_35(v_n=400) annotation (Placement(transformation(extent={{-82.93,99.9},{-77.93,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_36(v_n=400) annotation (Placement(transformation(extent={{-61.93,-12.1},{-56.93,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_37(v_n=400) annotation (Placement(transformation(extent={{-61.93,36.9},{-56.93,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_38(v_n=400) annotation (Placement(transformation(extent={{155.07,50.9},{160.07,55.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_39(v_n=400) annotation (Placement(transformation(extent={{155.07,99.9},{160.07,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_40(v_n=400) annotation (Placement(transformation(extent={{120.07,-159.1},{125.07,-154.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_41(v_n=400) annotation (Placement(transformation(extent={{78.07,8.9},{83.07,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_42(v_n=400) annotation (Placement(transformation(extent={{176.07,-33.1},{181.07,-28.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_43(v_n=400) annotation (Placement(transformation(extent={{141.07,-12.1},{146.07,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_44(v_n=400) annotation (Placement(transformation(extent={{-61.93,8.9},{-56.93,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_45(v_n=400) annotation (Placement(transformation(extent={{-5.93,-89.1},{-0.93,-84.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_46(v_n=400) annotation (Placement(transformation(extent={{-110.93,8.9},{-105.93,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_47(v_n=400) annotation (Placement(transformation(extent={{-159.93,99.9},{-154.93,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_48(v_n=400) annotation (Placement(transformation(extent={{-159.93,78.9},{-154.93,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_49(v_n=400) annotation (Placement(transformation(extent={{-159.93,50.9},{-154.93,55.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_50(v_n=400) annotation (Placement(transformation(extent={{-152.93,22.9},{-147.93,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_51(v_n=400) annotation (Placement(transformation(extent={{-152.93,1.9},{-147.93,6.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_52(v_n=400) annotation (Placement(transformation(extent={{-159.93,-26.1},{-154.93,-21.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_53(v_n=400) annotation (Placement(transformation(extent={{-159.93,-47.1},{-154.93,-42.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_54(v_n=400) annotation (Placement(transformation(extent={{-201.93,99.9},{-196.93,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_55(v_n=400) annotation (Placement(transformation(extent={{-243.93,99.9},{-238.93,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_56(v_n=400) annotation (Placement(transformation(extent={{-243.93,78.9},{-238.93,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_57(v_n=400) annotation (Placement(transformation(extent={{-243.93,50.9},{-238.93,55.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_58(v_n=400) annotation (Placement(transformation(extent={{-243.93,22.9},{-238.93,27.9}})));

  // Basic Parameters

  // ---- Lines (between nodes) ---------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Line_new line_1(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=20.265000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-9.43,127.9},{-4.43,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_2(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.753000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-9.43,-26.1},{-4.43,-21.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_3(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=0.216000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{71.07,89.4},{76.07,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_4(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=38.366000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{165.57,19.4},{170.57,24.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_5(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=0.227000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{155.07,64.9},{160.07,69.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_6(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=36.511000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{155.07,89.4},{160.07,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_7(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.038000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{127.07,-96.1},{132.07,-91.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_8(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=24.782000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-75.93,47.4},{-70.93,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_9(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.017000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{123.57,-194.1},{128.57,-189.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_10(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.492000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{127.07,-120.6},{132.07,-115.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_11(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=2.453000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-5.93,47.4},{-0.93,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_12(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.953000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-58.43,127.9},{-53.43,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_13(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=4.278000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{123.57,-47.1},{128.57,-42.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_14(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=24.146000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-96.93,47.4},{-91.93,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_15(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.718000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-5.93,-50.6},{-0.93,-45.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_16(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.759000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{8.07,68.4},{13.07,73.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_17(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.385000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{148.07,-1.6},{153.07,3.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_18(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.171000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-5.93,-124.1},{-0.93,-119.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_19(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=28.324000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-5.93,-148.6},{-0.93,-143.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_20(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.708000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{123.57,-145.1},{128.57,-140.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_21(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=0.216000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{71.07,68.4},{76.07,73.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_22(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.579000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{218.07,-1.6},{223.07,3.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_23(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=15.226000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{127.07,-71.6},{132.07,-66.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_24(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=0.187000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-82.93,89.4},{-77.93,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_25(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=13.120000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-12.93,-1.6},{-7.93,3.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_26(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=17.848000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{15.07,47.4},{20.07,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_27(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=7.492000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-12.93,22.9},{-7.93,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_28(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=20.316000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{197.07,19.4},{202.07,24.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_29(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=22.946000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{74.57,22.9},{79.57,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_30(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=21.516000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{130.57,-22.6},{135.57,-17.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_31(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.473000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{120.07,-169.6},{125.07,-164.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_32(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=13.883000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{71.07,47.4},{76.07,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_33(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=40.150000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{15.07,89.4},{20.07,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_34(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=17.304000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{165.57,40.4},{170.57,45.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_35(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=77.746000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-5.93,-169.6},{-0.93,-164.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_36(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.277000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-5.93,-75.1},{-0.93,-70.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_37(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=13.583000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-86.43,68.4},{-81.43,73.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_38(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=51.665000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{158.57,-22.6},{163.57,-17.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_39(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=7.626000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-5.93,-99.6},{-0.93,-94.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_40(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.383000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{123.57,-218.6},{128.57,-213.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_41(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=36.770000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-61.93,-1.6},{-56.93,3.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_42(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=52.041000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-61.93,22.9},{-56.93,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_43(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=26.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-107.43,22.9},{-102.43,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_44(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=17.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-159.93,89.4},{-154.93,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_45(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=16.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-156.43,36.9},{-151.43,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_46(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=19.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-152.93,12.4},{-147.93,17.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_47(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=22.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-159.93,64.9},{-154.93,69.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_48(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=12.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-156.43,-12.1},{-151.43,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_49(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=20.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-159.93,-36.6},{-154.93,-31.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_50(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=22.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-96.93,127.9},{-91.93,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_51(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=45.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-117.93,127.9},{-112.93,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_52(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-138.93,127.9},{-133.93,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_53(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=16.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-243.93,89.4},{-238.93,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_54(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=15.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-243.93,64.9},{-238.93,69.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_55(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.000000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{-243.93,36.9},{-238.93,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_56(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=29.579000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{60.57,127.9},{65.57,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_57(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.226000,
    i_n=364,
    parallel=1,
    useControlBus=true,
    Line_Params=Models_CyEntEE.CellModels.Data.Records.NAYY_4x240mm2_SE_Data(),
    electricOutput=true,
    simplified_Pi_Model=false,
    useTTEC=useTTEC,
    useUndergroundTemperatureTable=useUndergroundTemperature,
    useUndergroundMoistureTable=useUndergroundMoisture,
    UndergroundTemperaturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Temp_Underground.txt",
    UndergroundMoisturePath=data_local + "WeatherData/" + weatherLocation + "_" + weatherYear + "_Moisture_Underground.txt") annotation (Placement(transformation(extent={{18.57,127.9},{23.57,132.9}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=7.00956,
    loadProfileScaleQ=7.00956,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_1",
    num_BEVs=0) annotation (Placement(transformation(extent={{7.07,-12.1},{22.07,2.9}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH12",
    loadProfileScaleP=3.40008,
    loadProfileScaleQ=3.40008,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_2",
    num_BEVs=0) annotation (Placement(transformation(extent={{35.07,99.9},{50.07,114.9}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.68937,
    loadProfileScaleQ=3.68937,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_3",
    num_BEVs=0) annotation (Placement(transformation(extent={{147.07,-110.1},{162.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_4(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=5.25163,
    loadProfileScaleQ=5.25163,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_4",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.07,-180.1},{29.07,-165.1}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH17",
    loadProfileScaleP=6.15936,
    loadProfileScaleQ=6.15936,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_5",
    num_BEVs=0) annotation (Placement(transformation(extent={{35.07,78.9},{50.07,93.9}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH16",
    loadProfileScaleP=2.71136,
    loadProfileScaleQ=2.71136,
    usePV=true,
    PV_peakPower=8027.05,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_6",
    num_BEVs=0) annotation (Placement(transformation(extent={{-41.93,-12.1},{-26.93,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_7(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=3.67504,
    loadProfileScaleQ=3.67504,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_7",
    num_BEVs=0) annotation (Placement(transformation(extent={{238.07,8.9},{253.07,23.9}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=3.61936,
    loadProfileScaleQ=3.61936,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_8",
    num_BEVs=0) annotation (Placement(transformation(extent={{91.07,78.9},{106.07,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_9(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=3.14839,
    loadProfileScaleQ=3.14839,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_9",
    Q_HP_nom=8440.13,
    A_living=163.601,
    A_wall=95.1864,
    A_window=32.7202,
    A_roof=163.601,
    A_ground=163.601,
    V_air=409.003,
    U_wall=0.401421,
    U_window=1.65712,
    U_roof=0.271424,
    U_ground=0.457136,
    thermalMass=23747700.0,
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-41.93,36.9},{-26.93,51.9}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=3.4053,
    loadProfileScaleQ=3.4053,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_10",
    num_BEVs=0) annotation (Placement(transformation(extent={{238.07,-12.1},{253.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_11(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH40",
    loadProfileScaleP=3.27202,
    loadProfileScaleQ=3.27202,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_11",
    num_BEVs=0) annotation (Placement(transformation(extent={{147.07,-131.1},{162.07,-116.1}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=3.92714,
    loadProfileScaleQ=3.92714,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_12",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.07,-89.1},{29.07,-74.1}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=10.6671,
    loadProfileScaleQ=10.6671,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 1.5,
    tappingProfileName="TappingCycle_T_13",
    num_BEVs=0) annotation (Placement(transformation(extent={{-83.93,36.9},{-68.93,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_14(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=3.26084,
    loadProfileScaleQ=3.26084,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_14",
    num_BEVs=0) annotation (Placement(transformation(extent={{49.07,36.9},{64.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_15(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=6.62193,
    loadProfileScaleQ=6.62193,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_15",
    num_BEVs=0) annotation (Placement(transformation(extent={{7.07,36.9},{22.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_16(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=6.29437,
    loadProfileScaleQ=6.29437,
    usePV=true,
    PV_peakPower=18634.67,
    useBattery=true,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_16",
    num_BEVs=0) annotation (Placement(transformation(extent={{140.07,-180.1},{155.07,-165.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_17(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH35",
    loadProfileScaleP=3.94704,
    loadProfileScaleQ=3.94704,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_17",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.07,-61.1},{29.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_18(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.09742,
    loadProfileScaleQ=3.09742,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_18",
    Q_HP_nom=8274.19,
    A_living=154.871,
    A_wall=93.473,
    A_window=30.9742,
    A_roof=154.871,
    A_ground=154.871,
    V_air=387.178,
    U_wall=0.424161,
    U_window=1.724,
    U_roof=0.284801,
    U_ground=0.477201,
    thermalMass=22789400.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-41.93,8.9},{-26.93,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_19(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=4.68202,
    loadProfileScaleQ=4.68202,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_19",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.07,-138.1},{29.07,-123.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_20(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.77295,
    loadProfileScaleQ=2.77295,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_20",
    num_BEVs=0) annotation (Placement(transformation(extent={{7.07,8.9},{22.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_21(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=1.92351,
    loadProfileScaleQ=1.92351,
    usePV=true,
    PV_peakPower=5694.59,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_21",
    num_BEVs=0) annotation (Placement(transformation(extent={{147.07,-61.1},{162.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_22(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=3.52681,
    loadProfileScaleQ=3.52681,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_22",
    num_BEVs=0) annotation (Placement(transformation(extent={{196.07,-33.1},{211.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_23(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=4.9577,
    loadProfileScaleQ=4.9577,
    usePV=true,
    PV_peakPower=14677.4,
    useBattery=true,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_23",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.07,-110.1},{29.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_24(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=2.82892,
    loadProfileScaleQ=2.82892,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_24",
    num_BEVs=0) annotation (Placement(transformation(extent={{175.07,8.9},{190.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_25(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH20",
    loadProfileScaleP=5.26606,
    loadProfileScaleQ=5.26606,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_25",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.07,-159.1},{29.07,-144.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_26(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH39",
    loadProfileScaleP=3.404,
    loadProfileScaleQ=3.404,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_26",
    num_BEVs=0) annotation (Placement(transformation(extent={{98.07,8.9},{113.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_27(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.71792,
    loadProfileScaleQ=3.71792,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_27",
    num_BEVs=0) annotation (Placement(transformation(extent={{91.07,99.9},{106.07,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_28(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=3.60145,
    loadProfileScaleQ=3.60145,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_28",
    num_BEVs=0) annotation (Placement(transformation(extent={{175.07,99.9},{190.07,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_29(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=6.89392,
    loadProfileScaleQ=6.89392,
    usePV=true,
    PV_peakPower=20409.6,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_29",
    num_BEVs=0) annotation (Placement(transformation(extent={{140.07,-229.1},{155.07,-214.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_30(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=4.42972,
    loadProfileScaleQ=4.42972,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_30",
    Q_HP_nom=10219.3,
    A_living=221.486,
    A_wall=104.527,
    A_window=44.2972,
    A_roof=221.486,
    A_ground=221.486,
    V_air=553.715,
    U_wall=0.341196,
    U_window=1.47999,
    U_roof=0.235998,
    U_ground=0.403997,
    thermalMass=29916700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{175.07,50.9},{190.07,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_31(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH18",
    loadProfileScaleP=3.77252,
    loadProfileScaleQ=3.77252,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_31",
    num_BEVs=0) annotation (Placement(transformation(extent={{91.07,57.9},{106.07,72.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_32(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=6.03146,
    loadProfileScaleQ=6.03146,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_32",
    num_BEVs=0) annotation (Placement(transformation(extent={{140.07,-159.1},{155.07,-144.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_33(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH22",
    loadProfileScaleP=3.25115,
    loadProfileScaleQ=3.25115,
    usePV=true,
    PV_peakPower=9625.08,
    useBattery=true,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_33",
    num_BEVs=0) annotation (Placement(transformation(extent={{175.07,78.9},{190.07,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_34(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH39",
    loadProfileScaleP=2.2096,
    loadProfileScaleQ=2.2096,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_34",
    num_BEVs=0) annotation (Placement(transformation(extent={{147.07,-208.1},{162.07,-193.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_35(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=3.95723,
    loadProfileScaleQ=3.95723,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_35",
    num_BEVs=0) annotation (Placement(transformation(extent={{91.07,36.9},{106.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_36(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=3.27817,
    loadProfileScaleQ=3.27817,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_36",
    num_BEVs=0) annotation (Placement(transformation(extent={{-62.93,99.9},{-47.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_37(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=6.74268,
    loadProfileScaleQ=6.74268,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_37",
    num_BEVs=0) annotation (Placement(transformation(extent={{140.07,-33.1},{155.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_38(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH5",
    loadProfileScaleP=3.80119,
    loadProfileScaleQ=3.80119,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_38",
    num_BEVs=0) annotation (Placement(transformation(extent={{-62.93,78.9},{-47.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_39(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=3.00634,
    loadProfileScaleQ=3.00634,
    usePV=true,
    PV_peakPower=8900.35,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_39",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.07,-40.1},{29.07,-25.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_40(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH18",
    loadProfileScaleP=3.04885,
    loadProfileScaleQ=3.04885,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_40",
    num_BEVs=0) annotation (Placement(transformation(extent={{147.07,-82.1},{162.07,-67.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_41(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=3.17077,
    loadProfileScaleQ=3.17077,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_41",
    num_BEVs=0) annotation (Placement(transformation(extent={{-90.93,8.9},{-75.93,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_42(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=2.48999,
    loadProfileScaleQ=2.48999,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_42",
    num_BEVs=0) annotation (Placement(transformation(extent={{-139.93,99.9},{-124.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_43(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=2.34686,
    loadProfileScaleQ=2.34686,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_43",
    num_BEVs=0) annotation (Placement(transformation(extent={{-139.93,78.9},{-124.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_44(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=4.67043,
    loadProfileScaleQ=4.67043,
    usePV=true,
    PV_peakPower=13826.9,
    useBattery=true,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_44",
    num_BEVs=0) annotation (Placement(transformation(extent={{-139.93,50.9},{-124.93,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_45(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=2.35796,
    loadProfileScaleQ=2.35796,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_45",
    num_BEVs=0) annotation (Placement(transformation(extent={{-132.93,22.9},{-117.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_46(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH38",
    loadProfileScaleP=2.98096,
    loadProfileScaleQ=2.98096,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_46",
    Q_HP_nom=6982.75,
    A_living=149.048,
    A_wall=92.2756,
    A_window=29.8096,
    A_roof=149.048,
    A_ground=149.048,
    V_air=372.62,
    U_wall=0.320442,
    U_window=1.41895,
    U_roof=0.223789,
    U_ground=0.385684,
    thermalMass=22145100.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-132.93,1.9},{-117.93,16.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_47(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH16",
    loadProfileScaleP=2.5736,
    loadProfileScaleQ=2.5736,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_47",
    num_BEVs=0) annotation (Placement(transformation(extent={{-139.93,-26.1},{-124.93,-11.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_48(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH17",
    loadProfileScaleP=3.58875,
    loadProfileScaleQ=3.58875,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_48",
    num_BEVs=0) annotation (Placement(transformation(extent={{-139.93,-47.1},{-124.93,-32.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_49(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH18",
    loadProfileScaleP=6.81058,
    loadProfileScaleQ=6.81058,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_49",
    num_BEVs=0) annotation (Placement(transformation(extent={{-181.93,99.9},{-166.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_50(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH35",
    loadProfileScaleP=2.50642,
    loadProfileScaleQ=2.50642,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_50",
    Q_HP_nom=6508.47,
    A_living=125.321,
    A_wall=86.8827,
    A_window=25.0642,
    A_roof=125.321,
    A_ground=125.321,
    V_air=313.302,
    U_wall=0.380285,
    U_window=1.59495,
    U_roof=0.258991,
    U_ground=0.438486,
    thermalMass=19472900.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-223.93,99.9},{-208.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_51(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.16506,
    loadProfileScaleQ=2.16506,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_51",
    num_BEVs=0) annotation (Placement(transformation(extent={{-203.93,99.9},{-188.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_52(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH30",
    loadProfileScaleP=2.80624,
    loadProfileScaleQ=2.80624,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_52",
    num_BEVs=0) annotation (Placement(transformation(extent={{-223.93,78.9},{-208.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_53(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH10",
    loadProfileScaleP=2.35739,
    loadProfileScaleQ=2.35739,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_53",
    num_BEVs=0) annotation (Placement(transformation(extent={{-203.93,78.9},{-188.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_54(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH12",
    loadProfileScaleP=2.02247,
    loadProfileScaleQ=2.02247,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_54",
    num_BEVs=0) annotation (Placement(transformation(extent={{-223.93,50.9},{-208.93,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_55(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=2.5987,
    loadProfileScaleQ=2.5987,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_55",
    num_BEVs=0) annotation (Placement(transformation(extent={{-203.93,50.9},{-188.93,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_56(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=2.82695,
    loadProfileScaleQ=2.82695,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_56",
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=3,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-223.93,22.9},{-208.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_57(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH38",
    loadProfileScaleP=2.64605,
    loadProfileScaleQ=2.64605,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_57",
    num_BEVs=0) annotation (Placement(transformation(extent={{-203.93,22.9},{-188.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_58(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=3.35124,
    loadProfileScaleQ=3.35124,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_58",
    num_BEVs=0) annotation (Placement(transformation(extent={{-119.93,99.9},{-104.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_59(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH22",
    loadProfileScaleP=2.88284,
    loadProfileScaleQ=2.88284,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_59",
    num_BEVs=0) annotation (Placement(transformation(extent={{-119.93,78.9},{-104.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_60(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.01863,
    loadProfileScaleQ=3.01863,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_60",
    num_BEVs=0) annotation (Placement(transformation(extent={{-119.93,50.9},{-104.93,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_61(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=2.27656,
    loadProfileScaleQ=2.27656,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_61",
    num_BEVs=0) annotation (Placement(transformation(extent={{-112.93,22.9},{-97.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_62(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=2.43301,
    loadProfileScaleQ=2.43301,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_62",
    num_BEVs=0) annotation (Placement(transformation(extent={{-92.93,22.9},{-77.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_63(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH35",
    loadProfileScaleP=2.20622,
    loadProfileScaleQ=2.20622,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_63",
    Q_HP_nom=5462.64,
    A_living=110.311,
    A_wall=82.9668,
    A_window=22.0622,
    A_roof=110.311,
    A_ground=110.311,
    V_air=275.777,
    U_wall=0.333005,
    U_window=1.4559,
    U_roof=0.23118,
    U_ground=0.396769,
    thermalMass=17736200.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-72.93,22.9},{-57.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_64(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=2.33686,
    loadProfileScaleQ=2.33686,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_64",
    num_BEVs=0) annotation (Placement(transformation(extent={{-112.93,1.9},{-97.93,16.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_65(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.28871,
    loadProfileScaleQ=3.28871,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_65",
    num_BEVs=0) annotation (Placement(transformation(extent={{-92.93,1.9},{-77.93,16.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_66(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH36",
    loadProfileScaleP=2.99911,
    loadProfileScaleQ=2.99911,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_66",
    num_BEVs=0) annotation (Placement(transformation(extent={{-119.93,-26.1},{-104.93,-11.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_67(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.3849,
    loadProfileScaleQ=2.3849,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_67",
    num_BEVs=0) annotation (Placement(transformation(extent={{-42.93,99.9},{-27.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_68(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.43139,
    loadProfileScaleQ=3.43139,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_68",
    num_BEVs=0) annotation (Placement(transformation(extent={{-42.93,78.9},{-27.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_69(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=2.74635,
    loadProfileScaleQ=2.74635,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_69",
    num_BEVs=0) annotation (Placement(transformation(extent={{-70.93,8.9},{-55.93,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_70(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH10",
    loadProfileScaleP=3.22597,
    loadProfileScaleQ=3.22597,
    usePV=true,
    PV_peakPower=9550.6,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_70",
    num_BEVs=0) annotation (Placement(transformation(extent={{-21.93,36.9},{-6.93,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_71(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=3.56455,
    loadProfileScaleQ=3.56455,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_71",
    num_BEVs=0) annotation (Placement(transformation(extent={{-21.93,8.9},{-6.93,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_72(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=3.26449,
    loadProfileScaleQ=3.26449,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_72",
    num_BEVs=0) annotation (Placement(transformation(extent={{-21.93,-12.1},{-6.93,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_73(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=3.7697,
    loadProfileScaleQ=3.7697,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_73",
    num_BEVs=0) annotation (Placement(transformation(extent={{-1.93,-12.1},{13.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_74(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=2.58259,
    loadProfileScaleQ=2.58259,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_74",
    num_BEVs=0) annotation (Placement(transformation(extent={{55.07,99.9},{70.07,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_75(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=3.40117,
    loadProfileScaleQ=3.40117,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_75",
    num_BEVs=0) annotation (Placement(transformation(extent={{69.07,36.9},{84.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_76(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=2.85759,
    loadProfileScaleQ=2.85759,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_76",
    num_BEVs=0) annotation (Placement(transformation(extent={{89.07,36.9},{104.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_77(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH19",
    loadProfileScaleP=2.7646,
    loadProfileScaleQ=2.7646,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_77",
    num_BEVs=0) annotation (Placement(transformation(extent={{109.07,36.9},{124.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_78(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=2.32336,
    loadProfileScaleQ=2.32336,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_78",
    num_BEVs=0) annotation (Placement(transformation(extent={{27.07,8.9},{42.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_79(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH10",
    loadProfileScaleP=3.97541,
    loadProfileScaleQ=3.97541,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_79",
    num_BEVs=0) annotation (Placement(transformation(extent={{34.07,-40.1},{49.07,-25.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_80(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=2.64087,
    loadProfileScaleQ=2.64087,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_80",
    num_BEVs=0) annotation (Placement(transformation(extent={{54.07,-40.1},{69.07,-25.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_81(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH19",
    loadProfileScaleP=3.94291,
    loadProfileScaleQ=3.94291,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_81",
    num_BEVs=0) annotation (Placement(transformation(extent={{34.07,-89.1},{49.07,-74.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_82(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=4.5816,
    loadProfileScaleQ=4.5816,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_82",
    num_BEVs=0) annotation (Placement(transformation(extent={{34.07,-61.1},{49.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_83(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=2.84562,
    loadProfileScaleQ=2.84562,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_83",
    num_BEVs=0) annotation (Placement(transformation(extent={{54.07,-61.1},{69.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_84(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH16",
    loadProfileScaleP=3.75736,
    loadProfileScaleQ=3.75736,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_84",
    num_BEVs=0) annotation (Placement(transformation(extent={{34.07,-110.1},{49.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_85(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH36",
    loadProfileScaleP=3.94413,
    loadProfileScaleQ=3.94413,
    usePV=true,
    PV_peakPower=11676.7,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_85",
    num_BEVs=0) annotation (Placement(transformation(extent={{34.07,-138.1},{49.07,-123.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_86(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=4.14794,
    loadProfileScaleQ=4.14794,
    usePV=true,
    PV_peakPower=12280.1,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_86",
    num_BEVs=0) annotation (Placement(transformation(extent={{34.07,-159.1},{49.07,-144.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_87(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=3.78939,
    loadProfileScaleQ=3.78939,
    usePV=true,
    PV_peakPower=11218.6,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_87",
    num_BEVs=0) annotation (Placement(transformation(extent={{54.07,-159.1},{69.07,-144.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_88(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=4.04122,
    loadProfileScaleQ=4.04122,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_88",
    num_BEVs=0) annotation (Placement(transformation(extent={{34.07,-180.1},{49.07,-165.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_89(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH12",
    loadProfileScaleP=3.15967,
    loadProfileScaleQ=3.15967,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_89",
    num_BEVs=0) annotation (Placement(transformation(extent={{118.07,8.9},{133.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_90(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=3.72723,
    loadProfileScaleQ=3.72723,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_90",
    num_BEVs=0) annotation (Placement(transformation(extent={{258.07,8.9},{273.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_91(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=2.4112,
    loadProfileScaleQ=2.4112,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_91",
    Q_HP_nom=6798.08,
    A_living=120.56,
    A_wall=85.6878,
    A_window=24.112,
    A_roof=120.56,
    A_ground=120.56,
    V_air=301.4,
    U_wall=0.441053,
    U_window=1.77369,
    U_roof=0.294737,
    U_ground=0.492106,
    thermalMass=18926400.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{278.07,8.9},{293.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_92(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=3.81122,
    loadProfileScaleQ=3.81122,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_92",
    Q_HP_nom=9689.29,
    A_living=190.561,
    A_wall=99.9317,
    A_window=38.1122,
    A_roof=190.561,
    A_ground=190.561,
    V_air=476.403,
    U_wall=0.404245,
    U_window=1.66543,
    U_roof=0.273086,
    U_ground=0.459628,
    thermalMass=26657200.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{258.07,-12.1},{273.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_93(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=2.71693,
    loadProfileScaleQ=2.71693,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_93",
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=4,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{278.07,-12.1},{293.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_94(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.10111,
    loadProfileScaleQ=3.10111,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_94",
    num_BEVs=0) annotation (Placement(transformation(extent={{298.07,-12.1},{313.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_95(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=3.37818,
    loadProfileScaleQ=3.37818,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_95",
    Q_HP_nom=8318.23,
    A_living=168.909,
    A_wall=96.1832,
    A_window=33.7818,
    A_roof=168.909,
    A_ground=168.909,
    V_air=422.273,
    U_wall=0.368094,
    U_window=1.5591,
    U_roof=0.25182,
    U_ground=0.42773,
    thermalMass=24326300.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{195.07,8.9},{210.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_96(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=2.96608,
    loadProfileScaleQ=2.96608,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_96",
    num_BEVs=0) annotation (Placement(transformation(extent={{215.07,8.9},{230.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_97(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=2.61804,
    loadProfileScaleQ=2.61804,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_97",
    num_BEVs=0) annotation (Placement(transformation(extent={{235.07,8.9},{250.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_98(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=4.09294,
    loadProfileScaleQ=4.09294,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_98",
    num_BEVs=0) annotation (Placement(transformation(extent={{216.07,-33.1},{231.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_99(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=3.26346,
    loadProfileScaleQ=3.26346,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_99",
    num_BEVs=0) annotation (Placement(transformation(extent={{236.07,-33.1},{251.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_100(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=2.81378,
    loadProfileScaleQ=2.81378,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_100",
    num_BEVs=0) annotation (Placement(transformation(extent={{256.07,-33.1},{271.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_101(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH10",
    loadProfileScaleP=4.14158,
    loadProfileScaleQ=4.14158,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_101",
    num_BEVs=0) annotation (Placement(transformation(extent={{167.07,-61.1},{182.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_102(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=2.52612,
    loadProfileScaleQ=2.52612,
    usePV=true,
    PV_peakPower=7478.64,
    useBattery=true,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_102",
    num_BEVs=0) annotation (Placement(transformation(extent={{187.07,-61.1},{202.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_103(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.56476,
    loadProfileScaleQ=2.56476,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_103",
    num_BEVs=0) annotation (Placement(transformation(extent={{167.07,-82.1},{182.07,-67.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_104(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH40",
    loadProfileScaleP=3.6847,
    loadProfileScaleQ=3.6847,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_104",
    num_BEVs=0) annotation (Placement(transformation(extent={{187.07,-82.1},{202.07,-67.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_105(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH40",
    loadProfileScaleP=2.61344,
    loadProfileScaleQ=2.61344,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_105",
    num_BEVs=0) annotation (Placement(transformation(extent={{167.07,-110.1},{182.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_106(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH5",
    loadProfileScaleP=4.17181,
    loadProfileScaleQ=4.17181,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_106",
    num_BEVs=0) annotation (Placement(transformation(extent={{187.07,-110.1},{202.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_107(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=2.99319,
    loadProfileScaleQ=2.99319,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_107",
    num_BEVs=0) annotation (Placement(transformation(extent={{167.07,-131.1},{182.07,-116.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_108(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH20",
    loadProfileScaleP=2.82627,
    loadProfileScaleQ=2.82627,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_108",
    num_BEVs=0) annotation (Placement(transformation(extent={{187.07,-131.1},{202.07,-116.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_109(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=3.57426,
    loadProfileScaleQ=3.57426,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_109",
    num_BEVs=0) annotation (Placement(transformation(extent={{207.07,-131.1},{222.07,-116.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_110(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=3.94026,
    loadProfileScaleQ=3.94026,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_110",
    num_BEVs=0) annotation (Placement(transformation(extent={{167.07,-208.1},{182.07,-193.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_111(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH20",
    loadProfileScaleP=4.13378,
    loadProfileScaleQ=4.13378,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_111",
    num_BEVs=0) annotation (Placement(transformation(extent={{187.07,-208.1},{202.07,-193.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.PowerTransformation.SimpleTransformerComplex simpleTransformerComplex(
    UseRatio=false,
    ratio=50,
    U_P=10e3,
    U_S=400,
    epp_p(v(start=10000)),
    epp_n(v(start=400))) annotation (Placement(transformation(extent={{-114,174},{-94,194}})));
  Models_CyEntEE.CellModels.CPP.DecouplingGrids decouplingGrids annotation (Placement(transformation(extent={{-74,174},{-54,194}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));

  // ------------------------------------------------------------------------------------------
  //   Interface part
  // ------------------------------------------------------------------------------------------
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-110,40},{-90,60}})));
  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------
  TransiEnt.Components.Sensors.SmartMeter GridMeter annotation (Placement(transformation(extent={{-40,174},{-20,194}})));
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
  connect(controlBus.household_14, household_14.controlBus) annotation();
  connect(controlBus.household_15, household_15.controlBus) annotation();
  connect(controlBus.household_16, household_16.controlBus) annotation();
  connect(controlBus.household_17, household_17.controlBus) annotation();
  connect(controlBus.household_18, household_18.controlBus) annotation();
  connect(controlBus.household_19, household_19.controlBus) annotation();
  connect(controlBus.household_20, household_20.controlBus) annotation();
  connect(controlBus.household_21, household_21.controlBus) annotation();
  connect(controlBus.household_22, household_22.controlBus) annotation();
  connect(controlBus.household_23, household_23.controlBus) annotation();
  connect(controlBus.household_24, household_24.controlBus) annotation();
  connect(controlBus.household_25, household_25.controlBus) annotation();
  connect(controlBus.household_26, household_26.controlBus) annotation();
  connect(controlBus.household_27, household_27.controlBus) annotation();
  connect(controlBus.household_28, household_28.controlBus) annotation();
  connect(controlBus.household_29, household_29.controlBus) annotation();
  connect(controlBus.household_30, household_30.controlBus) annotation();
  connect(controlBus.household_31, household_31.controlBus) annotation();
  connect(controlBus.household_32, household_32.controlBus) annotation();
  connect(controlBus.household_33, household_33.controlBus) annotation();
  connect(controlBus.household_34, household_34.controlBus) annotation();
  connect(controlBus.household_35, household_35.controlBus) annotation();
  connect(controlBus.household_36, household_36.controlBus) annotation();
  connect(controlBus.household_37, household_37.controlBus) annotation();
  connect(controlBus.household_38, household_38.controlBus) annotation();
  connect(controlBus.household_39, household_39.controlBus) annotation();
  connect(controlBus.household_40, household_40.controlBus) annotation();
  connect(controlBus.household_41, household_41.controlBus) annotation();
  connect(controlBus.household_42, household_42.controlBus) annotation();
  connect(controlBus.household_43, household_43.controlBus) annotation();
  connect(controlBus.household_44, household_44.controlBus) annotation();
  connect(controlBus.household_45, household_45.controlBus) annotation();
  connect(controlBus.household_46, household_46.controlBus) annotation();
  connect(controlBus.household_47, household_47.controlBus) annotation();
  connect(controlBus.household_48, household_48.controlBus) annotation();
  connect(controlBus.household_49, household_49.controlBus) annotation();
  connect(controlBus.household_50, household_50.controlBus) annotation();
  connect(controlBus.household_51, household_51.controlBus) annotation();
  connect(controlBus.household_52, household_52.controlBus) annotation();
  connect(controlBus.household_53, household_53.controlBus) annotation();
  connect(controlBus.household_54, household_54.controlBus) annotation();
  connect(controlBus.household_55, household_55.controlBus) annotation();
  connect(controlBus.household_56, household_56.controlBus) annotation();
  connect(controlBus.household_57, household_57.controlBus) annotation();
  connect(controlBus.household_58, household_58.controlBus) annotation();
  connect(controlBus.household_59, household_59.controlBus) annotation();
  connect(controlBus.household_60, household_60.controlBus) annotation();
  connect(controlBus.household_61, household_61.controlBus) annotation();
  connect(controlBus.household_62, household_62.controlBus) annotation();
  connect(controlBus.household_63, household_63.controlBus) annotation();
  connect(controlBus.household_64, household_64.controlBus) annotation();
  connect(controlBus.household_65, household_65.controlBus) annotation();
  connect(controlBus.household_66, household_66.controlBus) annotation();
  connect(controlBus.household_67, household_67.controlBus) annotation();
  connect(controlBus.household_68, household_68.controlBus) annotation();
  connect(controlBus.household_69, household_69.controlBus) annotation();
  connect(controlBus.household_70, household_70.controlBus) annotation();
  connect(controlBus.household_71, household_71.controlBus) annotation();
  connect(controlBus.household_72, household_72.controlBus) annotation();
  connect(controlBus.household_73, household_73.controlBus) annotation();
  connect(controlBus.household_74, household_74.controlBus) annotation();
  connect(controlBus.household_75, household_75.controlBus) annotation();
  connect(controlBus.household_76, household_76.controlBus) annotation();
  connect(controlBus.household_77, household_77.controlBus) annotation();
  connect(controlBus.household_78, household_78.controlBus) annotation();
  connect(controlBus.household_79, household_79.controlBus) annotation();
  connect(controlBus.household_80, household_80.controlBus) annotation();
  connect(controlBus.household_81, household_81.controlBus) annotation();
  connect(controlBus.household_82, household_82.controlBus) annotation();
  connect(controlBus.household_83, household_83.controlBus) annotation();
  connect(controlBus.household_84, household_84.controlBus) annotation();
  connect(controlBus.household_85, household_85.controlBus) annotation();
  connect(controlBus.household_86, household_86.controlBus) annotation();
  connect(controlBus.household_87, household_87.controlBus) annotation();
  connect(controlBus.household_88, household_88.controlBus) annotation();
  connect(controlBus.household_89, household_89.controlBus) annotation();
  connect(controlBus.household_90, household_90.controlBus) annotation();
  connect(controlBus.household_91, household_91.controlBus) annotation();
  connect(controlBus.household_92, household_92.controlBus) annotation();
  connect(controlBus.household_93, household_93.controlBus) annotation();
  connect(controlBus.household_94, household_94.controlBus) annotation();
  connect(controlBus.household_95, household_95.controlBus) annotation();
  connect(controlBus.household_96, household_96.controlBus) annotation();
  connect(controlBus.household_97, household_97.controlBus) annotation();
  connect(controlBus.household_98, household_98.controlBus) annotation();
  connect(controlBus.household_99, household_99.controlBus) annotation();
  connect(controlBus.household_100, household_100.controlBus) annotation();
  connect(controlBus.household_101, household_101.controlBus) annotation();
  connect(controlBus.household_102, household_102.controlBus) annotation();
  connect(controlBus.household_103, household_103.controlBus) annotation();
  connect(controlBus.household_104, household_104.controlBus) annotation();
  connect(controlBus.household_105, household_105.controlBus) annotation();
  connect(controlBus.household_106, household_106.controlBus) annotation();
  connect(controlBus.household_107, household_107.controlBus) annotation();
  connect(controlBus.household_108, household_108.controlBus) annotation();
  connect(controlBus.household_109, household_109.controlBus) annotation();
  connect(controlBus.household_110, household_110.controlBus) annotation();
  connect(controlBus.household_111, household_111.controlBus) annotation();
  connect(controlBus.line_1, line_1.controlBus) annotation();
  connect(controlBus.line_2, line_2.controlBus) annotation();
  connect(controlBus.line_3, line_3.controlBus) annotation();
  connect(controlBus.line_4, line_4.controlBus) annotation();
  connect(controlBus.line_5, line_5.controlBus) annotation();
  connect(controlBus.line_6, line_6.controlBus) annotation();
  connect(controlBus.line_7, line_7.controlBus) annotation();
  connect(controlBus.line_8, line_8.controlBus) annotation();
  connect(controlBus.line_9, line_9.controlBus) annotation();
  connect(controlBus.line_10, line_10.controlBus) annotation();
  connect(controlBus.line_11, line_11.controlBus) annotation();
  connect(controlBus.line_12, line_12.controlBus) annotation();
  connect(controlBus.line_13, line_13.controlBus) annotation();
  connect(controlBus.line_14, line_14.controlBus) annotation();
  connect(controlBus.line_15, line_15.controlBus) annotation();
  connect(controlBus.line_16, line_16.controlBus) annotation();
  connect(controlBus.line_17, line_17.controlBus) annotation();
  connect(controlBus.line_18, line_18.controlBus) annotation();
  connect(controlBus.line_19, line_19.controlBus) annotation();
  connect(controlBus.line_20, line_20.controlBus) annotation();
  connect(controlBus.line_21, line_21.controlBus) annotation();
  connect(controlBus.line_22, line_22.controlBus) annotation();
  connect(controlBus.line_23, line_23.controlBus) annotation();
  connect(controlBus.line_24, line_24.controlBus) annotation();
  connect(controlBus.line_25, line_25.controlBus) annotation();
  connect(controlBus.line_26, line_26.controlBus) annotation();
  connect(controlBus.line_27, line_27.controlBus) annotation();
  connect(controlBus.line_28, line_28.controlBus) annotation();
  connect(controlBus.line_29, line_29.controlBus) annotation();
  connect(controlBus.line_30, line_30.controlBus) annotation();
  connect(controlBus.line_31, line_31.controlBus) annotation();
  connect(controlBus.line_32, line_32.controlBus) annotation();
  connect(controlBus.line_33, line_33.controlBus) annotation();
  connect(controlBus.line_34, line_34.controlBus) annotation();
  connect(controlBus.line_35, line_35.controlBus) annotation();
  connect(controlBus.line_36, line_36.controlBus) annotation();
  connect(controlBus.line_37, line_37.controlBus) annotation();
  connect(controlBus.line_38, line_38.controlBus) annotation();
  connect(controlBus.line_39, line_39.controlBus) annotation();
  connect(controlBus.line_40, line_40.controlBus) annotation();
  connect(controlBus.line_41, line_41.controlBus) annotation();
  connect(controlBus.line_42, line_42.controlBus) annotation();
  connect(controlBus.line_43, line_43.controlBus) annotation();
  connect(controlBus.line_44, line_44.controlBus) annotation();
  connect(controlBus.line_45, line_45.controlBus) annotation();
  connect(controlBus.line_46, line_46.controlBus) annotation();
  connect(controlBus.line_47, line_47.controlBus) annotation();
  connect(controlBus.line_48, line_48.controlBus) annotation();
  connect(controlBus.line_49, line_49.controlBus) annotation();
  connect(controlBus.line_50, line_50.controlBus) annotation();
  connect(controlBus.line_51, line_51.controlBus) annotation();
  connect(controlBus.line_52, line_52.controlBus) annotation();
  connect(controlBus.line_53, line_53.controlBus) annotation();
  connect(controlBus.line_54, line_54.controlBus) annotation();
  connect(controlBus.line_55, line_55.controlBus) annotation();
  connect(controlBus.line_56, line_56.controlBus) annotation();
  connect(controlBus.line_57, line_57.controlBus) annotation();
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
  connect(controlBus.node_15, node_15.controlBus) annotation();
  connect(controlBus.node_16, node_16.controlBus) annotation();
  connect(controlBus.node_17, node_17.controlBus) annotation();
  connect(controlBus.node_18, node_18.controlBus) annotation();
  connect(controlBus.node_19, node_19.controlBus) annotation();
  connect(controlBus.node_20, node_20.controlBus) annotation();
  connect(controlBus.node_21, node_21.controlBus) annotation();
  connect(controlBus.node_22, node_22.controlBus) annotation();
  connect(controlBus.node_23, node_23.controlBus) annotation();
  connect(controlBus.node_24, node_24.controlBus) annotation();
  connect(controlBus.node_25, node_25.controlBus) annotation();
  connect(controlBus.node_26, node_26.controlBus) annotation();
  connect(controlBus.node_27, node_27.controlBus) annotation();
  connect(controlBus.node_28, node_28.controlBus) annotation();
  connect(controlBus.node_29, node_29.controlBus) annotation();
  connect(controlBus.node_30, node_30.controlBus) annotation();
  connect(controlBus.node_31, node_31.controlBus) annotation();
  connect(controlBus.node_32, node_32.controlBus) annotation();
  connect(controlBus.node_33, node_33.controlBus) annotation();
  connect(controlBus.node_34, node_34.controlBus) annotation();
  connect(controlBus.node_35, node_35.controlBus) annotation();
  connect(controlBus.node_36, node_36.controlBus) annotation();
  connect(controlBus.node_37, node_37.controlBus) annotation();
  connect(controlBus.node_38, node_38.controlBus) annotation();
  connect(controlBus.node_39, node_39.controlBus) annotation();
  connect(controlBus.node_40, node_40.controlBus) annotation();
  connect(controlBus.node_41, node_41.controlBus) annotation();
  connect(controlBus.node_42, node_42.controlBus) annotation();
  connect(controlBus.node_43, node_43.controlBus) annotation();
  connect(controlBus.node_44, node_44.controlBus) annotation();
  connect(controlBus.node_45, node_45.controlBus) annotation();
  connect(controlBus.node_46, node_46.controlBus) annotation();
  connect(controlBus.node_47, node_47.controlBus) annotation();
  connect(controlBus.node_48, node_48.controlBus) annotation();
  connect(controlBus.node_49, node_49.controlBus) annotation();
  connect(controlBus.node_50, node_50.controlBus) annotation();
  connect(controlBus.node_51, node_51.controlBus) annotation();
  connect(controlBus.node_52, node_52.controlBus) annotation();
  connect(controlBus.node_53, node_53.controlBus) annotation();
  connect(controlBus.node_54, node_54.controlBus) annotation();
  connect(controlBus.node_55, node_55.controlBus) annotation();
  connect(controlBus.node_56, node_56.controlBus) annotation();
  connect(controlBus.node_57, node_57.controlBus) annotation();
  connect(controlBus.node_58, node_58.controlBus) annotation();

  // ---- Connect lines -----------------------------------------------------------------------

  connect(line_1.epp_p, node_1.epp) annotation (Line(points={{-9.43,130.4},{-31.43,155.9}}));
  connect(line_1.epp_n, node_12.epp) annotation (Line(points={{-4.43,130.4},{17.57,99.9}}));
  connect(line_2.epp_p, node_3.epp) annotation (Line(points={{-9.43,-23.6},{-10.43,-12.1}}));
  connect(line_2.epp_n, node_7.epp) annotation (Line(points={{-4.43,-23.6},{-3.43,-40.1}}));
  connect(line_3.epp_p, node_28.epp) annotation (Line(points={{71.07,91.9},{73.57,99.9}}));
  connect(line_3.epp_n, node_10.epp) annotation (Line(points={{76.07,91.9},{73.57,78.9}}));
  connect(line_4.epp_p, node_24.epp) annotation (Line(points={{165.57,21.9},{178.57,29.9}}));
  connect(line_4.epp_n, node_32.epp) annotation (Line(points={{170.57,21.9},{157.57,8.9}}));
  connect(line_5.epp_p, node_26.epp) annotation (Line(points={{155.07,67.4},{157.57,78.9}}));
  connect(line_5.epp_n, node_38.epp) annotation (Line(points={{160.07,67.4},{157.57,50.9}}));
  connect(line_6.epp_p, node_26.epp) annotation (Line(points={{155.07,91.9},{157.57,78.9}}));
  connect(line_6.epp_n, node_39.epp) annotation (Line(points={{160.07,91.9},{157.57,99.9}}));
  connect(line_7.epp_p, node_6.epp) annotation (Line(points={{127.07,-93.6},{129.57,-110.1}}));
  connect(line_7.epp_n, node_20.epp) annotation (Line(points={{132.07,-93.6},{129.57,-82.1}}));
  connect(line_8.epp_p, node_37.epp) annotation (Line(points={{-75.93,49.9},{-59.43,36.9}}));
  connect(line_8.epp_n, node_21.epp) annotation (Line(points={{-70.93,49.9},{-87.43,57.9}}));
  connect(line_9.epp_p, node_34.epp) annotation (Line(points={{123.57,-191.6},{129.57,-208.1}}));
  connect(line_9.epp_n, node_23.epp) annotation (Line(points={{128.57,-191.6},{122.57,-180.1}}));
  connect(line_10.epp_p, node_9.epp) annotation (Line(points={{127.07,-118.1},{129.57,-131.1}}));
  connect(line_10.epp_n, node_6.epp) annotation (Line(points={{132.07,-118.1},{129.57,-110.1}}));
  connect(line_11.epp_p, node_17.epp) annotation (Line(points={{-5.93,49.9},{3.57,57.9}}));
  connect(line_11.epp_n, node_11.epp) annotation (Line(points={{-0.93,49.9},{-10.43,36.9}}));
  connect(line_12.epp_p, node_1.epp) annotation (Line(points={{-58.43,130.4},{-31.43,155.9}}));
  connect(line_12.epp_n, node_35.epp) annotation (Line(points={{-53.43,130.4},{-80.43,99.9}}));
  connect(line_13.epp_p, node_25.epp) annotation (Line(points={{123.57,-44.6},{129.57,-61.1}}));
  connect(line_13.epp_n, node_29.epp) annotation (Line(points={{128.57,-44.6},{122.57,-33.1}}));
  connect(line_14.epp_p, node_21.epp) annotation (Line(points={{-96.93,49.9},{-87.43,57.9}}));
  connect(line_14.epp_n, node_13.epp) annotation (Line(points={{-91.93,49.9},{-101.43,36.9}}));
  connect(line_15.epp_p, node_7.epp) annotation (Line(points={{-5.93,-48.1},{-3.43,-40.1}}));
  connect(line_15.epp_n, node_22.epp) annotation (Line(points={{-0.93,-48.1},{-3.43,-61.1}}));
  connect(line_16.epp_p, node_4.epp) annotation (Line(points={{8.07,70.9},{17.57,78.9}}));
  connect(line_16.epp_n, node_17.epp) annotation (Line(points={{13.07,70.9},{3.57,57.9}}));
  connect(line_17.epp_p, node_32.epp) annotation (Line(points={{148.07,0.9},{157.57,8.9}}));
  connect(line_17.epp_n, node_43.epp) annotation (Line(points={{153.07,0.9},{143.57,-12.1}}));
  connect(line_18.epp_p, node_30.epp) annotation (Line(points={{-5.93,-121.6},{-3.43,-110.1}}));
  connect(line_18.epp_n, node_8.epp) annotation (Line(points={{-0.93,-121.6},{-3.43,-138.1}}));
  connect(line_19.epp_p, node_8.epp) annotation (Line(points={{-5.93,-146.1},{-3.43,-138.1}}));
  connect(line_19.epp_n, node_2.epp) annotation (Line(points={{-0.93,-146.1},{-3.43,-159.1}}));
  connect(line_20.epp_p, node_40.epp) annotation (Line(points={{123.57,-142.6},{122.57,-159.1}}));
  connect(line_20.epp_n, node_9.epp) annotation (Line(points={{128.57,-142.6},{129.57,-131.1}}));
  connect(line_21.epp_p, node_10.epp) annotation (Line(points={{71.07,70.9},{73.57,78.9}}));
  connect(line_21.epp_n, node_5.epp) annotation (Line(points={{76.07,70.9},{73.57,57.9}}));
  connect(line_22.epp_p, node_15.epp) annotation (Line(points={{218.07,0.9},{220.57,8.9}}));
  connect(line_22.epp_n, node_14.epp) annotation (Line(points={{223.07,0.9},{220.57,-12.1}}));
  connect(line_23.epp_p, node_20.epp) annotation (Line(points={{127.07,-69.1},{129.57,-82.1}}));
  connect(line_23.epp_n, node_25.epp) annotation (Line(points={{132.07,-69.1},{129.57,-61.1}}));
  connect(line_24.epp_p, node_35.epp) annotation (Line(points={{-82.93,91.9},{-80.43,99.9}}));
  connect(line_24.epp_n, node_33.epp) annotation (Line(points={{-77.93,91.9},{-80.43,78.9}}));
  connect(line_25.epp_p, node_16.epp) annotation (Line(points={{-12.93,0.9},{-10.43,8.9}}));
  connect(line_25.epp_n, node_3.epp) annotation (Line(points={{-7.93,0.9},{-10.43,-12.1}}));
  connect(line_26.epp_p, node_27.epp) annotation (Line(points={{15.07,49.9},{31.57,36.9}}));
  connect(line_26.epp_n, node_17.epp) annotation (Line(points={{20.07,49.9},{3.57,57.9}}));
  connect(line_27.epp_p, node_11.epp) annotation (Line(points={{-12.93,25.4},{-10.43,36.9}}));
  connect(line_27.epp_n, node_16.epp) annotation (Line(points={{-7.93,25.4},{-10.43,8.9}}));
  connect(line_28.epp_p, node_24.epp) annotation (Line(points={{197.07,21.9},{178.57,29.9}}));
  connect(line_28.epp_n, node_15.epp) annotation (Line(points={{202.07,21.9},{220.57,8.9}}));
  connect(line_29.epp_p, node_31.epp) annotation (Line(points={{74.57,25.4},{73.57,36.9}}));
  connect(line_29.epp_n, node_41.epp) annotation (Line(points={{79.57,25.4},{80.57,8.9}}));
  connect(line_30.epp_p, node_29.epp) annotation (Line(points={{130.57,-20.1},{122.57,-33.1}}));
  connect(line_30.epp_n, node_43.epp) annotation (Line(points={{135.57,-20.1},{143.57,-12.1}}));
  connect(line_31.epp_p, node_23.epp) annotation (Line(points={{120.07,-167.1},{122.57,-180.1}}));
  connect(line_31.epp_n, node_40.epp) annotation (Line(points={{125.07,-167.1},{122.57,-159.1}}));
  connect(line_32.epp_p, node_5.epp) annotation (Line(points={{71.07,49.9},{73.57,57.9}}));
  connect(line_32.epp_n, node_31.epp) annotation (Line(points={{76.07,49.9},{73.57,36.9}}));
  connect(line_33.epp_p, node_12.epp) annotation (Line(points={{15.07,91.9},{17.57,99.9}}));
  connect(line_33.epp_n, node_4.epp) annotation (Line(points={{20.07,91.9},{17.57,78.9}}));
  connect(line_34.epp_p, node_38.epp) annotation (Line(points={{165.57,42.9},{157.57,50.9}}));
  connect(line_34.epp_n, node_24.epp) annotation (Line(points={{170.57,42.9},{178.57,29.9}}));
  connect(line_35.epp_p, node_18.epp) annotation (Line(points={{-5.93,-167.1},{-3.43,-180.1}}));
  connect(line_35.epp_n, node_2.epp) annotation (Line(points={{-0.93,-167.1},{-3.43,-159.1}}));
  connect(line_36.epp_p, node_22.epp) annotation (Line(points={{-5.93,-72.6},{-3.43,-61.1}}));
  connect(line_36.epp_n, node_45.epp) annotation (Line(points={{-0.93,-72.6},{-3.43,-89.1}}));
  connect(line_37.epp_p, node_33.epp) annotation (Line(points={{-86.43,70.9},{-80.43,78.9}}));
  connect(line_37.epp_n, node_21.epp) annotation (Line(points={{-81.43,70.9},{-87.43,57.9}}));
  connect(line_38.epp_p, node_43.epp) annotation (Line(points={{158.57,-20.1},{143.57,-12.1}}));
  connect(line_38.epp_n, node_42.epp) annotation (Line(points={{163.57,-20.1},{178.57,-33.1}}));
  connect(line_39.epp_p, node_45.epp) annotation (Line(points={{-5.93,-97.1},{-3.43,-89.1}}));
  connect(line_39.epp_n, node_30.epp) annotation (Line(points={{-0.93,-97.1},{-3.43,-110.1}}));
  connect(line_40.epp_p, node_19.epp) annotation (Line(points={{123.57,-216.1},{122.57,-229.1}}));
  connect(line_40.epp_n, node_34.epp) annotation (Line(points={{128.57,-216.1},{129.57,-208.1}}));
  connect(line_41.epp_p, node_44.epp) annotation (Line(points={{-61.93,0.9},{-59.43,8.9}}));
  connect(line_41.epp_n, node_36.epp) annotation (Line(points={{-56.93,0.9},{-59.43,-12.1}}));
  connect(line_42.epp_p, node_44.epp) annotation (Line(points={{-61.93,25.4},{-59.43,8.9}}));
  connect(line_42.epp_n, node_37.epp) annotation (Line(points={{-56.93,25.4},{-59.43,36.9}}));
  connect(line_43.epp_p, node_13.epp) annotation (Line(points={{-107.43,25.4},{-101.43,36.9}}));
  connect(line_43.epp_n, node_46.epp) annotation (Line(points={{-102.43,25.4},{-108.43,8.9}}));
  connect(line_44.epp_p, node_47.epp) annotation (Line(points={{-159.93,91.9},{-157.43,99.9}}));
  connect(line_44.epp_n, node_48.epp) annotation (Line(points={{-154.93,91.9},{-157.43,78.9}}));
  connect(line_45.epp_p, node_49.epp) annotation (Line(points={{-156.43,39.4},{-157.43,50.9}}));
  connect(line_45.epp_n, node_50.epp) annotation (Line(points={{-151.43,39.4},{-150.43,22.9}}));
  connect(line_46.epp_p, node_50.epp) annotation (Line(points={{-152.93,14.9},{-150.43,22.9}}));
  connect(line_46.epp_n, node_51.epp) annotation (Line(points={{-147.93,14.9},{-150.43,1.9}}));
  connect(line_47.epp_p, node_48.epp) annotation (Line(points={{-159.93,67.4},{-157.43,78.9}}));
  connect(line_47.epp_n, node_49.epp) annotation (Line(points={{-154.93,67.4},{-157.43,50.9}}));
  connect(line_48.epp_p, node_51.epp) annotation (Line(points={{-156.43,-9.6},{-150.43,1.9}}));
  connect(line_48.epp_n, node_52.epp) annotation (Line(points={{-151.43,-9.6},{-157.43,-26.1}}));
  connect(line_49.epp_p, node_52.epp) annotation (Line(points={{-159.93,-34.1},{-157.43,-26.1}}));
  connect(line_49.epp_n, node_53.epp) annotation (Line(points={{-154.93,-34.1},{-157.43,-47.1}}));
  connect(line_50.epp_p, node_1.epp) annotation (Line(points={{-96.93,130.4},{-31.43,155.9}}));
  connect(line_50.epp_n, node_47.epp) annotation (Line(points={{-91.93,130.4},{-157.43,99.9}}));
  connect(line_51.epp_p, node_1.epp) annotation (Line(points={{-117.93,130.4},{-31.43,155.9}}));
  connect(line_51.epp_n, node_54.epp) annotation (Line(points={{-112.93,130.4},{-199.43,99.9}}));
  connect(line_52.epp_p, node_55.epp) annotation (Line(points={{-138.93,130.4},{-241.43,99.9}}));
  connect(line_52.epp_n, node_1.epp) annotation (Line(points={{-133.93,130.4},{-31.43,155.9}}));
  connect(line_53.epp_p, node_55.epp) annotation (Line(points={{-243.93,91.9},{-241.43,99.9}}));
  connect(line_53.epp_n, node_56.epp) annotation (Line(points={{-238.93,91.9},{-241.43,78.9}}));
  connect(line_54.epp_p, node_56.epp) annotation (Line(points={{-243.93,67.4},{-241.43,78.9}}));
  connect(line_54.epp_n, node_57.epp) annotation (Line(points={{-238.93,67.4},{-241.43,50.9}}));
  connect(line_55.epp_p, node_57.epp) annotation (Line(points={{-243.93,39.4},{-241.43,50.9}}));
  connect(line_55.epp_n, node_58.epp) annotation (Line(points={{-238.93,39.4},{-241.43,22.9}}));
  connect(line_56.epp_p, node_39.epp) annotation (Line(points={{60.57,130.4},{157.57,99.9}}));
  connect(line_56.epp_n, node_1.epp) annotation (Line(points={{65.57,130.4},{-31.43,155.9}}));
  connect(line_57.epp_p, node_1.epp) annotation (Line(points={{18.57,130.4},{-31.43,155.9}}));
  connect(line_57.epp_n, node_28.epp) annotation (Line(points={{23.57,130.4},{73.57,99.9}}));

  // ---- Connect households to nodes ---------------------------------------------------------

  connect(node_3.epp, household_1.epp) annotation (Line(points={{-10.43,-12.1},{14.57,-12.1}}));
  connect(node_12.epp, household_2.epp) annotation (Line(points={{17.57,99.9},{42.57,99.9}}));
  connect(node_6.epp, household_3.epp) annotation (Line(points={{129.57,-110.1},{154.57,-110.1}}));
  connect(node_18.epp, household_4.epp) annotation (Line(points={{-3.43,-180.1},{21.57,-180.1}}));
  connect(node_4.epp, household_5.epp) annotation (Line(points={{17.57,78.9},{42.57,78.9}}));
  connect(node_36.epp, household_6.epp) annotation (Line(points={{-59.43,-12.1},{-34.43,-12.1}}));
  connect(node_15.epp, household_7.epp) annotation (Line(points={{220.57,8.9},{245.57,8.9}}));
  connect(node_10.epp, household_8.epp) annotation (Line(points={{73.57,78.9},{98.57,78.9}}));
  connect(node_37.epp, household_9.epp) annotation (Line(points={{-59.43,36.9},{-34.43,36.9}}));
  connect(node_14.epp, household_10.epp) annotation (Line(points={{220.57,-12.1},{245.57,-12.1}}));
  connect(node_9.epp, household_11.epp) annotation (Line(points={{129.57,-131.1},{154.57,-131.1}}));
  connect(node_45.epp, household_12.epp) annotation (Line(points={{-3.43,-89.1},{21.57,-89.1}}));
  connect(node_13.epp, household_13.epp) annotation (Line(points={{-101.43,36.9},{-76.43,36.9}}));
  connect(node_27.epp, household_14.epp) annotation (Line(points={{31.57,36.9},{56.57,36.9}}));
  connect(node_11.epp, household_15.epp) annotation (Line(points={{-10.43,36.9},{14.57,36.9}}));
  connect(node_23.epp, household_16.epp) annotation (Line(points={{122.57,-180.1},{147.57,-180.1}}));
  connect(node_22.epp, household_17.epp) annotation (Line(points={{-3.43,-61.1},{21.57,-61.1}}));
  connect(node_44.epp, household_18.epp) annotation (Line(points={{-59.43,8.9},{-34.43,8.9}}));
  connect(node_8.epp, household_19.epp) annotation (Line(points={{-3.43,-138.1},{21.57,-138.1}}));
  connect(node_16.epp, household_20.epp) annotation (Line(points={{-10.43,8.9},{14.57,8.9}}));
  connect(node_25.epp, household_21.epp) annotation (Line(points={{129.57,-61.1},{154.57,-61.1}}));
  connect(node_42.epp, household_22.epp) annotation (Line(points={{178.57,-33.1},{203.57,-33.1}}));
  connect(node_30.epp, household_23.epp) annotation (Line(points={{-3.43,-110.1},{21.57,-110.1}}));
  connect(node_32.epp, household_24.epp) annotation (Line(points={{157.57,8.9},{182.57,8.9}}));
  connect(node_2.epp, household_25.epp) annotation (Line(points={{-3.43,-159.1},{21.57,-159.1}}));
  connect(node_41.epp, household_26.epp) annotation (Line(points={{80.57,8.9},{105.57,8.9}}));
  connect(node_28.epp, household_27.epp) annotation (Line(points={{73.57,99.9},{98.57,99.9}}));
  connect(node_39.epp, household_28.epp) annotation (Line(points={{157.57,99.9},{182.57,99.9}}));
  connect(node_19.epp, household_29.epp) annotation (Line(points={{122.57,-229.1},{147.57,-229.1}}));
  connect(node_38.epp, household_30.epp) annotation (Line(points={{157.57,50.9},{182.57,50.9}}));
  connect(node_5.epp, household_31.epp) annotation (Line(points={{73.57,57.9},{98.57,57.9}}));
  connect(node_40.epp, household_32.epp) annotation (Line(points={{122.57,-159.1},{147.57,-159.1}}));
  connect(node_26.epp, household_33.epp) annotation (Line(points={{157.57,78.9},{182.57,78.9}}));
  connect(node_34.epp, household_34.epp) annotation (Line(points={{129.57,-208.1},{154.57,-208.1}}));
  connect(node_31.epp, household_35.epp) annotation (Line(points={{73.57,36.9},{98.57,36.9}}));
  connect(node_35.epp, household_36.epp) annotation (Line(points={{-80.43,99.9},{-55.43,99.9}}));
  connect(node_29.epp, household_37.epp) annotation (Line(points={{122.57,-33.1},{147.57,-33.1}}));
  connect(node_33.epp, household_38.epp) annotation (Line(points={{-80.43,78.9},{-55.43,78.9}}));
  connect(node_7.epp, household_39.epp) annotation (Line(points={{-3.43,-40.1},{21.57,-40.1}}));
  connect(node_20.epp, household_40.epp) annotation (Line(points={{129.57,-82.1},{154.57,-82.1}}));
  connect(node_46.epp, household_41.epp) annotation (Line(points={{-108.43,8.9},{-83.43,8.9}}));
  connect(node_47.epp, household_42.epp) annotation (Line(points={{-157.43,99.9},{-132.43,99.9}}));
  connect(node_48.epp, household_43.epp) annotation (Line(points={{-157.43,78.9},{-132.43,78.9}}));
  connect(node_49.epp, household_44.epp) annotation (Line(points={{-157.43,50.9},{-132.43,50.9}}));
  connect(node_50.epp, household_45.epp) annotation (Line(points={{-150.43,22.9},{-125.43,22.9}}));
  connect(node_51.epp, household_46.epp) annotation (Line(points={{-150.43,1.9},{-125.43,1.9}}));
  connect(node_52.epp, household_47.epp) annotation (Line(points={{-157.43,-26.1},{-132.43,-26.1}}));
  connect(node_53.epp, household_48.epp) annotation (Line(points={{-157.43,-47.1},{-132.43,-47.1}}));
  connect(node_54.epp, household_49.epp) annotation (Line(points={{-199.43,99.9},{-174.43,99.9}}));
  connect(node_55.epp, household_50.epp) annotation (Line(points={{-241.43,99.9},{-216.43,99.9}}));
  connect(node_55.epp, household_51.epp) annotation (Line(points={{-241.43,99.9},{-196.43,99.9}}));
  connect(node_56.epp, household_52.epp) annotation (Line(points={{-241.43,78.9},{-216.43,78.9}}));
  connect(node_56.epp, household_53.epp) annotation (Line(points={{-241.43,78.9},{-196.43,78.9}}));
  connect(node_57.epp, household_54.epp) annotation (Line(points={{-241.43,50.9},{-216.43,50.9}}));
  connect(node_57.epp, household_55.epp) annotation (Line(points={{-241.43,50.9},{-196.43,50.9}}));
  connect(node_58.epp, household_56.epp) annotation (Line(points={{-241.43,22.9},{-216.43,22.9}}));
  connect(node_58.epp, household_57.epp) annotation (Line(points={{-241.43,22.9},{-196.43,22.9}}));
  connect(node_47.epp, household_58.epp) annotation (Line(points={{-157.43,99.9},{-112.43,99.9}}));
  connect(node_48.epp, household_59.epp) annotation (Line(points={{-157.43,78.9},{-112.43,78.9}}));
  connect(node_49.epp, household_60.epp) annotation (Line(points={{-157.43,50.9},{-112.43,50.9}}));
  connect(node_50.epp, household_61.epp) annotation (Line(points={{-150.43,22.9},{-105.43,22.9}}));
  connect(node_50.epp, household_62.epp) annotation (Line(points={{-150.43,22.9},{-85.43,22.9}}));
  connect(node_50.epp, household_63.epp) annotation (Line(points={{-150.43,22.9},{-65.43,22.9}}));
  connect(node_51.epp, household_64.epp) annotation (Line(points={{-150.43,1.9},{-105.43,1.9}}));
  connect(node_51.epp, household_65.epp) annotation (Line(points={{-150.43,1.9},{-85.43,1.9}}));
  connect(node_52.epp, household_66.epp) annotation (Line(points={{-157.43,-26.1},{-112.43,-26.1}}));
  connect(node_35.epp, household_67.epp) annotation (Line(points={{-80.43,99.9},{-35.43,99.9}}));
  connect(node_33.epp, household_68.epp) annotation (Line(points={{-80.43,78.9},{-35.43,78.9}}));
  connect(node_46.epp, household_69.epp) annotation (Line(points={{-108.43,8.9},{-63.43,8.9}}));
  connect(node_37.epp, household_70.epp) annotation (Line(points={{-59.43,36.9},{-14.43,36.9}}));
  connect(node_44.epp, household_71.epp) annotation (Line(points={{-59.43,8.9},{-14.43,8.9}}));
  connect(node_36.epp, household_72.epp) annotation (Line(points={{-59.43,-12.1},{-14.43,-12.1}}));
  connect(node_36.epp, household_73.epp) annotation (Line(points={{-59.43,-12.1},{5.57,-12.1}}));
  connect(node_12.epp, household_74.epp) annotation (Line(points={{17.57,99.9},{62.57,99.9}}));
  connect(node_27.epp, household_75.epp) annotation (Line(points={{31.57,36.9},{76.57,36.9}}));
  connect(node_27.epp, household_76.epp) annotation (Line(points={{31.57,36.9},{96.57,36.9}}));
  connect(node_27.epp, household_77.epp) annotation (Line(points={{31.57,36.9},{116.57,36.9}}));
  connect(node_16.epp, household_78.epp) annotation (Line(points={{-10.43,8.9},{34.57,8.9}}));
  connect(node_7.epp, household_79.epp) annotation (Line(points={{-3.43,-40.1},{41.57,-40.1}}));
  connect(node_7.epp, household_80.epp) annotation (Line(points={{-3.43,-40.1},{61.57,-40.1}}));
  connect(node_45.epp, household_81.epp) annotation (Line(points={{-3.43,-89.1},{41.57,-89.1}}));
  connect(node_22.epp, household_82.epp) annotation (Line(points={{-3.43,-61.1},{41.57,-61.1}}));
  connect(node_22.epp, household_83.epp) annotation (Line(points={{-3.43,-61.1},{61.57,-61.1}}));
  connect(node_30.epp, household_84.epp) annotation (Line(points={{-3.43,-110.1},{41.57,-110.1}}));
  connect(node_8.epp, household_85.epp) annotation (Line(points={{-3.43,-138.1},{41.57,-138.1}}));
  connect(node_2.epp, household_86.epp) annotation (Line(points={{-3.43,-159.1},{41.57,-159.1}}));
  connect(node_2.epp, household_87.epp) annotation (Line(points={{-3.43,-159.1},{61.57,-159.1}}));
  connect(node_18.epp, household_88.epp) annotation (Line(points={{-3.43,-180.1},{41.57,-180.1}}));
  connect(node_41.epp, household_89.epp) annotation (Line(points={{80.57,8.9},{125.57,8.9}}));
  connect(node_15.epp, household_90.epp) annotation (Line(points={{220.57,8.9},{265.57,8.9}}));
  connect(node_15.epp, household_91.epp) annotation (Line(points={{220.57,8.9},{285.57,8.9}}));
  connect(node_14.epp, household_92.epp) annotation (Line(points={{220.57,-12.1},{265.57,-12.1}}));
  connect(node_14.epp, household_93.epp) annotation (Line(points={{220.57,-12.1},{285.57,-12.1}}));
  connect(node_14.epp, household_94.epp) annotation (Line(points={{220.57,-12.1},{305.57,-12.1}}));
  connect(node_32.epp, household_95.epp) annotation (Line(points={{157.57,8.9},{202.57,8.9}}));
  connect(node_32.epp, household_96.epp) annotation (Line(points={{157.57,8.9},{222.57,8.9}}));
  connect(node_32.epp, household_97.epp) annotation (Line(points={{157.57,8.9},{242.57,8.9}}));
  connect(node_42.epp, household_98.epp) annotation (Line(points={{178.57,-33.1},{223.57,-33.1}}));
  connect(node_42.epp, household_99.epp) annotation (Line(points={{178.57,-33.1},{243.57,-33.1}}));
  connect(node_42.epp, household_100.epp) annotation (Line(points={{178.57,-33.1},{263.57,-33.1}}));
  connect(node_25.epp, household_101.epp) annotation (Line(points={{129.57,-61.1},{174.57,-61.1}}));
  connect(node_25.epp, household_102.epp) annotation (Line(points={{129.57,-61.1},{194.57,-61.1}}));
  connect(node_20.epp, household_103.epp) annotation (Line(points={{129.57,-82.1},{174.57,-82.1}}));
  connect(node_20.epp, household_104.epp) annotation (Line(points={{129.57,-82.1},{194.57,-82.1}}));
  connect(node_6.epp, household_105.epp) annotation (Line(points={{129.57,-110.1},{174.57,-110.1}}));
  connect(node_6.epp, household_106.epp) annotation (Line(points={{129.57,-110.1},{194.57,-110.1}}));
  connect(node_9.epp, household_107.epp) annotation (Line(points={{129.57,-131.1},{174.57,-131.1}}));
  connect(node_9.epp, household_108.epp) annotation (Line(points={{129.57,-131.1},{194.57,-131.1}}));
  connect(node_9.epp, household_109.epp) annotation (Line(points={{129.57,-131.1},{214.57,-131.1}}));
  connect(node_34.epp, household_110.epp) annotation (Line(points={{129.57,-208.1},{174.57,-208.1}}));
  connect(node_34.epp, household_111.epp) annotation (Line(points={{129.57,-208.1},{194.57,-208.1}}));

  // ---- Connect transformer to node ---------------------------------------------------------

  connect(epp, epp) annotation (Line(
      points={{0,108},{0,108}},
      color={0,127,0},
      thickness=0.5));
  connect(simpleTransformerComplex.epp_p, epp) annotation (Line(
      points={{-114,184},{-120,184},{-120,116},{-18,116},{-18,108},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(decouplingGrids.epp_p, simpleTransformerComplex.epp_n) annotation (Line(
      points={{-74,184},{-94,184}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_a, decouplingGrids.epp_n) annotation (Line(
      points={{-39.2,184},{-54,184}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_b, node_1.epp) annotation (Line(
      points={{-30,174},{-32,174},{-32,155.9},{-31.43,155.9}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.controlBus, controlBus.GridMeter) annotation();
   annotation();
   annotation();
   annotation();
   annotation();
   annotation();
   annotation();
  annotation (
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={Rectangle(
          extent={{-260,220},{-140,140}},
          lineColor={102,44,145},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-258,220},{-142,144}},
          textColor={102,44,145},
          horizontalAlignment=TextAlignment.Left,
          textString="Scenario: LV-urban-6
Topology: SimBench 1-LV-urban6--0-sw
Degree of urbanisation: Urban
Technology Mix: Today
Number of Prosumers: 111
Number of PV: 13
Number of BES: 7
Number of EHP: 9
Number of BEV: 3")}),
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
          textString="%LV_urban_6_T")}));
end LV_urban_6_T;
