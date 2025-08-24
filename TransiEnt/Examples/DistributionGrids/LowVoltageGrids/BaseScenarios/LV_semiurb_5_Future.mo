within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.BaseScenarios;
model LV_semiurb_5_Future "Small semiurban low voltage distribution grid scenario with future technology penetration scenario."
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

  TransiEnt.Components.Electrical.Grid.Base.Node node_1(v_n=400) annotation (Placement(transformation(extent={{-94.59,149.96},{-89.59,154.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_2(v_n=400) annotation (Placement(transformation(extent={{178.41,-88.04},{183.41,-83.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_3(v_n=400) annotation (Placement(transformation(extent={{-94.59,72.96},{-89.59,77.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_4(v_n=400) annotation (Placement(transformation(extent={{178.41,86.96},{183.41,91.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_5(v_n=400) annotation (Placement(transformation(extent={{24.41,-249.04},{29.41,-244.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_6(v_n=400) annotation (Placement(transformation(extent={{108.41,-214.04},{113.41,-209.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_7(v_n=400) annotation (Placement(transformation(extent={{-178.59,205.96},{-173.59,210.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_8(v_n=400) annotation (Placement(transformation(extent={{178.41,107.96},{183.41,112.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_9(v_n=400) annotation (Placement(transformation(extent={{-38.59,16.96},{-33.59,21.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_10(v_n=400) annotation (Placement(transformation(extent={{52.41,58.96},{57.41,63.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_11(v_n=400) annotation (Placement(transformation(extent={{59.41,-60.04},{64.41,-55.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_12(v_n=400) annotation (Placement(transformation(extent={{73.41,-214.04},{78.41,-209.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_13(v_n=400) annotation (Placement(transformation(extent={{178.41,-207.04},{183.41,-202.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_14(v_n=400) annotation (Placement(transformation(extent={{59.41,240.96},{64.41,245.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_15(v_n=400) annotation (Placement(transformation(extent={{-262.59,289.96},{-257.59,294.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_16(v_n=400) annotation (Placement(transformation(extent={{73.41,-249.04},{78.41,-244.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_17(v_n=400) annotation (Placement(transformation(extent={{-87.59,93.96},{-82.59,98.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_18(v_n=400) annotation (Placement(transformation(extent={{59.41,261.96},{64.41,266.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_19(v_n=400) annotation (Placement(transformation(extent={{-150.59,-151.04},{-145.59,-146.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_20(v_n=400) annotation (Placement(transformation(extent={{178.41,-109.04},{183.41,-104.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_21(v_n=400) annotation (Placement(transformation(extent={{94.41,-109.04},{99.41,-104.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_22(v_n=400) annotation (Placement(transformation(extent={{73.41,-396.04},{78.41,-391.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_23(v_n=400) annotation (Placement(transformation(extent={{178.41,289.96},{183.41,294.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_24(v_n=400) annotation (Placement(transformation(extent={{52.41,86.96},{57.41,91.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_25(v_n=400) annotation (Placement(transformation(extent={{52.41,142.96},{57.41,147.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_26(v_n=400) annotation (Placement(transformation(extent={{178.41,-137.04},{183.41,-132.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_27(v_n=400) annotation (Placement(transformation(extent={{178.41,268.96},{183.41,273.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_28(v_n=400) annotation (Placement(transformation(extent={{178.41,177.96},{183.41,182.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_29(v_n=400) annotation (Placement(transformation(extent={{-192.59,-172.04},{-187.59,-167.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_30(v_n=400) annotation (Placement(transformation(extent={{-150.59,9.96},{-145.59,14.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_31(v_n=400) annotation (Placement(transformation(extent={{24.41,-172.04},{29.41,-167.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_32(v_n=400) annotation (Placement(transformation(extent={{73.41,-340.04},{78.41,-335.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_33(v_n=400) annotation (Placement(transformation(extent={{178.41,240.96},{183.41,245.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_34(v_n=400) annotation (Placement(transformation(extent={{-87.59,9.96},{-82.59,14.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_35(v_n=400) annotation (Placement(transformation(extent={{185.41,-235.04},{190.41,-230.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_36(v_n=400) annotation (Placement(transformation(extent={{73.41,-284.04},{78.41,-279.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_37(v_n=400) annotation (Placement(transformation(extent={{59.41,212.96},{64.41,217.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_38(v_n=400) annotation (Placement(transformation(extent={{-150.59,-18.04},{-145.59,-13.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_39(v_n=400) annotation (Placement(transformation(extent={{-136.59,233.96},{-131.59,238.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_40(v_n=400) annotation (Placement(transformation(extent={{-150.59,-46.04},{-145.59,-41.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_41(v_n=400) annotation (Placement(transformation(extent={{178.41,9.96},{183.41,14.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_42(v_n=400) annotation (Placement(transformation(extent={{178.41,135.96},{183.41,140.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_43(v_n=400) annotation (Placement(transformation(extent={{-192.59,-291.04},{-187.59,-286.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_44(v_n=400) annotation (Placement(transformation(extent={{-87.59,128.96},{-82.59,133.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_45(v_n=400) annotation (Placement(transformation(extent={{178.41,-60.04},{183.41,-55.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_46(v_n=400) annotation (Placement(transformation(extent={{59.41,-32.04},{64.41,-27.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_47(v_n=400) annotation (Placement(transformation(extent={{24.41,-144.04},{29.41,-139.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_48(v_n=400) annotation (Placement(transformation(extent={{234.41,240.96},{239.41,245.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_49(v_n=400) annotation (Placement(transformation(extent={{94.41,-186.04},{99.41,-181.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_50(v_n=400) annotation (Placement(transformation(extent={{-192.59,-235.04},{-187.59,-230.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_51(v_n=400) annotation (Placement(transformation(extent={{-38.59,37.96},{-33.59,42.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_52(v_n=400) annotation (Placement(transformation(extent={{73.41,-445.04},{78.41,-440.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_53(v_n=400) annotation (Placement(transformation(extent={{178.41,156.96},{183.41,161.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_54(v_n=400) annotation (Placement(transformation(extent={{24.41,-221.04},{29.41,-216.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_55(v_n=400) annotation (Placement(transformation(extent={{59.41,184.96},{64.41,189.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_56(v_n=400) annotation (Placement(transformation(extent={{-150.59,-74.04},{-145.59,-69.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_57(v_n=400) annotation (Placement(transformation(extent={{94.41,-88.04},{99.41,-83.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_58(v_n=400) annotation (Placement(transformation(extent={{185.41,-158.04},{190.41,-153.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_59(v_n=400) annotation (Placement(transformation(extent={{-122.59,289.96},{-117.59,294.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_60(v_n=400) annotation (Placement(transformation(extent={{59.41,9.96},{64.41,14.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_61(v_n=400) annotation (Placement(transformation(extent={{73.41,-368.04},{78.41,-363.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_62(v_n=400) annotation (Placement(transformation(extent={{-87.59,233.96},{-82.59,238.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_63(v_n=400) annotation (Placement(transformation(extent={{24.41,-88.04},{29.41,-83.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_64(v_n=400) annotation (Placement(transformation(extent={{-87.59,177.96},{-82.59,182.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_65(v_n=400) annotation (Placement(transformation(extent={{178.41,-11.04},{183.41,-6.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_66(v_n=400) annotation (Placement(transformation(extent={{66.41,-312.04},{71.41,-307.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_67(v_n=400) annotation (Placement(transformation(extent={{227.41,296.96},{232.41,301.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_68(v_n=400) annotation (Placement(transformation(extent={{-87.59,37.96},{-82.59,42.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_69(v_n=400) annotation (Placement(transformation(extent={{185.41,-39.04},{190.41,-34.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_70(v_n=400) annotation (Placement(transformation(extent={{-94.59,205.96},{-89.59,210.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_71(v_n=400) annotation (Placement(transformation(extent={{-150.59,-172.04},{-145.59,-167.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_72(v_n=400) annotation (Placement(transformation(extent={{-150.59,-123.04},{-145.59,-118.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_73(v_n=400) annotation (Placement(transformation(extent={{24.41,-116.04},{29.41,-111.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_74(v_n=400) annotation (Placement(transformation(extent={{-178.59,149.96},{-173.59,154.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_75(v_n=400) annotation (Placement(transformation(extent={{59.41,289.96},{64.41,294.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_76(v_n=400) annotation (Placement(transformation(extent={{-262.59,261.96},{-257.59,266.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_77(v_n=400) annotation (Placement(transformation(extent={{-178.59,177.96},{-173.59,182.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_78(v_n=400) annotation (Placement(transformation(extent={{-101.59,-123.04},{-96.59,-118.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_79(v_n=400) annotation (Placement(transformation(extent={{-150.59,-95.04},{-145.59,-90.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_80(v_n=400) annotation (Placement(transformation(extent={{-150.59,37.96},{-145.59,42.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_81(v_n=400) annotation (Placement(transformation(extent={{52.41,-11.04},{57.41,-6.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_82(v_n=400) annotation (Placement(transformation(extent={{-192.59,-263.04},{-187.59,-258.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_83(v_n=400) annotation (Placement(transformation(extent={{59.41,37.96},{64.41,42.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_84(v_n=400) annotation (Placement(transformation(extent={{178.41,212.96},{183.41,217.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_85(v_n=400) annotation (Placement(transformation(extent={{73.41,-417.04},{78.41,-412.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_86(v_n=400) annotation (Placement(transformation(extent={{-178.59,226.96},{-173.59,231.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_87(v_n=400) annotation (Placement(transformation(extent={{178.41,-186.04},{183.41,-181.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_88(v_n=400) annotation (Placement(transformation(extent={{-129.59,261.96},{-124.59,266.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_89(v_n=400) annotation (Placement(transformation(extent={{-192.59,-207.04},{-187.59,-202.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_90(v_n=400) annotation (Placement(transformation(extent={{-192.59,-151.04},{-187.59,-146.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_91(v_n=400) annotation (Placement(transformation(extent={{24.41,-298.04},{29.41,-293.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_92(v_n=400) annotation (Placement(transformation(extent={{-192.59,-123.04},{-187.59,-118.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_93(v_n=400) annotation (Placement(transformation(extent={{94.41,-158.04},{99.41,-153.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_94(v_n=400) annotation (Placement(transformation(extent={{-87.59,-25.04},{-82.59,-20.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_95(v_n=400) annotation (Placement(transformation(extent={{52.41,163.96},{57.41,168.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_96(v_n=400) annotation (Placement(transformation(extent={{234.41,268.96},{239.41,273.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_97(v_n=400) annotation (Placement(transformation(extent={{94.41,-137.04},{99.41,-132.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_98(v_n=400) annotation (Placement(transformation(extent={{-192.59,-319.04},{-187.59,-314.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_99(v_n=400) annotation (Placement(transformation(extent={{-3.59,359.96},{1.41,364.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_100(v_n=400) annotation (Placement(transformation(extent={{178.41,37.96},{183.41,42.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_101(v_n=400) annotation (Placement(transformation(extent={{24.41,-277.04},{29.41,-272.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_102(v_n=400) annotation (Placement(transformation(extent={{178.41,58.96},{183.41,63.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_103(v_n=400) annotation (Placement(transformation(extent={{52.41,114.96},{57.41,119.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_104(v_n=400) annotation (Placement(transformation(extent={{24.41,-200.04},{29.41,-195.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_105(v_n=400) annotation (Placement(transformation(extent={{-262.59,233.96},{-257.59,238.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_106(v_n=400) annotation (Placement(transformation(extent={{-262.59,205.96},{-257.59,210.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_107(v_n=400) annotation (Placement(transformation(extent={{-262.59,177.96},{-257.59,182.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_108(v_n=400) annotation (Placement(transformation(extent={{-24.59,289.96},{-19.59,294.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_109(v_n=400) annotation (Placement(transformation(extent={{-262.59,142.96},{-257.59,147.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_110(v_n=400) annotation (Placement(transformation(extent={{-262.59,121.96},{-257.59,126.96}})));

  // Basic Parameters

  // ---- Lines (between nodes) ---------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Line_new line_1(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=15.331000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{59.41,198.96},{64.41,203.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_2(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=15.752000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{52.41,153.46},{57.41,158.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_3(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=33.813000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{94.41,-172.04},{99.41,-167.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_4(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.899000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-150.59,-4.04},{-145.59,0.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_5(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.566000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-192.59,-277.04},{-187.59,-272.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_6(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=4.399000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{73.41,-266.54},{78.41,-261.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_7(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=2.235000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-150.59,-137.04},{-145.59,-132.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_8(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=4.217000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{73.41,-431.04},{78.41,-426.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_9(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=11.594000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{59.41,251.46},{64.41,256.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_10(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=34.487000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{181.91,-49.54},{186.91,-44.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_11(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.148000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-91.09,163.96},{-86.09,168.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_12(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=22.845000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{83.91,-200.04},{88.91,-195.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_13(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=11.354000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{59.41,226.96},{64.41,231.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_14(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.586000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{41.91,-74.04},{46.91,-69.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_15(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=98.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-63.09,324.96},{-58.09,329.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_16(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.766000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-91.09,219.96},{-86.09,224.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_17(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=33.773000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-150.59,-109.04},{-145.59,-104.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_18(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=9.800000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{24.41,-210.54},{29.41,-205.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_19(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=2.820000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,121.96},{183.41,126.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_20(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=33.352000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{73.41,-231.54},{78.41,-226.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_21(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=6.489000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-150.59,-32.04},{-145.59,-27.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_22(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=7.432000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-192.59,-189.54},{-187.59,-184.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_23(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.232000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-150.59,-60.04},{-145.59,-55.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_24(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=11.853000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-91.09,83.46},{-86.09,88.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_25(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=11.141000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{24.41,-102.04},{29.41,-97.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_26(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=90.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-133.09,324.96},{-128.09,329.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_27(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=7.219000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{59.41,275.96},{64.41,280.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_28(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=7.370000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{73.41,-406.54},{78.41,-401.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_29(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=6.269000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{52.41,72.96},{57.41,77.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_30(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=9.955000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{73.41,-354.04},{78.41,-349.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_31(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.040000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-192.59,-221.04},{-187.59,-216.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_32(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.084000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{73.41,-382.04},{78.41,-377.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_33(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=15.070000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{181.91,-172.04},{186.91,-167.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_34(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.577000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-178.59,163.96},{-173.59,168.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_35(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.134000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{230.91,282.96},{235.91,287.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_36(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.199000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-192.59,-249.04},{-187.59,-244.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_37(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=36.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-154.09,244.46},{-149.09,249.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_38(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=9.877000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{69.91,-298.04},{74.91,-293.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_39(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=13.917000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{87.41,324.96},{92.41,329.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_40(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.223000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,23.96},{183.41,28.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_41(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=39.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-133.09,247.96},{-128.09,252.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_42(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=17.909000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{94.41,-123.04},{99.41,-118.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_43(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.610000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-91.09,191.96},{-86.09,196.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_44(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=19.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-122.59,55.46},{-117.59,60.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_45(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.118000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-38.59,27.46},{-33.59,32.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_46(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.277000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,146.46},{183.41,151.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_47(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.428000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,254.96},{183.41,259.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_48(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=8.398000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{52.41,100.96},{57.41,105.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_49(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.246000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-91.09,139.46},{-86.09,144.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_50(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=19.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{59.41,23.96},{64.41,28.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_51(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.995000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{24.41,-235.04},{29.41,-230.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_52(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.272000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{52.41,128.96},{57.41,133.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_53(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.852000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-192.59,-161.54},{-187.59,-156.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_54(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=27.677000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{101.41,-200.04},{106.41,-195.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_55(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=19.933000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{181.91,-147.54},{186.91,-142.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_56(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=25.109000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{59.41,-46.04},{64.41,-41.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_57(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=21.966000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-126.09,275.96},{-121.09,280.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_58(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.821000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{24.41,-287.54},{29.41,-282.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_59(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=13.145000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{27.91,324.96},{32.91,329.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_60(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.776000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-87.59,-7.54},{-82.59,-2.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_61(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=25.985000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{94.41,-98.54},{99.41,-93.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_62(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=4.738000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{69.91,-326.04},{74.91,-321.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_63(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=5.110000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{55.91,-0.54},{60.91,4.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_64(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=5.444000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{24.41,-186.04},{29.41,-181.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_65(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=9.927000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{181.91,-221.04},{186.91,-216.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_66(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=48.979000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{181.91,-25.04},{186.91,-20.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_67(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=2.861000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,167.46},{183.41,172.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_68(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=28.125000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{76.91,-74.04},{81.91,-69.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_69(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=37.777000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-262.59,275.96},{-257.59,280.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_70(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=2.639000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-150.59,23.96},{-145.59,28.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_71(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=22.013000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{94.41,-147.54},{99.41,-142.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_72(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=45.296000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-192.59,-305.04},{-187.59,-300.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_73(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=1.672000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{24.41,-130.04},{29.41,-125.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_74(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=5.006000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,226.96},{183.41,231.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_75(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=2.215000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{55.91,-21.54},{60.91,-16.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_76(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=16.423000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,195.46},{183.41,200.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_77(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=4.885000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,72.96},{183.41,77.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_78(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=20.428000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,-74.04},{183.41,-69.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_79(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=16.128000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,48.46},{183.41,53.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_80(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=8.282000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-178.59,216.46},{-173.59,221.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_81(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=12.482000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,-0.54},{183.41,4.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_82(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=12.906000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{55.91,174.46},{60.91,179.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_83(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=8.201000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-178.59,191.96},{-173.59,196.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_84(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.238000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,97.46},{183.41,102.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_85(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.856000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,-98.54},{183.41,-93.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_86(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=5.571000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,279.46},{183.41,284.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_87(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=2.322000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-192.59,-137.04},{-187.59,-132.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_88(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.922000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{24.41,-158.04},{29.41,-153.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_89(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=21.788000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,-123.04},{183.41,-118.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_90(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=4.358000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{24.41,-263.04},{29.41,-258.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_91(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=37.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-91.09,55.46},{-86.09,60.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_92(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=28.712000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-126.09,-109.04},{-121.09,-104.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_93(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=18.160000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-66.59,55.46},{-61.59,60.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_94(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=6.836000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-150.59,-161.54},{-145.59,-156.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_95(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=6.540000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{55.91,48.46},{60.91,53.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_96(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=7.914000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-87.59,23.96},{-82.59,28.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_97(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=30.304000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{111.91,328.46},{116.91,333.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_98(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.188000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{178.41,-196.54},{183.41,-191.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_99(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.914000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-171.59,-109.04},{-166.59,-104.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_100(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=10.180000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-150.59,-84.54},{-145.59,-79.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_101(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=14.370000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{234.41,254.96},{239.41,259.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_102(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=17.376000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-108.59,247.96},{-103.59,252.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_103(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=3.694000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-87.59,111.46},{-82.59,116.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_104(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=40.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-14.09,324.96},{-9.09,329.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_105(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=33.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-262.59,247.96},{-257.59,252.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_106(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=27.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-262.59,219.96},{-257.59,224.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_107(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=41.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-262.59,191.96},{-257.59,196.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_108(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=31.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-262.59,160.46},{-257.59,165.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_109(
    r=0.0001267,
    x=0.000079797,
    b=2.73319e-07,
    length=28.000000,
    i_n=364,
    parallel=1)
      annotation (Placement(transformation(extent={{-262.59,132.46},{-257.59,137.46}})));

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
    loadProfileName="SFH39",
    loadProfileScaleP=2.72954,
    loadProfileScaleQ=2.72954,
    usePV=true,
    PV_peakPower=8080.88,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_1",
    Q_HP_nom=7053.42,
    A_living=136.477,
    A_wall=89.5281,
    A_window=27.2955,
    A_roof=136.477,
    A_ground=136.477,
    V_air=341.193,
    U_wall=0.385063,
    U_window=1.60901,
    U_roof=0.261802,
    U_ground=0.442702,
    thermalMass=20739400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{79.41,240.96},{94.41,255.96}})));

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
    loadProfileName="SFH17",
    loadProfileScaleP=2.0476,
    loadProfileScaleQ=2.0476,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_2",
    Q_HP_nom=5266.48,
    A_living=102.38,
    A_wall=80.707,
    A_window=20.476,
    A_roof=102.38,
    A_ground=102.38,
    V_air=255.95,
    U_wall=0.352891,
    U_window=1.51438,
    U_roof=0.242877,
    U_ground=0.414315,
    thermalMass=16801000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=2,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-172.59,-235.04},{-157.59,-220.04}})));

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
    loadProfileScaleP=4.18442,
    loadProfileScaleQ=4.18442,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_3",
    Q_HP_nom=9216.89,
    A_living=209.221,
    A_wall=102.8,
    A_window=41.8441,
    A_roof=209.221,
    A_ground=209.221,
    V_air=523.051,
    U_wall=0.303031,
    U_window=1.36774,
    U_roof=0.213547,
    U_ground=0.370321,
    thermalMass=28632700.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=3,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{44.41,-221.04},{59.41,-206.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_4(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=4.32044,
    loadProfileScaleQ=4.32044,
    usePV=true,
    PV_peakPower=12790.8,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_4",
    Q_HP_nom=9853.62,
    A_living=216.022,
    A_wall=103.773,
    A_window=43.2045,
    A_roof=216.022,
    A_ground=216.022,
    V_air=540.056,
    U_wall=0.330708,
    U_window=1.44914,
    U_roof=0.229828,
    U_ground=0.394742,
    thermalMass=29346100.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=4,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=5,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-74.59,205.96},{-59.59,220.96}})));

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
    loadProfileName="SFH10",
    loadProfileScaleP=4.62882,
    loadProfileScaleQ=4.62882,
    usePV=true,
    PV_peakPower=13703.7,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_5",
    Q_HP_nom=11132.8,
    A_living=231.441,
    A_wall=105.844,
    A_window=46.2882,
    A_roof=231.441,
    A_ground=231.441,
    V_air=578.603,
    U_wall=0.376894,
    U_window=1.58498,
    U_roof=0.256996,
    U_ground=0.435495,
    thermalMass=30951000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=6,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=7,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-242.59,289.96},{-227.59,304.96}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=2.12416,
    loadProfileScaleQ=2.12416,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_6",
    Q_HP_nom=5642.84,
    A_living=106.208,
    A_wall=81.8155,
    A_window=21.2415,
    A_roof=106.208,
    A_ground=106.208,
    V_air=265.519,
    U_wall=0.380448,
    U_window=1.59544,
    U_roof=0.259087,
    U_ground=0.438631,
    thermalMass=17254000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=8,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=9,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{114.41,-88.04},{129.41,-73.04}})));

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
    loadProfileName="SFH23",
    loadProfileScaleP=5.36312,
    loadProfileScaleQ=5.36312,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_7",
    Q_HP_nom=12719.7,
    A_living=268.156,
    A_wall=110.124,
    A_window=53.6312,
    A_roof=268.156,
    A_ground=268.156,
    V_air=670.391,
    U_wall=0.377635,
    U_window=1.58716,
    U_roof=0.257433,
    U_ground=0.436149,
    thermalMass=34712900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=10,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{93.41,-214.04},{108.41,-199.04}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.12432,
    loadProfileScaleQ=3.12432,
    usePV=true,
    PV_peakPower=9249.63,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_8",
    Q_HP_nom=7999.04,
    A_living=156.216,
    A_wall=93.7432,
    A_window=31.2432,
    A_roof=156.216,
    A_ground=156.216,
    V_air=390.54,
    U_wall=0.391044,
    U_window=1.6266,
    U_roof=0.26532,
    U_ground=0.44798,
    thermalMass=22937600.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=11,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=12,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=13,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{198.41,107.96},{213.41,122.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_9(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.1484,
    loadProfileScaleQ=3.1484,
    usePV=true,
    PV_peakPower=9320.92,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_9",
    Q_HP_nom=8051.16,
    A_living=157.42,
    A_wall=93.983,
    A_window=31.4839,
    A_roof=157.42,
    A_ground=157.42,
    V_air=393.549,
    U_wall=0.390858,
    U_window=1.62605,
    U_roof=0.26521,
    U_ground=0.447815,
    thermalMass=23070000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=14,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=15,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,268.96},{213.41,283.96}})));

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
    loadProfileName="SFH10",
    loadProfileScaleP=4.33648,
    loadProfileScaleQ=4.33648,
    usePV=true,
    PV_peakPower=12838.3,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_10",
    Q_HP_nom=10188.0,
    A_living=216.824,
    A_wall=103.885,
    A_window=43.3648,
    A_roof=216.824,
    A_ground=216.824,
    V_air=542.06,
    U_wall=0.353341,
    U_window=1.51571,
    U_roof=0.243142,
    U_ground=0.414713,
    thermalMass=29429900.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{79.41,184.96},{94.41,199.96}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=2.68482,
    loadProfileScaleQ=2.68482,
    usePV=true,
    PV_peakPower=7948.48,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_11",
    Q_HP_nom=7380.63,
    A_living=134.241,
    A_wall=89.0141,
    A_window=26.8481,
    A_roof=134.241,
    A_ground=134.241,
    V_air=335.601,
    U_wall=0.432413,
    U_window=1.74827,
    U_roof=0.289655,
    U_ground=0.484482,
    thermalMass=20487000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=16,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=17,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{205.41,-235.04},{220.41,-220.04}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=3.92714,
    loadProfileScaleQ=3.92714,
    usePV=true,
    PV_peakPower=11626.4,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_12",
    Q_HP_nom=9191.26,
    A_living=196.357,
    A_wall=100.856,
    A_window=39.2714,
    A_roof=196.357,
    A_ground=196.357,
    V_air=490.892,
    U_wall=0.342486,
    U_window=1.48378,
    U_roof=0.236756,
    U_ground=0.405134,
    thermalMass=27273800.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=18,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=19,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=20,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{198.41,9.96},{213.41,24.96}})));

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
    loadProfileName="SFH40",
    loadProfileScaleP=4.07556,
    loadProfileScaleQ=4.07556,
    usePV=true,
    PV_peakPower=12065.8,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_13",
    Q_HP_nom=9647.82,
    A_living=203.778,
    A_wall=101.995,
    A_window=40.7556,
    A_roof=203.778,
    A_ground=203.778,
    V_air=509.445,
    U_wall=0.354097,
    U_window=1.51793,
    U_roof=0.243586,
    U_ground=0.41538,
    thermalMass=28059400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=21,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{114.41,-158.04},{129.41,-143.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_14(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH30",
    loadProfileScaleP=3.26084,
    loadProfileScaleQ=3.26084,
    usePV=true,
    PV_peakPower=9653.8,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_14",
    Q_HP_nom=8733.81,
    A_living=163.042,
    A_wall=95.0795,
    A_window=32.6084,
    A_roof=163.042,
    A_ground=163.042,
    V_air=407.605,
    U_wall=0.431627,
    U_window=1.74596,
    U_roof=0.289192,
    U_ground=0.483788,
    thermalMass=23686600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=22,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=23,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{198.41,86.96},{213.41,101.96}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=3.91698,
    loadProfileScaleQ=3.91698,
    usePV=true,
    PV_peakPower=11596.3,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_15",
    Q_HP_nom=10084.0,
    A_living=195.849,
    A_wall=100.776,
    A_window=39.1697,
    A_roof=195.849,
    A_ground=195.849,
    V_air=489.622,
    U_wall=0.417053,
    U_window=1.7031,
    U_roof=0.280619,
    U_ground=0.470929,
    thermalMass=27219900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=24,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{72.41,86.96},{87.41,101.96}})));

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
    loadProfileName="SFH12",
    loadProfileScaleP=3.86188,
    loadProfileScaleQ=3.86188,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_16",
    Q_HP_nom=9747.68,
    A_living=193.094,
    A_wall=100.339,
    A_window=38.6188,
    A_roof=193.094,
    A_ground=193.094,
    V_air=482.735,
    U_wall=0.399661,
    U_window=1.65194,
    U_roof=0.270389,
    U_ground=0.455583,
    thermalMass=26927000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=25,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{72.41,142.96},{87.41,157.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_17(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=3.94704,
    loadProfileScaleQ=3.94704,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_17",
    Q_HP_nom=8672.28,
    A_living=197.352,
    A_wall=101.012,
    A_window=39.4704,
    A_roof=197.352,
    A_ground=197.352,
    V_air=493.38,
    U_wall=0.297039,
    U_window=1.35011,
    U_roof=0.210023,
    U_ground=0.365034,
    thermalMass=27379400.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=26,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=27,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{79.41,212.96},{94.41,227.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_18(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=2.5102,
    loadProfileScaleQ=2.5102,
    usePV=true,
    PV_peakPower=7431.51,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_18",
    Q_HP_nom=6997.17,
    A_living=125.51,
    A_wall=86.9294,
    A_window=25.1021,
    A_roof=125.51,
    A_ground=125.51,
    V_air=313.776,
    U_wall=0.436312,
    U_window=1.75974,
    U_roof=0.291948,
    U_ground=0.487922,
    thermalMass=19494600.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-18.59,16.96},{-3.59,31.96}})));

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
    loadProfileName="SFH38",
    loadProfileScaleP=3.35654,
    loadProfileScaleQ=3.35654,
    usePV=true,
    PV_peakPower=9937.12,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_19",
    Q_HP_nom=8631.45,
    A_living=167.827,
    A_wall=95.9826,
    A_window=33.5653,
    A_roof=167.827,
    A_ground=167.827,
    V_air=419.567,
    U_wall=0.401421,
    U_window=1.65712,
    U_roof=0.271424,
    U_ground=0.457136,
    thermalMass=24208500.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=28,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=29,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,177.96},{213.41,192.96}})));

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
    loadProfileName="SFH19",
    loadProfileScaleP=3.70414,
    loadProfileScaleQ=3.70414,
    usePV=true,
    PV_peakPower=10966.2,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_20",
    Q_HP_nom=9981.64,
    A_living=185.207,
    A_wall=99.0493,
    A_window=37.0413,
    A_roof=185.207,
    A_ground=185.207,
    V_air=463.017,
    U_wall=0.449804,
    U_window=1.79942,
    U_roof=0.299885,
    U_ground=0.499827,
    thermalMass=26084800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=30,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{254.41,268.96},{269.41,283.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_21(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=3.61158,
    loadProfileScaleQ=3.61158,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_21",
    Q_HP_nom=8105.39,
    A_living=180.579,
    A_wall=98.2639,
    A_window=36.1159,
    A_roof=180.579,
    A_ground=180.579,
    V_air=451.448,
    U_wall=0.305406,
    U_window=1.37472,
    U_roof=0.214945,
    U_ground=0.372417,
    thermalMass=25588100.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-102.59,289.96},{-87.59,304.96}})));

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
    loadProfileName="SFH36",
    loadProfileScaleP=2.9396,
    loadProfileScaleQ=2.9396,
    usePV=true,
    PV_peakPower=8702.76,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_22",
    Q_HP_nom=7938.31,
    A_living=146.98,
    A_wall=91.8393,
    A_window=29.396,
    A_roof=146.98,
    A_ground=146.98,
    V_air=367.45,
    U_wall=0.427581,
    U_window=1.73406,
    U_roof=0.286813,
    U_ground=0.480219,
    thermalMass=21915300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=31,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{198.41,-186.04},{213.41,-171.04}})));

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
    loadProfileName="SFH9",
    loadProfileScaleP=4.12726,
    loadProfileScaleQ=4.12726,
    usePV=true,
    PV_peakPower=12218.9,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_23",
    Q_HP_nom=9162.47,
    A_living=206.363,
    A_wall=102.381,
    A_window=41.2726,
    A_roof=206.363,
    A_ground=206.363,
    V_air=515.907,
    U_wall=0.307624,
    U_window=1.38125,
    U_roof=0.216249,
    U_ground=0.374374,
    thermalMass=28332000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=32,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=33,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{247.41,296.96},{262.41,311.96}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=4.517,
    loadProfileScaleQ=4.517,
    usePV=true,
    PV_peakPower=13372.7,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_24",
    Q_HP_nom=10998.5,
    A_living=225.85,
    A_wall=105.113,
    A_window=45.17,
    A_roof=225.85,
    A_ground=225.85,
    V_air=564.625,
    U_wall=0.384645,
    U_window=1.60778,
    U_roof=0.261556,
    U_ground=0.442334,
    thermalMass=30370900.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=34,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=35,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-67.59,37.96},{-52.59,52.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_25(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=4.82992,
    loadProfileScaleQ=4.82992,
    usePV=true,
    PV_peakPower=14299.1,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_25",
    Q_HP_nom=10460.8,
    A_living=241.496,
    A_wall=107.102,
    A_window=48.2992,
    A_roof=241.496,
    A_ground=241.496,
    V_air=603.74,
    U_wall=0.301049,
    U_window=1.36191,
    U_roof=0.212382,
    U_ground=0.368573,
    thermalMass=31989200.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=36,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-158.59,205.96},{-143.59,220.96}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=2.96786,
    loadProfileScaleQ=2.96786,
    usePV=true,
    PV_peakPower=8786.43,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_26",
    Q_HP_nom=7971.28,
    A_living=148.393,
    A_wall=92.1381,
    A_window=29.6786,
    A_roof=148.393,
    A_ground=148.393,
    V_air=370.982,
    U_wall=0.424161,
    U_window=1.724,
    U_roof=0.284801,
    U_ground=0.477201,
    thermalMass=22072400.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=37,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=38,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=39,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-116.59,233.96},{-101.59,248.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

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
    loadProfileName="SFH32",
    loadProfileScaleP=1.8704,
    loadProfileScaleQ=1.8704,
    usePV=true,
    PV_peakPower=5537.37,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_27",
    Q_HP_nom=5310.92,
    A_living=93.52,
    A_wall=78.0017,
    A_window=18.704,
    A_roof=93.52,
    A_ground=93.52,
    V_air=233.8,
    U_wall=0.417244,
    U_window=1.70366,
    U_roof=0.280732,
    U_ground=0.471098,
    thermalMass=15739700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-74.59,149.96},{-59.59,164.96}})));

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
    loadProfileName="SFH35",
    loadProfileScaleP=4.0376,
    loadProfileScaleQ=4.0376,
    usePV=true,
    PV_peakPower=11953.4,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_28",
    Q_HP_nom=9852.17,
    A_living=201.88,
    A_wall=101.708,
    A_window=40.3759,
    A_roof=201.88,
    A_ground=201.88,
    V_air=504.699,
    U_wall=0.376747,
    U_window=1.58455,
    U_roof=0.25691,
    U_ground=0.435365,
    thermalMass=27858800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=40,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=41,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{72.41,163.96},{87.41,178.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_29(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
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
    Q_HP_nom=9356.6,
    A_living=198.319,
    A_wall=101.162,
    A_window=39.6639,
    A_roof=198.319,
    A_ground=198.319,
    V_air=495.799,
    U_wall=0.349221,
    U_window=1.50359,
    U_roof=0.240718,
    U_ground=0.411077,
    thermalMass=27482000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=42,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-67.59,177.96},{-52.59,192.96}})));

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
    loadProfileName="SFH9",
    loadProfileScaleP=7.13468,
    loadProfileScaleQ=7.13468,
    usePV=true,
    PV_peakPower=21122.4,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_30",
    Q_HP_nom=14742.7,
    A_living=356.734,
    A_wall=117.527,
    A_window=71.3468,
    A_roof=356.734,
    A_ground=356.734,
    V_air=891.835,
    U_wall=0.291758,
    U_window=1.33458,
    U_roof=0.206917,
    U_ground=0.360375,
    thermalMass=43520700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{44.41,-144.04},{59.41,-129.04}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=4.96556,
    loadProfileScaleQ=4.96556,
    usePV=true,
    PV_peakPower=14700.7,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_31",
    Q_HP_nom=12179.7,
    A_living=248.278,
    A_wall=107.913,
    A_window=49.6555,
    A_roof=248.278,
    A_ground=248.278,
    V_air=620.694,
    U_wall=0.398563,
    U_window=1.64871,
    U_roof=0.269743,
    U_ground=0.454614,
    thermalMass=32685900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=43,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-67.59,128.96},{-52.59,143.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

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
    loadProfileScaleP=3.88412,
    loadProfileScaleQ=3.88412,
    usePV=true,
    PV_peakPower=11499.0,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_32",
    Q_HP_nom=9279.36,
    A_living=194.206,
    A_wall=100.517,
    A_window=38.8412,
    A_roof=194.206,
    A_ground=194.206,
    V_air=485.515,
    U_wall=0.357102,
    U_window=1.52677,
    U_roof=0.245354,
    U_ground=0.418031,
    thermalMass=27045300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=44,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-158.59,226.96},{-143.59,241.96}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=3.25114,
    loadProfileScaleQ=3.25114,
    usePV=true,
    PV_peakPower=9625.09,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_33",
    Q_HP_nom=8406.82,
    A_living=162.557,
    A_wall=94.9865,
    A_window=32.5115,
    A_roof=162.557,
    A_ground=162.557,
    V_air=406.394,
    U_wall=0.402749,
    U_window=1.66103,
    U_roof=0.272206,
    U_ground=0.458308,
    thermalMass=23633600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=45,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=46,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-67.59,93.96},{-52.59,108.96}})));

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
    loadProfileName="SFH22",
    loadProfileScaleP=2.2096,
    loadProfileScaleQ=2.2096,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_34",
    Q_HP_nom=6200.71,
    A_living=110.48,
    A_wall=83.0135,
    A_window=22.096,
    A_roof=110.48,
    A_ground=110.48,
    V_air=276.2,
    U_wall=0.427285,
    U_window=1.73319,
    U_roof=0.286638,
    U_ground=0.479957,
    thermalMass=17756000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=47,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=48,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-172.59,-291.04},{-157.59,-276.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_35(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=5.3686,
    loadProfileScaleQ=5.3686,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_35",
    Q_HP_nom=13816.2,
    A_living=268.43,
    A_wall=110.152,
    A_window=53.6861,
    A_roof=268.43,
    A_ground=268.43,
    V_air=671.076,
    U_wall=0.445839,
    U_window=1.78776,
    U_roof=0.297552,
    U_ground=0.496328,
    thermalMass=34740700.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=49,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{128.41,-214.04},{143.41,-199.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_36(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=3.27818,
    loadProfileScaleQ=3.27818,
    usePV=true,
    PV_peakPower=9705.14,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_36",
    Q_HP_nom=8709.33,
    A_living=163.909,
    A_wall=95.2451,
    A_window=32.7817,
    A_roof=163.909,
    A_ground=163.909,
    V_air=409.772,
    U_wall=0.425487,
    U_window=1.7279,
    U_roof=0.28558,
    U_ground=0.47837,
    thermalMass=23781300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=50,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{44.41,-298.04},{59.41,-283.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_37(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH12",
    loadProfileScaleP=4.74632,
    loadProfileScaleQ=4.74632,
    usePV=true,
    PV_peakPower=14051.6,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_37",
    Q_HP_nom=10023.4,
    A_living=237.316,
    A_wall=106.587,
    A_window=47.4633,
    A_roof=237.316,
    A_ground=237.316,
    V_air=593.291,
    U_wall=0.281991,
    U_window=1.30586,
    U_roof=0.201171,
    U_ground=0.351757,
    thermalMass=31558400.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=51,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=52,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-67.59,233.96},{-52.59,248.96}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=4.29624,
    loadProfileScaleQ=4.29624,
    usePV=true,
    PV_peakPower=12719.1,
    useBattery=true,
    Bat_Capacity=8640000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_38",
    Q_HP_nom=9942.73,
    A_living=214.812,
    A_wall=103.602,
    A_window=42.9623,
    A_roof=214.812,
    A_ground=214.812,
    V_air=537.029,
    U_wall=0.341196,
    U_window=1.47999,
    U_roof=0.235998,
    U_ground=0.403997,
    thermalMass=29219300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=53,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{79.41,289.96},{94.41,304.96}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=3.50138,
    loadProfileScaleQ=3.50138,
    usePV=true,
    PV_peakPower=10365.9,
    useBattery=true,
    Bat_Capacity=25920000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_39",
    Q_HP_nom=8988.55,
    A_living=175.069,
    A_wall=97.2998,
    A_window=35.0138,
    A_roof=175.069,
    A_ground=175.069,
    V_air=437.672,
    U_wall=0.404098,
    U_window=1.665,
    U_roof=0.272999,
    U_ground=0.459499,
    thermalMass=24994000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=54,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=55,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{44.41,-200.04},{59.41,-185.04}})));

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
    loadProfileName="SFH28",
    loadProfileScaleP=3.04884,
    loadProfileScaleQ=3.04884,
    usePV=true,
    PV_peakPower=9026.17,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_40",
    Q_HP_nom=7010.25,
    A_living=152.442,
    A_wall=92.9791,
    A_window=30.4885,
    A_roof=152.442,
    A_ground=152.442,
    V_air=381.106,
    U_wall=0.309177,
    U_window=1.38581,
    U_roof=0.217163,
    U_ground=0.375744,
    thermalMass=22521200.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=56,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{44.41,-172.04},{59.41,-157.04}})));

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
    loadProfileName="SFH12",
    loadProfileScaleP=3.17076,
    loadProfileScaleQ=3.17076,
    usePV=true,
    PV_peakPower=9387.12,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_41",
    Q_HP_nom=7871.29,
    A_living=158.538,
    A_wall=94.2043,
    A_window=31.7077,
    A_roof=158.538,
    A_ground=158.538,
    V_air=396.346,
    U_wall=0.368576,
    U_window=1.56052,
    U_roof=0.252104,
    U_ground=0.428155,
    thermalMass=23193000.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-130.59,-123.04},{-115.59,-108.04}})));

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
    loadProfileName="SFH17",
    loadProfileScaleP=2.98504,
    loadProfileScaleQ=2.98504,
    usePV=true,
    PV_peakPower=8837.29,
    useBattery=true,
    Bat_Capacity=51840000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_42",
    Q_HP_nom=6684.2,
    A_living=149.252,
    A_wall=92.3183,
    A_window=29.8503,
    A_roof=149.252,
    A_ground=149.252,
    V_air=373.129,
    U_wall=0.289237,
    U_window=1.32717,
    U_roof=0.205434,
    U_ground=0.358151,
    thermalMass=22167700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-158.59,177.96},{-143.59,192.96}})));

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
    loadProfileName="SFH40",
    loadProfileScaleP=2.34686,
    loadProfileScaleQ=2.34686,
    usePV=true,
    PV_peakPower=6947.94,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_43",
    Q_HP_nom=5609.32,
    A_living=117.343,
    A_wall=84.8564,
    A_window=23.4686,
    A_roof=117.343,
    A_ground=117.343,
    V_air=293.358,
    U_wall=0.313999,
    U_window=1.4,
    U_roof=0.22,
    U_ground=0.379999,
    thermalMass=18554900.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=57,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=58,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{72.41,-11.04},{87.41,3.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_44(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH20",
    loadProfileScaleP=4.17538,
    loadProfileScaleQ=4.17538,
    usePV=true,
    PV_peakPower=12361.3,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_44",
    Q_HP_nom=8942.25,
    A_living=208.769,
    A_wall=102.735,
    A_window=41.7539,
    A_roof=208.769,
    A_ground=208.769,
    V_air=521.923,
    U_wall=0.283149,
    U_window=1.30926,
    U_roof=0.201852,
    U_ground=0.352778,
    thermalMass=28585300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=59,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{198.41,289.96},{213.41,304.96}})));

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
    loadProfileName="SFH31",
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
    Q_HP_nom=6455.75,
    A_living=117.898,
    A_wall=85.0013,
    A_window=23.5796,
    A_roof=117.898,
    A_ground=117.898,
    V_air=294.745,
    U_wall=0.414929,
    U_window=1.69685,
    U_roof=0.27937,
    U_ground=0.469055,
    thermalMass=18619100.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=60,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=61,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=62,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{198.41,58.96},{213.41,73.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_46(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH5",
    loadProfileScaleP=2.39376,
    loadProfileScaleQ=2.39376,
    usePV=true,
    PV_peakPower=7086.79,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_46",
    Q_HP_nom=5740.56,
    A_living=119.688,
    A_wall=85.4643,
    A_window=23.9375,
    A_roof=119.688,
    A_ground=119.688,
    V_air=299.219,
    U_wall=0.318067,
    U_window=1.41196,
    U_roof=0.222392,
    U_ground=0.383589,
    thermalMass=18825800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=63,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=64,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{93.41,-445.04},{108.41,-430.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_47(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=2.5736,
    loadProfileScaleQ=2.5736,
    usePV=true,
    PV_peakPower=7619.21,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_47",
    Q_HP_nom=6296.32,
    A_living=128.68,
    A_wall=87.7012,
    A_window=25.736,
    A_roof=128.68,
    A_ground=128.68,
    V_air=321.7,
    U_wall=0.33871,
    U_window=1.47268,
    U_roof=0.234535,
    U_ground=0.401803,
    thermalMass=19856300.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=65,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=66,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{44.41,-88.04},{59.41,-73.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_48(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=4.51992,
    loadProfileScaleQ=4.51992,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_48",
    Q_HP_nom=11737.4,
    A_living=225.996,
    A_wall=105.132,
    A_window=45.1993,
    A_roof=225.996,
    A_ground=225.996,
    V_air=564.991,
    U_wall=0.437774,
    U_window=1.76404,
    U_roof=0.292808,
    U_ground=0.489212,
    thermalMass=30386100.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{93.41,-284.04},{108.41,-269.04}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=1.04057,
    loadProfileScaleQ=1.04057,
    usePV=true,
    PV_peakPower=3080.64,
    useBattery=false,
    useEHP=true,
    V_BST = 0.2,
    tappingProfileName="TappingCycle_A_49",
    Q_HP_nom=3181.52,
    A_living=52.0286,
    A_wall=61.7251,
    A_window=10.4057,
    A_roof=52.0286,
    A_ground=52.0286,
    V_air=130.071,
    U_wall=0.39975,
    U_window=1.65221,
    U_roof=0.270441,
    U_ground=0.455662,
    thermalMass=10438600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=67,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=68,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-130.59,9.96},{-115.59,24.96}})));

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
    loadProfileName="SFH4",
    loadProfileScaleP=3.09362,
    loadProfileScaleQ=3.09362,
    usePV=true,
    PV_peakPower=9158.74,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_50",
    Q_HP_nom=6860.72,
    A_living=154.681,
    A_wall=93.4347,
    A_window=30.9363,
    A_roof=154.681,
    A_ground=154.681,
    V_air=386.704,
    U_wall=0.285413,
    U_window=1.31592,
    U_roof=0.203184,
    U_ground=0.354776,
    thermalMass=22768500.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=69,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=70,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{79.41,261.96},{94.41,276.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_51(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=2.75226,
    loadProfileScaleQ=2.75226,
    usePV=true,
    PV_peakPower=8148.14,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_51",
    Q_HP_nom=6394.07,
    A_living=137.613,
    A_wall=89.786,
    A_window=27.5227,
    A_roof=137.613,
    A_ground=137.613,
    V_air=344.033,
    U_wall=0.307998,
    U_window=1.38235,
    U_roof=0.216469,
    U_ground=0.374704,
    thermalMass=20867400.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=71,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=72,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{72.41,58.96},{87.41,73.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_52(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=3.39346,
    loadProfileScaleQ=3.39346,
    usePV=true,
    PV_peakPower=10046.4,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_52",
    Q_HP_nom=8542.92,
    A_living=169.673,
    A_wall=96.3239,
    A_window=33.9345,
    A_roof=169.673,
    A_ground=169.673,
    V_air=424.181,
    U_wall=0.385651,
    U_window=1.61074,
    U_roof=0.262148,
    U_ground=0.443222,
    thermalMass=24409200.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=73,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=74,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-130.59,-46.04},{-115.59,-31.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_53(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH20",
    loadProfileScaleP=2.35738,
    loadProfileScaleQ=2.35738,
    usePV=true,
    PV_peakPower=6979.09,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_53",
    Q_HP_nom=6154.26,
    A_living=117.869,
    A_wall=84.9938,
    A_window=23.5739,
    A_roof=117.869,
    A_ground=117.869,
    V_air=294.673,
    U_wall=0.378129,
    U_window=1.58861,
    U_roof=0.257723,
    U_ground=0.436584,
    thermalMass=18615800.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=75,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=76,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-172.59,-207.04},{-157.59,-192.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_54(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH16",
    loadProfileScaleP=3.10472,
    loadProfileScaleQ=3.10472,
    usePV=true,
    PV_peakPower=9191.61,
    useBattery=true,
    Bat_Capacity=8640000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_54",
    Q_HP_nom=7238.22,
    A_living=155.236,
    A_wall=93.5466,
    A_window=31.0473,
    A_roof=155.236,
    A_ground=155.236,
    V_air=388.091,
    U_wall=0.320442,
    U_window=1.41895,
    U_roof=0.223789,
    U_ground=0.385684,
    thermalMass=22829600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=77,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=78,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,240.96},{213.41,255.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

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
    loadProfileName="SFH35",
    loadProfileScaleP=2.5987,
    loadProfileScaleQ=2.5987,
    usePV=true,
    PV_peakPower=7693.52,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_55",
    Q_HP_nom=7231.71,
    A_living=129.935,
    A_wall=88.002,
    A_window=25.987,
    A_roof=129.935,
    A_ground=129.935,
    V_air=324.837,
    U_wall=0.438816,
    U_window=1.76711,
    U_roof=0.293421,
    U_ground=0.490132,
    thermalMass=19999000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=79,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,212.96},{213.41,227.96}})));

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
    loadProfileScaleP=3.41416,
    loadProfileScaleQ=3.41416,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_56",
    Q_HP_nom=8574.88,
    A_living=170.708,
    A_wall=96.5137,
    A_window=34.1417,
    A_roof=170.708,
    A_ground=170.708,
    V_air=426.771,
    U_wall=0.384374,
    U_window=1.60698,
    U_roof=0.261397,
    U_ground=0.442095,
    thermalMass=24521700.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=80,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-172.59,-172.04},{-157.59,-157.04}})));

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
    loadProfileName="SFH9",
    loadProfileScaleP=3.7283,
    loadProfileScaleQ=3.7283,
    usePV=true,
    PV_peakPower=11037.7,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_57",
    Q_HP_nom=9111.86,
    A_living=186.415,
    A_wall=99.2509,
    A_window=37.283,
    A_roof=186.415,
    A_ground=186.415,
    V_air=466.038,
    U_wall=0.371058,
    U_window=1.56782,
    U_roof=0.253563,
    U_ground=0.430345,
    thermalMass=26214200.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=81,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{114.41,-137.04},{129.41,-122.04}})));

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
    loadProfileName="SFH18",
    loadProfileScaleP=3.84628,
    loadProfileScaleQ=3.84628,
    usePV=true,
    PV_peakPower=11387.0,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_58",
    Q_HP_nom=9478.8,
    A_living=192.314,
    A_wall=100.215,
    A_window=38.4628,
    A_roof=192.314,
    A_ground=192.314,
    V_air=480.785,
    U_wall=0.380285,
    U_window=1.59495,
    U_roof=0.258991,
    U_ground=0.438486,
    thermalMass=26843900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=82,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{93.41,-417.04},{108.41,-402.04}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=2.88284,
    loadProfileScaleQ=2.88284,
    usePV=true,
    PV_peakPower=8534.72,
    useBattery=true,
    Bat_Capacity=17280000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_59",
    Q_HP_nom=7580.26,
    A_living=144.142,
    A_wall=91.2307,
    A_window=28.8284,
    A_roof=144.142,
    A_ground=144.142,
    V_air=360.355,
    U_wall=0.404121,
    U_window=1.66506,
    U_roof=0.273012,
    U_ground=0.459518,
    thermalMass=21599000.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-18.59,37.96},{-3.59,52.96}})));

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
    loadProfileName="SFH32",
    loadProfileScaleP=3.01862,
    loadProfileScaleQ=3.01862,
    usePV=true,
    PV_peakPower=8936.7,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_60",
    Q_HP_nom=7185.53,
    A_living=150.931,
    A_wall=92.6679,
    A_window=30.1863,
    A_roof=150.931,
    A_ground=150.931,
    V_air=377.329,
    U_wall=0.333031,
    U_window=1.45597,
    U_roof=0.231194,
    U_ground=0.396792,
    thermalMass=22354000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=83,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{79.41,37.96},{94.41,52.96}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=3.35882,
    loadProfileScaleQ=3.35882,
    usePV=true,
    PV_peakPower=9943.88,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_61",
    Q_HP_nom=8055.47,
    A_living=167.941,
    A_wall=96.0038,
    A_window=33.5881,
    A_roof=167.941,
    A_ground=167.941,
    V_air=419.851,
    U_wall=0.347698,
    U_window=1.49911,
    U_roof=0.239822,
    U_ground=0.409733,
    thermalMass=24220900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=84,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-242.59,261.96},{-227.59,276.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_62(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH23",
    loadProfileScaleP=3.51526,
    loadProfileScaleQ=3.51526,
    usePV=true,
    PV_peakPower=10407,
    useBattery=true,
    Bat_Capacity=51840000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_62",
    Q_HP_nom=8027.54,
    A_living=175.763,
    A_wall=97.4231,
    A_window=35.1527,
    A_roof=175.763,
    A_ground=175.763,
    V_air=439.408,
    U_wall=0.315673,
    U_window=1.40492,
    U_roof=0.220984,
    U_ground=0.381477,
    thermalMass=25069000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=85,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=86,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-172.59,-123.04},{-157.59,-108.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_63(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=2.79342,
    loadProfileScaleQ=2.79342,
    usePV=true,
    PV_peakPower=8269.99,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_63",
    Q_HP_nom=6512.29,
    A_living=139.671,
    A_wall=90.2484,
    A_window=27.9343,
    A_roof=139.671,
    A_ground=139.671,
    V_air=349.178,
    U_wall=0.311653,
    U_window=1.3931,
    U_roof=0.218619,
    U_ground=0.377929,
    thermalMass=21098600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=87,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=88,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-67.59,-25.04},{-52.59,-10.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_64(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=1.74965,
    loadProfileScaleQ=1.74965,
    usePV=true,
    PV_peakPower=5179.88,
    useBattery=true,
    Bat_Capacity=25920000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_64",
    Q_HP_nom=5169.54,
    A_living=87.4824,
    A_wall=76.0355,
    A_window=17.4965,
    A_roof=87.4824,
    A_ground=87.4824,
    V_air=218.706,
    U_wall=0.440543,
    U_window=1.77219,
    U_roof=0.294437,
    U_ground=0.491656,
    thermalMass=15005300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=89,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-130.59,-18.04},{-115.59,-3.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_65(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=3.28872,
    loadProfileScaleQ=3.28872,
    usePV=true,
    PV_peakPower=9736.34,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_65",
    Q_HP_nom=8523.7,
    A_living=164.436,
    A_wall=95.3453,
    A_window=32.8871,
    A_roof=164.436,
    A_ground=164.436,
    V_air=411.089,
    U_wall=0.405724,
    U_window=1.66978,
    U_roof=0.273955,
    U_ground=0.460933,
    thermalMass=23838900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=90,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,37.96},{213.41,52.96}})));

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
    loadProfileName="SFH32",
    loadProfileScaleP=1.64663,
    loadProfileScaleQ=1.64663,
    usePV=true,
    PV_peakPower=4874.89,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_66",
    Q_HP_nom=4435.69,
    A_living=82.3315,
    A_wall=74.2704,
    A_window=16.4663,
    A_roof=82.3315,
    A_ground=82.3315,
    V_air=205.829,
    U_wall=0.363378,
    U_window=1.54523,
    U_roof=0.249046,
    U_ground=0.423569,
    thermalMass=14370600.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-172.59,-151.04},{-157.59,-136.04}})));

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
    loadProfileName="SFH21",
    loadProfileScaleP=2.3849,
    loadProfileScaleQ=2.3849,
    usePV=true,
    PV_peakPower=7060.56,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_67",
    Q_HP_nom=5726.92,
    A_living=119.245,
    A_wall=85.3504,
    A_window=23.849,
    A_roof=119.245,
    A_ground=119.245,
    V_air=298.113,
    U_wall=0.31866,
    U_window=1.41371,
    U_roof=0.222741,
    U_ground=0.384112,
    thermalMass=18774800.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=91,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{44.41,-116.04},{59.41,-101.04}})));

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
    loadProfileName="SFH36",
    loadProfileScaleP=3.92644,
    loadProfileScaleQ=3.92644,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_68",
    Q_HP_nom=8953.45,
    A_living=196.322,
    A_wall=100.85,
    A_window=39.2643,
    A_roof=196.322,
    A_ground=196.322,
    V_air=490.804,
    U_wall=0.323241,
    U_window=1.42718,
    U_roof=0.225436,
    U_ground=0.388153,
    thermalMass=27270100.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=92,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=93,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=94,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-158.59,149.96},{-143.59,164.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_69(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=2.15914,
    loadProfileScaleQ=2.15914,
    usePV=true,
    PV_peakPower=6392.19,
    useBattery=true,
    Bat_Capacity=8640000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_69",
    Q_HP_nom=5033.1,
    A_living=107.957,
    A_wall=82.311,
    A_window=21.5914,
    A_roof=107.957,
    A_ground=107.957,
    V_air=269.892,
    U_wall=0.289865,
    U_window=1.32901,
    U_roof=0.205803,
    U_ground=0.358704,
    thermalMass=17460000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=95,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{86.41,-312.04},{101.41,-297.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_70(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH22",
    loadProfileScaleP=2.63876,
    loadProfileScaleQ=2.63876,
    usePV=true,
    PV_peakPower=7812.12,
    useBattery=true,
    Bat_Capacity=43200000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_70",
    Q_HP_nom=6570.44,
    A_living=131.938,
    A_wall=88.4767,
    A_window=26.3876,
    A_roof=131.938,
    A_ground=131.938,
    V_air=329.845,
    U_wall=0.353851,
    U_window=1.51721,
    U_roof=0.243442,
    U_ground=0.415163,
    thermalMass=20226400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=96,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{205.41,-39.04},{220.41,-24.04}})));

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
    loadProfileName="SFH10",
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
    Q_HP_nom=8324.41,
    A_living=178.227,
    A_wall=97.8563,
    A_window=35.6455,
    A_roof=178.227,
    A_ground=178.227,
    V_air=445.568,
    U_wall=0.333005,
    U_window=1.4559,
    U_roof=0.23118,
    U_ground=0.396769,
    thermalMass=25334900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=97,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,-207.04},{213.41,-192.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_72(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=2.67728,
    loadProfileScaleQ=2.67728,
    usePV=true,
    PV_peakPower=7926.16,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_72",
    Q_HP_nom=7055.73,
    A_living=133.864,
    A_wall=88.9268,
    A_window=26.7728,
    A_roof=133.864,
    A_ground=133.864,
    V_air=334.66,
    U_wall=0.398378,
    U_window=1.64817,
    U_roof=0.269634,
    U_ground=0.454452,
    thermalMass=20444500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=98,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{93.41,-340.04},{108.41,-325.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_73(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH27",
    loadProfileScaleP=4.26474,
    loadProfileScaleQ=4.26474,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_73",
    Q_HP_nom=9917.13,
    A_living=213.237,
    A_wall=103.379,
    A_window=42.6474,
    A_roof=213.237,
    A_ground=213.237,
    V_air=533.093,
    U_wall=0.344218,
    U_window=1.48888,
    U_roof=0.237775,
    U_ground=0.406663,
    thermalMass=29054400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=99,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-172.59,-263.04},{-157.59,-248.04}})));

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
    loadProfileName="SFH18",
    loadProfileScaleP=2.58258,
    loadProfileScaleQ=2.58258,
    usePV=true,
    PV_peakPower=7645.8,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_74",
    Q_HP_nom=6068.54,
    A_living=129.129,
    A_wall=87.8092,
    A_window=25.8259,
    A_roof=129.129,
    A_ground=129.129,
    V_air=322.823,
    U_wall=0.310533,
    U_window=1.3898,
    U_roof=0.21796,
    U_ground=0.376941,
    thermalMass=19907400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=100,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{44.41,-249.04},{59.41,-234.04}})));

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
    loadProfileName="SFH31",
    loadProfileScaleP=4.33236,
    loadProfileScaleQ=4.33236,
    usePV=true,
    PV_peakPower=12826.1,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_75",
    Q_HP_nom=9258.74,
    A_living=216.618,
    A_wall=103.856,
    A_window=43.3235,
    A_roof=216.618,
    A_ground=216.618,
    V_air=541.544,
    U_wall=0.284195,
    U_window=1.31234,
    U_roof=0.202468,
    U_ground=0.353702,
    thermalMass=29408300.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{79.41,-32.04},{94.41,-17.04}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=3.35264,
    loadProfileScaleQ=3.35264,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_76",
    Q_HP_nom=7434.64,
    A_living=167.632,
    A_wall=95.9463,
    A_window=33.5264,
    A_roof=167.632,
    A_ground=167.632,
    V_air=419.08,
    U_wall=0.291432,
    U_window=1.33362,
    U_roof=0.206725,
    U_ground=0.360087,
    thermalMass=24187300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=101,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{93.41,-368.04},{108.41,-353.04}})));

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
    loadProfileName="SFH38",
    loadProfileScaleP=4.79018,
    loadProfileScaleQ=4.79018,
    usePV=true,
    PV_peakPower=14181.5,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_77",
    Q_HP_nom=11749.1,
    A_living=239.509,
    A_wall=106.859,
    A_window=47.9018,
    A_roof=239.509,
    A_ground=239.509,
    V_air=598.772,
    U_wall=0.395497,
    U_window=1.6397,
    U_roof=0.267939,
    U_ground=0.451909,
    thermalMass=31784600.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=102,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-130.59,37.96},{-115.59,52.96}})));

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
    loadProfileName="SFH28",
    loadProfileScaleP=2.91058,
    loadProfileScaleQ=2.91058,
    usePV=true,
    PV_peakPower=8616.85,
    useBattery=true,
    Bat_Capacity=51840000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_78",
    Q_HP_nom=7190.82,
    A_living=145.529,
    A_wall=91.5295,
    A_window=29.1058,
    A_roof=145.529,
    A_ground=145.529,
    V_air=363.822,
    U_wall=0.357128,
    U_window=1.52685,
    U_roof=0.24537,
    U_ground=0.418055,
    thermalMass=21753700.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{254.41,240.96},{269.41,255.96}})));

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
    loadProfileName="SFH9",
    loadProfileScaleP=4.7323,
    loadProfileScaleQ=4.7323,
    usePV=true,
    PV_peakPower=14010.1,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_79",
    Q_HP_nom=11274.3,
    A_living=236.615,
    A_wall=106.5,
    A_window=47.323,
    A_roof=236.615,
    A_ground=236.615,
    V_air=591.538,
    U_wall=0.371218,
    U_window=1.56829,
    U_roof=0.253658,
    U_ground=0.430487,
    thermalMass=31486100.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=103,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{93.41,-249.04},{108.41,-234.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_80(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH3",
    loadProfileScaleP=3.22808,
    loadProfileScaleQ=3.22808,
    usePV=true,
    PV_peakPower=9556.82,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_80",
    Q_HP_nom=8665.42,
    A_living=161.404,
    A_wall=94.7641,
    A_window=32.2808,
    A_roof=161.404,
    A_ground=161.404,
    V_air=403.51,
    U_wall=0.432434,
    U_window=1.74834,
    U_roof=0.289667,
    U_ground=0.484501,
    thermalMass=23507300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=104,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{79.41,9.96},{94.41,24.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_81(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=3.11246,
    loadProfileScaleQ=3.11246,
    usePV=true,
    PV_peakPower=9214.52,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_81",
    Q_HP_nom=8555.46,
    A_living=155.623,
    A_wall=93.6244,
    A_window=31.1247,
    A_roof=155.623,
    A_ground=155.623,
    V_air=389.058,
    U_wall=0.448358,
    U_window=1.79517,
    U_roof=0.299034,
    U_ground=0.498551,
    thermalMass=22872300.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=105,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-172.59,-319.04},{-157.59,-304.04}})));

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
    loadProfileName="SFH20",
    loadProfileScaleP=3.0632,
    loadProfileScaleQ=3.0632,
    usePV=true,
    PV_peakPower=9068.68,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_82",
    Q_HP_nom=7116.73,
    A_living=153.16,
    A_wall=93.1259,
    A_window=30.632,
    A_roof=153.16,
    A_ground=153.16,
    V_air=382.9,
    U_wall=0.316872,
    U_window=1.40845,
    U_roof=0.22169,
    U_ground=0.382535,
    thermalMass=22600500.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{72.41,114.96},{87.41,129.96}})));

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
    loadProfileName="SFH40",
    loadProfileScaleP=2.84562,
    loadProfileScaleQ=2.84562,
    usePV=true,
    PV_peakPower=8424.53,
    useBattery=true,
    Bat_Capacity=17280000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_83",
    Q_HP_nom=7386.94,
    A_living=142.281,
    A_wall=90.8254,
    A_window=28.4562,
    A_roof=142.281,
    A_ground=142.281,
    V_air=355.703,
    U_wall=0.392723,
    U_window=1.63154,
    U_roof=0.266308,
    U_ground=0.449462,
    thermalMass=21391100.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=106,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=107,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{44.41,-277.04},{59.41,-262.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

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
    loadProfileName="SFH10",
    loadProfileScaleP=2.43188,
    loadProfileScaleQ=2.43188,
    usePV=true,
    PV_peakPower=7199.64,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_84",
    Q_HP_nom=5876.27,
    A_living=121.594,
    A_wall=85.9508,
    A_window=24.3188,
    A_roof=121.594,
    A_ground=121.594,
    V_air=303.985,
    U_wall=0.324765,
    U_window=1.43166,
    U_roof=0.226332,
    U_ground=0.389498,
    thermalMass=19045400.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=108,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-130.59,-151.04},{-115.59,-136.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_85(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH8",
    loadProfileScaleP=3.94412,
    loadProfileScaleQ=3.94412,
    usePV=true,
    PV_peakPower=11676.7,
    useBattery=true,
    Bat_Capacity=51840000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_85",
    Q_HP_nom=8499.79,
    A_living=197.206,
    A_wall=100.989,
    A_window=39.4413,
    A_roof=197.206,
    A_ground=197.206,
    V_air=493.016,
    U_wall=0.283511,
    U_window=1.31033,
    U_roof=0.202065,
    U_ground=0.353098,
    thermalMass=27364000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=109,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=110,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{198.41,-88.04},{213.41,-73.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_86(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH5",
    loadProfileScaleP=4.64298,
    loadProfileScaleQ=4.64298,
    usePV=true,
    PV_peakPower=13745.7,
    useBattery=false,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_86",
    Q_HP_nom=11614.8,
    A_living=232.149,
    A_wall=105.935,
    A_window=46.4299,
    A_roof=232.149,
    A_ground=232.149,
    V_air=580.373,
    U_wall=0.408924,
    U_window=1.67919,
    U_roof=0.275838,
    U_ground=0.463757,
    thermalMass=31024400.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=111,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=112,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=113,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{114.41,-109.04},{129.41,-94.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_87(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH16",
    loadProfileScaleP=4.28444,
    loadProfileScaleQ=4.28444,
    usePV=true,
    PV_peakPower=12684.2,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_87",
    Q_HP_nom=9828.64,
    A_living=214.222,
    A_wall=103.519,
    A_window=42.8443,
    A_roof=214.222,
    A_ground=214.222,
    V_air=535.554,
    U_wall=0.334403,
    U_window=1.46001,
    U_roof=0.232002,
    U_ground=0.398003,
    thermalMass=29157500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=114,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,-137.04},{213.41,-122.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_88(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=4.79812,
    loadProfileScaleQ=4.79812,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_88",
    Q_HP_nom=11037.9,
    A_living=239.906,
    A_wall=106.908,
    A_window=47.9812,
    A_roof=239.906,
    A_ground=239.906,
    V_air=599.765,
    U_wall=0.345189,
    U_window=1.49173,
    U_roof=0.238346,
    U_ground=0.40752,
    thermalMass=31825500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=115,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{93.41,-396.04},{108.41,-381.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_89(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH29",
    loadProfileScaleP=3.15966,
    loadProfileScaleQ=3.15966,
    usePV=true,
    PV_peakPower=9354.26,
    useBattery=true,
    Bat_Capacity=34560000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_89",
    Q_HP_nom=7964.81,
    A_living=157.983,
    A_wall=94.0947,
    A_window=31.5967,
    A_roof=157.983,
    A_ground=157.983,
    V_air=394.958,
    U_wall=0.380014,
    U_window=1.59416,
    U_roof=0.258832,
    U_ground=0.438248,
    thermalMass=23132000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=116,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=117,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{198.41,-109.04},{213.41,-94.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_90(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH14",
    loadProfileScaleP=3.72722,
    loadProfileScaleQ=3.72722,
    usePV=true,
    PV_peakPower=11034.5,
    useBattery=true,
    Bat_Capacity=25920000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_90",
    Q_HP_nom=9700.64,
    A_living=186.361,
    A_wall=99.242,
    A_window=37.2723,
    A_roof=186.361,
    A_ground=186.361,
    V_air=465.903,
    U_wall=0.421278,
    U_window=1.71552,
    U_roof=0.283105,
    U_ground=0.474657,
    thermalMass=26208500.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=118,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{198.41,-60.04},{213.41,-45.04}})));

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
    loadProfileName="SFH39",
    loadProfileScaleP=2.99842,
    loadProfileScaleQ=2.99842,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_A_91",
    Q_HP_nom=7675.19,
    A_living=149.921,
    A_wall=92.4579,
    A_window=29.9841,
    A_roof=149.921,
    A_ground=149.921,
    V_air=374.801,
    U_wall=0.386927,
    U_window=1.61449,
    U_roof=0.262898,
    U_ground=0.444347,
    thermalMass=22241900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=119,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,135.96},{213.41,150.96}})));

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
    loadProfileName="SFH23",
    loadProfileScaleP=4.7424,
    loadProfileScaleQ=4.7424,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_92",
    Q_HP_nom=12115.5,
    A_living=237.12,
    A_wall=106.563,
    A_window=47.424,
    A_roof=237.12,
    A_ground=237.12,
    V_air=592.801,
    U_wall=0.428351,
    U_window=1.73633,
    U_roof=0.287265,
    U_ground=0.480898,
    thermalMass=31538200.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=120,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=121,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-81.59,-123.04},{-66.59,-108.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_93(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=4.99222,
    loadProfileScaleQ=4.99222,
    usePV=true,
    PV_peakPower=14779.6,
    useBattery=true,
    Bat_Capacity=25920000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_93",
    Q_HP_nom=11159.6,
    A_living=249.611,
    A_wall=108.069,
    A_window=49.9222,
    A_roof=249.611,
    A_ground=249.611,
    V_air=624.027,
    U_wall=0.326502,
    U_window=1.43677,
    U_roof=0.227354,
    U_ground=0.391031,
    thermalMass=32822600.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=122,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=123,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-67.59,9.96},{-52.59,24.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_94(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH7",
    loadProfileScaleP=5.3764,
    loadProfileScaleQ=5.3764,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_A_94",
    Q_HP_nom=13353.7,
    A_living=268.82,
    A_wall=110.193,
    A_window=53.764,
    A_roof=268.82,
    A_ground=268.82,
    V_air=672.05,
    U_wall=0.415668,
    U_window=1.69902,
    U_roof=0.279805,
    U_ground=0.469707,
    thermalMass=34780300.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=124,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=125,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,-11.04},{213.41,3.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_95(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH25",
    loadProfileScaleP=2.0257,
    loadProfileScaleQ=2.0257,
    usePV=true,
    PV_peakPower=5997.14,
    useBattery=true,
    Bat_Capacity=51840000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_A_95",
    Q_HP_nom=4918.6,
    A_living=101.285,
    A_wall=80.3835,
    A_window=20.257,
    A_roof=101.285,
    A_ground=101.285,
    V_air=253.213,
    U_wall=0.311558,
    U_window=1.39282,
    U_roof=0.218564,
    U_ground=0.377845,
    thermalMass=16670900.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=126,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-130.59,-172.04},{-115.59,-157.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_96(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=3.55328,
    loadProfileScaleQ=3.55328,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_96",
    Q_HP_nom=9534.75,
    A_living=177.664,
    A_wall=97.7579,
    A_window=35.5329,
    A_roof=177.664,
    A_ground=177.664,
    V_air=444.161,
    U_wall=0.441975,
    U_window=1.7764,
    U_roof=0.295279,
    U_ground=0.492919,
    thermalMass=25274200.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=127,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{205.41,-158.04},{220.41,-143.04}})));

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
    loadProfileName="SFH21",
    loadProfileScaleP=3.20524,
    loadProfileScaleQ=3.20524,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_97",
    Q_HP_nom=8241.35,
    A_living=160.262,
    A_wall=94.5423,
    A_window=32.0525,
    A_roof=160.262,
    A_ground=160.262,
    V_air=400.656,
    U_wall=0.396873,
    U_window=1.64374,
    U_roof=0.268749,
    U_ground=0.453123,
    thermalMass=23382200.0,
    num_BEVs=3,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=128,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=129,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=130,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-130.59,-74.04},{-115.59,-59.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_98(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH31",
    loadProfileScaleP=4.09294,
    loadProfileScaleQ=4.09294,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_98",
    Q_HP_nom=9208.55,
    A_living=204.647,
    A_wall=102.125,
    A_window=40.9294,
    A_roof=204.647,
    A_ground=204.647,
    V_air=511.617,
    U_wall=0.316636,
    U_window=1.40775,
    U_roof=0.221551,
    U_ground=0.382326,
    thermalMass=28151000.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=131,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=132,
        Bat_Capacity=295200000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{198.41,156.96},{213.41,171.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

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
    loadProfileName="SFH14",
    loadProfileScaleP=9.30106,
    loadProfileScaleQ=9.30106,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 1.5,
    tappingProfileName="TappingCycle_A_99",
    Q_HP_nom=22623.7,
    A_living=465.053,
    A_wall=122.64,
    A_window=93.0106,
    A_roof=465.053,
    A_ground=465.053,
    V_air=1162.63,
    U_wall=0.441053,
    U_window=1.77369,
    U_roof=0.294737,
    U_ground=0.492106,
    thermalMass=53929800.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-4.59,289.96},{10.41,304.96}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=3.89604,
    loadProfileScaleQ=3.89604,
    usePV=true,
    PV_peakPower=11534.3,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_100",
    Q_HP_nom=9880.0,
    A_living=194.802,
    A_wall=100.611,
    A_window=38.9604,
    A_roof=194.802,
    A_ground=194.802,
    V_air=487.005,
    U_wall=0.404245,
    U_window=1.66543,
    U_roof=0.273086,
    U_ground=0.459628,
    thermalMass=27108600.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-242.59,233.96},{-227.59,248.96}})));

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
    loadProfileName="SFH21",
    loadProfileScaleP=5.07276,
    loadProfileScaleQ=5.07276,
    usePV=true,
    PV_peakPower=15018.0,
    useBattery=true,
    Bat_Capacity=43200000.0,
    Bat_PowerLimit=6000.0,
    Bat_SOCStart=1.0,
    useEHP=true,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_101",
    Q_HP_nom=11271.6,
    A_living=253.638,
    A_wall=108.533,
    A_window=50.7276,
    A_roof=253.638,
    A_ground=253.638,
    V_air=634.095,
    U_wall=0.32317,
    U_window=1.42697,
    U_roof=0.225394,
    U_ground=0.388091,
    thermalMass=33234700.0,
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=133,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=16500.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=134,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4())}) annotation (Placement(transformation(extent={{-242.59,205.96},{-227.59,220.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_102(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH34",
    loadProfileScaleP=3.4573,
    loadProfileScaleQ=3.4573,
    usePV=true,
    PV_peakPower=10235.4,
    useBattery=true,
    Bat_Capacity=25920000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_102",
    Q_HP_nom=7916.19,
    A_living=172.865,
    A_wall=96.9052,
    A_window=34.573,
    A_roof=172.865,
    A_ground=172.865,
    V_air=432.163,
    U_wall=0.316263,
    U_window=1.40666,
    U_roof=0.221331,
    U_ground=0.381997,
    thermalMass=24755500.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-242.59,177.96},{-227.59,192.96}})));

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
    loadProfileName="SFH18",
    loadProfileScaleP=3.49594,
    loadProfileScaleQ=3.49594,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_A_103",
    Q_HP_nom=8573.96,
    A_living=174.797,
    A_wall=97.2514,
    A_window=34.9594,
    A_roof=174.797,
    A_ground=174.797,
    V_air=436.992,
    U_wall=0.368094,
    U_window=1.5591,
    U_roof=0.25182,
    U_ground=0.42773,
    thermalMass=24964600.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-242.59,142.96},{-227.59,157.96}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=4.61588,
    loadProfileScaleQ=4.61588,
    usePV=true,
    PV_peakPower=13665.4,
    useBattery=true,
    Bat_Capacity=43200000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_A_104",
    Q_HP_nom=9806.87,
    A_living=230.794,
    A_wall=105.76,
    A_window=46.1588,
    A_roof=230.794,
    A_ground=230.794,
    V_air=576.985,
    U_wall=0.284363,
    U_window=1.31283,
    U_roof=0.202566,
    U_ground=0.353849,
    thermalMass=30884000.0,
    num_BEVs=1,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=135,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=22000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{-242.59,121.96},{-227.59,136.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.PowerTransformation.SimpleTransformerComplex simpleTransformerComplex(
    UseRatio=false,
    ratio=50,
    U_P=10e3,
    U_S=400,
    epp_p(v(start=10000)),
    epp_n(v(start=400))) annotation (Placement(transformation(extent={{-84,376},{-64,396}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));
  // ------------------------------------------------------------------------------------------
  //   Interface part
  // ------------------------------------------------------------------------------------------
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-110,40},{-90,60}})));

  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------
  TransiEnt.Components.Sensors.SmartMeter GridMeter annotation (Placement(transformation(extent={{-12,376},{8,396}})));
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
  connect(controlBus.node_59, node_59.controlBus) annotation();
  connect(controlBus.node_60, node_60.controlBus) annotation();
  connect(controlBus.node_61, node_61.controlBus) annotation();
  connect(controlBus.node_62, node_62.controlBus) annotation();
  connect(controlBus.node_63, node_63.controlBus) annotation();
  connect(controlBus.node_64, node_64.controlBus) annotation();
  connect(controlBus.node_65, node_65.controlBus) annotation();
  connect(controlBus.node_66, node_66.controlBus) annotation();
  connect(controlBus.node_67, node_67.controlBus) annotation();
  connect(controlBus.node_68, node_68.controlBus) annotation();
  connect(controlBus.node_69, node_69.controlBus) annotation();
  connect(controlBus.node_70, node_70.controlBus) annotation();
  connect(controlBus.node_71, node_71.controlBus) annotation();
  connect(controlBus.node_72, node_72.controlBus) annotation();
  connect(controlBus.node_73, node_73.controlBus) annotation();
  connect(controlBus.node_74, node_74.controlBus) annotation();
  connect(controlBus.node_75, node_75.controlBus) annotation();
  connect(controlBus.node_76, node_76.controlBus) annotation();
  connect(controlBus.node_77, node_77.controlBus) annotation();
  connect(controlBus.node_78, node_78.controlBus) annotation();
  connect(controlBus.node_79, node_79.controlBus) annotation();
  connect(controlBus.node_80, node_80.controlBus) annotation();
  connect(controlBus.node_81, node_81.controlBus) annotation();
  connect(controlBus.node_82, node_82.controlBus) annotation();
  connect(controlBus.node_83, node_83.controlBus) annotation();
  connect(controlBus.node_84, node_84.controlBus) annotation();
  connect(controlBus.node_85, node_85.controlBus) annotation();
  connect(controlBus.node_86, node_86.controlBus) annotation();
  connect(controlBus.node_87, node_87.controlBus) annotation();
  connect(controlBus.node_88, node_88.controlBus) annotation();
  connect(controlBus.node_89, node_89.controlBus) annotation();
  connect(controlBus.node_90, node_90.controlBus) annotation();
  connect(controlBus.node_91, node_91.controlBus) annotation();
  connect(controlBus.node_92, node_92.controlBus) annotation();
  connect(controlBus.node_93, node_93.controlBus) annotation();
  connect(controlBus.node_94, node_94.controlBus) annotation();
  connect(controlBus.node_95, node_95.controlBus) annotation();
  connect(controlBus.node_96, node_96.controlBus) annotation();
  connect(controlBus.node_97, node_97.controlBus) annotation();
  connect(controlBus.node_98, node_98.controlBus) annotation();
  connect(controlBus.node_99, node_99.controlBus) annotation();
  connect(controlBus.node_100, node_100.controlBus) annotation();
  connect(controlBus.node_101, node_101.controlBus) annotation();
  connect(controlBus.node_102, node_102.controlBus) annotation();
  connect(controlBus.node_103, node_103.controlBus) annotation();
  connect(controlBus.node_104, node_104.controlBus) annotation();
  connect(controlBus.node_105, node_105.controlBus) annotation();
  connect(controlBus.node_106, node_106.controlBus) annotation();
  connect(controlBus.node_107, node_107.controlBus) annotation();
  connect(controlBus.node_108, node_108.controlBus) annotation();
  connect(controlBus.node_109, node_109.controlBus) annotation();
  connect(controlBus.node_110, node_110.controlBus) annotation();

  // ---- Connect lines -----------------------------------------------------------------------

  connect(line_1.epp_p, node_55.epp) annotation (Line(points={{59.41,201.46},{61.91,184.96}}));
  connect(line_1.epp_n, node_37.epp) annotation (Line(points={{64.41,201.46},{61.91,212.96}}));
  connect(line_2.epp_p, node_25.epp) annotation (Line(points={{52.41,155.96},{54.91,142.96}}));
  connect(line_2.epp_n, node_95.epp) annotation (Line(points={{57.41,155.96},{54.91,163.96}}));
  connect(line_3.epp_p, node_49.epp) annotation (Line(points={{94.41,-169.54},{96.91,-186.04}}));
  connect(line_3.epp_n, node_93.epp) annotation (Line(points={{99.41,-169.54},{96.91,-158.04}}));
  connect(line_4.epp_p, node_38.epp) annotation (Line(points={{-150.59,-1.54},{-148.09,-18.04}}));
  connect(line_4.epp_n, node_30.epp) annotation (Line(points={{-145.59,-1.54},{-148.09,9.96}}));
  connect(line_5.epp_p, node_43.epp) annotation (Line(points={{-192.59,-274.54},{-190.09,-291.04}}));
  connect(line_5.epp_n, node_82.epp) annotation (Line(points={{-187.59,-274.54},{-190.09,-263.04}}));
  connect(line_6.epp_p, node_36.epp) annotation (Line(points={{73.41,-264.04},{75.91,-284.04}}));
  connect(line_6.epp_n, node_16.epp) annotation (Line(points={{78.41,-264.04},{75.91,-249.04}}));
  connect(line_7.epp_p, node_72.epp) annotation (Line(points={{-150.59,-134.54},{-148.09,-123.04}}));
  connect(line_7.epp_n, node_19.epp) annotation (Line(points={{-145.59,-134.54},{-148.09,-151.04}}));
  connect(line_8.epp_p, node_52.epp) annotation (Line(points={{73.41,-428.54},{75.91,-445.04}}));
  connect(line_8.epp_n, node_85.epp) annotation (Line(points={{78.41,-428.54},{75.91,-417.04}}));
  connect(line_9.epp_p, node_14.epp) annotation (Line(points={{59.41,253.96},{61.91,240.96}}));
  connect(line_9.epp_n, node_18.epp) annotation (Line(points={{64.41,253.96},{61.91,261.96}}));
  connect(line_10.epp_p, node_69.epp) annotation (Line(points={{181.91,-47.04},{187.91,-39.04}}));
  connect(line_10.epp_n, node_45.epp) annotation (Line(points={{186.91,-47.04},{180.91,-60.04}}));
  connect(line_11.epp_p, node_1.epp) annotation (Line(points={{-91.09,166.46},{-92.09,149.96}}));
  connect(line_11.epp_n, node_64.epp) annotation (Line(points={{-86.09,166.46},{-85.09,177.96}}));
  connect(line_12.epp_p, node_12.epp) annotation (Line(points={{83.91,-197.54},{75.91,-214.04}}));
  connect(line_12.epp_n, node_49.epp) annotation (Line(points={{88.91,-197.54},{96.91,-186.04}}));
  connect(line_13.epp_p, node_37.epp) annotation (Line(points={{59.41,229.46},{61.91,212.96}}));
  connect(line_13.epp_n, node_14.epp) annotation (Line(points={{64.41,229.46},{61.91,240.96}}));
  connect(line_14.epp_p, node_11.epp) annotation (Line(points={{41.91,-71.54},{61.91,-60.04}}));
  connect(line_14.epp_n, node_63.epp) annotation (Line(points={{46.91,-71.54},{26.91,-88.04}}));
  connect(line_15.epp_p, node_59.epp) annotation (Line(points={{-63.09,327.46},{-120.09,289.96}}));
  connect(line_15.epp_n, node_99.epp) annotation (Line(points={{-58.09,327.46},{-1.09,359.96}}));
  connect(line_16.epp_p, node_70.epp) annotation (Line(points={{-91.09,222.46},{-92.09,205.96}}));
  connect(line_16.epp_n, node_62.epp) annotation (Line(points={{-86.09,222.46},{-85.09,233.96}}));
  connect(line_17.epp_p, node_79.epp) annotation (Line(points={{-150.59,-106.54},{-148.09,-95.04}}));
  connect(line_17.epp_n, node_72.epp) annotation (Line(points={{-145.59,-106.54},{-148.09,-123.04}}));
  connect(line_18.epp_p, node_104.epp) annotation (Line(points={{24.41,-208.04},{26.91,-200.04}}));
  connect(line_18.epp_n, node_54.epp) annotation (Line(points={{29.41,-208.04},{26.91,-221.04}}));
  connect(line_19.epp_p, node_42.epp) annotation (Line(points={{178.41,124.46},{180.91,135.96}}));
  connect(line_19.epp_n, node_8.epp) annotation (Line(points={{183.41,124.46},{180.91,107.96}}));
  connect(line_20.epp_p, node_16.epp) annotation (Line(points={{73.41,-229.04},{75.91,-249.04}}));
  connect(line_20.epp_n, node_12.epp) annotation (Line(points={{78.41,-229.04},{75.91,-214.04}}));
  connect(line_21.epp_p, node_40.epp) annotation (Line(points={{-150.59,-29.54},{-148.09,-46.04}}));
  connect(line_21.epp_n, node_38.epp) annotation (Line(points={{-145.59,-29.54},{-148.09,-18.04}}));
  connect(line_22.epp_p, node_89.epp) annotation (Line(points={{-192.59,-187.04},{-190.09,-207.04}}));
  connect(line_22.epp_n, node_29.epp) annotation (Line(points={{-187.59,-187.04},{-190.09,-172.04}}));
  connect(line_23.epp_p, node_56.epp) annotation (Line(points={{-150.59,-57.54},{-148.09,-74.04}}));
  connect(line_23.epp_n, node_40.epp) annotation (Line(points={{-145.59,-57.54},{-148.09,-46.04}}));
  connect(line_24.epp_p, node_3.epp) annotation (Line(points={{-91.09,85.96},{-92.09,72.96}}));
  connect(line_24.epp_n, node_17.epp) annotation (Line(points={{-86.09,85.96},{-85.09,93.96}}));
  connect(line_25.epp_p, node_63.epp) annotation (Line(points={{24.41,-99.54},{26.91,-88.04}}));
  connect(line_25.epp_n, node_73.epp) annotation (Line(points={{29.41,-99.54},{26.91,-116.04}}));
  connect(line_26.epp_p, node_15.epp) annotation (Line(points={{-133.09,327.46},{-260.09,289.96}}));
  connect(line_26.epp_n, node_99.epp) annotation (Line(points={{-128.09,327.46},{-1.09,359.96}}));
  connect(line_27.epp_p, node_18.epp) annotation (Line(points={{59.41,278.46},{61.91,261.96}}));
  connect(line_27.epp_n, node_75.epp) annotation (Line(points={{64.41,278.46},{61.91,289.96}}));
  connect(line_28.epp_p, node_85.epp) annotation (Line(points={{73.41,-404.04},{75.91,-417.04}}));
  connect(line_28.epp_n, node_22.epp) annotation (Line(points={{78.41,-404.04},{75.91,-396.04}}));
  connect(line_29.epp_p, node_10.epp) annotation (Line(points={{52.41,75.46},{54.91,58.96}}));
  connect(line_29.epp_n, node_24.epp) annotation (Line(points={{57.41,75.46},{54.91,86.96}}));
  connect(line_30.epp_p, node_61.epp) annotation (Line(points={{73.41,-351.54},{75.91,-368.04}}));
  connect(line_30.epp_n, node_32.epp) annotation (Line(points={{78.41,-351.54},{75.91,-340.04}}));
  connect(line_31.epp_p, node_50.epp) annotation (Line(points={{-192.59,-218.54},{-190.09,-235.04}}));
  connect(line_31.epp_n, node_89.epp) annotation (Line(points={{-187.59,-218.54},{-190.09,-207.04}}));
  connect(line_32.epp_p, node_22.epp) annotation (Line(points={{73.41,-379.54},{75.91,-396.04}}));
  connect(line_32.epp_n, node_61.epp) annotation (Line(points={{78.41,-379.54},{75.91,-368.04}}));
  connect(line_33.epp_p, node_58.epp) annotation (Line(points={{181.91,-169.54},{187.91,-158.04}}));
  connect(line_33.epp_n, node_87.epp) annotation (Line(points={{186.91,-169.54},{180.91,-186.04}}));
  connect(line_34.epp_p, node_74.epp) annotation (Line(points={{-178.59,166.46},{-176.09,149.96}}));
  connect(line_34.epp_n, node_77.epp) annotation (Line(points={{-173.59,166.46},{-176.09,177.96}}));
  connect(line_35.epp_p, node_67.epp) annotation (Line(points={{230.91,285.46},{229.91,296.96}}));
  connect(line_35.epp_n, node_96.epp) annotation (Line(points={{235.91,285.46},{236.91,268.96}}));
  connect(line_36.epp_p, node_82.epp) annotation (Line(points={{-192.59,-246.54},{-190.09,-263.04}}));
  connect(line_36.epp_n, node_50.epp) annotation (Line(points={{-187.59,-246.54},{-190.09,-235.04}}));
  connect(line_37.epp_p, node_86.epp) annotation (Line(points={{-154.09,246.96},{-176.09,226.96}}));
  connect(line_37.epp_n, node_88.epp) annotation (Line(points={{-149.09,246.96},{-127.09,261.96}}));
  connect(line_38.epp_p, node_66.epp) annotation (Line(points={{69.91,-295.54},{68.91,-312.04}}));
  connect(line_38.epp_n, node_36.epp) annotation (Line(points={{74.91,-295.54},{75.91,-284.04}}));
  connect(line_39.epp_p, node_99.epp) annotation (Line(points={{87.41,327.46},{-1.09,359.96}}));
  connect(line_39.epp_n, node_23.epp) annotation (Line(points={{92.41,327.46},{180.91,289.96}}));
  connect(line_40.epp_p, node_100.epp) annotation (Line(points={{178.41,26.46},{180.91,37.96}}));
  connect(line_40.epp_n, node_41.epp) annotation (Line(points={{183.41,26.46},{180.91,9.96}}));
  connect(line_41.epp_p, node_88.epp) annotation (Line(points={{-133.09,250.46},{-127.09,261.96}}));
  connect(line_41.epp_n, node_39.epp) annotation (Line(points={{-128.09,250.46},{-134.09,233.96}}));
  connect(line_42.epp_p, node_97.epp) annotation (Line(points={{94.41,-120.54},{96.91,-137.04}}));
  connect(line_42.epp_n, node_21.epp) annotation (Line(points={{99.41,-120.54},{96.91,-109.04}}));
  connect(line_43.epp_p, node_64.epp) annotation (Line(points={{-91.09,194.46},{-85.09,177.96}}));
  connect(line_43.epp_n, node_70.epp) annotation (Line(points={{-86.09,194.46},{-92.09,205.96}}));
  connect(line_44.epp_p, node_80.epp) annotation (Line(points={{-122.59,57.96},{-148.09,37.96}}));
  connect(line_44.epp_n, node_3.epp) annotation (Line(points={{-117.59,57.96},{-92.09,72.96}}));
  connect(line_45.epp_p, node_51.epp) annotation (Line(points={{-38.59,29.96},{-36.09,37.96}}));
  connect(line_45.epp_n, node_9.epp) annotation (Line(points={{-33.59,29.96},{-36.09,16.96}}));
  connect(line_46.epp_p, node_53.epp) annotation (Line(points={{178.41,148.96},{180.91,156.96}}));
  connect(line_46.epp_n, node_42.epp) annotation (Line(points={{183.41,148.96},{180.91,135.96}}));
  connect(line_47.epp_p, node_27.epp) annotation (Line(points={{178.41,257.46},{180.91,268.96}}));
  connect(line_47.epp_n, node_33.epp) annotation (Line(points={{183.41,257.46},{180.91,240.96}}));
  connect(line_48.epp_p, node_24.epp) annotation (Line(points={{52.41,103.46},{54.91,86.96}}));
  connect(line_48.epp_n, node_103.epp) annotation (Line(points={{57.41,103.46},{54.91,114.96}}));
  connect(line_49.epp_p, node_44.epp) annotation (Line(points={{-91.09,141.96},{-85.09,128.96}}));
  connect(line_49.epp_n, node_1.epp) annotation (Line(points={{-86.09,141.96},{-92.09,149.96}}));
  connect(line_50.epp_p, node_60.epp) annotation (Line(points={{59.41,26.46},{61.91,9.96}}));
  connect(line_50.epp_n, node_83.epp) annotation (Line(points={{64.41,26.46},{61.91,37.96}}));
  connect(line_51.epp_p, node_54.epp) annotation (Line(points={{24.41,-232.54},{26.91,-221.04}}));
  connect(line_51.epp_n, node_5.epp) annotation (Line(points={{29.41,-232.54},{26.91,-249.04}}));
  connect(line_52.epp_p, node_103.epp) annotation (Line(points={{52.41,131.46},{54.91,114.96}}));
  connect(line_52.epp_n, node_25.epp) annotation (Line(points={{57.41,131.46},{54.91,142.96}}));
  connect(line_53.epp_p, node_29.epp) annotation (Line(points={{-192.59,-159.04},{-190.09,-172.04}}));
  connect(line_53.epp_n, node_90.epp) annotation (Line(points={{-187.59,-159.04},{-190.09,-151.04}}));
  connect(line_54.epp_p, node_49.epp) annotation (Line(points={{101.41,-197.54},{96.91,-186.04}}));
  connect(line_54.epp_n, node_6.epp) annotation (Line(points={{106.41,-197.54},{110.91,-214.04}}));
  connect(line_55.epp_p, node_26.epp) annotation (Line(points={{181.91,-145.04},{180.91,-137.04}}));
  connect(line_55.epp_n, node_58.epp) annotation (Line(points={{186.91,-145.04},{187.91,-158.04}}));
  connect(line_56.epp_p, node_11.epp) annotation (Line(points={{59.41,-43.54},{61.91,-60.04}}));
  connect(line_56.epp_n, node_46.epp) annotation (Line(points={{64.41,-43.54},{61.91,-32.04}}));
  connect(line_57.epp_p, node_88.epp) annotation (Line(points={{-126.09,278.46},{-127.09,261.96}}));
  connect(line_57.epp_n, node_59.epp) annotation (Line(points={{-121.09,278.46},{-120.09,289.96}}));
  connect(line_58.epp_p, node_101.epp) annotation (Line(points={{24.41,-285.04},{26.91,-277.04}}));
  connect(line_58.epp_n, node_91.epp) annotation (Line(points={{29.41,-285.04},{26.91,-298.04}}));
  connect(line_59.epp_p, node_75.epp) annotation (Line(points={{27.91,327.46},{61.91,289.96}}));
  connect(line_59.epp_n, node_99.epp) annotation (Line(points={{32.91,327.46},{-1.09,359.96}}));
  connect(line_60.epp_p, node_94.epp) annotation (Line(points={{-87.59,-5.04},{-85.09,-25.04}}));
  connect(line_60.epp_n, node_34.epp) annotation (Line(points={{-82.59,-5.04},{-85.09,9.96}}));
  connect(line_61.epp_p, node_21.epp) annotation (Line(points={{94.41,-96.04},{96.91,-109.04}}));
  connect(line_61.epp_n, node_57.epp) annotation (Line(points={{99.41,-96.04},{96.91,-88.04}}));
  connect(line_62.epp_p, node_32.epp) annotation (Line(points={{69.91,-323.54},{75.91,-340.04}}));
  connect(line_62.epp_n, node_66.epp) annotation (Line(points={{74.91,-323.54},{68.91,-312.04}}));
  connect(line_63.epp_p, node_81.epp) annotation (Line(points={{55.91,1.96},{54.91,-11.04}}));
  connect(line_63.epp_n, node_60.epp) annotation (Line(points={{60.91,1.96},{61.91,9.96}}));
  connect(line_64.epp_p, node_31.epp) annotation (Line(points={{24.41,-183.54},{26.91,-172.04}}));
  connect(line_64.epp_n, node_104.epp) annotation (Line(points={{29.41,-183.54},{26.91,-200.04}}));
  connect(line_65.epp_p, node_13.epp) annotation (Line(points={{181.91,-218.54},{180.91,-207.04}}));
  connect(line_65.epp_n, node_35.epp) annotation (Line(points={{186.91,-218.54},{187.91,-235.04}}));
  connect(line_66.epp_p, node_65.epp) annotation (Line(points={{181.91,-22.54},{180.91,-11.04}}));
  connect(line_66.epp_n, node_69.epp) annotation (Line(points={{186.91,-22.54},{187.91,-39.04}}));
  connect(line_67.epp_p, node_28.epp) annotation (Line(points={{178.41,169.96},{180.91,177.96}}));
  connect(line_67.epp_n, node_53.epp) annotation (Line(points={{183.41,169.96},{180.91,156.96}}));
  connect(line_68.epp_p, node_57.epp) annotation (Line(points={{76.91,-71.54},{96.91,-88.04}}));
  connect(line_68.epp_n, node_11.epp) annotation (Line(points={{81.91,-71.54},{61.91,-60.04}}));
  connect(line_69.epp_p, node_76.epp) annotation (Line(points={{-262.59,278.46},{-260.09,261.96}}));
  connect(line_69.epp_n, node_15.epp) annotation (Line(points={{-257.59,278.46},{-260.09,289.96}}));
  connect(line_70.epp_p, node_30.epp) annotation (Line(points={{-150.59,26.46},{-148.09,9.96}}));
  connect(line_70.epp_n, node_80.epp) annotation (Line(points={{-145.59,26.46},{-148.09,37.96}}));
  connect(line_71.epp_p, node_93.epp) annotation (Line(points={{94.41,-145.04},{96.91,-158.04}}));
  connect(line_71.epp_n, node_97.epp) annotation (Line(points={{99.41,-145.04},{96.91,-137.04}}));
  connect(line_72.epp_p, node_98.epp) annotation (Line(points={{-192.59,-302.54},{-190.09,-319.04}}));
  connect(line_72.epp_n, node_43.epp) annotation (Line(points={{-187.59,-302.54},{-190.09,-291.04}}));
  connect(line_73.epp_p, node_73.epp) annotation (Line(points={{24.41,-127.54},{26.91,-116.04}}));
  connect(line_73.epp_n, node_47.epp) annotation (Line(points={{29.41,-127.54},{26.91,-144.04}}));
  connect(line_74.epp_p, node_33.epp) annotation (Line(points={{178.41,229.46},{180.91,240.96}}));
  connect(line_74.epp_n, node_84.epp) annotation (Line(points={{183.41,229.46},{180.91,212.96}}));
  connect(line_75.epp_p, node_46.epp) annotation (Line(points={{55.91,-19.04},{61.91,-32.04}}));
  connect(line_75.epp_n, node_81.epp) annotation (Line(points={{60.91,-19.04},{54.91,-11.04}}));
  connect(line_76.epp_p, node_84.epp) annotation (Line(points={{178.41,197.96},{180.91,212.96}}));
  connect(line_76.epp_n, node_28.epp) annotation (Line(points={{183.41,197.96},{180.91,177.96}}));
  connect(line_77.epp_p, node_4.epp) annotation (Line(points={{178.41,75.46},{180.91,86.96}}));
  connect(line_77.epp_n, node_102.epp) annotation (Line(points={{183.41,75.46},{180.91,58.96}}));
  connect(line_78.epp_p, node_45.epp) annotation (Line(points={{178.41,-71.54},{180.91,-60.04}}));
  connect(line_78.epp_n, node_2.epp) annotation (Line(points={{183.41,-71.54},{180.91,-88.04}}));
  connect(line_79.epp_p, node_102.epp) annotation (Line(points={{178.41,50.96},{180.91,58.96}}));
  connect(line_79.epp_n, node_100.epp) annotation (Line(points={{183.41,50.96},{180.91,37.96}}));
  connect(line_80.epp_p, node_7.epp) annotation (Line(points={{-178.59,218.96},{-176.09,205.96}}));
  connect(line_80.epp_n, node_86.epp) annotation (Line(points={{-173.59,218.96},{-176.09,226.96}}));
  connect(line_81.epp_p, node_41.epp) annotation (Line(points={{178.41,1.96},{180.91,9.96}}));
  connect(line_81.epp_n, node_65.epp) annotation (Line(points={{183.41,1.96},{180.91,-11.04}}));
  connect(line_82.epp_p, node_95.epp) annotation (Line(points={{55.91,176.96},{54.91,163.96}}));
  connect(line_82.epp_n, node_55.epp) annotation (Line(points={{60.91,176.96},{61.91,184.96}}));
  connect(line_83.epp_p, node_77.epp) annotation (Line(points={{-178.59,194.46},{-176.09,177.96}}));
  connect(line_83.epp_n, node_7.epp) annotation (Line(points={{-173.59,194.46},{-176.09,205.96}}));
  connect(line_84.epp_p, node_8.epp) annotation (Line(points={{178.41,99.96},{180.91,107.96}}));
  connect(line_84.epp_n, node_4.epp) annotation (Line(points={{183.41,99.96},{180.91,86.96}}));
  connect(line_85.epp_p, node_2.epp) annotation (Line(points={{178.41,-96.04},{180.91,-88.04}}));
  connect(line_85.epp_n, node_20.epp) annotation (Line(points={{183.41,-96.04},{180.91,-109.04}}));
  connect(line_86.epp_p, node_23.epp) annotation (Line(points={{178.41,281.96},{180.91,289.96}}));
  connect(line_86.epp_n, node_27.epp) annotation (Line(points={{183.41,281.96},{180.91,268.96}}));
  connect(line_87.epp_p, node_90.epp) annotation (Line(points={{-192.59,-134.54},{-190.09,-151.04}}));
  connect(line_87.epp_n, node_92.epp) annotation (Line(points={{-187.59,-134.54},{-190.09,-123.04}}));
  connect(line_88.epp_p, node_47.epp) annotation (Line(points={{24.41,-155.54},{26.91,-144.04}}));
  connect(line_88.epp_n, node_31.epp) annotation (Line(points={{29.41,-155.54},{26.91,-172.04}}));
  connect(line_89.epp_p, node_20.epp) annotation (Line(points={{178.41,-120.54},{180.91,-109.04}}));
  connect(line_89.epp_n, node_26.epp) annotation (Line(points={{183.41,-120.54},{180.91,-137.04}}));
  connect(line_90.epp_p, node_5.epp) annotation (Line(points={{24.41,-260.54},{26.91,-249.04}}));
  connect(line_90.epp_n, node_101.epp) annotation (Line(points={{29.41,-260.54},{26.91,-277.04}}));
  connect(line_91.epp_p, node_68.epp) annotation (Line(points={{-91.09,57.96},{-85.09,37.96}}));
  connect(line_91.epp_n, node_3.epp) annotation (Line(points={{-86.09,57.96},{-92.09,72.96}}));
  connect(line_92.epp_p, node_78.epp) annotation (Line(points={{-126.09,-106.54},{-99.09,-123.04}}));
  connect(line_92.epp_n, node_79.epp) annotation (Line(points={{-121.09,-106.54},{-148.09,-95.04}}));
  connect(line_93.epp_p, node_3.epp) annotation (Line(points={{-66.59,57.96},{-92.09,72.96}}));
  connect(line_93.epp_n, node_51.epp) annotation (Line(points={{-61.59,57.96},{-36.09,37.96}}));
  connect(line_94.epp_p, node_19.epp) annotation (Line(points={{-150.59,-159.04},{-148.09,-151.04}}));
  connect(line_94.epp_n, node_71.epp) annotation (Line(points={{-145.59,-159.04},{-148.09,-172.04}}));
  connect(line_95.epp_p, node_83.epp) annotation (Line(points={{55.91,50.96},{61.91,37.96}}));
  connect(line_95.epp_n, node_10.epp) annotation (Line(points={{60.91,50.96},{54.91,58.96}}));
  connect(line_96.epp_p, node_34.epp) annotation (Line(points={{-87.59,26.46},{-85.09,9.96}}));
  connect(line_96.epp_n, node_68.epp) annotation (Line(points={{-82.59,26.46},{-85.09,37.96}}));
  connect(line_97.epp_p, node_99.epp) annotation (Line(points={{111.91,330.96},{-1.09,359.96}}));
  connect(line_97.epp_n, node_67.epp) annotation (Line(points={{116.91,330.96},{229.91,296.96}}));
  connect(line_98.epp_p, node_87.epp) annotation (Line(points={{178.41,-194.04},{180.91,-186.04}}));
  connect(line_98.epp_n, node_13.epp) annotation (Line(points={{183.41,-194.04},{180.91,-207.04}}));
  connect(line_99.epp_p, node_92.epp) annotation (Line(points={{-171.59,-106.54},{-190.09,-123.04}}));
  connect(line_99.epp_n, node_79.epp) annotation (Line(points={{-166.59,-106.54},{-148.09,-95.04}}));
  connect(line_100.epp_p, node_79.epp) annotation (Line(points={{-150.59,-82.04},{-148.09,-95.04}}));
  connect(line_100.epp_n, node_56.epp) annotation (Line(points={{-145.59,-82.04},{-148.09,-74.04}}));
  connect(line_101.epp_p, node_96.epp) annotation (Line(points={{234.41,257.46},{236.91,268.96}}));
  connect(line_101.epp_n, node_48.epp) annotation (Line(points={{239.41,257.46},{236.91,240.96}}));
  connect(line_102.epp_p, node_62.epp) annotation (Line(points={{-108.59,250.46},{-85.09,233.96}}));
  connect(line_102.epp_n, node_88.epp) annotation (Line(points={{-103.59,250.46},{-127.09,261.96}}));
  connect(line_103.epp_p, node_17.epp) annotation (Line(points={{-87.59,113.96},{-85.09,93.96}}));
  connect(line_103.epp_n, node_44.epp) annotation (Line(points={{-82.59,113.96},{-85.09,128.96}}));
  connect(line_104.epp_p, node_99.epp) annotation (Line(points={{-14.09,327.46},{-1.09,359.96}}));
  connect(line_104.epp_n, node_108.epp) annotation (Line(points={{-9.09,327.46},{-22.09,289.96}}));
  connect(line_105.epp_p, node_76.epp) annotation (Line(points={{-262.59,250.46},{-260.09,261.96}}));
  connect(line_105.epp_n, node_105.epp) annotation (Line(points={{-257.59,250.46},{-260.09,233.96}}));
  connect(line_106.epp_p, node_105.epp) annotation (Line(points={{-262.59,222.46},{-260.09,233.96}}));
  connect(line_106.epp_n, node_106.epp) annotation (Line(points={{-257.59,222.46},{-260.09,205.96}}));
  connect(line_107.epp_p, node_106.epp) annotation (Line(points={{-262.59,194.46},{-260.09,205.96}}));
  connect(line_107.epp_n, node_107.epp) annotation (Line(points={{-257.59,194.46},{-260.09,177.96}}));
  connect(line_108.epp_p, node_107.epp) annotation (Line(points={{-262.59,162.96},{-260.09,177.96}}));
  connect(line_108.epp_n, node_109.epp) annotation (Line(points={{-257.59,162.96},{-260.09,142.96}}));
  connect(line_109.epp_p, node_109.epp) annotation (Line(points={{-262.59,134.96},{-260.09,142.96}}));
  connect(line_109.epp_n, node_110.epp) annotation (Line(points={{-257.59,134.96},{-260.09,121.96}}));

  // ---- Connect households to nodes ---------------------------------------------------------

  connect(node_14.epp, household_1.epp) annotation (Line(points={{61.91,240.96},{86.91,240.96}}));
  connect(node_50.epp, household_2.epp) annotation (Line(points={{-190.09,-235.04},{-165.09,-235.04}}));
  connect(node_54.epp, household_3.epp) annotation (Line(points={{26.91,-221.04},{51.91,-221.04}}));
  connect(node_70.epp, household_4.epp) annotation (Line(points={{-92.09,205.96},{-67.09,205.96}}));
  connect(node_15.epp, household_5.epp) annotation (Line(points={{-260.09,289.96},{-235.09,289.96}}));
  connect(node_57.epp, household_6.epp) annotation (Line(points={{96.91,-88.04},{121.91,-88.04}}));
  connect(node_12.epp, household_7.epp) annotation (Line(points={{75.91,-214.04},{100.91,-214.04}}));
  connect(node_8.epp, household_8.epp) annotation (Line(points={{180.91,107.96},{205.91,107.96}}));
  connect(node_27.epp, household_9.epp) annotation (Line(points={{180.91,268.96},{205.91,268.96}}));
  connect(node_55.epp, household_10.epp) annotation (Line(points={{61.91,184.96},{86.91,184.96}}));
  connect(node_35.epp, household_11.epp) annotation (Line(points={{187.91,-235.04},{212.91,-235.04}}));
  connect(node_41.epp, household_12.epp) annotation (Line(points={{180.91,9.96},{205.91,9.96}}));
  connect(node_93.epp, household_13.epp) annotation (Line(points={{96.91,-158.04},{121.91,-158.04}}));
  connect(node_4.epp, household_14.epp) annotation (Line(points={{180.91,86.96},{205.91,86.96}}));
  connect(node_24.epp, household_15.epp) annotation (Line(points={{54.91,86.96},{79.91,86.96}}));
  connect(node_25.epp, household_16.epp) annotation (Line(points={{54.91,142.96},{79.91,142.96}}));
  connect(node_37.epp, household_17.epp) annotation (Line(points={{61.91,212.96},{86.91,212.96}}));
  connect(node_9.epp, household_18.epp) annotation (Line(points={{-36.09,16.96},{-11.09,16.96}}));
  connect(node_28.epp, household_19.epp) annotation (Line(points={{180.91,177.96},{205.91,177.96}}));
  connect(node_96.epp, household_20.epp) annotation (Line(points={{236.91,268.96},{261.91,268.96}}));
  connect(node_59.epp, household_21.epp) annotation (Line(points={{-120.09,289.96},{-95.09,289.96}}));
  connect(node_87.epp, household_22.epp) annotation (Line(points={{180.91,-186.04},{205.91,-186.04}}));
  connect(node_67.epp, household_23.epp) annotation (Line(points={{229.91,296.96},{254.91,296.96}}));
  connect(node_68.epp, household_24.epp) annotation (Line(points={{-85.09,37.96},{-60.09,37.96}}));
  connect(node_7.epp, household_25.epp) annotation (Line(points={{-176.09,205.96},{-151.09,205.96}}));
  connect(node_39.epp, household_26.epp) annotation (Line(points={{-134.09,233.96},{-109.09,233.96}}));
  connect(node_1.epp, household_27.epp) annotation (Line(points={{-92.09,149.96},{-67.09,149.96}}));
  connect(node_95.epp, household_28.epp) annotation (Line(points={{54.91,163.96},{79.91,163.96}}));
  connect(node_64.epp, household_29.epp) annotation (Line(points={{-85.09,177.96},{-60.09,177.96}}));
  connect(node_47.epp, household_30.epp) annotation (Line(points={{26.91,-144.04},{51.91,-144.04}}));
  connect(node_44.epp, household_31.epp) annotation (Line(points={{-85.09,128.96},{-60.09,128.96}}));
  connect(node_86.epp, household_32.epp) annotation (Line(points={{-176.09,226.96},{-151.09,226.96}}));
  connect(node_17.epp, household_33.epp) annotation (Line(points={{-85.09,93.96},{-60.09,93.96}}));
  connect(node_43.epp, household_34.epp) annotation (Line(points={{-190.09,-291.04},{-165.09,-291.04}}));
  connect(node_6.epp, household_35.epp) annotation (Line(points={{110.91,-214.04},{135.91,-214.04}}));
  connect(node_91.epp, household_36.epp) annotation (Line(points={{26.91,-298.04},{51.91,-298.04}}));
  connect(node_62.epp, household_37.epp) annotation (Line(points={{-85.09,233.96},{-60.09,233.96}}));
  connect(node_75.epp, household_38.epp) annotation (Line(points={{61.91,289.96},{86.91,289.96}}));
  connect(node_104.epp, household_39.epp) annotation (Line(points={{26.91,-200.04},{51.91,-200.04}}));
  connect(node_31.epp, household_40.epp) annotation (Line(points={{26.91,-172.04},{51.91,-172.04}}));
  connect(node_72.epp, household_41.epp) annotation (Line(points={{-148.09,-123.04},{-123.09,-123.04}}));
  connect(node_77.epp, household_42.epp) annotation (Line(points={{-176.09,177.96},{-151.09,177.96}}));
  connect(node_81.epp, household_43.epp) annotation (Line(points={{54.91,-11.04},{79.91,-11.04}}));
  connect(node_23.epp, household_44.epp) annotation (Line(points={{180.91,289.96},{205.91,289.96}}));
  connect(node_102.epp, household_45.epp) annotation (Line(points={{180.91,58.96},{205.91,58.96}}));
  connect(node_52.epp, household_46.epp) annotation (Line(points={{75.91,-445.04},{100.91,-445.04}}));
  connect(node_63.epp, household_47.epp) annotation (Line(points={{26.91,-88.04},{51.91,-88.04}}));
  connect(node_36.epp, household_48.epp) annotation (Line(points={{75.91,-284.04},{100.91,-284.04}}));
  connect(node_30.epp, household_49.epp) annotation (Line(points={{-148.09,9.96},{-123.09,9.96}}));
  connect(node_18.epp, household_50.epp) annotation (Line(points={{61.91,261.96},{86.91,261.96}}));
  connect(node_10.epp, household_51.epp) annotation (Line(points={{54.91,58.96},{79.91,58.96}}));
  connect(node_40.epp, household_52.epp) annotation (Line(points={{-148.09,-46.04},{-123.09,-46.04}}));
  connect(node_89.epp, household_53.epp) annotation (Line(points={{-190.09,-207.04},{-165.09,-207.04}}));
  connect(node_33.epp, household_54.epp) annotation (Line(points={{180.91,240.96},{205.91,240.96}}));
  connect(node_84.epp, household_55.epp) annotation (Line(points={{180.91,212.96},{205.91,212.96}}));
  connect(node_29.epp, household_56.epp) annotation (Line(points={{-190.09,-172.04},{-165.09,-172.04}}));
  connect(node_97.epp, household_57.epp) annotation (Line(points={{96.91,-137.04},{121.91,-137.04}}));
  connect(node_85.epp, household_58.epp) annotation (Line(points={{75.91,-417.04},{100.91,-417.04}}));
  connect(node_51.epp, household_59.epp) annotation (Line(points={{-36.09,37.96},{-11.09,37.96}}));
  connect(node_83.epp, household_60.epp) annotation (Line(points={{61.91,37.96},{86.91,37.96}}));
  connect(node_76.epp, household_61.epp) annotation (Line(points={{-260.09,261.96},{-235.09,261.96}}));
  connect(node_92.epp, household_62.epp) annotation (Line(points={{-190.09,-123.04},{-165.09,-123.04}}));
  connect(node_94.epp, household_63.epp) annotation (Line(points={{-85.09,-25.04},{-60.09,-25.04}}));
  connect(node_38.epp, household_64.epp) annotation (Line(points={{-148.09,-18.04},{-123.09,-18.04}}));
  connect(node_100.epp, household_65.epp) annotation (Line(points={{180.91,37.96},{205.91,37.96}}));
  connect(node_90.epp, household_66.epp) annotation (Line(points={{-190.09,-151.04},{-165.09,-151.04}}));
  connect(node_73.epp, household_67.epp) annotation (Line(points={{26.91,-116.04},{51.91,-116.04}}));
  connect(node_74.epp, household_68.epp) annotation (Line(points={{-176.09,149.96},{-151.09,149.96}}));
  connect(node_66.epp, household_69.epp) annotation (Line(points={{68.91,-312.04},{93.91,-312.04}}));
  connect(node_69.epp, household_70.epp) annotation (Line(points={{187.91,-39.04},{212.91,-39.04}}));
  connect(node_13.epp, household_71.epp) annotation (Line(points={{180.91,-207.04},{205.91,-207.04}}));
  connect(node_32.epp, household_72.epp) annotation (Line(points={{75.91,-340.04},{100.91,-340.04}}));
  connect(node_82.epp, household_73.epp) annotation (Line(points={{-190.09,-263.04},{-165.09,-263.04}}));
  connect(node_5.epp, household_74.epp) annotation (Line(points={{26.91,-249.04},{51.91,-249.04}}));
  connect(node_46.epp, household_75.epp) annotation (Line(points={{61.91,-32.04},{86.91,-32.04}}));
  connect(node_61.epp, household_76.epp) annotation (Line(points={{75.91,-368.04},{100.91,-368.04}}));
  connect(node_80.epp, household_77.epp) annotation (Line(points={{-148.09,37.96},{-123.09,37.96}}));
  connect(node_48.epp, household_78.epp) annotation (Line(points={{236.91,240.96},{261.91,240.96}}));
  connect(node_16.epp, household_79.epp) annotation (Line(points={{75.91,-249.04},{100.91,-249.04}}));
  connect(node_60.epp, household_80.epp) annotation (Line(points={{61.91,9.96},{86.91,9.96}}));
  connect(node_98.epp, household_81.epp) annotation (Line(points={{-190.09,-319.04},{-165.09,-319.04}}));
  connect(node_103.epp, household_82.epp) annotation (Line(points={{54.91,114.96},{79.91,114.96}}));
  connect(node_101.epp, household_83.epp) annotation (Line(points={{26.91,-277.04},{51.91,-277.04}}));
  connect(node_19.epp, household_84.epp) annotation (Line(points={{-148.09,-151.04},{-123.09,-151.04}}));
  connect(node_2.epp, household_85.epp) annotation (Line(points={{180.91,-88.04},{205.91,-88.04}}));
  connect(node_21.epp, household_86.epp) annotation (Line(points={{96.91,-109.04},{121.91,-109.04}}));
  connect(node_26.epp, household_87.epp) annotation (Line(points={{180.91,-137.04},{205.91,-137.04}}));
  connect(node_22.epp, household_88.epp) annotation (Line(points={{75.91,-396.04},{100.91,-396.04}}));
  connect(node_20.epp, household_89.epp) annotation (Line(points={{180.91,-109.04},{205.91,-109.04}}));
  connect(node_45.epp, household_90.epp) annotation (Line(points={{180.91,-60.04},{205.91,-60.04}}));
  connect(node_42.epp, household_91.epp) annotation (Line(points={{180.91,135.96},{205.91,135.96}}));
  connect(node_78.epp, household_92.epp) annotation (Line(points={{-99.09,-123.04},{-74.09,-123.04}}));
  connect(node_34.epp, household_93.epp) annotation (Line(points={{-85.09,9.96},{-60.09,9.96}}));
  connect(node_65.epp, household_94.epp) annotation (Line(points={{180.91,-11.04},{205.91,-11.04}}));
  connect(node_71.epp, household_95.epp) annotation (Line(points={{-148.09,-172.04},{-123.09,-172.04}}));
  connect(node_58.epp, household_96.epp) annotation (Line(points={{187.91,-158.04},{212.91,-158.04}}));
  connect(node_56.epp, household_97.epp) annotation (Line(points={{-148.09,-74.04},{-123.09,-74.04}}));
  connect(node_53.epp, household_98.epp) annotation (Line(points={{180.91,156.96},{205.91,156.96}}));
  connect(node_108.epp, household_99.epp) annotation (Line(points={{-22.09,289.96},{2.91,289.96}}));
  connect(node_105.epp, household_100.epp) annotation (Line(points={{-260.09,233.96},{-235.09,233.96}}));
  connect(node_106.epp, household_101.epp) annotation (Line(points={{-260.09,205.96},{-235.09,205.96}}));
  connect(node_107.epp, household_102.epp) annotation (Line(points={{-260.09,177.96},{-235.09,177.96}}));
  connect(node_109.epp, household_103.epp) annotation (Line(points={{-260.09,142.96},{-235.09,142.96}}));
  connect(node_110.epp, household_104.epp) annotation (Line(points={{-260.09,121.96},{-235.09,121.96}}));

  // ---- Connect transformer to node ---------------------------------------------------------

  connect(epp, epp) annotation (Line(
      points={{0,108},{0,108}},
      color={0,127,0},
      thickness=0.5));
  connect(simpleTransformerComplex.epp_p, epp) annotation (Line(
      points={{-84,386},{-92,386},{-92,308},{-32,308},{-32,108},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_a, simpleTransformerComplex.epp_n) annotation (Line(
      points={{-11.2,386},{-64,386}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_b, node_99.epp) annotation (Line(
      points={{7.2,386},{-1.09,386},{-1.09,359.96}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.controlBus, controlBus.GridMeter) annotation();
   annotation(
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={Rectangle(
          extent={{-300,60},{-180,-20}},
          lineColor={102,44,145},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-298,60},{-182,-16}},
          textColor={102,44,145},
          horizontalAlignment=TextAlignment.Left,
          textString="Scenario: LV-semiurb-5
Topology: SimBench 1-LV-semiurb5--0-sw
Degree of urbanisation: Semi-urban
Technology Mix: Future
Number of Prosumers: 104
Number of PV: 81
Number of BES: 66
Number of EHP: 84
Number of BEV: 135")}),
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
          textString="%LV_semiurb_5_A")}));
end LV_semiurb_5_Future;
