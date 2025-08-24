within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_TIA;
model LV_semiurb_4_I
  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String condition_scenario="";

  parameter String data_local="modelica://Scenarios_CyEntEE/LocalData/" + "LV_semiurb_4/" + condition_scenario + "/" "Directory containing simulation data";

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for battery system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for heating system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for vehicle system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter String weatherLocation = "Hamelin" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter String weatherYear = "2019" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter Boolean useTTEC=false "If lines shall use transient thermal equivalent circuit" annotation (Evaluate=true, Dialog(group="Line"));

  parameter Boolean useUndergroundTemperature=false "If lines shall use transient thermal equivalent circuit" annotation (Evaluate=true, Dialog(group="Line"));

  parameter Boolean useUndergroundMoisture=false "If lines shall use transient thermal equivalent circuit" annotation (Evaluate=true, Dialog(group="Line"));

  // ------------------------------------------------------------------------------------------
  //   Components
  // ------------------------------------------------------------------------------------------

  // ---- TransiEnt Models (SimCenter and ModelStatistics) ------------------------------------

  inner TransiEnt.SimCenter simCenter(redeclare model Ground_Temperature = TransiEnt.Basics.Tables.Ambient.UndergroundTemperature_Duesseldorf_1m_3600s_TMY (use_absolute_path=true, absolute_path="modelica://TransiEnt/Tables/ambient/UndergroundTemperature_Duesseldorf_1m_2017.txt"), electricityPrice(use_absolute_path=true, absolute_path="modelica://TransiEnt/Tables/electricity/ElectricityPrices_DayAhead_EPEX_Spot_2011.txt")) annotation (Placement(transformation(extent={{-90.0,80.0},{-70.0,100.0}})));
  inner TransiEnt.ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-60.0,80.0},{-40.0,100.0}})));

  // ---- Nodes -------------------------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Base.Node node_1(v_n=400) annotation (Placement(transformation(extent={{92.27,10.18},{97.27,15.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_2(v_n=400) annotation (Placement(transformation(extent={{50.27,87.18},{55.27,92.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_3(v_n=400) annotation (Placement(transformation(extent={{92.27,66.18},{97.27,71.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_4(v_n=400) annotation (Placement(transformation(extent={{1.27,-73.82},{6.27,-68.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_5(v_n=400) annotation (Placement(transformation(extent={{127.27,-143.82},{132.27,-138.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_6(v_n=400) annotation (Placement(transformation(extent={{-5.73,38.18},{-0.73,43.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_7(v_n=400) annotation (Placement(transformation(extent={{127.27,-227.82},{132.27,-222.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_8(v_n=400) annotation (Placement(transformation(extent={{50.27,143.18},{55.27,148.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_9(v_n=400) annotation (Placement(transformation(extent={{-75.73,80.18},{-70.73,85.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_10(v_n=400) annotation (Placement(transformation(extent={{-5.73,66.18},{-0.73,71.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_11(v_n=400) annotation (Placement(transformation(extent={{92.27,-17.82},{97.27,-12.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_12(v_n=400) annotation (Placement(transformation(extent={{92.27,38.18},{97.27,43.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_13(v_n=400) annotation (Placement(transformation(extent={{-5.73,-45.82},{-0.73,-40.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_14(v_n=400) annotation (Placement(transformation(extent={{-68.73,143.18},{-63.73,148.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_15(v_n=400) annotation (Placement(transformation(extent={{-19.73,234.18},{-14.73,239.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_16(v_n=400) annotation (Placement(transformation(extent={{92.27,-66.82},{97.27,-61.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_17(v_n=400) annotation (Placement(transformation(extent={{127.27,-122.82},{132.27,-117.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_18(v_n=400) annotation (Placement(transformation(extent={{92.27,-94.82},{97.27,-89.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_19(v_n=400) annotation (Placement(transformation(extent={{-68.73,52.18},{-63.73,57.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_20(v_n=400) annotation (Placement(transformation(extent={{57.27,-241.82},{62.27,-236.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_21(v_n=400) annotation (Placement(transformation(extent={{50.27,171.18},{55.27,176.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_22(v_n=400) annotation (Placement(transformation(extent={{127.27,-171.82},{132.27,-166.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_23(v_n=400) annotation (Placement(transformation(extent={{92.27,-45.82},{97.27,-40.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_24(v_n=400) annotation (Placement(transformation(extent={{-5.73,3.18},{-0.73,8.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_25(v_n=400) annotation (Placement(transformation(extent={{57.27,-206.82},{62.27,-201.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_26(v_n=400) annotation (Placement(transformation(extent={{57.27,-269.82},{62.27,-264.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_27(v_n=400) annotation (Placement(transformation(extent={{57.27,-150.82},{62.27,-145.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_28(v_n=400) annotation (Placement(transformation(extent={{127.27,-199.82},{132.27,-194.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_29(v_n=400) annotation (Placement(transformation(extent={{-68.73,171.18},{-63.73,176.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_30(v_n=400) annotation (Placement(transformation(extent={{1.27,-24.82},{6.27,-19.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_31(v_n=400) annotation (Placement(transformation(extent={{57.27,-122.82},{62.27,-117.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_32(v_n=400) annotation (Placement(transformation(extent={{43.27,115.18},{48.27,120.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_33(v_n=400) annotation (Placement(transformation(extent={{57.27,-178.82},{62.27,-173.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_34(v_n=400) annotation (Placement(transformation(extent={{-68.73,115.18},{-63.73,120.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_35(v_n=400) annotation (Placement(transformation(extent={{-145.73,171.18},{-140.73,176.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_36(v_n=400) annotation (Placement(transformation(extent={{-145.73,143.18},{-140.73,148.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_37(v_n=400) annotation (Placement(transformation(extent={{-145.73,115.18},{-140.73,120.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_38(v_n=400) annotation (Placement(transformation(extent={{-166.73,80.18},{-161.73,85.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_39(v_n=400) annotation (Placement(transformation(extent={{-194.73,52.18},{-189.73,57.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_40(v_n=400) annotation (Placement(transformation(extent={{-194.73,17.18},{-189.73,22.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_41(v_n=400) annotation (Placement(transformation(extent={{-138.73,52.18},{-133.73,57.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_42(v_n=400) annotation (Placement(transformation(extent={{-138.73,17.18},{-133.73,22.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_43(v_n=400) annotation (Placement(transformation(extent={{-138.73,-10.82},{-133.73,-5.82}})));

  // Basic Parameters

  // ---- Lines (between nodes) ---------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Line_new line_1(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=10.219000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-72.23,66.18},{-67.23,71.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_2(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.360000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{127.27,-157.82},{132.27,-152.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_3(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.343000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-2.23,-59.82},{2.77,-54.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_4(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=14.565000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{127.27,-133.32},{132.27,-128.32}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_5(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.607000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{46.77,129.18},{51.77,134.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_6(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.650000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{92.27,52.18},{97.27,57.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_7(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=10.010000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{92.27,-31.82},{97.27,-26.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_8(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.594000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{57.27,-192.82},{62.27,-187.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_9(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.460000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{127.27,-213.82},{132.27,-208.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_10(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.552000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-44.23,202.68},{-39.23,207.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_11(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=26.545000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-5.73,52.18},{-0.73,57.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_12(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.417000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{71.27,76.68},{76.27,81.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_13(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.429000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{57.27,-224.32},{62.27,-219.32}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_14(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.046000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{74.77,-108.82},{79.77,-103.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_15(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=0.692000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-2.23,-10.82},{2.77,-5.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_16(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.870000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-68.73,157.18},{-63.73,162.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_17(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=33.843000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{57.27,-255.82},{62.27,-250.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_18(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.660000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{57.27,-136.82},{62.27,-131.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_19(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=14.085000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{92.27,-3.82},{97.27,1.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_20(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=16.354000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{46.77,101.18},{51.77,106.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_21(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.451000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{92.27,-56.32},{97.27,-51.32}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_22(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.942000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-2.23,-35.32},{2.77,-30.32}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_23(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=11.444000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{92.27,24.18},{97.27,29.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_24(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.428000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-72.23,97.68},{-67.23,102.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_25(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.348000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{15.27,202.68},{20.27,207.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_26(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.222000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{22.27,76.68},{27.27,81.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_27(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=29.066000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{109.77,-108.82},{114.77,-103.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_28(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=53.308000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-68.73,129.18},{-63.73,134.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_29(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.024000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{50.27,157.18},{55.27,162.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_30(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.234000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{57.27,-164.82},{62.27,-159.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_31(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=26.544000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-5.73,20.68},{-0.73,25.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_32(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=18.783000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{92.27,-80.82},{97.27,-75.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_33(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.678000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{127.27,-185.82},{132.27,-180.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_34(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=60.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-82.73,202.68},{-77.73,207.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_35(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=28.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-145.73,157.18},{-140.73,162.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_36(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=36.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-145.73,129.18},{-140.73,134.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_37(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-156.23,97.68},{-151.23,102.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_38(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=41.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-180.73,66.18},{-175.73,71.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_39(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=22.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-194.73,34.68},{-189.73,39.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_40(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=28.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-152.73,66.18},{-147.73,71.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_41(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=20.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-138.73,34.68},{-133.73,39.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_42(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=26.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-138.73,3.18},{-133.73,8.18}})));

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
    loadProfileName="SFH38",
    loadProfileScaleP=4.08203,
    loadProfileScaleQ=4.08203,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_I_1",
    Q_HP_nom=9951.0,
    A_living=204.101,
    A_wall=102.044,
    A_window=40.8203,
    A_roof=204.101,
    A_ground=204.101,
    V_air=510.253,
    U_wall=0.376933,
    U_window=1.5851,
    U_roof=0.25702,
    U_ground=0.43553,
    thermalMass=28093500.0,
    num_BEVs=2,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=2,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{63.27,115.18},{78.27,130.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_2(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH11",
    loadProfileScaleP=2.97136,
    loadProfileScaleQ=2.97136,
    usePV=true,
    PV_peakPower=8796.79,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_2",
    Q_HP_nom=7297.32,
    A_living=148.568,
    A_wall=92.1749,
    A_window=29.7136,
    A_roof=148.568,
    A_ground=148.568,
    V_air=371.42,
    U_wall=0.354562,
    U_window=1.5193,
    U_roof=0.24386,
    U_ground=0.41579,
    thermalMass=22091800.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{14.27,38.18},{29.27,53.18}})));

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
    loadProfileName="SFH10",
    loadProfileScaleP=5.01485,
    loadProfileScaleQ=5.01485,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_I_3",
    num_BEVs=0) annotation (Placement(transformation(extent={{-48.73,52.18},{-33.73,67.18}})));

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
    loadProfileName="SFH40",
    loadProfileScaleP=3.89173,
    loadProfileScaleQ=3.89173,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_4",
    num_BEVs=2,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=3,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=4,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-48.73,143.18},{-33.73,158.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_5(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=4.85296,
    loadProfileScaleQ=4.85296,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_I_5",
    num_BEVs=0) annotation (Placement(transformation(extent={{112.27,-17.82},{127.27,-2.82}})));

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
    loadProfileName="SFH12",
    loadProfileScaleP=3.43054,
    loadProfileScaleQ=3.43054,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_6",
    num_BEVs=0) annotation (Placement(transformation(extent={{147.27,-122.82},{162.27,-107.82}})));

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
    loadProfileName="SFH32",
    loadProfileScaleP=3.67504,
    loadProfileScaleQ=3.67504,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_7",
    Q_HP_nom=9228.72,
    A_living=183.752,
    A_wall=98.8048,
    A_window=36.7504,
    A_roof=183.752,
    A_ground=183.752,
    V_air=459.381,
    U_wall=0.391028,
    U_window=1.62655,
    U_roof=0.265311,
    U_ground=0.447966,
    thermalMass=25928900.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{77.27,-122.82},{92.27,-107.82}})));

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
    loadProfileName="SFH19",
    loadProfileScaleP=3.12432,
    loadProfileScaleQ=3.12432,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_8",
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=5,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{77.27,-178.82},{92.27,-163.82}})));

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
    loadProfileName="SFH21",
    loadProfileScaleP=2.71967,
    loadProfileScaleQ=2.71967,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_9",
    num_BEVs=2,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=6,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=7,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{147.27,-199.82},{162.27,-184.82}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=2.97658,
    loadProfileScaleQ=2.97658,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_10",
    num_BEVs=0) annotation (Placement(transformation(extent={{21.27,-73.82},{36.27,-58.82}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH18",
    loadProfileScaleP=3.27202,
    loadProfileScaleQ=3.27202,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_11",
    Q_HP_nom=7440.39,
    A_living=163.601,
    A_wall=95.1864,
    A_window=32.7202,
    A_roof=163.601,
    A_ground=163.601,
    V_air=409.003,
    U_wall=0.307025,
    U_window=1.37948,
    U_roof=0.215897,
    U_ground=0.373845,
    thermalMass=23747700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{70.27,143.18},{85.27,158.18}})));

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
    loadProfileName="SFH18",
    loadProfileScaleP=3.49842,
    loadProfileScaleQ=3.49842,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_12",
    num_BEVs=0) annotation (Placement(transformation(extent={{-55.73,80.18},{-40.73,95.18}})));

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
    loadProfileName="SFH39",
    loadProfileScaleP=4.2997,
    loadProfileScaleQ=4.2997,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_I_13",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.27,-45.82},{29.27,-30.82}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=3.26084,
    loadProfileScaleQ=3.26084,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_14",
    Q_HP_nom=7380.48,
    A_living=163.042,
    A_wall=95.0795,
    A_window=32.6084,
    A_roof=163.042,
    A_ground=163.042,
    V_air=407.605,
    U_wall=0.303491,
    U_window=1.36909,
    U_roof=0.213818,
    U_ground=0.370727,
    thermalMass=23686600.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{112.27,-66.82},{127.27,-51.82}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=2.99321,
    loadProfileScaleQ=2.99321,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_15",
    Q_HP_nom=6938.83,
    A_living=149.661,
    A_wall=92.4037,
    A_window=29.9321,
    A_roof=149.661,
    A_ground=149.661,
    V_air=374.152,
    U_wall=0.313419,
    U_window=1.39829,
    U_roof=0.219658,
    U_ground=0.379487,
    thermalMass=22213100.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-48.73,115.18},{-33.73,130.18}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=4.08602,
    loadProfileScaleQ=4.08602,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_16",
    num_BEVs=0) annotation (Placement(transformation(extent={{14.27,3.18},{29.27,18.18}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=3.51832,
    loadProfileScaleQ=3.51832,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_17",
    Q_HP_nom=9200.63,
    A_living=175.916,
    A_wall=97.4501,
    A_window=35.1832,
    A_roof=175.916,
    A_ground=175.916,
    V_air=439.79,
    U_wall=0.419569,
    U_window=1.7105,
    U_roof=0.282099,
    U_ground=0.473149,
    thermalMass=25085500.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{147.27,-171.82},{162.27,-156.82}})));

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
    loadProfileName="SFH8",
    loadProfileScaleP=2.6687,
    loadProfileScaleQ=2.6687,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_18",
    Q_HP_nom=6119.63,
    A_living=133.435,
    A_wall=88.8271,
    A_window=26.687,
    A_roof=133.435,
    A_ground=133.435,
    V_air=333.588,
    U_wall=0.296507,
    U_window=1.34855,
    U_roof=0.20971,
    U_ground=0.364565,
    thermalMass=20396000.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{70.27,171.18},{85.27,186.18}})));

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
    loadProfileName="SFH4",
    loadProfileScaleP=2.92782,
    loadProfileScaleQ=2.92782,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_19",
    Q_HP_nom=7860.9,
    A_living=146.391,
    A_wall=91.7139,
    A_window=29.2782,
    A_roof=146.391,
    A_ground=146.391,
    V_air=365.977,
    U_wall=0.422451,
    U_window=1.71897,
    U_roof=0.283794,
    U_ground=0.475692,
    thermalMass=21849700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{90.27,171.18},{105.27,186.18}})));

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
    loadProfileName="SFH34",
    loadProfileScaleP=2.34423,
    loadProfileScaleQ=2.34423,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_I_20",
    Q_HP_nom=5460.42,
    A_living=117.212,
    A_wall=84.822,
    A_window=23.4423,
    A_roof=117.212,
    A_ground=117.212,
    V_air=293.029,
    U_wall=0.296337,
    U_window=1.34805,
    U_roof=0.20961,
    U_ground=0.364415,
    thermalMass=18539700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{14.27,66.18},{29.27,81.18}})));

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
    loadProfileName="SFH16",
    loadProfileScaleP=1.92351,
    loadProfileScaleQ=1.92351,
    usePV=true,
    PV_peakPower=5694.59,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_I_21",
    num_BEVs=3,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=8,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=9,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=10,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{77.27,-241.82},{92.27,-226.82}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_22(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=3.09809,
    loadProfileScaleQ=3.09809,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_22",
    Q_HP_nom=7622.13,
    A_living=154.905,
    A_wall=93.4797,
    A_window=30.9809,
    A_roof=154.905,
    A_ground=154.905,
    V_air=387.261,
    U_wall=0.359671,
    U_window=1.53433,
    U_roof=0.246865,
    U_ground=0.420298,
    thermalMass=22793000.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-48.73,171.18},{-33.73,186.18}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=3.2035,
    loadProfileScaleQ=3.2035,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_23",
    Q_HP_nom=8749.41,
    A_living=160.175,
    A_wall=94.5253,
    A_window=32.035,
    A_roof=160.175,
    A_ground=160.175,
    V_air=400.437,
    U_wall=0.446049,
    U_window=1.78838,
    U_roof=0.297676,
    U_ground=0.496514,
    thermalMass=23372600.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-28.73,171.18},{-13.73,186.18}})));

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
    loadProfileName="SFH22",
    loadProfileScaleP=3.5481,
    loadProfileScaleQ=3.5481,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_24",
    Q_HP_nom=8853.63,
    A_living=177.405,
    A_wall=97.7125,
    A_window=35.481,
    A_roof=177.405,
    A_ground=177.405,
    V_air=443.513,
    U_wall=0.382824,
    U_window=1.60242,
    U_roof=0.260485,
    U_ground=0.440727,
    thermalMass=25246200.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{147.27,-143.82},{162.27,-128.82}})));

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
    loadProfileName="SFH28",
    loadProfileScaleP=4.33488,
    loadProfileScaleQ=4.33488,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_I_25",
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=11,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{77.27,-150.82},{92.27,-135.82}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_26(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=2.47282,
    loadProfileScaleQ=2.47282,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_I_26",
    num_BEVs=2,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=12,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=13,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{112.27,-45.82},{127.27,-30.82}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_27(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH17",
    loadProfileScaleP=3.22288,
    loadProfileScaleQ=3.22288,
    usePV=true,
    PV_peakPower=9541.42,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_27",
    num_BEVs=0) annotation (Placement(transformation(extent={{77.27,-206.82},{92.27,-191.82}})));

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
    loadProfileScaleP=3.10641,
    loadProfileScaleQ=3.10641,
    usePV=true,
    PV_peakPower=9196.58,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_28",
    num_BEVs=0) annotation (Placement(transformation(extent={{147.27,-227.82},{162.27,-212.82}})));

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
    loadProfileScaleP=3.96639,
    loadProfileScaleQ=3.96639,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_29",
    Q_HP_nom=9122.84,
    A_living=198.319,
    A_wall=101.162,
    A_window=39.6639,
    A_roof=198.319,
    A_ground=198.319,
    V_air=495.799,
    U_wall=0.330344,
    U_window=1.44807,
    U_roof=0.229614,
    U_ground=0.394421,
    thermalMass=27482000.0,
    num_BEVs=2,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=14,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=15,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{112.27,10.18},{127.27,25.18}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=3.93468,
    loadProfileScaleQ=3.93468,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_30",
    Q_HP_nom=8686.61,
    A_living=196.734,
    A_wall=100.915,
    A_window=39.3468,
    A_roof=196.734,
    A_ground=196.734,
    V_air=491.835,
    U_wall=0.300184,
    U_window=1.35936,
    U_roof=0.211873,
    U_ground=0.367809,
    thermalMass=27313800.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{112.27,66.18},{127.27,81.18}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=3.27747,
    loadProfileScaleQ=3.27747,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_I_31",
    num_BEVs=0) annotation (Placement(transformation(extent={{112.27,38.18},{127.27,53.18}})));

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
    loadProfileName="SFH36",
    loadProfileScaleP=4.10826,
    loadProfileScaleQ=4.10826,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_I_32",
    Q_HP_nom=9670.1,
    A_living=205.413,
    A_wall=102.24,
    A_window=41.0826,
    A_roof=205.413,
    A_ground=205.413,
    V_air=513.533,
    U_wall=0.350425,
    U_window=1.50713,
    U_roof=0.241426,
    U_ground=0.412139,
    thermalMass=28231900.0,
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=16,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{77.27,-269.82},{92.27,-254.82}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_33(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH9",
    loadProfileScaleP=2.32739,
    loadProfileScaleQ=2.32739,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_I_33",
    num_BEVs=0) annotation (Placement(transformation(extent={{21.27,-24.82},{36.27,-9.82}})));

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
    loadProfileName="SFH5",
    loadProfileScaleP=5.60657,
    loadProfileScaleQ=5.60657,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_I_34",
    Q_HP_nom=13570.9,
    A_living=280.329,
    A_wall=111.364,
    A_window=56.0657,
    A_roof=280.329,
    A_ground=280.329,
    V_air=700.821,
    U_wall=0.39772,
    U_window=1.64624,
    U_roof=0.269247,
    U_ground=0.453871,
    thermalMass=35943800.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-125.73,171.18},{-110.73,186.18}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=5.13264,
    loadProfileScaleQ=5.13264,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_I_35",
    num_BEVs=0) annotation (Placement(transformation(extent={{-125.73,143.18},{-110.73,158.18}})));

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
    loadProfileName="SFH20",
    loadProfileScaleP=5.38477,
    loadProfileScaleQ=5.38477,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_I_36",
    num_BEVs=0) annotation (Placement(transformation(extent={{-125.73,115.18},{-110.73,130.18}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=7.21211,
    loadProfileScaleQ=7.21211,
    usePV=true,
    PV_peakPower=21351.7,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_I_37",
    Q_HP_nom=16464.5,
    A_living=360.606,
    A_wall=117.775,
    A_window=72.1211,
    A_roof=360.606,
    A_ground=360.606,
    V_air=901.514,
    U_wall=0.368952,
    U_window=1.56162,
    U_roof=0.252325,
    U_ground=0.428487,
    thermalMass=43898700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-174.73,52.18},{-159.73,67.18}})));

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
    loadProfileName="SFH30",
    loadProfileScaleP=6.14375,
    loadProfileScaleQ=6.14375,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_I_38",
    num_BEVs=0) annotation (Placement(transformation(extent={{-174.73,17.18},{-159.73,32.18}})));

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
    loadProfileName="SFH35",
    loadProfileScaleP=6.59456,
    loadProfileScaleQ=6.59456,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_I_39",
    Q_HP_nom=15343.3,
    A_living=329.728,
    A_wall=115.639,
    A_window=65.9456,
    A_roof=329.728,
    A_ground=329.728,
    V_air=824.32,
    U_wall=0.377911,
    U_window=1.58797,
    U_roof=0.257595,
    U_ground=0.436392,
    thermalMass=40869200.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-118.73,52.18},{-103.73,67.18}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=5.61773,
    loadProfileScaleQ=5.61773,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_I_40",
    Q_HP_nom=14260.3,
    A_living=280.887,
    A_wall=111.419,
    A_window=56.1773,
    A_roof=280.887,
    A_ground=280.887,
    V_air=702.216,
    U_wall=0.43798,
    U_window=1.76465,
    U_roof=0.29293,
    U_ground=0.489394,
    thermalMass=36000100.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-118.73,17.18},{-103.73,32.18}})));

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
    loadProfileName="SFH36",
    loadProfileScaleP=4.27572,
    loadProfileScaleQ=4.27572,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_I_41",
    num_BEVs=0) annotation (Placement(transformation(extent={{-118.73,-10.82},{-103.73,4.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------

  TransiEnt.Components.Electrical.PowerTransformation.SimpleTransformerComplex simpleTransformerComplex(
    UseRatio=false,
    ratio=50,
    U_P=10e3,
    U_S=400,
    epp_p(v(start=10000)),
    epp_n(v(start=400))) annotation (Placement(transformation(extent={{-82,250},{-62,270}})));
  Models_CyEntEE.CellModels.CPP.DecouplingGrids decouplingGrids annotation (Placement(transformation(extent={{-52,250},{-32,270}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));
  Bus.LVGridControlBus controlBus annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  TransiEnt.Components.Sensors.SmartMeter GridMeter annotation (Placement(transformation(extent={{-20,250},{0,270}})));
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

  // ---- Connect lines -----------------------------------------------------------------------

  connect(line_1.epp_p, node_19.epp) annotation (Line(points={{-72.23,68.68},{-66.23,52.18}}));
  connect(line_1.epp_n, node_9.epp) annotation (Line(points={{-67.23,68.68},{-73.23,80.18}}));
  connect(line_2.epp_p, node_5.epp) annotation (Line(points={{127.27,-155.32},{129.77,-143.82}}));
  connect(line_2.epp_n, node_22.epp) annotation (Line(points={{132.27,-155.32},{129.77,-171.82}}));
  connect(line_3.epp_p, node_13.epp) annotation (Line(points={{-2.23,-57.32},{-3.23,-45.82}}));
  connect(line_3.epp_n, node_4.epp) annotation (Line(points={{2.77,-57.32},{3.77,-73.82}}));
  connect(line_4.epp_p, node_17.epp) annotation (Line(points={{127.27,-130.82},{129.77,-122.82}}));
  connect(line_4.epp_n, node_5.epp) annotation (Line(points={{132.27,-130.82},{129.77,-143.82}}));
  connect(line_5.epp_p, node_32.epp) annotation (Line(points={{46.77,131.68},{45.77,115.18}}));
  connect(line_5.epp_n, node_8.epp) annotation (Line(points={{51.77,131.68},{52.77,143.18}}));
  connect(line_6.epp_p, node_12.epp) annotation (Line(points={{92.27,54.68},{94.77,38.18}}));
  connect(line_6.epp_n, node_3.epp) annotation (Line(points={{97.27,54.68},{94.77,66.18}}));
  connect(line_7.epp_p, node_23.epp) annotation (Line(points={{92.27,-29.32},{94.77,-45.82}}));
  connect(line_7.epp_n, node_11.epp) annotation (Line(points={{97.27,-29.32},{94.77,-17.82}}));
  connect(line_8.epp_p, node_25.epp) annotation (Line(points={{57.27,-190.32},{59.77,-206.82}}));
  connect(line_8.epp_n, node_33.epp) annotation (Line(points={{62.27,-190.32},{59.77,-178.82}}));
  connect(line_9.epp_p, node_28.epp) annotation (Line(points={{127.27,-211.32},{129.77,-199.82}}));
  connect(line_9.epp_n, node_7.epp) annotation (Line(points={{132.27,-211.32},{129.77,-227.82}}));
  connect(line_10.epp_p, node_15.epp) annotation (Line(points={{-44.23,205.18},{-17.23,234.18}}));
  connect(line_10.epp_n, node_29.epp) annotation (Line(points={{-39.23,205.18},{-66.23,171.18}}));
  connect(line_11.epp_p, node_10.epp) annotation (Line(points={{-5.73,54.68},{-3.23,66.18}}));
  connect(line_11.epp_n, node_6.epp) annotation (Line(points={{-0.73,54.68},{-3.23,38.18}}));
  connect(line_12.epp_p, node_3.epp) annotation (Line(points={{71.27,79.18},{94.77,66.18}}));
  connect(line_12.epp_n, node_2.epp) annotation (Line(points={{76.27,79.18},{52.77,87.18}}));
  connect(line_13.epp_p, node_20.epp) annotation (Line(points={{57.27,-221.82},{59.77,-241.82}}));
  connect(line_13.epp_n, node_25.epp) annotation (Line(points={{62.27,-221.82},{59.77,-206.82}}));
  connect(line_14.epp_p, node_31.epp) annotation (Line(points={{74.77,-106.32},{59.77,-122.82}}));
  connect(line_14.epp_n, node_18.epp) annotation (Line(points={{79.77,-106.32},{94.77,-94.82}}));
  connect(line_15.epp_p, node_24.epp) annotation (Line(points={{-2.23,-8.32},{-3.23,3.18}}));
  connect(line_15.epp_n, node_30.epp) annotation (Line(points={{2.77,-8.32},{3.77,-24.82}}));
  connect(line_16.epp_p, node_29.epp) annotation (Line(points={{-68.73,159.68},{-66.23,171.18}}));
  connect(line_16.epp_n, node_14.epp) annotation (Line(points={{-63.73,159.68},{-66.23,143.18}}));
  connect(line_17.epp_p, node_26.epp) annotation (Line(points={{57.27,-253.32},{59.77,-269.82}}));
  connect(line_17.epp_n, node_20.epp) annotation (Line(points={{62.27,-253.32},{59.77,-241.82}}));
  connect(line_18.epp_p, node_27.epp) annotation (Line(points={{57.27,-134.32},{59.77,-150.82}}));
  connect(line_18.epp_n, node_31.epp) annotation (Line(points={{62.27,-134.32},{59.77,-122.82}}));
  connect(line_19.epp_p, node_11.epp) annotation (Line(points={{92.27,-1.32},{94.77,-17.82}}));
  connect(line_19.epp_n, node_1.epp) annotation (Line(points={{97.27,-1.32},{94.77,10.18}}));
  connect(line_20.epp_p, node_2.epp) annotation (Line(points={{46.77,103.68},{52.77,87.18}}));
  connect(line_20.epp_n, node_32.epp) annotation (Line(points={{51.77,103.68},{45.77,115.18}}));
  connect(line_21.epp_p, node_16.epp) annotation (Line(points={{92.27,-53.82},{94.77,-66.82}}));
  connect(line_21.epp_n, node_23.epp) annotation (Line(points={{97.27,-53.82},{94.77,-45.82}}));
  connect(line_22.epp_p, node_30.epp) annotation (Line(points={{-2.23,-32.82},{3.77,-24.82}}));
  connect(line_22.epp_n, node_13.epp) annotation (Line(points={{2.77,-32.82},{-3.23,-45.82}}));
  connect(line_23.epp_p, node_1.epp) annotation (Line(points={{92.27,26.68},{94.77,10.18}}));
  connect(line_23.epp_n, node_12.epp) annotation (Line(points={{97.27,26.68},{94.77,38.18}}));
  connect(line_24.epp_p, node_9.epp) annotation (Line(points={{-72.23,100.18},{-73.23,80.18}}));
  connect(line_24.epp_n, node_34.epp) annotation (Line(points={{-67.23,100.18},{-66.23,115.18}}));
  connect(line_25.epp_p, node_21.epp) annotation (Line(points={{15.27,205.18},{52.77,171.18}}));
  connect(line_25.epp_n, node_15.epp) annotation (Line(points={{20.27,205.18},{-17.23,234.18}}));
  connect(line_26.epp_p, node_2.epp) annotation (Line(points={{22.27,79.18},{52.77,87.18}}));
  connect(line_26.epp_n, node_10.epp) annotation (Line(points={{27.27,79.18},{-3.23,66.18}}));
  connect(line_27.epp_p, node_18.epp) annotation (Line(points={{109.77,-106.32},{94.77,-94.82}}));
  connect(line_27.epp_n, node_17.epp) annotation (Line(points={{114.77,-106.32},{129.77,-122.82}}));
  connect(line_28.epp_p, node_14.epp) annotation (Line(points={{-68.73,131.68},{-66.23,143.18}}));
  connect(line_28.epp_n, node_34.epp) annotation (Line(points={{-63.73,131.68},{-66.23,115.18}}));
  connect(line_29.epp_p, node_8.epp) annotation (Line(points={{50.27,159.68},{52.77,143.18}}));
  connect(line_29.epp_n, node_21.epp) annotation (Line(points={{55.27,159.68},{52.77,171.18}}));
  connect(line_30.epp_p, node_33.epp) annotation (Line(points={{57.27,-162.32},{59.77,-178.82}}));
  connect(line_30.epp_n, node_27.epp) annotation (Line(points={{62.27,-162.32},{59.77,-150.82}}));
  connect(line_31.epp_p, node_6.epp) annotation (Line(points={{-5.73,23.18},{-3.23,38.18}}));
  connect(line_31.epp_n, node_24.epp) annotation (Line(points={{-0.73,23.18},{-3.23,3.18}}));
  connect(line_32.epp_p, node_18.epp) annotation (Line(points={{92.27,-78.32},{94.77,-94.82}}));
  connect(line_32.epp_n, node_16.epp) annotation (Line(points={{97.27,-78.32},{94.77,-66.82}}));
  connect(line_33.epp_p, node_22.epp) annotation (Line(points={{127.27,-183.32},{129.77,-171.82}}));
  connect(line_33.epp_n, node_28.epp) annotation (Line(points={{132.27,-183.32},{129.77,-199.82}}));
  connect(line_34.epp_p, node_15.epp) annotation (Line(points={{-82.73,205.18},{-17.23,234.18}}));
  connect(line_34.epp_n, node_35.epp) annotation (Line(points={{-77.73,205.18},{-143.23,171.18}}));
  connect(line_35.epp_p, node_35.epp) annotation (Line(points={{-145.73,159.68},{-143.23,171.18}}));
  connect(line_35.epp_n, node_36.epp) annotation (Line(points={{-140.73,159.68},{-143.23,143.18}}));
  connect(line_36.epp_p, node_36.epp) annotation (Line(points={{-145.73,131.68},{-143.23,143.18}}));
  connect(line_36.epp_n, node_37.epp) annotation (Line(points={{-140.73,131.68},{-143.23,115.18}}));
  connect(line_37.epp_p, node_37.epp) annotation (Line(points={{-156.23,100.18},{-143.23,115.18}}));
  connect(line_37.epp_n, node_38.epp) annotation (Line(points={{-151.23,100.18},{-164.23,80.18}}));
  connect(line_38.epp_p, node_38.epp) annotation (Line(points={{-180.73,68.68},{-164.23,80.18}}));
  connect(line_38.epp_n, node_39.epp) annotation (Line(points={{-175.73,68.68},{-192.23,52.18}}));
  connect(line_39.epp_p, node_39.epp) annotation (Line(points={{-194.73,37.18},{-192.23,52.18}}));
  connect(line_39.epp_n, node_40.epp) annotation (Line(points={{-189.73,37.18},{-192.23,17.18}}));
  connect(line_40.epp_p, node_38.epp) annotation (Line(points={{-152.73,68.68},{-164.23,80.18}}));
  connect(line_40.epp_n, node_41.epp) annotation (Line(points={{-147.73,68.68},{-136.23,52.18}}));
  connect(line_41.epp_p, node_41.epp) annotation (Line(points={{-138.73,37.18},{-136.23,52.18}}));
  connect(line_41.epp_n, node_42.epp) annotation (Line(points={{-133.73,37.18},{-136.23,17.18}}));
  connect(line_42.epp_p, node_42.epp) annotation (Line(points={{-138.73,5.68},{-136.23,17.18}}));
  connect(line_42.epp_n, node_43.epp) annotation (Line(points={{-133.73,5.68},{-136.23,-10.82}}));

  // ---- Connect households to nodes ---------------------------------------------------------

  connect(node_32.epp, household_1.epp) annotation (Line(points={{45.77,115.18},{70.77,115.18}}));
  connect(node_6.epp, household_2.epp) annotation (Line(points={{-3.23,38.18},{21.77,38.18}}));
  connect(node_19.epp, household_3.epp) annotation (Line(points={{-66.23,52.18},{-41.23,52.18}}));
  connect(node_14.epp, household_4.epp) annotation (Line(points={{-66.23,143.18},{-41.23,143.18}}));
  connect(node_11.epp, household_5.epp) annotation (Line(points={{94.77,-17.82},{119.77,-17.82}}));
  connect(node_17.epp, household_6.epp) annotation (Line(points={{129.77,-122.82},{154.77,-122.82}}));
  connect(node_31.epp, household_7.epp) annotation (Line(points={{59.77,-122.82},{84.77,-122.82}}));
  connect(node_33.epp, household_8.epp) annotation (Line(points={{59.77,-178.82},{84.77,-178.82}}));
  connect(node_28.epp, household_9.epp) annotation (Line(points={{129.77,-199.82},{154.77,-199.82}}));
  connect(node_4.epp, household_10.epp) annotation (Line(points={{3.77,-73.82},{28.77,-73.82}}));
  connect(node_8.epp, household_11.epp) annotation (Line(points={{52.77,143.18},{77.77,143.18}}));
  connect(node_9.epp, household_12.epp) annotation (Line(points={{-73.23,80.18},{-48.23,80.18}}));
  connect(node_13.epp, household_13.epp) annotation (Line(points={{-3.23,-45.82},{21.77,-45.82}}));
  connect(node_16.epp, household_14.epp) annotation (Line(points={{94.77,-66.82},{119.77,-66.82}}));
  connect(node_34.epp, household_15.epp) annotation (Line(points={{-66.23,115.18},{-41.23,115.18}}));
  connect(node_24.epp, household_16.epp) annotation (Line(points={{-3.23,3.18},{21.77,3.18}}));
  connect(node_22.epp, household_17.epp) annotation (Line(points={{129.77,-171.82},{154.77,-171.82}}));
  connect(node_21.epp, household_18.epp) annotation (Line(points={{52.77,171.18},{77.77,171.18}}));
  connect(node_21.epp, household_19.epp) annotation (Line(points={{52.77,171.18},{97.77,171.18}}));
  connect(node_10.epp, household_20.epp) annotation (Line(points={{-3.23,66.18},{21.77,66.18}}));
  connect(node_20.epp, household_21.epp) annotation (Line(points={{59.77,-241.82},{84.77,-241.82}}));
  connect(node_29.epp, household_22.epp) annotation (Line(points={{-66.23,171.18},{-41.23,171.18}}));
  connect(node_29.epp, household_23.epp) annotation (Line(points={{-66.23,171.18},{-21.23,171.18}}));
  connect(node_5.epp, household_24.epp) annotation (Line(points={{129.77,-143.82},{154.77,-143.82}}));
  connect(node_27.epp, household_25.epp) annotation (Line(points={{59.77,-150.82},{84.77,-150.82}}));
  connect(node_23.epp, household_26.epp) annotation (Line(points={{94.77,-45.82},{119.77,-45.82}}));
  connect(node_25.epp, household_27.epp) annotation (Line(points={{59.77,-206.82},{84.77,-206.82}}));
  connect(node_7.epp, household_28.epp) annotation (Line(points={{129.77,-227.82},{154.77,-227.82}}));
  connect(node_1.epp, household_29.epp) annotation (Line(points={{94.77,10.18},{119.77,10.18}}));
  connect(node_3.epp, household_30.epp) annotation (Line(points={{94.77,66.18},{119.77,66.18}}));
  connect(node_12.epp, household_31.epp) annotation (Line(points={{94.77,38.18},{119.77,38.18}}));
  connect(node_26.epp, household_32.epp) annotation (Line(points={{59.77,-269.82},{84.77,-269.82}}));
  connect(node_30.epp, household_33.epp) annotation (Line(points={{3.77,-24.82},{28.77,-24.82}}));
  connect(node_35.epp, household_34.epp) annotation (Line(points={{-143.23,171.18},{-118.23,171.18}}));
  connect(node_36.epp, household_35.epp) annotation (Line(points={{-143.23,143.18},{-118.23,143.18}}));
  connect(node_37.epp, household_36.epp) annotation (Line(points={{-143.23,115.18},{-118.23,115.18}}));
  connect(node_39.epp, household_37.epp) annotation (Line(points={{-192.23,52.18},{-167.23,52.18}}));
  connect(node_40.epp, household_38.epp) annotation (Line(points={{-192.23,17.18},{-167.23,17.18}}));
  connect(node_41.epp, household_39.epp) annotation (Line(points={{-136.23,52.18},{-111.23,52.18}}));
  connect(node_42.epp, household_40.epp) annotation (Line(points={{-136.23,17.18},{-111.23,17.18}}));
  connect(node_43.epp, household_41.epp) annotation (Line(points={{-136.23,-10.82},{-111.23,-10.82}}));

  // ---- Connect transformer to node ---------------------------------------------------------

  connect(epp, epp) annotation (Line(
      points={{0,108},{0,108}},
      color={0,127,0},
      thickness=0.5));
  connect(simpleTransformerComplex.epp_p, epp) annotation (Line(
      points={{-82,260},{-88,260},{-88,196},{0,196},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(decouplingGrids.epp_p, simpleTransformerComplex.epp_n) annotation (Line(
      points={{-52,260},{-62,260}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_a, decouplingGrids.epp_n) annotation (Line(
      points={{-19.2,260},{-32,260}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_b, node_15.epp) annotation (Line(
      points={{-10,250},{-10,226},{-17.23,226},{-17.23,234.18}},
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
          extent={{-220,280},{-100,200}},
          lineColor={102,44,145},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-218,278},{-102,202}},
          textColor={102,44,145},
          horizontalAlignment=TextAlignment.Left,
          textString="Scenario: LV-semiurb-4
Topology: SimBench 1-LV-semiurb4--0-sw
Degree of urbanisation: Semi-urban
Technology Mix: Future
Number of Prosumers: 41
Number of PV: 5
Number of BES: 1
Number of EHP: 20
Number of BEV: 16")}),
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
          textString="%LV_semiurb_4_I")}));
end LV_semiurb_4_I;
