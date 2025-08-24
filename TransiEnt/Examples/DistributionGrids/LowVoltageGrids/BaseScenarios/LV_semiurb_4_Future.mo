within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.BaseScenarios;
model LV_semiurb_4_Future "Small semiurban low voltage distribution grid scenario with future technology penetration scenario."
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
    parallel=1)
      annotation (Placement(transformation(extent={{-72.23,66.18},{-67.23,71.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_2(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.360000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{127.27,-157.82},{132.27,-152.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_3(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.343000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-2.23,-59.82},{2.77,-54.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_4(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=14.565000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{127.27,-133.32},{132.27,-128.32}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_5(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.607000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{46.77,129.18},{51.77,134.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_6(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.650000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{92.27,52.18},{97.27,57.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_7(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=10.010000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{92.27,-31.82},{97.27,-26.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_8(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.594000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{57.27,-192.82},{62.27,-187.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_9(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.460000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{127.27,-213.82},{132.27,-208.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_10(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.552000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-44.23,202.68},{-39.23,207.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_11(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=26.545000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-5.73,52.18},{-0.73,57.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_12(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.417000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{71.27,76.68},{76.27,81.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_13(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.429000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{57.27,-224.32},{62.27,-219.32}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_14(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.046000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{74.77,-108.82},{79.77,-103.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_15(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=0.692000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-2.23,-10.82},{2.77,-5.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_16(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.870000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-68.73,157.18},{-63.73,162.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_17(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=33.843000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{57.27,-255.82},{62.27,-250.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_18(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.660000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{57.27,-136.82},{62.27,-131.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_19(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=14.085000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{92.27,-3.82},{97.27,1.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_20(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=16.354000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{46.77,101.18},{51.77,106.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_21(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.451000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{92.27,-56.32},{97.27,-51.32}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_22(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.942000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-2.23,-35.32},{2.77,-30.32}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_23(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=11.444000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{92.27,24.18},{97.27,29.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_24(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.428000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-72.23,97.68},{-67.23,102.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_25(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.348000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{15.27,202.68},{20.27,207.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_26(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.222000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{22.27,76.68},{27.27,81.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_27(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=29.066000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{109.77,-108.82},{114.77,-103.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_28(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=53.308000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-68.73,129.18},{-63.73,134.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_29(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.024000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{50.27,157.18},{55.27,162.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_30(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.234000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{57.27,-164.82},{62.27,-159.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_31(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=26.544000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-5.73,20.68},{-0.73,25.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_32(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=18.783000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{92.27,-80.82},{97.27,-75.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_33(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=8.678000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{127.27,-185.82},{132.27,-180.82}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_34(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=60.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-82.73,202.68},{-77.73,207.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_35(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=28.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-145.73,157.18},{-140.73,162.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_36(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=36.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-145.73,129.18},{-140.73,134.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_37(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-156.23,97.68},{-151.23,102.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_38(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=41.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-180.73,66.18},{-175.73,71.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_39(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=22.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-194.73,34.68},{-189.73,39.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_40(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=28.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-152.73,66.18},{-147.73,71.18}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_41(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=20.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-138.73,34.68},{-133.73,39.68}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_42(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=26.000000,
    i_n=275,
    parallel=1)
      annotation (Placement(transformation(extent={{-138.73,3.18},{-133.73,8.18}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=4.08202,
    loadProfileScaleQ=4.08202,
    usePV=true,
    PV_peakPower=12084.9,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_1",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{63.27,115.18},{78.27,130.18}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=2.97136,
    loadProfileScaleQ=2.97136,
    usePV=true,
    PV_peakPower=8796.79,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_2",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=2,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{14.27,38.18},{29.27,53.18}})));

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
    loadProfileName="SFH19",
    loadProfileScaleP=5.01486,
    loadProfileScaleQ=5.01486,
    usePV=true,
    PV_peakPower=14846.6,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_3",
    Q_HP_nom=13031.3,
    A_living=250.743,
    A_wall=108.2,
    A_window=50.1485,
    A_roof=250.743,
    A_ground=250.743,
    V_air=626.857,
    U_wall=0.448024,
    U_window=1.79419,
    U_roof=0.298837,
    U_ground=0.498256,
    thermalMass=32938500.0,
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
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-48.73,52.18},{-33.73,67.18}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=3.89172,
    loadProfileScaleQ=3.89172,
    usePV=true,
    PV_peakPower=11521.5,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_4",
    Q_HP_nom=8566.98,
    A_living=194.586,
    A_wall=100.577,
    A_window=38.9173,
    A_roof=194.586,
    A_ground=194.586,
    V_air=486.466,
    U_wall=0.297348,
    U_window=1.35102,
    U_roof=0.210204,
    U_ground=0.365307,
    thermalMass=27085700.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=5,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-48.73,143.18},{-33.73,158.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_5(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=4.85296,
    loadProfileScaleQ=4.85296,
    usePV=true,
    PV_peakPower=14367.3,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_5",
    Q_HP_nom=10717.4,
    A_living=242.648,
    A_wall=107.242,
    A_window=48.5296,
    A_roof=242.648,
    A_ground=242.648,
    V_air=606.62,
    U_wall=0.315509,
    U_window=1.40444,
    U_roof=0.220888,
    U_ground=0.381332,
    thermalMass=32107800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=6,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=7,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{112.27,-17.82},{127.27,-2.82}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=3.43054,
    loadProfileScaleQ=3.43054,
    usePV=true,
    PV_peakPower=10156.2,
    useBattery=true,
    Bat_Capacity=17280000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_6",
    Q_HP_nom=7764.41,
    A_living=171.527,
    A_wall=96.663,
    A_window=34.3054,
    A_roof=171.527,
    A_ground=171.527,
    V_air=428.818,
    U_wall=0.307423,
    U_window=1.38065,
    U_roof=0.216131,
    U_ground=0.374196,
    thermalMass=24610500.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=8,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=9,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{147.27,-122.82},{162.27,-107.82}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=3.67504,
    loadProfileScaleQ=3.67504,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_7",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=10,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=11,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{77.27,-122.82},{92.27,-107.82}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_8(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=3.12432,
    loadProfileScaleQ=3.12432,
    usePV=true,
    PV_peakPower=9249.63,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_8",
    Q_HP_nom=7305.31,
    A_living=156.216,
    A_wall=93.7432,
    A_window=31.2432,
    A_roof=156.216,
    A_ground=156.216,
    V_air=390.54,
    U_wall=0.32306,
    U_window=1.42665,
    U_roof=0.225329,
    U_ground=0.387994,
    thermalMass=22937600.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=12,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{77.27,-178.82},{92.27,-163.82}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=2.71968,
    loadProfileScaleQ=2.71968,
    usePV=true,
    PV_peakPower=8051.68,
    useBattery=true,
    Bat_Capacity=8640000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_9",
    Q_HP_nom=6795.65,
    A_living=135.984,
    A_wall=89.4153,
    A_window=27.1967,
    A_roof=135.984,
    A_ground=135.984,
    V_air=339.959,
    U_wall=0.359273,
    U_window=1.53316,
    U_roof=0.246631,
    U_ground=0.419947,
    thermalMass=20683800.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=13,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=14,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=15,
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

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_10(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=2.97658,
    loadProfileScaleQ=2.97658,
    usePV=true,
    PV_peakPower=8812.24,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_10",
    Q_HP_nom=6984.59,
    A_living=148.829,
    A_wall=92.2297,
    A_window=29.7658,
    A_roof=148.829,
    A_ground=148.829,
    V_air=372.073,
    U_wall=0.321552,
    U_window=1.42221,
    U_roof=0.224443,
    U_ground=0.386664,
    thermalMass=22120800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=16,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{21.27,-73.82},{36.27,-58.82}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=3.27202,
    loadProfileScaleQ=3.27202,
    usePV=true,
    PV_peakPower=9686.9,
    useBattery=true,
    Bat_Capacity=17280000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_11",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=17,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{70.27,143.18},{85.27,158.18}})));

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
    loadProfileName="SFH8",
    loadProfileScaleP=3.49842,
    loadProfileScaleQ=3.49842,
    usePV=true,
    PV_peakPower=10357.2,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_12",
    Q_HP_nom=7804.25,
    A_living=174.921,
    A_wall=97.2735,
    A_window=34.9842,
    A_roof=174.921,
    A_ground=174.921,
    V_air=437.302,
    U_wall=0.298764,
    U_window=1.35519,
    U_roof=0.211038,
    U_ground=0.366556,
    thermalMass=24978000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=18,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=19,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-55.73,80.18},{-40.73,95.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

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
    loadProfileName="SFH28",
    loadProfileScaleP=4.2997,
    loadProfileScaleQ=4.2997,
    usePV=true,
    PV_peakPower=12729.4,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_13",
    Q_HP_nom=10616.5,
    A_living=214.985,
    A_wall=103.627,
    A_window=42.997,
    A_roof=214.985,
    A_ground=214.985,
    V_air=537.463,
    U_wall=0.391576,
    U_window=1.62816,
    U_roof=0.265633,
    U_ground=0.448449,
    thermalMass=29237500.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=20,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=21,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=22,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{14.27,-45.82},{29.27,-30.82}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_14(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH39",
    loadProfileScaleP=3.26084,
    loadProfileScaleQ=3.26084,
    usePV=true,
    PV_peakPower=9653.8,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_14",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=23,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=24,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{112.27,-66.82},{127.27,-51.82}})));

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
    loadProfileName="SFH23",
    loadProfileScaleP=2.99322,
    loadProfileScaleQ=2.99322,
    usePV=true,
    PV_peakPower=8861.51,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_15",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=25,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=26,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-48.73,115.18},{-33.73,130.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_16(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH18",
    loadProfileScaleP=4.08602,
    loadProfileScaleQ=4.08602,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_16",
    Q_HP_nom=9525.1,
    A_living=204.301,
    A_wall=102.074,
    A_window=40.8602,
    A_roof=204.301,
    A_ground=204.301,
    V_air=510.753,
    U_wall=0.342683,
    U_window=1.48436,
    U_roof=0.236873,
    U_ground=0.405309,
    thermalMass=28114600.0,
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
    loadProfileName="SFH11",
    loadProfileScaleP=3.51832,
    loadProfileScaleQ=3.51832,
    usePV=true,
    PV_peakPower=10416.1,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_17",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=27,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{147.27,-171.82},{162.27,-156.82}})));

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
    loadProfileName="SFH22",
    loadProfileScaleP=2.6687,
    loadProfileScaleQ=2.6687,
    usePV=true,
    PV_peakPower=7900.76,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_18",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=28,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{70.27,171.18},{85.27,186.18}})));

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
    loadProfileName="SFH36",
    loadProfileScaleP=2.92782,
    loadProfileScaleQ=2.92782,
    usePV=true,
    PV_peakPower=8667.89,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_19",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=29,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=30,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{90.27,171.18},{105.27,186.18}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=2.34424,
    loadProfileScaleQ=2.34424,
    usePV=true,
    PV_peakPower=6940.18,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_20",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=31,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=32,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{14.27,66.18},{29.27,81.18}})));

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
    loadProfileName="SFH31",
    loadProfileScaleP=1.92351,
    loadProfileScaleQ=1.92351,
    usePV=true,
    PV_peakPower=5694.59,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_21",
    Q_HP_nom=5638.9,
    A_living=96.1753,
    A_wall=78.8339,
    A_window=19.2351,
    A_roof=96.1753,
    A_ground=96.1753,
    V_air=240.438,
    U_wall=0.445998,
    U_window=1.78823,
    U_roof=0.297646,
    U_ground=0.496469,
    thermalMass=16059800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=33,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{77.27,-241.82},{92.27,-226.82}})));

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
    loadProfileName="SFH30",
    loadProfileScaleP=3.0981,
    loadProfileScaleQ=3.0981,
    usePV=true,
    PV_peakPower=9172.01,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_22",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=34,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=35,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-48.73,171.18},{-33.73,186.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_23(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH21",
    loadProfileScaleP=3.2035,
    loadProfileScaleQ=3.2035,
    usePV=true,
    PV_peakPower=9484.05,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_23",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=36,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-28.73,171.18},{-13.73,186.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_24(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=3.5481,
    loadProfileScaleQ=3.5481,
    usePV=true,
    PV_peakPower=10504.2,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_24",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=37,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{147.27,-143.82},{162.27,-128.82}})));

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
    loadProfileName="SFH38",
    loadProfileScaleP=4.33488,
    loadProfileScaleQ=4.33488,
    usePV=true,
    PV_peakPower=12833.5,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_25",
    Q_HP_nom=10881.7,
    A_living=216.744,
    A_wall=103.873,
    A_window=43.3488,
    A_roof=216.744,
    A_ground=216.744,
    V_air=541.86,
    U_wall=0.405675,
    U_window=1.66963,
    U_roof=0.273926,
    U_ground=0.46089,
    thermalMass=29421500.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=38,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=39,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{77.27,-150.82},{92.27,-135.82}})));

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
    loadProfileName="SFH12",
    loadProfileScaleP=2.47282,
    loadProfileScaleQ=2.47282,
    usePV=true,
    PV_peakPower=7320.85,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_26",
    Q_HP_nom=5639.83,
    A_living=123.641,
    A_wall=86.4657,
    A_window=24.7282,
    A_roof=123.641,
    A_ground=123.641,
    V_air=309.102,
    U_wall=0.286662,
    U_window=1.31959,
    U_roof=0.203919,
    U_ground=0.355878,
    thermalMass=19280500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=40,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{112.27,-45.82},{127.27,-30.82}})));

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
    loadProfileName="SFH9",
    loadProfileScaleP=3.22288,
    loadProfileScaleQ=3.22288,
    usePV=true,
    PV_peakPower=9541.42,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_27",
    Q_HP_nom=7561.36,
    A_living=161.144,
    A_wall=94.7137,
    A_window=32.2288,
    A_roof=161.144,
    A_ground=161.144,
    V_air=402.86,
    U_wall=0.328077,
    U_window=1.4414,
    U_roof=0.228281,
    U_ground=0.392421,
    thermalMass=23478800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=41,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=42,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{77.27,-206.82},{92.27,-191.82}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_28(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=3.1064,
    loadProfileScaleQ=3.1064,
    usePV=true,
    PV_peakPower=9196.58,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_28",
    Q_HP_nom=7038.46,
    A_living=155.32,
    A_wall=93.5635,
    A_window=31.0641,
    A_roof=155.32,
    A_ground=155.32,
    V_air=388.301,
    U_wall=0.300433,
    U_window=1.3601,
    U_roof=0.21202,
    U_ground=0.368029,
    thermalMass=22838900.0,
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
    loadProfileName="SFH16",
    loadProfileScaleP=3.96638,
    loadProfileScaleQ=3.96638,
    usePV=true,
    PV_peakPower=11742.6,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_29",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=43,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{112.27,10.18},{127.27,25.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_30(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH20",
    loadProfileScaleP=3.93468,
    loadProfileScaleQ=3.93468,
    usePV=true,
    PV_peakPower=11648.7,
    useBattery=true,
    Bat_Capacity=17280000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_30",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=44,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=45,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{112.27,66.18},{127.27,81.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_31(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=3.27748,
    loadProfileScaleQ=3.27748,
    usePV=true,
    PV_peakPower=9703.07,
    useBattery=true,
    Bat_Capacity=43200000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_31",
    Q_HP_nom=7738.08,
    A_living=163.874,
    A_wall=95.2384,
    A_window=32.7747,
    A_roof=163.874,
    A_ground=163.874,
    V_air=409.684,
    U_wall=0.334057,
    U_window=1.45899,
    U_roof=0.231798,
    U_ground=0.397697,
    thermalMass=23777500.0,
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
    tappingProfileName="TappingCycle_A_32",
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
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=46,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{77.27,-269.82},{92.27,-254.82}})));

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
    loadProfileName="SFH35",
    loadProfileScaleP=2.32738,
    loadProfileScaleQ=2.32738,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_33",
    Q_HP_nom=5382.25,
    A_living=116.369,
    A_wall=84.6008,
    A_window=23.2739,
    A_roof=116.369,
    A_ground=116.369,
    V_air=290.924,
    U_wall=0.290905,
    U_window=1.33207,
    U_roof=0.206415,
    U_ground=0.359622,
    thermalMass=18442100.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=47,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=48,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{21.27,-24.82},{36.27,-9.82}})));

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
    loadProfileName="SFH10",
    loadProfileScaleP=5.60658,
    loadProfileScaleQ=5.60658,
    usePV=true,
    PV_peakPower=16598.4,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_34",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=49,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-125.73,171.18},{-110.73,186.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_35(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH5",
    loadProfileScaleP=5.13264,
    loadProfileScaleQ=5.13264,
    usePV=true,
    PV_peakPower=15195.3,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_35",
    Q_HP_nom=12206.2,
    A_living=256.632,
    A_wall=108.871,
    A_window=51.3264,
    A_roof=256.632,
    A_ground=256.632,
    V_air=641.58,
    U_wall=0.376322,
    U_window=1.5833,
    U_roof=0.25666,
    U_ground=0.43499,
    thermalMass=33540500.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=50,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=51,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-125.73,143.18},{-110.73,158.18}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=5.38478,
    loadProfileScaleQ=5.38478,
    usePV=true,
    PV_peakPower=15941.8,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_36",
    Q_HP_nom=11928.6,
    A_living=269.239,
    A_wall=110.237,
    A_window=53.8477,
    A_roof=269.239,
    A_ground=269.239,
    V_air=673.097,
    U_wall=0.325116,
    U_window=1.43269,
    U_roof=0.226539,
    U_ground=0.389808,
    thermalMass=34822700.0,
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
    loadProfileName="SFH32",
    loadProfileScaleP=7.21212,
    loadProfileScaleQ=7.21212,
    usePV=true,
    PV_peakPower=21351.7,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_37",
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=52,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=53,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-174.73,52.18},{-159.73,67.18}})));

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
    loadProfileName="SFH40",
    loadProfileScaleP=6.14376,
    loadProfileScaleQ=6.14376,
    usePV=true,
    PV_peakPower=18188.8,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_38",
    Q_HP_nom=12928.4,
    A_living=307.188,
    A_wall=113.83,
    A_window=61.4375,
    A_roof=307.188,
    A_ground=307.188,
    V_air=767.969,
    U_wall=0.29597,
    U_window=1.34697,
    U_roof=0.209394,
    U_ground=0.364091,
    thermalMass=38634800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=54,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-174.73,17.18},{-159.73,32.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_39(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=6.59456,
    loadProfileScaleQ=6.59456,
    usePV=true,
    PV_peakPower=19523.4,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_39",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=55,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-118.73,52.18},{-103.73,67.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_40(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH17",
    loadProfileScaleP=5.61774,
    loadProfileScaleQ=5.61774,
    usePV=true,
    PV_peakPower=16631.5,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_40",
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
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=56,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-118.73,17.18},{-103.73,32.18}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

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
    loadProfileScaleP=4.27572,
    loadProfileScaleQ=4.27572,
    usePV=true,
    PV_peakPower=12658.4,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_41",
    Q_HP_nom=9807.49,
    A_living=213.786,
    A_wall=103.457,
    A_window=42.7572,
    A_roof=213.786,
    A_ground=213.786,
    V_air=534.465,
    U_wall=0.334157,
    U_window=1.45928,
    U_roof=0.231857,
    U_ground=0.397785,
    thermalMass=29111900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=57,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-118.73,-10.82},{-103.73,4.18}})));

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
    epp_n(v(start=400))) annotation (Placement(transformation(extent={{-96,260},{-76,280}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  TransiEnt.Components.Sensors.SmartMeter GridMeter annotation (Placement(transformation(extent={{-20,260},{0,280}})));
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
      points={{-96,270},{-102,270},{-102,192},{0,192},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_a, simpleTransformerComplex.epp_n) annotation (Line(
      points={{-19.2,270},{-76,270}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_b, node_15.epp) annotation (Line(
      points={{-0.8,270},{-0.8,226},{-17.23,226},{-17.23,234.18}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.controlBus, controlBus.GridMeter) annotation();
   annotation(
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={Rectangle(
          extent={{-280,280},{-160,200}},
          lineColor={102,44,145},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-278,278},{-162,202}},
          textColor={102,44,145},
          horizontalAlignment=TextAlignment.Left,
          textString="Scenario: LV-semiurb-4
Topology: SimBench 1-LV-semiurb4--0-sw
Degree of urbanisation: Semi-urban
Technology Mix: Future
Number of Prosumers: 41
Number of PV: 37
Number of BES: 31
Number of EHP: 36
Number of BEV: 57")}),
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
          textString="%LV_semiurb_4_A")}));
end LV_semiurb_4_Future;
