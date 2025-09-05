within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.BaseScenarios;
model LV_urban_6_Future "Urban low voltage distribution grid scenario with future technology penetration scenario."
  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String data_local="modelica://TransiEnt/Tables/distribution/" "Directory containing simulation data" annotation (Evaluate=true, Dialog(group="Scenario"));

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for battery system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for heating system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for vehicle system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter String weatherLocation = "Hamelin" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter String weatherYear = "2019" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

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

  TransiEnt.Components.Electrical.Grid.Node node_1(v_n=400) annotation (Placement(transformation(extent={{-33.93,155.9},{-28.93,160.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_2(v_n=400) annotation (Placement(transformation(extent={{-5.93,-159.1},{-0.93,-154.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_3(v_n=400) annotation (Placement(transformation(extent={{-12.93,-12.1},{-7.93,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_4(v_n=400) annotation (Placement(transformation(extent={{15.07,78.9},{20.07,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_5(v_n=400) annotation (Placement(transformation(extent={{71.07,57.9},{76.07,62.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_6(v_n=400) annotation (Placement(transformation(extent={{127.07,-110.1},{132.07,-105.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_7(v_n=400) annotation (Placement(transformation(extent={{-5.93,-40.1},{-0.93,-35.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_8(v_n=400) annotation (Placement(transformation(extent={{-5.93,-138.1},{-0.93,-133.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_9(v_n=400) annotation (Placement(transformation(extent={{127.07,-131.1},{132.07,-126.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_10(v_n=400) annotation (Placement(transformation(extent={{71.07,78.9},{76.07,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_11(v_n=400) annotation (Placement(transformation(extent={{-12.93,36.9},{-7.93,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_12(v_n=400) annotation (Placement(transformation(extent={{15.07,99.9},{20.07,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_13(v_n=400) annotation (Placement(transformation(extent={{-103.93,36.9},{-98.93,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_14(v_n=400) annotation (Placement(transformation(extent={{218.07,-12.1},{223.07,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_15(v_n=400) annotation (Placement(transformation(extent={{218.07,8.9},{223.07,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_16(v_n=400) annotation (Placement(transformation(extent={{-12.93,8.9},{-7.93,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_17(v_n=400) annotation (Placement(transformation(extent={{1.07,57.9},{6.07,62.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_18(v_n=400) annotation (Placement(transformation(extent={{-5.93,-180.1},{-0.93,-175.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_19(v_n=400) annotation (Placement(transformation(extent={{120.07,-229.1},{125.07,-224.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_20(v_n=400) annotation (Placement(transformation(extent={{127.07,-82.1},{132.07,-77.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_21(v_n=400) annotation (Placement(transformation(extent={{-89.93,57.9},{-84.93,62.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_22(v_n=400) annotation (Placement(transformation(extent={{-5.93,-61.1},{-0.93,-56.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_23(v_n=400) annotation (Placement(transformation(extent={{120.07,-180.1},{125.07,-175.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_24(v_n=400) annotation (Placement(transformation(extent={{176.07,29.9},{181.07,34.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_25(v_n=400) annotation (Placement(transformation(extent={{127.07,-61.1},{132.07,-56.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_26(v_n=400) annotation (Placement(transformation(extent={{155.07,78.9},{160.07,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_27(v_n=400) annotation (Placement(transformation(extent={{29.07,36.9},{34.07,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_28(v_n=400) annotation (Placement(transformation(extent={{71.07,99.9},{76.07,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_29(v_n=400) annotation (Placement(transformation(extent={{120.07,-33.1},{125.07,-28.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_30(v_n=400) annotation (Placement(transformation(extent={{-5.93,-110.1},{-0.93,-105.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_31(v_n=400) annotation (Placement(transformation(extent={{71.07,36.9},{76.07,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_32(v_n=400) annotation (Placement(transformation(extent={{155.07,8.9},{160.07,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_33(v_n=400) annotation (Placement(transformation(extent={{-82.93,78.9},{-77.93,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_34(v_n=400) annotation (Placement(transformation(extent={{127.07,-208.1},{132.07,-203.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_35(v_n=400) annotation (Placement(transformation(extent={{-82.93,99.9},{-77.93,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_36(v_n=400) annotation (Placement(transformation(extent={{-61.93,-12.1},{-56.93,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_37(v_n=400) annotation (Placement(transformation(extent={{-61.93,36.9},{-56.93,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_38(v_n=400) annotation (Placement(transformation(extent={{155.07,50.9},{160.07,55.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_39(v_n=400) annotation (Placement(transformation(extent={{155.07,99.9},{160.07,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_40(v_n=400) annotation (Placement(transformation(extent={{120.07,-159.1},{125.07,-154.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_41(v_n=400) annotation (Placement(transformation(extent={{78.07,8.9},{83.07,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_42(v_n=400) annotation (Placement(transformation(extent={{176.07,-33.1},{181.07,-28.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_43(v_n=400) annotation (Placement(transformation(extent={{141.07,-12.1},{146.07,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_44(v_n=400) annotation (Placement(transformation(extent={{-61.93,8.9},{-56.93,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_45(v_n=400) annotation (Placement(transformation(extent={{-5.93,-89.1},{-0.93,-84.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_46(v_n=400) annotation (Placement(transformation(extent={{-110.93,8.9},{-105.93,13.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_47(v_n=400) annotation (Placement(transformation(extent={{-159.93,99.9},{-154.93,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_48(v_n=400) annotation (Placement(transformation(extent={{-159.93,78.9},{-154.93,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_49(v_n=400) annotation (Placement(transformation(extent={{-159.93,50.9},{-154.93,55.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_50(v_n=400) annotation (Placement(transformation(extent={{-152.93,22.9},{-147.93,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_51(v_n=400) annotation (Placement(transformation(extent={{-152.93,1.9},{-147.93,6.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_52(v_n=400) annotation (Placement(transformation(extent={{-159.93,-26.1},{-154.93,-21.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_53(v_n=400) annotation (Placement(transformation(extent={{-159.93,-47.1},{-154.93,-42.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_54(v_n=400) annotation (Placement(transformation(extent={{-201.93,99.9},{-196.93,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_55(v_n=400) annotation (Placement(transformation(extent={{-243.93,99.9},{-238.93,104.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_56(v_n=400) annotation (Placement(transformation(extent={{-243.93,78.9},{-238.93,83.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_57(v_n=400) annotation (Placement(transformation(extent={{-243.93,50.9},{-238.93,55.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Node node_58(v_n=400) annotation (Placement(transformation(extent={{-243.93,22.9},{-238.93,27.9}})));

  // Basic Parameters

  // ---- Lines (between nodes) ---------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_1(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=20.265000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-9.43,127.9},{-4.43,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_2(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.753000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-9.43,-26.1},{-4.43,-21.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_3(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=0.216000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{71.07,89.4},{76.07,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_4(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=38.366000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{165.57,19.4},{170.57,24.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_5(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=0.227000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{155.07,64.9},{160.07,69.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_6(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=36.511000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{155.07,89.4},{160.07,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_7(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.038000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{127.07,-96.1},{132.07,-91.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_8(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=24.782000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-75.93,47.4},{-70.93,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_9(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.017000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{123.57,-194.1},{128.57,-189.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_10(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.492000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{127.07,-120.6},{132.07,-115.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_11(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=2.453000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-5.93,47.4},{-0.93,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_12(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.953000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-58.43,127.9},{-53.43,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_13(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=4.278000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{123.57,-47.1},{128.57,-42.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_14(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=24.146000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-96.93,47.4},{-91.93,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_15(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.718000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-5.93,-50.6},{-0.93,-45.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_16(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.759000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{8.07,68.4},{13.07,73.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_17(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.385000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{148.07,-1.6},{153.07,3.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_18(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.171000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-5.93,-124.1},{-0.93,-119.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_19(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=28.324000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-5.93,-148.6},{-0.93,-143.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_20(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.708000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{123.57,-145.1},{128.57,-140.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_21(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=0.216000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{71.07,68.4},{76.07,73.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_22(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.579000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{218.07,-1.6},{223.07,3.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_23(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=15.226000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{127.07,-71.6},{132.07,-66.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_24(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=0.187000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-82.93,89.4},{-77.93,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_25(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=13.120000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-12.93,-1.6},{-7.93,3.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_26(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=17.848000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{15.07,47.4},{20.07,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_27(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=7.492000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-12.93,22.9},{-7.93,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_28(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=20.316000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{197.07,19.4},{202.07,24.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_29(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=22.946000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{74.57,22.9},{79.57,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_30(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=21.516000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{130.57,-22.6},{135.57,-17.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_31(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.473000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{120.07,-169.6},{125.07,-164.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_32(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=13.883000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{71.07,47.4},{76.07,52.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_33(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=40.150000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{15.07,89.4},{20.07,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_34(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=17.304000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{165.57,40.4},{170.57,45.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_35(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=77.746000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-5.93,-169.6},{-0.93,-164.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_36(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.277000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-5.93,-75.1},{-0.93,-70.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_37(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=13.583000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-86.43,68.4},{-81.43,73.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_38(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=51.665000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{158.57,-22.6},{163.57,-17.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_39(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=7.626000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-5.93,-99.6},{-0.93,-94.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_40(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.383000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{123.57,-218.6},{128.57,-213.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_41(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=36.770000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-61.93,-1.6},{-56.93,3.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_42(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=52.041000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-61.93,22.9},{-56.93,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_43(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=26.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-107.43,22.9},{-102.43,27.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_44(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=17.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-159.93,89.4},{-154.93,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_45(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=16.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-156.43,36.9},{-151.43,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_46(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=19.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-152.93,12.4},{-147.93,17.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_47(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=22.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-159.93,64.9},{-154.93,69.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_48(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=12.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-156.43,-12.1},{-151.43,-7.1}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_49(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=20.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-159.93,-36.6},{-154.93,-31.6}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_50(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=22.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-96.93,127.9},{-91.93,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_51(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=45.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-117.93,127.9},{-112.93,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_52(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-138.93,127.9},{-133.93,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_53(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=16.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-243.93,89.4},{-238.93,94.4}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_54(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=15.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-243.93,64.9},{-238.93,69.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_55(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.000000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{-243.93,36.9},{-238.93,41.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_56(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=29.579000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{60.57,127.9},{65.57,132.9}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_57(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.226000,
    i_n=364,
    parallel=1) annotation (Placement(transformation(extent={{18.57,127.9},{23.57,132.9}})));

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
    loadProfileName="SFH16",
    loadProfileScaleP=7.00956,
    loadProfileScaleQ=7.00956,
    usePV=true,
    PV_peakPower=20752.0,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_1",
    Q_HP_nom=16478.0,
    A_living=350.478,
    A_wall=117.115,
    A_window=70.0956,
    A_roof=350.478,
    A_ground=350.478,
    V_air=876.195,
    U_wall=0.390858,
    U_window=1.62605,
    U_roof=0.26521,
    U_ground=0.447815,
    thermalMass=42908800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{7.07,-12.1},{22.07,2.9}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=3.40008,
    loadProfileScaleQ=3.40008,
    usePV=true,
    PV_peakPower=10066.0,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_2",
    Q_HP_nom=8204.65,
    A_living=170.004,
    A_wall=96.3848,
    A_window=34.0008,
    A_roof=170.004,
    A_ground=170.004,
    V_air=425.01,
    U_wall=0.353341,
    U_window=1.51571,
    U_roof=0.243142,
    U_ground=0.414713,
    thermalMass=24445200.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=2,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{35.07,99.9},{50.07,114.9}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH40",
    loadProfileScaleP=3.68936,
    loadProfileScaleQ=3.68936,
    usePV=true,
    PV_peakPower=10922.4,
    useBattery=true,
    Bat_Capacity=8640000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_3",
    Q_HP_nom=9743.62,
    A_living=184.468,
    A_wall=98.9255,
    A_window=36.8937,
    A_roof=184.468,
    A_ground=184.468,
    V_air=461.171,
    U_wall=0.432413,
    U_window=1.74827,
    U_roof=0.289655,
    U_ground=0.484482,
    thermalMass=26005700.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=3,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=4,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{147.07,-110.1},{162.07,-95.1}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=5.25162,
    loadProfileScaleQ=5.25162,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_4",
    Q_HP_nom=11932.3,
    A_living=262.581,
    A_wall=109.527,
    A_window=52.5163,
    A_roof=262.581,
    A_ground=262.581,
    V_air=656.454,
    U_wall=0.342486,
    U_window=1.48378,
    U_roof=0.236756,
    U_ground=0.405134,
    thermalMass=34146700.0,
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
    loadProfileName="SFH22",
    loadProfileScaleP=6.15936,
    loadProfileScaleQ=6.15936,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_5",
    Q_HP_nom=13995.8,
    A_living=307.968,
    A_wall=113.897,
    A_window=61.5936,
    A_roof=307.968,
    A_ground=307.968,
    V_air=769.92,
    U_wall=0.354097,
    U_window=1.51793,
    U_roof=0.243586,
    U_ground=0.41538,
    thermalMass=38712500.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=5,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=6,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{35.07,78.9},{50.07,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

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
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_6",
    Q_HP_nom=7436.67,
    A_living=135.568,
    A_wall=89.3201,
    A_window=27.1136,
    A_roof=135.568,
    A_ground=135.568,
    V_air=338.92,
    U_wall=0.431627,
    U_window=1.74596,
    U_roof=0.289192,
    U_ground=0.483788,
    thermalMass=20636900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=7,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-41.93,-12.1},{-26.93,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_7(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=3.67504,
    loadProfileScaleQ=3.67504,
    usePV=true,
    PV_peakPower=10880.1,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_7",
    Q_HP_nom=9531.55,
    A_living=183.752,
    A_wall=98.8048,
    A_window=36.7504,
    A_roof=183.752,
    A_ground=183.752,
    V_air=459.381,
    U_wall=0.417053,
    U_window=1.7031,
    U_roof=0.280619,
    U_ground=0.470929,
    thermalMass=25928900.0,
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
    loadProfileName="SFH14",
    loadProfileScaleP=3.61936,
    loadProfileScaleQ=3.61936,
    usePV=true,
    PV_peakPower=10715.2,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_8",
    Q_HP_nom=9204.18,
    A_living=180.968,
    A_wall=98.3308,
    A_window=36.1936,
    A_roof=180.968,
    A_ground=180.968,
    V_air=452.42,
    U_wall=0.399661,
    U_window=1.65194,
    U_roof=0.270389,
    U_ground=0.455583,
    thermalMass=25629900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=8,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{91.07,78.9},{106.07,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_9(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH20",
    loadProfileScaleP=3.1484,
    loadProfileScaleQ=3.1484,
    usePV=true,
    PV_peakPower=9320.92,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_9",
    Q_HP_nom=7087.9,
    A_living=157.42,
    A_wall=93.983,
    A_window=31.4839,
    A_roof=157.42,
    A_ground=157.42,
    V_air=393.549,
    U_wall=0.297039,
    U_window=1.35011,
    U_roof=0.210023,
    U_ground=0.365034,
    thermalMass=23070000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=9,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=10,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-41.93,36.9},{-26.93,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_10(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH19",
    loadProfileScaleP=3.4053,
    loadProfileScaleQ=3.4053,
    usePV=true,
    PV_peakPower=10081.5,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_10",
    Q_HP_nom=9123.34,
    A_living=170.265,
    A_wall=96.4326,
    A_window=34.053,
    A_roof=170.265,
    A_ground=170.265,
    V_air=425.662,
    U_wall=0.436312,
    U_window=1.75974,
    U_roof=0.291948,
    U_ground=0.487922,
    thermalMass=24473600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=11,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=12,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{238.07,-12.1},{253.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_11(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=3.27202,
    loadProfileScaleQ=3.27202,
    usePV=true,
    PV_peakPower=9686.9,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_11",
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
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=13,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{147.07,-131.1},{162.07,-116.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_12(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=3.92714,
    loadProfileScaleQ=3.92714,
    usePV=true,
    PV_peakPower=11626.4,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_12",
    Q_HP_nom=10509.4,
    A_living=196.357,
    A_wall=100.856,
    A_window=39.2714,
    A_roof=196.357,
    A_ground=196.357,
    V_air=490.892,
    U_wall=0.449804,
    U_window=1.79942,
    U_roof=0.299885,
    U_ground=0.499827,
    thermalMass=27273800.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=14,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=15,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=16,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{14.07,-89.1},{29.07,-74.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_13(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=10.6671,
    loadProfileScaleQ=10.6671,
    usePV=true,
    PV_peakPower=31580.2,
    useBattery=false,
    useEHP=true,
    V_BST = 1.5,
    tappingProfileName="TappingCycle_A_13",
    Q_HP_nom=21786.9,
    A_living=533.354,
    A_wall=124.274,
    A_window=106.671,
    A_roof=533.354,
    A_ground=533.354,
    V_air=1333.39,
    U_wall=0.305406,
    U_window=1.37472,
    U_roof=0.214945,
    U_ground=0.372417,
    thermalMass=60347400.0,
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
    loadProfileName="SFH8",
    loadProfileScaleP=3.26084,
    loadProfileScaleQ=3.26084,
    usePV=true,
    PV_peakPower=9653.8,
    useBattery=true,
    Bat_Capacity=25920000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_14",
    Q_HP_nom=8691.08,
    A_living=163.042,
    A_wall=95.0795,
    A_window=32.6084,
    A_roof=163.042,
    A_ground=163.042,
    V_air=407.605,
    U_wall=0.427581,
    U_window=1.73406,
    U_roof=0.286813,
    U_ground=0.480219,
    thermalMass=23686600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=17,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=18,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{49.07,36.9},{64.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_15(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=6.62194,
    loadProfileScaleQ=6.62194,
    usePV=true,
    PV_peakPower=19604.4,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_15",
    Q_HP_nom=14067.7,
    A_living=331.097,
    A_wall=115.741,
    A_window=66.2193,
    A_roof=331.097,
    A_ground=331.097,
    V_air=827.741,
    U_wall=0.307624,
    U_window=1.38125,
    U_roof=0.216249,
    U_ground=0.374374,
    thermalMass=41004200.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=19,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{7.07,36.9},{22.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_16(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH10",
    loadProfileScaleP=6.29438,
    loadProfileScaleQ=6.29438,
    usePV=true,
    PV_peakPower=18634.7,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_16",
    Q_HP_nom=14829.8,
    A_living=314.719,
    A_wall=114.459,
    A_window=62.9437,
    A_roof=314.719,
    A_ground=314.719,
    V_air=786.796,
    U_wall=0.384645,
    U_window=1.60778,
    U_roof=0.261556,
    U_ground=0.442334,
    thermalMass=39383600.0,
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
    loadProfileName="SFH5",
    loadProfileScaleP=3.94704,
    loadProfileScaleQ=3.94704,
    usePV=true,
    PV_peakPower=11685.3,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_17",
    Q_HP_nom=8721.75,
    A_living=197.352,
    A_wall=101.012,
    A_window=39.4704,
    A_roof=197.352,
    A_ground=197.352,
    V_air=493.38,
    U_wall=0.301049,
    U_window=1.36191,
    U_roof=0.212382,
    U_ground=0.368573,
    thermalMass=27379400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=20,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{14.07,-61.1},{29.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_18(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=3.09742,
    loadProfileScaleQ=3.09742,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_18",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=21,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-41.93,8.9},{-26.93,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_19(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH19",
    loadProfileScaleP=4.68202,
    loadProfileScaleQ=4.68202,
    usePV=true,
    PV_peakPower=13861.2,
    useBattery=true,
    Bat_Capacity=43200000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_19",
    Q_HP_nom=11820.1,
    A_living=234.101,
    A_wall=106.183,
    A_window=46.8202,
    A_roof=234.101,
    A_ground=234.101,
    V_air=585.252,
    U_wall=0.417244,
    U_window=1.70366,
    U_roof=0.280732,
    U_ground=0.471098,
    thermalMass=31226300.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=22,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=23,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{14.07,-138.1},{29.07,-123.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_20(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=2.77296,
    loadProfileScaleQ=2.77296,
    usePV=true,
    PV_peakPower=8209.42,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_20",
    Q_HP_nom=7073.99,
    A_living=138.648,
    A_wall=90.0192,
    A_window=27.7295,
    A_roof=138.648,
    A_ground=138.648,
    V_air=346.619,
    U_wall=0.376747,
    U_window=1.58455,
    U_roof=0.25691,
    U_ground=0.435365,
    thermalMass=20983700.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=24,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=25,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{7.07,8.9},{22.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_21(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH12",
    loadProfileScaleP=1.92351,
    loadProfileScaleQ=1.92351,
    usePV=true,
    PV_peakPower=5694.59,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_21",
    Q_HP_nom=4965.52,
    A_living=96.1753,
    A_wall=78.8339,
    A_window=19.2351,
    A_roof=96.1753,
    A_ground=96.1753,
    V_air=240.438,
    U_wall=0.349221,
    U_window=1.50359,
    U_roof=0.240718,
    U_ground=0.411077,
    thermalMass=16059800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=26,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{147.07,-61.1},{162.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_22(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=3.5268,
    loadProfileScaleQ=3.5268,
    usePV=true,
    PV_peakPower=10441.2,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_22",
    Q_HP_nom=7781.89,
    A_living=176.34,
    A_wall=97.5252,
    A_window=35.2681,
    A_roof=176.34,
    A_ground=176.34,
    V_air=440.851,
    U_wall=0.291758,
    U_window=1.33458,
    U_roof=0.206917,
    U_ground=0.360375,
    thermalMass=25131400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=27,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{196.07,-33.1},{211.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_23(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=4.9577,
    loadProfileScaleQ=4.9577,
    usePV=true,
    PV_peakPower=14677.4,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_23",
    Q_HP_nom=12162.4,
    A_living=247.885,
    A_wall=107.867,
    A_window=49.577,
    A_roof=247.885,
    A_ground=247.885,
    V_air=619.713,
    U_wall=0.398563,
    U_window=1.64871,
    U_roof=0.269743,
    U_ground=0.454614,
    thermalMass=32645700.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=28,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=29,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{14.07,-110.1},{29.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_24(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.82892,
    loadProfileScaleQ=2.82892,
    usePV=true,
    PV_peakPower=8375.09,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_24",
    Q_HP_nom=7013.41,
    A_living=141.446,
    A_wall=90.6418,
    A_window=28.2892,
    A_roof=141.446,
    A_ground=141.446,
    V_air=353.615,
    U_wall=0.357102,
    U_window=1.52677,
    U_roof=0.245354,
    U_ground=0.418031,
    thermalMass=21297600.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=30,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{175.07,8.9},{190.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_25(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=5.26606,
    loadProfileScaleQ=5.26606,
    usePV=true,
    PV_peakPower=15590.3,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_25",
    Q_HP_nom=12905.1,
    A_living=263.303,
    A_wall=109.606,
    A_window=52.6606,
    A_roof=263.303,
    A_ground=263.303,
    V_air=658.257,
    U_wall=0.402749,
    U_window=1.66103,
    U_roof=0.272206,
    U_ground=0.458308,
    thermalMass=34220100.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=31,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=32,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{14.07,-159.1},{29.07,-144.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_26(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH16",
    loadProfileScaleP=3.404,
    loadProfileScaleQ=3.404,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_26",
    Q_HP_nom=9021.58,
    A_living=170.2,
    A_wall=96.4207,
    A_window=34.04,
    A_roof=170.2,
    A_ground=170.2,
    V_air=425.5,
    U_wall=0.427285,
    U_window=1.73319,
    U_roof=0.286638,
    U_ground=0.479957,
    thermalMass=24466500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=33,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{98.07,8.9},{113.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_27(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.71792,
    loadProfileScaleQ=3.71792,
    usePV=true,
    PV_peakPower=11007.0,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_27",
    Q_HP_nom=9967.76,
    A_living=185.896,
    A_wall=99.1645,
    A_window=37.1792,
    A_roof=185.896,
    A_ground=185.896,
    V_air=464.74,
    U_wall=0.445839,
    U_window=1.78776,
    U_roof=0.297552,
    U_ground=0.496328,
    thermalMass=26158700.0,
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
    loadProfileName="SFH31",
    loadProfileScaleP=3.60144,
    loadProfileScaleQ=3.60144,
    usePV=true,
    PV_peakPower=10662.2,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_28",
    Q_HP_nom=9459.55,
    A_living=180.072,
    A_wall=98.1766,
    A_window=36.0145,
    A_roof=180.072,
    A_ground=180.072,
    V_air=450.181,
    U_wall=0.425487,
    U_window=1.7279,
    U_roof=0.28558,
    U_ground=0.47837,
    thermalMass=25533600.0,
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
    loadProfileName="SFH23",
    loadProfileScaleP=6.89392,
    loadProfileScaleQ=6.89392,
    usePV=true,
    PV_peakPower=20409.6,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_29",
    Q_HP_nom=14093.1,
    A_living=344.696,
    A_wall=116.721,
    A_window=68.9392,
    A_roof=344.696,
    A_ground=344.696,
    V_air=861.74,
    U_wall=0.281991,
    U_window=1.30586,
    U_roof=0.201171,
    U_ground=0.351757,
    thermalMass=42342000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=34,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=35,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{140.07,-229.1},{155.07,-214.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_30(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH18",
    loadProfileScaleP=4.42972,
    loadProfileScaleQ=4.42972,
    usePV=true,
    PV_peakPower=13114.3,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_30",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=36,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{175.07,50.9},{190.07,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_31(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=3.77252,
    loadProfileScaleQ=3.77252,
    usePV=true,
    PV_peakPower=11168.6,
    useBattery=true,
    Bat_Capacity=51840000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_31",
    Q_HP_nom=9600.42,
    A_living=188.626,
    A_wall=99.6159,
    A_window=37.7252,
    A_roof=188.626,
    A_ground=188.626,
    V_air=471.564,
    U_wall=0.404098,
    U_window=1.665,
    U_roof=0.272999,
    U_ground=0.459499,
    thermalMass=26450600.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=37,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=38,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=39,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{91.07,57.9},{106.07,72.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_32(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=6.03146,
    loadProfileScaleQ=6.03146,
    usePV=true,
    PV_peakPower=17856.3,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_32",
    Q_HP_nom=12943.9,
    A_living=301.573,
    A_wall=113.344,
    A_window=60.3146,
    A_roof=301.573,
    A_ground=301.573,
    V_air=753.932,
    U_wall=0.309177,
    U_window=1.38581,
    U_roof=0.217163,
    U_ground=0.375744,
    thermalMass=38074900.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=40,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=41,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{140.07,-159.1},{155.07,-144.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_33(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=3.25114,
    loadProfileScaleQ=3.25114,
    usePV=true,
    PV_peakPower=9625.09,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_33",
    Q_HP_nom=8046.76,
    A_living=162.557,
    A_wall=94.9865,
    A_window=32.5115,
    A_roof=162.557,
    A_ground=162.557,
    V_air=406.394,
    U_wall=0.368576,
    U_window=1.56052,
    U_roof=0.252104,
    U_ground=0.428155,
    thermalMass=23633600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=42,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=43,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{175.07,78.9},{190.07,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_34(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=2.2096,
    loadProfileScaleQ=2.2096,
    usePV=true,
    PV_peakPower=6541.58,
    useBattery=true,
    Bat_Capacity=51840000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_34",
    Q_HP_nom=5130.63,
    A_living=110.48,
    A_wall=83.0135,
    A_window=22.096,
    A_roof=110.48,
    A_ground=110.48,
    V_air=276.2,
    U_wall=0.289237,
    U_window=1.32717,
    U_roof=0.205434,
    U_ground=0.358151,
    thermalMass=17756000.0,
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
    loadProfileName="SFH23",
    loadProfileScaleP=3.95722,
    loadProfileScaleQ=3.95722,
    usePV=true,
    PV_peakPower=11715.5,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_35",
    Q_HP_nom=8901.99,
    A_living=197.861,
    A_wall=101.091,
    A_window=39.5723,
    A_roof=197.861,
    A_ground=197.861,
    V_air=494.653,
    U_wall=0.313999,
    U_window=1.4,
    U_roof=0.22,
    U_ground=0.379999,
    thermalMass=27433400.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=44,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=45,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{91.07,36.9},{106.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_36(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=3.27818,
    loadProfileScaleQ=3.27818,
    usePV=true,
    PV_peakPower=9705.14,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_36",
    Q_HP_nom=7199.56,
    A_living=163.909,
    A_wall=95.2451,
    A_window=32.7817,
    A_roof=163.909,
    A_ground=163.909,
    V_air=409.772,
    U_wall=0.283149,
    U_window=1.30926,
    U_roof=0.201852,
    U_ground=0.352778,
    thermalMass=23781300.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=46,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=47,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-62.93,99.9},{-47.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_37(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=6.74268,
    loadProfileScaleQ=6.74268,
    usePV=true,
    PV_peakPower=19961.9,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_37",
    Q_HP_nom=16369.8,
    A_living=337.134,
    A_wall=116.185,
    A_window=67.4268,
    A_roof=337.134,
    A_ground=337.134,
    V_air=842.835,
    U_wall=0.414929,
    U_window=1.69685,
    U_roof=0.27937,
    U_ground=0.469055,
    thermalMass=41599000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=48,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=49,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{140.07,-33.1},{155.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_38(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.80118,
    loadProfileScaleQ=3.80118,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_38",
    Q_HP_nom=8636.0,
    A_living=190.059,
    A_wall=99.8502,
    A_window=38.0119,
    A_roof=190.059,
    A_ground=190.059,
    V_air=475.149,
    U_wall=0.318067,
    U_window=1.41196,
    U_roof=0.222392,
    U_ground=0.383589,
    thermalMass=26603600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=50,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=51,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-62.93,78.9},{-47.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_39(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH17",
    loadProfileScaleP=3.00634,
    loadProfileScaleQ=3.00634,
    usePV=true,
    PV_peakPower=8900.35,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_39",
    Q_HP_nom=7215.92,
    A_living=150.317,
    A_wall=92.5404,
    A_window=30.0634,
    A_roof=150.317,
    A_ground=150.317,
    V_air=375.792,
    U_wall=0.33871,
    U_window=1.47268,
    U_roof=0.234535,
    U_ground=0.401803,
    thermalMass=22285900.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=52,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=53,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{14.07,-40.1},{29.07,-25.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_40(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.04884,
    loadProfileScaleQ=3.04884,
    usePV=true,
    PV_peakPower=9026.17,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_40",
    Q_HP_nom=8296.94,
    A_living=152.442,
    A_wall=92.9791,
    A_window=30.4885,
    A_roof=152.442,
    A_ground=152.442,
    V_air=381.106,
    U_wall=0.437774,
    U_window=1.76404,
    U_roof=0.292808,
    U_ground=0.489212,
    thermalMass=22521200.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=54,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=55,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{147.07,-82.1},{162.07,-67.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_41(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH18",
    loadProfileScaleP=3.17076,
    loadProfileScaleQ=3.17076,
    usePV=true,
    PV_peakPower=9387.12,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_41",
    Q_HP_nom=8193.19,
    A_living=158.538,
    A_wall=94.2043,
    A_window=31.7077,
    A_roof=158.538,
    A_ground=158.538,
    V_air=396.346,
    U_wall=0.39975,
    U_window=1.65221,
    U_roof=0.270441,
    U_ground=0.455662,
    thermalMass=23193000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=56,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-90.93,8.9},{-75.93,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_42(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=2.49,
    loadProfileScaleQ=2.49,
    usePV=true,
    PV_peakPower=7371.71,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_42",
    Q_HP_nom=5663.57,
    A_living=124.5,
    A_wall=86.6795,
    A_window=24.8999,
    A_roof=124.5,
    A_ground=124.5,
    V_air=311.249,
    U_wall=0.285413,
    U_window=1.31592,
    U_roof=0.203184,
    U_ground=0.354776,
    thermalMass=19378900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=57,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-139.93,99.9},{-124.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_43(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=2.34686,
    loadProfileScaleQ=2.34686,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_43",
    Q_HP_nom=5560.55,
    A_living=117.343,
    A_wall=84.8564,
    A_window=23.4686,
    A_roof=117.343,
    A_ground=117.343,
    V_air=293.358,
    U_wall=0.307998,
    U_window=1.38235,
    U_roof=0.216469,
    U_ground=0.374704,
    thermalMass=18554900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=58,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-139.93,78.9},{-124.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_44(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=4.67042,
    loadProfileScaleQ=4.67042,
    usePV=true,
    PV_peakPower=13826.9,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_44",
    Q_HP_nom=11346.4,
    A_living=233.521,
    A_wall=106.11,
    A_window=46.7043,
    A_roof=233.521,
    A_ground=233.521,
    V_air=583.804,
    U_wall=0.385651,
    U_window=1.61074,
    U_roof=0.262148,
    U_ground=0.443222,
    thermalMass=31166400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=59,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-139.93,50.9},{-124.93,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_45(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH10",
    loadProfileScaleP=2.35796,
    loadProfileScaleQ=2.35796,
    usePV=true,
    PV_peakPower=6980.8,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_45",
    Q_HP_nom=6155.57,
    A_living=117.898,
    A_wall=85.0013,
    A_window=23.5796,
    A_roof=117.898,
    A_ground=117.898,
    V_air=294.745,
    U_wall=0.378129,
    U_window=1.58861,
    U_roof=0.257723,
    U_ground=0.436584,
    thermalMass=18619100.0,
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
    loadProfileName="SFH17",
    loadProfileScaleP=2.98096,
    loadProfileScaleQ=2.98096,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_46",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=60,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-132.93,1.9},{-117.93,16.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_47(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.5736,
    loadProfileScaleQ=2.5736,
    usePV=true,
    PV_peakPower=7619.21,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_47",
    Q_HP_nom=7171.34,
    A_living=128.68,
    A_wall=87.7012,
    A_window=25.736,
    A_roof=128.68,
    A_ground=128.68,
    V_air=321.7,
    U_wall=0.438816,
    U_window=1.76711,
    U_roof=0.293421,
    U_ground=0.490132,
    thermalMass=19856300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=61,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-139.93,-26.1},{-124.93,-11.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_48(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=3.58874,
    loadProfileScaleQ=3.58874,
    usePV=true,
    PV_peakPower=10624.6,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_48",
    Q_HP_nom=8960.92,
    A_living=179.437,
    A_wall=98.0667,
    A_window=35.8875,
    A_roof=179.437,
    A_ground=179.437,
    V_air=448.593,
    U_wall=0.384374,
    U_window=1.60698,
    U_roof=0.261397,
    U_ground=0.442095,
    thermalMass=25465200.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=62,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=63,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-139.93,-47.1},{-124.93,-32.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_49(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH5",
    loadProfileScaleP=6.81058,
    loadProfileScaleQ=6.81058,
    usePV=true,
    PV_peakPower=20162.9,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_49",
    Q_HP_nom=15666.9,
    A_living=340.529,
    A_wall=116.428,
    A_window=68.1058,
    A_roof=340.529,
    A_ground=340.529,
    V_air=851.322,
    U_wall=0.371058,
    U_window=1.56782,
    U_roof=0.253563,
    U_ground=0.430345,
    thermalMass=41932800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=64,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=65,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-181.93,99.9},{-166.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_50(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=2.50642,
    loadProfileScaleQ=2.50642,
    usePV=true,
    PV_peakPower=7420.32,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_50",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=66,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-223.93,99.9},{-208.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_51(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=2.16506,
    loadProfileScaleQ=2.16506,
    usePV=true,
    PV_peakPower=6409.72,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_51",
    Q_HP_nom=5916.77,
    A_living=108.253,
    A_wall=82.394,
    A_window=21.6506,
    A_roof=108.253,
    A_ground=108.253,
    V_air=270.632,
    U_wall=0.404121,
    U_window=1.66506,
    U_roof=0.273012,
    U_ground=0.459518,
    thermalMass=17494800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=67,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-203.93,99.9},{-188.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_52(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=2.80624,
    loadProfileScaleQ=2.80624,
    usePV=true,
    PV_peakPower=8307.95,
    useBattery=true,
    Bat_Capacity=43200000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_52",
    Q_HP_nom=6738.76,
    A_living=140.312,
    A_wall=90.391,
    A_window=28.0624,
    A_roof=140.312,
    A_ground=140.312,
    V_air=350.78,
    U_wall=0.333031,
    U_window=1.45597,
    U_roof=0.231194,
    U_ground=0.396792,
    thermalMass=21170500.0,
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
    loadProfileName="SFH3",
    loadProfileScaleP=2.35738,
    loadProfileScaleQ=2.35738,
    usePV=true,
    PV_peakPower=6979.09,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_53",
    Q_HP_nom=5906.08,
    A_living=117.869,
    A_wall=84.9938,
    A_window=23.5739,
    A_roof=117.869,
    A_ground=117.869,
    V_air=294.673,
    U_wall=0.347698,
    U_window=1.49911,
    U_roof=0.239822,
    U_ground=0.409733,
    thermalMass=18615800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=68,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-203.93,78.9},{-188.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_54(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=2.02248,
    loadProfileScaleQ=2.02248,
    usePV=true,
    PV_peakPower=5987.61,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_54",
    Q_HP_nom=4941.58,
    A_living=101.124,
    A_wall=80.3355,
    A_window=20.2247,
    A_roof=101.124,
    A_ground=101.124,
    V_air=252.809,
    U_wall=0.315673,
    U_window=1.40492,
    U_roof=0.220984,
    U_ground=0.381477,
    thermalMass=16651700.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=69,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=70,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=71,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-223.93,50.9},{-208.93,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_55(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=2.5987,
    loadProfileScaleQ=2.5987,
    usePV=true,
    PV_peakPower=7693.52,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_55",
    Q_HP_nom=6111.6,
    A_living=129.935,
    A_wall=88.002,
    A_window=25.987,
    A_roof=129.935,
    A_ground=129.935,
    V_air=324.837,
    U_wall=0.311653,
    U_window=1.3931,
    U_roof=0.218619,
    U_ground=0.377929,
    thermalMass=19999000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=72,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-203.93,50.9},{-188.93,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_56(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=2.82696,
    loadProfileScaleQ=2.82696,
    usePV=true,
    PV_peakPower=8369.29,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_56",
    Q_HP_nom=7795.04,
    A_living=141.348,
    A_wall=90.6202,
    A_window=28.2696,
    A_roof=141.348,
    A_ground=141.348,
    V_air=353.369,
    U_wall=0.440543,
    U_window=1.77219,
    U_roof=0.294437,
    U_ground=0.491656,
    thermalMass=21286600.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=73,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-223.93,22.9},{-208.93,37.9}})));

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
    loadProfileName="SFH23",
    loadProfileScaleP=2.64604,
    loadProfileScaleQ=2.64604,
    usePV=true,
    PV_peakPower=7833.67,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_57",
    Q_HP_nom=7049.79,
    A_living=132.302,
    A_wall=88.5623,
    A_window=26.4605,
    A_roof=132.302,
    A_ground=132.302,
    V_air=330.756,
    U_wall=0.405724,
    U_window=1.66978,
    U_roof=0.273955,
    U_ground=0.460933,
    thermalMass=20267700.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=74,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-203.93,22.9},{-188.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_58(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH39",
    loadProfileScaleP=3.35124,
    loadProfileScaleQ=3.35124,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_58",
    Q_HP_nom=8208.7,
    A_living=167.562,
    A_wall=95.9333,
    A_window=33.5124,
    A_roof=167.562,
    A_ground=167.562,
    V_air=418.904,
    U_wall=0.363378,
    U_window=1.54523,
    U_roof=0.249046,
    U_ground=0.423569,
    thermalMass=24179700.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=75,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-119.93,99.9},{-104.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_59(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=2.88284,
    loadProfileScaleQ=2.88284,
    usePV=true,
    PV_peakPower=8534.72,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_59",
    Q_HP_nom=6762.67,
    A_living=144.142,
    A_wall=91.2307,
    A_window=28.8284,
    A_roof=144.142,
    A_ground=144.142,
    V_air=360.355,
    U_wall=0.31866,
    U_window=1.41371,
    U_roof=0.222741,
    U_ground=0.384112,
    thermalMass=21599000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=76,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-119.93,78.9},{-104.93,93.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_60(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=3.01862,
    loadProfileScaleQ=3.01862,
    usePV=true,
    PV_peakPower=8936.7,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_60",
    Q_HP_nom=7088.36,
    A_living=150.931,
    A_wall=92.6679,
    A_window=30.1863,
    A_roof=150.931,
    A_ground=150.931,
    V_air=377.329,
    U_wall=0.323241,
    U_window=1.42718,
    U_roof=0.225436,
    U_ground=0.388153,
    thermalMass=22354000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=77,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-119.93,50.9},{-104.93,65.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_61(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.27656,
    loadProfileScaleQ=2.27656,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_61",
    Q_HP_nom=5271.1,
    A_living=113.828,
    A_wall=83.9246,
    A_window=22.7656,
    A_roof=113.828,
    A_ground=113.828,
    V_air=284.57,
    U_wall=0.289865,
    U_window=1.32901,
    U_roof=0.205803,
    U_ground=0.358704,
    thermalMass=18146800.0,
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
    loadProfileName="SFH22",
    loadProfileScaleP=2.43302,
    loadProfileScaleQ=2.43302,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_62",
    Q_HP_nom=6121.85,
    A_living=121.651,
    A_wall=85.9652,
    A_window=24.3301,
    A_roof=121.651,
    A_ground=121.651,
    V_air=304.127,
    U_wall=0.353851,
    U_window=1.51721,
    U_roof=0.243442,
    U_ground=0.415163,
    thermalMass=19051900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=78,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-92.93,22.9},{-77.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_63(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH18",
    loadProfileScaleP=2.20622,
    loadProfileScaleQ=2.20622,
    usePV=true,
    PV_peakPower=6531.57,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_63",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=79,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-72.93,22.9},{-57.93,37.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_64(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=2.33686,
    loadProfileScaleQ=2.33686,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_64",
    Q_HP_nom=6271.91,
    A_living=116.843,
    A_wall=84.7253,
    A_window=23.3686,
    A_roof=116.843,
    A_ground=116.843,
    V_air=292.107,
    U_wall=0.398378,
    U_window=1.64817,
    U_roof=0.269634,
    U_ground=0.454452,
    thermalMass=18497000.0,
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
    loadProfileName="SFH10",
    loadProfileScaleP=3.28872,
    loadProfileScaleQ=3.28872,
    usePV=true,
    PV_peakPower=9736.34,
    useBattery=true,
    Bat_Capacity=25920000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_65",
    Q_HP_nom=7869.62,
    A_living=164.436,
    A_wall=95.3453,
    A_window=32.8871,
    A_roof=164.436,
    A_ground=164.436,
    V_air=411.089,
    U_wall=0.344218,
    U_window=1.48888,
    U_roof=0.237775,
    U_ground=0.406663,
    thermalMass=23838900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=80,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-92.93,1.9},{-77.93,16.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_66(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=2.9991,
    loadProfileScaleQ=2.9991,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_66",
    Q_HP_nom=6922.41,
    A_living=149.955,
    A_wall=92.4652,
    A_window=29.9911,
    A_roof=149.955,
    A_ground=149.955,
    V_air=374.889,
    U_wall=0.310533,
    U_window=1.3898,
    U_roof=0.21796,
    U_ground=0.376941,
    thermalMass=22245800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=81,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-119.93,-26.1},{-104.93,-11.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_67(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=2.3849,
    loadProfileScaleQ=2.3849,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_67",
    Q_HP_nom=5443.25,
    A_living=119.245,
    A_wall=85.3504,
    A_window=23.849,
    A_roof=119.245,
    A_ground=119.245,
    V_air=298.113,
    U_wall=0.284195,
    U_window=1.31234,
    U_roof=0.202468,
    U_ground=0.353702,
    thermalMass=18774800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=82,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-42.93,99.9},{-27.93,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_68(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.4314,
    loadProfileScaleQ=3.4314,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_68",
    Q_HP_nom=7590.13,
    A_living=171.57,
    A_wall=96.6707,
    A_window=34.3139,
    A_roof=171.57,
    A_ground=171.57,
    V_air=428.924,
    U_wall=0.291432,
    U_window=1.33362,
    U_roof=0.206725,
    U_ground=0.360087,
    thermalMass=24615100.0,
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
    loadProfileName="SFH29",
    loadProfileScaleP=2.74636,
    loadProfileScaleQ=2.74636,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_69",
    Q_HP_nom=7187.29,
    A_living=137.318,
    A_wall=89.7191,
    A_window=27.4635,
    A_roof=137.318,
    A_ground=137.318,
    V_air=343.294,
    U_wall=0.395497,
    U_window=1.6397,
    U_roof=0.267939,
    U_ground=0.451909,
    thermalMass=20834100.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=83,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=84,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-70.93,8.9},{-55.93,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_70(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=3.22598,
    loadProfileScaleQ=3.22598,
    usePV=true,
    PV_peakPower=9550.6,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_70",
    Q_HP_nom=7871.97,
    A_living=161.299,
    A_wall=94.7437,
    A_window=32.2597,
    A_roof=161.299,
    A_ground=161.299,
    V_air=403.247,
    U_wall=0.357128,
    U_window=1.52685,
    U_roof=0.24537,
    U_ground=0.418055,
    thermalMass=23495800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=85,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-21.93,36.9},{-6.93,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_71(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH35",
    loadProfileScaleP=3.56454,
    loadProfileScaleQ=3.56454,
    usePV=true,
    PV_peakPower=10552.9,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_71",
    Q_HP_nom=8758.16,
    A_living=178.227,
    A_wall=97.8563,
    A_window=35.6455,
    A_roof=178.227,
    A_ground=178.227,
    V_air=445.568,
    U_wall=0.371218,
    U_window=1.56829,
    U_roof=0.253658,
    U_ground=0.430487,
    thermalMass=25334900.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=86,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=87,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-21.93,8.9},{-6.93,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_72(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.2645,
    loadProfileScaleQ=3.2645,
    usePV=true,
    PV_peakPower=9664.64,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_72",
    Q_HP_nom=8750.91,
    A_living=163.225,
    A_wall=95.1145,
    A_window=32.6449,
    A_roof=163.225,
    A_ground=163.225,
    V_air=408.061,
    U_wall=0.432434,
    U_window=1.74834,
    U_roof=0.289667,
    U_ground=0.484501,
    thermalMass=23706600.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=88,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=89,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=90,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-21.93,-12.1},{-6.93,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_73(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.7697,
    loadProfileScaleQ=3.7697,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_73",
    Q_HP_nom=10119.9,
    A_living=188.485,
    A_wall=99.5928,
    A_window=37.697,
    A_roof=188.485,
    A_ground=188.485,
    V_air=471.213,
    U_wall=0.448358,
    U_window=1.79517,
    U_roof=0.299034,
    U_ground=0.498551,
    thermalMass=26435500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=91,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-1.93,-12.1},{13.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_74(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=2.58258,
    loadProfileScaleQ=2.58258,
    usePV=true,
    PV_peakPower=7645.8,
    useBattery=true,
    Bat_Capacity=17280000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_74",
    Q_HP_nom=6124.11,
    A_living=129.129,
    A_wall=87.8092,
    A_window=25.8259,
    A_roof=129.129,
    A_ground=129.129,
    V_air=322.823,
    U_wall=0.316872,
    U_window=1.40845,
    U_roof=0.22169,
    U_ground=0.382535,
    thermalMass=19907400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=92,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{55.07,99.9},{70.07,114.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_75(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH30",
    loadProfileScaleP=3.40118,
    loadProfileScaleQ=3.40118,
    usePV=true,
    PV_peakPower=10069.3,
    useBattery=true,
    Bat_Capacity=17280000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_75",
    Q_HP_nom=8637.33,
    A_living=170.059,
    A_wall=96.3948,
    A_window=34.0117,
    A_roof=170.059,
    A_ground=170.059,
    V_air=425.146,
    U_wall=0.392723,
    U_window=1.63154,
    U_roof=0.266308,
    U_ground=0.449462,
    thermalMass=24451200.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=93,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=94,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{69.07,36.9},{84.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_76(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH36",
    loadProfileScaleP=2.8576,
    loadProfileScaleQ=2.8576,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_76",
    Q_HP_nom=6768.47,
    A_living=142.88,
    A_wall=90.9564,
    A_window=28.5759,
    A_roof=142.88,
    A_ground=142.88,
    V_air=357.199,
    U_wall=0.324765,
    U_window=1.43166,
    U_roof=0.226332,
    U_ground=0.389498,
    thermalMass=21458000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=95,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{89.07,36.9},{104.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_77(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=2.7646,
    loadProfileScaleQ=2.7646,
    usePV=true,
    PV_peakPower=8184.67,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_77",
    Q_HP_nom=6192.72,
    A_living=138.23,
    A_wall=89.9253,
    A_window=27.646,
    A_roof=138.23,
    A_ground=138.23,
    V_air=345.575,
    U_wall=0.283511,
    U_window=1.31033,
    U_roof=0.202065,
    U_ground=0.353098,
    thermalMass=20936700.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=96,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{109.07,36.9},{124.07,51.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_78(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=2.32336,
    loadProfileScaleQ=2.32336,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_78",
    Q_HP_nom=6325.69,
    A_living=116.168,
    A_wall=84.5477,
    A_window=23.2336,
    A_roof=116.168,
    A_ground=116.168,
    V_air=290.421,
    U_wall=0.408924,
    U_window=1.67919,
    U_roof=0.275838,
    U_ground=0.463757,
    thermalMass=18418800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=97,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=98,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{27.07,8.9},{42.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_79(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=3.9754,
    loadProfileScaleQ=3.9754,
    usePV=true,
    PV_peakPower=11769.3,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_79",
    Q_HP_nom=9191.73,
    A_living=198.77,
    A_wall=101.232,
    A_window=39.7541,
    A_roof=198.77,
    A_ground=198.77,
    V_air=496.926,
    U_wall=0.334403,
    U_window=1.46001,
    U_roof=0.232002,
    U_ground=0.398003,
    thermalMass=27529800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=99,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=100,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{34.07,-40.1},{49.07,-25.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_80(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH35",
    loadProfileScaleP=2.64088,
    loadProfileScaleQ=2.64088,
    usePV=true,
    PV_peakPower=7818.39,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_80",
    Q_HP_nom=6497.75,
    A_living=132.044,
    A_wall=88.5015,
    A_window=26.4087,
    A_roof=132.044,
    A_ground=132.044,
    V_air=330.109,
    U_wall=0.345189,
    U_window=1.49173,
    U_roof=0.238346,
    U_ground=0.40752,
    thermalMass=20238400.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=101,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=102,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{54.07,-40.1},{69.07,-25.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_81(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH36",
    loadProfileScaleP=3.9429,
    loadProfileScaleQ=3.9429,
    usePV=true,
    PV_peakPower=11673.1,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_81",
    Q_HP_nom=9686.66,
    A_living=197.145,
    A_wall=100.979,
    A_window=39.4291,
    A_roof=197.145,
    A_ground=197.145,
    V_air=492.864,
    U_wall=0.380014,
    U_window=1.59416,
    U_roof=0.258832,
    U_ground=0.438248,
    thermalMass=27357500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=103,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{34.07,-89.1},{49.07,-74.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_82(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=4.5816,
    loadProfileScaleQ=4.5816,
    usePV=true,
    PV_peakPower=13563.9,
    useBattery=true,
    Bat_Capacity=25920000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_82",
    Q_HP_nom=11649.8,
    A_living=229.08,
    A_wall=105.538,
    A_window=45.816,
    A_roof=229.08,
    A_ground=229.08,
    V_air=572.699,
    U_wall=0.421278,
    U_window=1.71552,
    U_roof=0.283105,
    U_ground=0.474657,
    thermalMass=30706300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=104,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{34.07,-61.1},{49.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_83(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH20",
    loadProfileScaleP=2.84562,
    loadProfileScaleQ=2.84562,
    usePV=true,
    PV_peakPower=8424.53,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_83",
    Q_HP_nom=7332.06,
    A_living=142.281,
    A_wall=90.8254,
    A_window=28.4562,
    A_roof=142.281,
    A_ground=142.281,
    V_air=355.703,
    U_wall=0.386927,
    U_window=1.61449,
    U_roof=0.262898,
    U_ground=0.444347,
    thermalMass=21391100.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=105,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=106,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=107,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{54.07,-61.1},{69.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_84(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=3.75736,
    loadProfileScaleQ=3.75736,
    usePV=true,
    PV_peakPower=11123.8,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_84",
    Q_HP_nom=9853.64,
    A_living=187.868,
    A_wall=99.4914,
    A_window=37.5736,
    A_roof=187.868,
    A_ground=187.868,
    V_air=469.67,
    U_wall=0.428351,
    U_window=1.73633,
    U_roof=0.287265,
    U_ground=0.480898,
    thermalMass=26369600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=108,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=109,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{34.07,-110.1},{49.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_85(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=3.94412,
    loadProfileScaleQ=3.94412,
    usePV=true,
    PV_peakPower=11676.7,
    useBattery=true,
    Bat_Capacity=25920000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_85",
    Q_HP_nom=9029.71,
    A_living=197.206,
    A_wall=100.989,
    A_window=39.4413,
    A_roof=197.206,
    A_ground=197.206,
    V_air=493.016,
    U_wall=0.326502,
    U_window=1.43677,
    U_roof=0.227354,
    U_ground=0.391031,
    thermalMass=27364000.0,
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
    loadProfileName="SFH9",
    loadProfileScaleP=4.14794,
    loadProfileScaleQ=4.14794,
    usePV=true,
    PV_peakPower=12280.1,
    useBattery=true,
    Bat_Capacity=43200000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_86",
    Q_HP_nom=10591.6,
    A_living=207.397,
    A_wall=102.533,
    A_window=41.4794,
    A_roof=207.397,
    A_ground=207.397,
    V_air=518.493,
    U_wall=0.415668,
    U_window=1.69902,
    U_roof=0.279805,
    U_ground=0.469707,
    thermalMass=28440900.0,
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
    loadProfileName="SFH40",
    loadProfileScaleP=3.78938,
    loadProfileScaleQ=3.78938,
    usePV=true,
    PV_peakPower=11218.6,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_87",
    Q_HP_nom=8534.4,
    A_living=189.469,
    A_wall=99.754,
    A_window=37.8939,
    A_roof=189.469,
    A_ground=189.469,
    V_air=473.674,
    U_wall=0.311558,
    U_window=1.39282,
    U_roof=0.218564,
    U_ground=0.377845,
    thermalMass=26540700.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=110,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=111,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{54.07,-159.1},{69.07,-144.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_88(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=4.04122,
    loadProfileScaleQ=4.04122,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_88",
    Q_HP_nom=10680.2,
    A_living=202.061,
    A_wall=101.736,
    A_window=40.4122,
    A_roof=202.061,
    A_ground=202.061,
    V_air=505.152,
    U_wall=0.441975,
    U_window=1.7764,
    U_roof=0.295279,
    U_ground=0.492919,
    thermalMass=27878000.0,
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
    loadProfileName="SFH10",
    loadProfileScaleP=3.15966,
    loadProfileScaleQ=3.15966,
    usePV=true,
    PV_peakPower=9354.26,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_89",
    Q_HP_nom=8138.4,
    A_living=157.983,
    A_wall=94.0947,
    A_window=31.5967,
    A_roof=157.983,
    A_ground=157.983,
    V_air=394.958,
    U_wall=0.396873,
    U_window=1.64374,
    U_roof=0.268749,
    U_ground=0.453123,
    thermalMass=23132000.0,
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
    loadProfileName="SFH35",
    loadProfileScaleP=3.72722,
    loadProfileScaleQ=3.72722,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_90",
    Q_HP_nom=8468.97,
    A_living=186.361,
    A_wall=99.242,
    A_window=37.2723,
    A_roof=186.361,
    A_ground=186.361,
    V_air=465.903,
    U_wall=0.316636,
    U_window=1.40775,
    U_roof=0.221551,
    U_ground=0.382326,
    thermalMass=26208500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=112,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{258.07,8.9},{273.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_91(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.4112,
    loadProfileScaleQ=2.4112,
    usePV=true,
    PV_peakPower=7138.42,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_91",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=113,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{278.07,8.9},{293.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_92(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=3.81122,
    loadProfileScaleQ=3.81122,
    usePV=true,
    PV_peakPower=11283.2,
    useBattery=true,
    Bat_Capacity=43200000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_92",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=114,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{258.07,-12.1},{273.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_93(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH12",
    loadProfileScaleP=2.71692,
    loadProfileScaleQ=2.71692,
    usePV=true,
    PV_peakPower=8043.51,
    useBattery=true,
    Bat_Capacity=8640000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_93",
    Q_HP_nom=6460.21,
    A_living=135.846,
    A_wall=89.3839,
    A_window=27.1693,
    A_roof=135.846,
    A_ground=135.846,
    V_air=339.616,
    U_wall=0.32317,
    U_window=1.42697,
    U_roof=0.225394,
    U_ground=0.388091,
    thermalMass=20668300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=115,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{278.07,-12.1},{293.07,2.9}})));

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
    loadProfileName="SFH20",
    loadProfileScaleP=3.1011,
    loadProfileScaleQ=3.1011,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_94",
    Q_HP_nom=7188.37,
    A_living=155.055,
    A_wall=93.5102,
    A_window=31.0111,
    A_roof=155.055,
    A_ground=155.055,
    V_air=387.639,
    U_wall=0.316263,
    U_window=1.40666,
    U_roof=0.221331,
    U_ground=0.381997,
    thermalMass=22809700.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=116,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{298.07,-12.1},{313.07,2.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_95(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.37818,
    loadProfileScaleQ=3.37818,
    usePV=true,
    PV_peakPower=10001.2,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_95",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=117,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=118,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{195.07,8.9},{210.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_96(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH38",
    loadProfileScaleP=2.96608,
    loadProfileScaleQ=2.96608,
    usePV=true,
    PV_peakPower=8781.16,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_96",
    Q_HP_nom=6598.86,
    A_living=148.304,
    A_wall=92.1193,
    A_window=29.6608,
    A_roof=148.304,
    A_ground=148.304,
    V_air=370.759,
    U_wall=0.284363,
    U_window=1.31283,
    U_roof=0.202566,
    U_ground=0.353849,
    thermalMass=22062500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=119,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{215.07,8.9},{230.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_97(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=2.61804,
    loadProfileScaleQ=2.61804,
    usePV=true,
    PV_peakPower=7750.78,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_97",
    Q_HP_nom=6183.54,
    A_living=130.902,
    A_wall=88.232,
    A_window=26.1804,
    A_roof=130.902,
    A_ground=130.902,
    V_air=327.255,
    U_wall=0.31527,
    U_window=1.40374,
    U_roof=0.220747,
    U_ground=0.381121,
    thermalMass=20108900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=120,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{235.07,8.9},{250.07,23.9}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_98(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH12",
    loadProfileScaleP=4.09294,
    loadProfileScaleQ=4.09294,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_98",
    Q_HP_nom=9660.38,
    A_living=204.647,
    A_wall=102.125,
    A_window=40.9294,
    A_roof=204.647,
    A_ground=204.647,
    V_air=511.617,
    U_wall=0.352197,
    U_window=1.51234,
    U_roof=0.242469,
    U_ground=0.413703,
    thermalMass=28151000.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=121,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=122,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=123,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{216.07,-33.1},{231.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_99(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=3.26346,
    loadProfileScaleQ=3.26346,
    usePV=true,
    PV_peakPower=9661.56,
    useBattery=true,
    Bat_Capacity=17280000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_99",
    Q_HP_nom=7809.73,
    A_living=163.173,
    A_wall=95.1046,
    A_window=32.6346,
    A_roof=163.173,
    A_ground=163.173,
    V_air=407.932,
    U_wall=0.343609,
    U_window=1.48708,
    U_roof=0.237417,
    U_ground=0.406125,
    thermalMass=23700900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=124,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{236.07,-33.1},{251.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_100(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=2.81378,
    loadProfileScaleQ=2.81378,
    usePV=true,
    PV_peakPower=8330.27,
    useBattery=true,
    Bat_Capacity=34560000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_100",
    Q_HP_nom=6996.54,
    A_living=140.689,
    A_wall=90.4746,
    A_window=28.1378,
    A_roof=140.689,
    A_ground=140.689,
    V_air=351.723,
    U_wall=0.358808,
    U_window=1.53179,
    U_roof=0.246358,
    U_ground=0.419536,
    thermalMass=21212800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=125,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=126,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{256.07,-33.1},{271.07,-18.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_101(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=4.14158,
    loadProfileScaleQ=4.14158,
    usePV=true,
    PV_peakPower=12261.3,
    useBattery=true,
    Bat_Capacity=43200000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_101",
    Q_HP_nom=9442.11,
    A_living=207.079,
    A_wall=102.487,
    A_window=41.4158,
    A_roof=207.079,
    A_ground=207.079,
    V_air=517.697,
    U_wall=0.327197,
    U_window=1.43881,
    U_roof=0.227763,
    U_ground=0.391644,
    thermalMass=28407300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=127,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{167.07,-61.1},{182.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_102(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=2.52612,
    loadProfileScaleQ=2.52612,
    usePV=true,
    PV_peakPower=7478.64,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_102",
    Q_HP_nom=6548.28,
    A_living=126.306,
    A_wall=87.1247,
    A_window=25.2612,
    A_roof=126.306,
    A_ground=126.306,
    V_air=315.765,
    U_wall=0.379753,
    U_window=1.59339,
    U_roof=0.258678,
    U_ground=0.438018,
    thermalMass=19585500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=128,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{187.07,-61.1},{202.07,-46.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_103(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=2.56476,
    loadProfileScaleQ=2.56476,
    usePV=true,
    PV_peakPower=7593.04,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_103",
    Q_HP_nom=7045.79,
    A_living=128.238,
    A_wall=87.5946,
    A_window=25.6476,
    A_roof=128.238,
    A_ground=128.238,
    V_air=320.595,
    U_wall=0.426855,
    U_window=1.73193,
    U_roof=0.286386,
    U_ground=0.479578,
    thermalMass=19805900.0,
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
    loadProfileName="SFH39",
    loadProfileScaleP=3.6847,
    loadProfileScaleQ=3.6847,
    usePV=true,
    PV_peakPower=10908.7,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_104",
    Q_HP_nom=8188.47,
    A_living=184.235,
    A_wall=98.8862,
    A_window=36.847,
    A_roof=184.235,
    A_ground=184.235,
    V_air=460.587,
    U_wall=0.29998,
    U_window=1.35877,
    U_roof=0.211753,
    U_ground=0.36763,
    thermalMass=25980700.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=129,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=130,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{187.07,-82.1},{202.07,-67.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_105(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH38",
    loadProfileScaleP=2.61344,
    loadProfileScaleQ=2.61344,
    usePV=true,
    PV_peakPower=7737.16,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_105",
    Q_HP_nom=6640.16,
    A_living=130.672,
    A_wall=88.1774,
    A_window=26.1344,
    A_roof=130.672,
    A_ground=130.672,
    V_air=326.68,
    U_wall=0.367954,
    U_window=1.55869,
    U_roof=0.251738,
    U_ground=0.427607,
    thermalMass=20082800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=131,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=132,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{167.07,-110.1},{182.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_106(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=4.17182,
    loadProfileScaleQ=4.17182,
    usePV=true,
    PV_peakPower=12350.8,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_106",
    Q_HP_nom=9184.47,
    A_living=208.591,
    A_wall=102.709,
    A_window=41.7181,
    A_roof=208.591,
    A_ground=208.591,
    V_air=521.476,
    U_wall=0.302452,
    U_window=1.36603,
    U_roof=0.213207,
    U_ground=0.36981,
    thermalMass=28566400.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=133,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=134,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{187.07,-110.1},{202.07,-95.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_107(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=2.9932,
    loadProfileScaleQ=2.9932,
    usePV=true,
    PV_peakPower=8861.45,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_107",
    Q_HP_nom=7810.77,
    A_living=149.66,
    A_wall=92.4035,
    A_window=29.9319,
    A_roof=149.66,
    A_ground=149.66,
    V_air=374.149,
    U_wall=0.401866,
    U_window=1.65843,
    U_roof=0.271686,
    U_ground=0.457529,
    thermalMass=22213000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=135,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{167.07,-131.1},{182.07,-116.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_108(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH40",
    loadProfileScaleP=2.82628,
    loadProfileScaleQ=2.82628,
    usePV=true,
    PV_peakPower=8367.28,
    useBattery=true,
    Bat_Capacity=17280000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_108",
    Q_HP_nom=6915.65,
    A_living=141.314,
    A_wall=90.6127,
    A_window=28.2627,
    A_roof=141.314,
    A_ground=141.314,
    V_air=353.284,
    U_wall=0.34733,
    U_window=1.49803,
    U_roof=0.239606,
    U_ground=0.409409,
    thermalMass=21282800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=136,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=137,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{187.07,-131.1},{202.07,-116.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_109(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=3.57426,
    loadProfileScaleQ=3.57426,
    usePV=true,
    PV_peakPower=10581.7,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_109",
    Q_HP_nom=8835.06,
    A_living=178.713,
    A_wall=97.941,
    A_window=35.7426,
    A_roof=178.713,
    A_ground=178.713,
    V_air=446.783,
    U_wall=0.376122,
    U_window=1.58271,
    U_roof=0.256542,
    U_ground=0.434813,
    thermalMass=25387200.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=138,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{207.07,-131.1},{222.07,-116.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_110(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=3.94026,
    loadProfileScaleQ=3.94026,
    usePV=true,
    PV_peakPower=11665.2,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_110",
    Q_HP_nom=8832.81,
    A_living=197.013,
    A_wall=100.959,
    A_window=39.4026,
    A_roof=197.013,
    A_ground=197.013,
    V_air=492.532,
    U_wall=0.311158,
    U_window=1.39164,
    U_roof=0.218328,
    U_ground=0.377492,
    thermalMass=27343400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=139,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{167.07,-208.1},{182.07,-193.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_111(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=4.13378,
    loadProfileScaleQ=4.13378,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_111",
    Q_HP_nom=9137.04,
    A_living=206.689,
    A_wall=102.429,
    A_window=41.3378,
    A_roof=206.689,
    A_ground=206.689,
    V_air=516.722,
    U_wall=0.304624,
    U_window=1.37242,
    U_roof=0.214485,
    U_ground=0.371727,
    thermalMass=28366300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=140,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{187.07,-208.1},{202.07,-193.1}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------

  TransiEnt.Components.Electrical.PowerTransformation.SimpleTransformerComplex simpleTransformerComplex(
    UseRatio=false,
    ratio=50,
    U_P=10e3,
    U_S=400,
    epp_p(v(start=10000)),
    epp_n(v(start=400))) annotation (Placement(transformation(extent={{-104,174},{-84,194}})));
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
      points={{-104,184},{-104,146},{-74,146},{-74,128},{0,128},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_a, simpleTransformerComplex.epp_n) annotation (Line(
      points={{-39.2,184},{-84,184}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_b, node_1.epp) annotation (Line(
      points={{-20.8,184},{-20.8,164},{-20,164},{-20,144},{-31.43,144},{-31.43,155.9}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.controlBus, controlBus.GridMeter) annotation();
   annotation(
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={Rectangle(
          extent={{-240,220},{-120,140}},
          lineColor={102,44,145},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-238,220},{-122,144}},
          textColor={102,44,145},
          horizontalAlignment=TextAlignment.Left,
          textString="Scenario: LV-urban-6
Topology: SimBench 1-LV-urban6--0-sw
Degree of urbanisation: Urban
Technology Mix: Future
Number of Prosumers: 111
Number of PV: 88
Number of BES: 73
Number of EHP: 87
Number of BEV: 140")}),
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
          textString="%LV_urban_6_A")}));
end LV_urban_6_Future;
