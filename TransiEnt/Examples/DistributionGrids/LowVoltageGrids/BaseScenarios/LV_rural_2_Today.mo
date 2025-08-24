within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_TIA;
model LV_rural_2_T "This model was automatically generated"
  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String condition_scenario="originalesSzenario";

  parameter String data_local="modelica://Scenarios_CyEntEE/LocalData/" + "LV_rural_2/" + condition_scenario + "/" "Directory containing simulation data";

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Limit_P "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

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

  TransiEnt.Components.Electrical.Grid.Base.Node node_1(v_n=400) annotation (Placement(transformation(extent={{124.92,-67.04},{129.92,-62.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_2(v_n=400) annotation (Placement(transformation(extent={{145.92,-655.04},{150.92,-650.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_3(v_n=400) annotation (Placement(transformation(extent={{-85.08,2.96},{-80.08,7.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_4(v_n=400) annotation (Placement(transformation(extent={{117.92,-4.04},{122.92,0.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_5(v_n=400) annotation (Placement(transformation(extent={{-85.08,177.96},{-80.08,182.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_6(v_n=400) annotation (Placement(transformation(extent={{117.92,58.96},{122.92,63.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_7(v_n=400) annotation (Placement(transformation(extent={{117.92,254.96},{122.92,259.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_8(v_n=400) annotation (Placement(transformation(extent={{-85.08,142.96},{-80.08,147.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_9(v_n=400) annotation (Placement(transformation(extent={{-211.08,-18.04},{-206.08,-13.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_10(v_n=400) annotation (Placement(transformation(extent={{-211.08,107.96},{-206.08,112.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_11(v_n=400) annotation (Placement(transformation(extent={{117.92,-193.04},{122.92,-188.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_12(v_n=400) annotation (Placement(transformation(extent={{124.92,23.96},{129.92,28.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_13(v_n=400) annotation (Placement(transformation(extent={{-176.08,422.96},{-171.08,427.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_14(v_n=400) annotation (Placement(transformation(extent={{124.92,-312.04},{129.92,-307.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_15(v_n=400) annotation (Placement(transformation(extent={{12.92,-25.04},{17.92,-20.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_16(v_n=400) annotation (Placement(transformation(extent={{-155.08,107.96},{-150.08,112.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_17(v_n=400) annotation (Placement(transformation(extent={{-85.08,212.96},{-80.08,217.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_18(v_n=400) annotation (Placement(transformation(extent={{117.92,86.96},{122.92,91.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_19(v_n=400) annotation (Placement(transformation(extent={{-176.08,247.96},{-171.08,252.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_20(v_n=400) annotation (Placement(transformation(extent={{12.92,219.96},{17.92,224.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_21(v_n=400) annotation (Placement(transformation(extent={{117.92,-347.04},{122.92,-342.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_22(v_n=400) annotation (Placement(transformation(extent={{-85.08,72.96},{-80.08,77.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_23(v_n=400) annotation (Placement(transformation(extent={{-183.08,177.96},{-178.08,182.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_24(v_n=400) annotation (Placement(transformation(extent={{-85.08,37.96},{-80.08,42.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_25(v_n=400) annotation (Placement(transformation(extent={{145.92,-571.04},{150.92,-566.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_26(v_n=400) annotation (Placement(transformation(extent={{-211.08,44.96},{-206.08,49.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_27(v_n=400) annotation (Placement(transformation(extent={{19.92,-88.04},{24.92,-83.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_28(v_n=400) annotation (Placement(transformation(extent={{117.92,-39.04},{122.92,-34.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_29(v_n=400) annotation (Placement(transformation(extent={{117.92,-130.04},{122.92,-125.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_30(v_n=400) annotation (Placement(transformation(extent={{117.92,-375.04},{122.92,-370.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_31(v_n=400) annotation (Placement(transformation(extent={{117.92,-403.04},{122.92,-398.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_32(v_n=400) annotation (Placement(transformation(extent={{-85.08,-25.04},{-80.08,-20.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_33(v_n=400) annotation (Placement(transformation(extent={{-155.08,142.96},{-150.08,147.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_34(v_n=400) annotation (Placement(transformation(extent={{124.92,-221.04},{129.92,-216.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_35(v_n=400) annotation (Placement(transformation(extent={{-85.08,422.96},{-80.08,427.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_36(v_n=400) annotation (Placement(transformation(extent={{117.92,219.96},{122.92,224.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_37(v_n=400) annotation (Placement(transformation(extent={{117.92,184.96},{122.92,189.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_38(v_n=400) annotation (Placement(transformation(extent={{19.92,254.96},{24.92,259.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_39(v_n=400) annotation (Placement(transformation(extent={{12.92,72.96},{17.92,77.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_40(v_n=400) annotation (Placement(transformation(extent={{89.92,-599.04},{94.92,-594.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_41(v_n=400) annotation (Placement(transformation(extent={{12.92,289.96},{17.92,294.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_42(v_n=400) annotation (Placement(transformation(extent={{124.92,156.96},{129.92,161.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_43(v_n=400) annotation (Placement(transformation(extent={{145.92,-487.04},{150.92,-482.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_44(v_n=400) annotation (Placement(transformation(extent={{117.92,-249.04},{122.92,-244.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_45(v_n=400) annotation (Placement(transformation(extent={{-85.08,317.96},{-80.08,322.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_46(v_n=400) annotation (Placement(transformation(extent={{12.92,184.96},{17.92,189.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_47(v_n=400) annotation (Placement(transformation(extent={{-85.08,282.96},{-80.08,287.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_48(v_n=400) annotation (Placement(transformation(extent={{96.92,-578.04},{101.92,-573.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_49(v_n=400) annotation (Placement(transformation(extent={{-176.08,282.96},{-171.08,287.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_50(v_n=400) annotation (Placement(transformation(extent={{-78.08,352.96},{-73.08,357.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_51(v_n=400) annotation (Placement(transformation(extent={{-204.08,-137.04},{-199.08,-132.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_52(v_n=400) annotation (Placement(transformation(extent={{-85.08,247.96},{-80.08,252.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_53(v_n=400) annotation (Placement(transformation(extent={{117.92,394.96},{122.92,399.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_54(v_n=400) annotation (Placement(transformation(extent={{-169.08,352.96},{-164.08,357.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_55(v_n=400) annotation (Placement(transformation(extent={{96.92,-627.04},{101.92,-622.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_56(v_n=400) annotation (Placement(transformation(extent={{96.92,-487.04},{101.92,-482.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_57(v_n=400) annotation (Placement(transformation(extent={{12.92,394.96},{17.92,399.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_58(v_n=400) annotation (Placement(transformation(extent={{12.92,352.96},{17.92,357.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_59(v_n=400) annotation (Placement(transformation(extent={{-211.08,-172.04},{-206.08,-167.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_60(v_n=400) annotation (Placement(transformation(extent={{89.92,-515.04},{94.92,-510.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_61(v_n=400) annotation (Placement(transformation(extent={{117.92,121.96},{122.92,126.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_62(v_n=400) annotation (Placement(transformation(extent={{117.92,359.96},{122.92,364.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_63(v_n=400) annotation (Placement(transformation(extent={{-29.08,464.96},{-24.08,469.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_64(v_n=400) annotation (Placement(transformation(extent={{145.92,-599.04},{150.92,-594.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_65(v_n=400) annotation (Placement(transformation(extent={{-211.08,-74.04},{-206.08,-69.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_66(v_n=400) annotation (Placement(transformation(extent={{145.92,-676.04},{150.92,-671.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_67(v_n=400) annotation (Placement(transformation(extent={{117.92,324.96},{122.92,329.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_68(v_n=400) annotation (Placement(transformation(extent={{145.92,-515.04},{150.92,-510.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_69(v_n=400) annotation (Placement(transformation(extent={{-169.08,212.96},{-164.08,217.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_70(v_n=400) annotation (Placement(transformation(extent={{-155.08,72.96},{-150.08,77.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_71(v_n=400) annotation (Placement(transformation(extent={{117.92,-284.04},{122.92,-279.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_72(v_n=400) annotation (Placement(transformation(extent={{117.92,-158.04},{122.92,-153.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_73(v_n=400) annotation (Placement(transformation(extent={{-211.08,72.96},{-206.08,77.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_74(v_n=400) annotation (Placement(transformation(extent={{117.92,429.96},{122.92,434.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_75(v_n=400) annotation (Placement(transformation(extent={{-211.08,142.96},{-206.08,147.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_76(v_n=400) annotation (Placement(transformation(extent={{117.92,-459.04},{122.92,-454.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_77(v_n=400) annotation (Placement(transformation(extent={{-211.08,-109.04},{-206.08,-104.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_78(v_n=400) annotation (Placement(transformation(extent={{12.92,317.96},{17.92,322.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_79(v_n=400) annotation (Placement(transformation(extent={{-176.08,317.96},{-171.08,322.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_80(v_n=400) annotation (Placement(transformation(extent={{152.92,-550.04},{157.92,-545.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_81(v_n=400) annotation (Placement(transformation(extent={{117.92,-438.04},{122.92,-433.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_82(v_n=400) annotation (Placement(transformation(extent={{12.92,149.96},{17.92,154.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_83(v_n=400) annotation (Placement(transformation(extent={{124.92,-102.04},{129.92,-97.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_84(v_n=400) annotation (Placement(transformation(extent={{145.92,-627.04},{150.92,-622.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_85(v_n=400) annotation (Placement(transformation(extent={{-211.08,16.96},{-206.08,21.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_86(v_n=400) annotation (Placement(transformation(extent={{96.92,-550.04},{101.92,-545.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_87(v_n=400) annotation (Placement(transformation(extent={{-211.08,-46.04},{-206.08,-41.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_88(v_n=400) annotation (Placement(transformation(extent={{-85.08,394.96},{-80.08,399.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_89(v_n=400) annotation (Placement(transformation(extent={{12.92,9.96},{17.92,14.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_90(v_n=400) annotation (Placement(transformation(extent={{-176.08,387.96},{-171.08,392.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_91(v_n=400) annotation (Placement(transformation(extent={{12.92,429.96},{17.92,434.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_92(v_n=400) annotation (Placement(transformation(extent={{12.92,-53.04},{17.92,-48.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_93(v_n=400) annotation (Placement(transformation(extent={{117.92,289.96},{122.92,294.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_94(v_n=400) annotation (Placement(transformation(extent={{12.92,44.96},{17.92,49.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_95(v_n=400) annotation (Placement(transformation(extent={{-85.08,107.96},{-80.08,112.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Base.Node node_96(v_n=400) annotation (Placement(transformation(extent={{12.92,114.96},{17.92,119.96}})));

  // Basic Parameters

  // ---- Lines (between nodes) ---------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Line_new line_1(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.262000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,125.46},{-80.08,130.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_2(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=17.910000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-176.08,265.46},{-171.08,270.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_3(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=29.952000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,-420.54},{122.92,-415.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_4(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.237000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,-329.54},{126.42,-324.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_5(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.715000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,160.46},{-80.08,165.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_6(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.057000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{145.92,-501.04},{150.92,-496.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_7(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,139.46},{126.42,144.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_8(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.377000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,-298.04},{126.42,-293.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_9(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=26.059000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{145.92,-641.04},{150.92,-636.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_10(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=18.539000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,-361.04},{122.92,-356.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_11(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=16.837000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,-116.04},{126.42,-111.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_12(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=17.818000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{145.92,-585.04},{150.92,-580.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_13(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.367000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-211.08,-32.04},{-206.08,-27.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_14(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.453000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{93.42,-613.04},{98.42,-608.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_15(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.881000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,412.46},{17.92,417.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_16(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.509000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{44.42,447.46},{49.42,452.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_17(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=32.814000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{107.42,-473.04},{112.42,-468.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_18(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.581000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-211.08,-60.04},{-206.08,-55.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_19(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=24.323000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-197.08,160.46},{-192.08,165.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_20(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.251000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,9.96},{126.42,14.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_21(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=17.728000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-172.58,230.46},{-167.58,235.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_22(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.038000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{16.42,272.46},{21.42,277.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_23(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.751000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,-389.04},{122.92,-384.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_24(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=16.608000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,300.46},{-80.08,305.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_25(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=16.102000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,265.46},{-80.08,270.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_26(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=26.048000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,373.96},{17.92,378.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_27(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=41.570000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-207.58,-154.54},{-202.58,-149.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_28(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.169000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{16.42,-70.54},{21.42,-65.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_29(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.839000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,170.96},{126.42,175.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_30(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.210000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,-11.04},{-80.08,-6.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_31(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.011000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,202.46},{122.92,207.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_32(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.414000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-176.08,300.46},{-171.08,305.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_33(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.774000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,-53.04},{126.42,-48.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_34(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=23.362000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{145.92,-613.04},{150.92,-608.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_35(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=24.416000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,307.46},{122.92,312.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_36(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=27.891000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,20.46},{-80.08,25.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_37(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=29.198000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-172.58,335.46},{-167.58,340.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_38(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.558000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-211.08,-91.54},{-206.08,-86.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_39(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=18.172000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,55.46},{-80.08,60.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_40(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.689000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,377.46},{122.92,382.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_41(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.730000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{149.42,-532.54},{154.42,-527.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_42(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.275000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-8.08,447.46},{-3.08,452.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_43(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.667000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{16.42,237.46},{21.42,242.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_44(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.011000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,195.46},{-80.08,200.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_45(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.171000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,58.96},{17.92,63.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_46(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.097000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,-235.04},{126.42,-230.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_47(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.835000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,167.46},{17.92,172.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_48(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.852000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,335.46},{17.92,340.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_49(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.224000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-169.08,160.46},{-164.08,165.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_50(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.522000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,202.46},{17.92,207.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_51(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=23.385000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,27.46},{17.92,32.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_52(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.145000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,237.46},{122.92,242.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_53(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.381000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,-207.04},{126.42,-202.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_54(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.931000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-211.08,125.46},{-206.08,130.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_55(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.937000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-211.08,-0.54},{-206.08,4.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_56(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=22.078000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,412.46},{122.92,417.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_57(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.950000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-155.08,125.46},{-150.08,130.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_58(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=18.923000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,72.96},{122.92,77.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_59(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.804000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,-266.54},{122.92,-261.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_60(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=27.478000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{145.92,-665.54},{150.92,-660.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_61(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.935000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{93.42,-501.04},{98.42,-496.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_62(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.300000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-207.58,-123.04},{-202.58,-118.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_63(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.972000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{96.92,-564.04},{101.92,-559.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_64(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.089000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,408.96},{-80.08,413.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_65(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=25.453000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,90.46},{-80.08,95.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_66(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=25.518000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,303.96},{17.92,308.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_67(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=5.173000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{121.42,41.46},{126.42,46.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_68(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=22.055000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{124.92,-84.54},{129.92,-79.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_69(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.594000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,-7.54},{17.92,-2.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_70(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.501000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,-39.04},{17.92,-34.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_71(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=28.142000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{149.42,-560.54},{154.42,-555.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_72(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=20.065000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-176.08,195.46},{-171.08,200.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_73(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.134000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,-144.04},{122.92,-139.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_74(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=17.123000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-176.08,405.46},{-171.08,410.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_75(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=21.857000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{93.42,-532.54},{98.42,-527.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_76(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.093000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-81.58,373.96},{-76.58,378.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_77(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=17.136000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-211.08,58.96},{-206.08,63.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_78(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.689000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-155.08,90.46},{-150.08,95.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_79(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=28.766000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,-448.54},{122.92,-443.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_80(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=22.026000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,93.96},{17.92,98.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_81(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=19.882000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,104.46},{122.92,109.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_82(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=24.169000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,-175.54},{122.92,-170.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_83(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.080000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-172.58,370.46},{-167.58,375.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_84(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=17.980000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-85.08,230.46},{-80.08,235.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_85(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=1.632000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,-21.54},{122.92,-16.54}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_86(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=20.789000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,342.46},{122.92,347.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_87(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=3.386000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{117.92,272.46},{122.92,277.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_88(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.426000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{12.92,132.46},{17.92,137.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_89(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=15.068000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-211.08,30.96},{-206.08,35.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_90(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=2.261000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-81.58,335.46},{-76.58,340.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_91(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=17.470000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-211.08,90.46},{-206.08,95.46}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_92(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=49.449000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{131.92,-473.04},{136.92,-468.04}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_93(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=75.000000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-57.08,443.96},{-52.08,448.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_94(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=6.700000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{-102.58,443.96},{-97.58,448.96}})));

  // Basic Parameters

  TransiEnt.Components.Electrical.Grid.Line_new line_95(
    r=0.0002067,
    x=0.000080425,
    b=2.60752e-07,
    length=32.201000,
    i_n=275,
    parallel=1,
    ) annotation (Placement(transformation(extent={{93.42,-588.54},{98.42,-583.54}})));

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
    loadProfileName="SFH20",
    loadProfileScaleP=3.14477,
    loadProfileScaleQ=3.14477,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_1",
    num_BEVs=0) annotation (Placement(transformation(extent={{-135.08,107.96},{-120.08,122.96}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=6.60008,
    loadProfileScaleQ=6.60008,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_2",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,359.96},{152.92,374.96}})));

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
    loadProfileName="SFH21",
    loadProfileScaleP=7.64479,
    loadProfileScaleQ=7.64479,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_3",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,289.96},{152.92,304.96}})));

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
    loadProfileScaleP=3.38319,
    loadProfileScaleQ=3.38319,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_4",
    num_BEVs=0) annotation (Placement(transformation(extent={{144.92,-67.04},{159.92,-52.04}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=3.19652,
    loadProfileScaleQ=3.19652,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_5",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,114.96},{47.92,129.96}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=1.7741,
    loadProfileScaleQ=1.7741,
    usePV=true,
    PV_peakPower=5252.28,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_6",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,184.96},{152.92,199.96}})));

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
    loadProfileName="SFH10",
    loadProfileScaleP=2.73779,
    loadProfileScaleQ=2.73779,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_7",
    num_BEVs=0) annotation (Placement(transformation(extent={{116.92,-550.04},{131.92,-535.04}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=2.18706,
    loadProfileScaleQ=2.18706,
    usePV=true,
    PV_peakPower=6475.99,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_8",
    Q_HP_nom=5574.43,
    A_living=109.353,
    A_wall=82.7014,
    A_window=21.8706,
    A_roof=109.353,
    A_ground=109.353,
    V_air=273.383,
    U_wall=0.352891,
    U_window=1.51438,
    U_roof=0.242877,
    U_ground=0.414315,
    thermalMass=17623900.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-249.04},{152.92,-234.04}})));

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
    loadProfileName="SFH40",
    loadProfileScaleP=7.10381,
    loadProfileScaleQ=7.10381,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_9",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,254.96},{152.92,269.96}})));

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
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=5.26494,
    loadProfileScaleQ=5.26494,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_10",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-438.04},{152.92,-423.04}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=3.27202,
    loadProfileScaleQ=3.27202,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_11",
    num_BEVs=0) annotation (Placement(transformation(extent={{-149.08,352.96},{-134.08,367.96}})));

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
    loadProfileName="SFH25",
    loadProfileScaleP=3.92714,
    loadProfileScaleQ=3.92714,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_12",
    num_BEVs=0) annotation (Placement(transformation(extent={{-135.08,72.96},{-120.08,87.96}})));

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
    loadProfileName="SFH40",
    loadProfileScaleP=4.2997,
    loadProfileScaleQ=4.2997,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_13",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,219.96},{47.92,234.96}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=3.26084,
    loadProfileScaleQ=3.26084,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_14",
    num_BEVs=0) annotation (Placement(transformation(extent={{144.92,-102.04},{159.92,-87.04}})));

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
    loadProfileName="SFH5",
    loadProfileScaleP=3.42193,
    loadProfileScaleQ=3.42193,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_15",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,142.96},{-50.08,157.96}})));

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
    loadProfileName="SFH39",
    loadProfileScaleP=3.36684,
    loadProfileScaleQ=3.36684,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_16",
    num_BEVs=0) annotation (Placement(transformation(extent={{172.92,-550.04},{187.92,-535.04}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=3.00978,
    loadProfileScaleQ=3.00978,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_17",
    num_BEVs=0) annotation (Placement(transformation(extent={{144.92,-221.04},{159.92,-206.04}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=2.16016,
    loadProfileScaleQ=2.16016,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_18",
    Q_HP_nom=5435.91,
    A_living=108.008,
    A_wall=82.3253,
    A_window=21.6016,
    A_roof=108.008,
    A_ground=108.008,
    V_air=270.02,
    U_wall=0.342486,
    U_window=1.48378,
    U_roof=0.236756,
    U_ground=0.405134,
    thermalMass=17466000.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,317.96},{-50.08,332.96}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=3.35653,
    loadProfileScaleQ=3.35653,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_19",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,107.96},{-50.08,122.96}})));

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
    loadProfileName="SFH36",
    loadProfileScaleP=2.77295,
    loadProfileScaleQ=2.77295,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_20",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,44.96},{-176.08,59.96}})));

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
    loadProfileScaleP=0.986247,
    loadProfileScaleQ=0.986247,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.2,
    tappingProfileName="TappingCycle_T_21",
    num_BEVs=0) annotation (Placement(transformation(extent={{39.92,254.96},{54.92,269.96}})));

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
    loadProfileName="SFH28",
    loadProfileScaleP=2.58955,
    loadProfileScaleQ=2.58955,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_22",
    num_BEVs=0) annotation (Placement(transformation(extent={{164.92,-221.04},{179.92,-206.04}})));

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
    loadProfileName="SFH5",
    loadProfileScaleP=3.63222,
    loadProfileScaleQ=3.63222,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_23",
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=196920000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110())}) annotation (Placement(transformation(extent={{137.92,-39.04},{152.92,-24.04}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=1.89166,
    loadProfileScaleQ=1.89166,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_24",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-347.04},{152.92,-332.04}})));

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
    loadProfileName="SFH32",
    loadProfileScaleP=7.9231,
    loadProfileScaleQ=7.9231,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 1.5,
    tappingProfileName="TappingCycle_T_25",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,324.96},{152.92,339.96}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=2.47282,
    loadProfileScaleQ=2.47282,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_26",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-158.04},{152.92,-143.04}})));

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
    loadProfileName="SFH23",
    loadProfileScaleP=3.94206,
    loadProfileScaleQ=3.94206,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_27",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,422.96},{-50.08,437.96}})));

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
    loadProfileName="SFH18",
    loadProfileScaleP=2.16915,
    loadProfileScaleQ=2.16915,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_28",
    num_BEVs=0) annotation (Placement(transformation(extent={{144.92,156.96},{159.92,171.96}})));

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
    loadProfileName="SFH21",
    loadProfileScaleP=4.68557,
    loadProfileScaleQ=4.68557,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_29",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,-25.04},{47.92,-10.04}})));

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
    loadProfileName="SFH19",
    loadProfileScaleP=2.99742,
    loadProfileScaleQ=2.99742,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_30",
    Q_HP_nom=7650.45,
    A_living=149.871,
    A_wall=92.4476,
    A_window=29.9742,
    A_roof=149.871,
    A_ground=149.871,
    V_air=374.678,
    U_wall=0.384645,
    U_window=1.60778,
    U_roof=0.261556,
    U_ground=0.442334,
    thermalMass=22236400.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,212.96},{-50.08,227.96}})));

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
    loadProfileName="SFH32",
    loadProfileScaleP=2.34022,
    loadProfileScaleQ=2.34022,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_31",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,-53.04},{47.92,-38.04}})));

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
    loadProfileName="SFH12",
    loadProfileScaleP=2.45182,
    loadProfileScaleQ=2.45182,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_32",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,107.96},{-176.08,122.96}})));

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
    loadProfileName="SFH8",
    loadProfileScaleP=1.81885,
    loadProfileScaleQ=1.81885,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_33",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,219.96},{152.92,234.96}})));

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
    loadProfileName="SFH21",
    loadProfileScaleP=2.2096,
    loadProfileScaleQ=2.2096,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_34",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,247.96},{-50.08,262.96}})));

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
    loadProfileName="SFH9",
    loadProfileScaleP=2.08879,
    loadProfileScaleQ=2.08879,
    usePV=true,
    PV_peakPower=6184.98,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_35",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,-74.04},{-176.08,-59.04}})));

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
    loadProfileName="SFH17",
    loadProfileScaleP=3.99736,
    loadProfileScaleQ=3.99736,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_36",
    num_BEVs=0) annotation (Placement(transformation(extent={{144.92,-312.04},{159.92,-297.04}})));

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
    loadProfileName="SFH23",
    loadProfileScaleP=6.15771,
    loadProfileScaleQ=6.15771,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_37",
    num_BEVs=0) annotation (Placement(transformation(extent={{-184.08,-137.04},{-169.08,-122.04}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=2.86393,
    loadProfileScaleQ=2.86393,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_38",
    num_BEVs=0) annotation (Placement(transformation(extent={{-156.08,282.96},{-141.08,297.96}})));

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
    loadProfileName="SFH34",
    loadProfileScaleP=3.00634,
    loadProfileScaleQ=3.00634,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_39",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,-18.04},{-176.08,-3.04}})));

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
    loadProfileName="SFH21",
    loadProfileScaleP=2.11159,
    loadProfileScaleQ=2.11159,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_40",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,352.96},{47.92,367.96}})));

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
    loadProfileName="SFH18",
    loadProfileScaleP=1.73847,
    loadProfileScaleQ=1.73847,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_41",
    num_BEVs=0) annotation (Placement(transformation(extent={{116.92,-487.04},{131.92,-472.04}})));

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
    loadProfileName="SFH10",
    loadProfileScaleP=3.20917,
    loadProfileScaleQ=3.20917,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_42",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-284.04},{152.92,-269.04}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=1.40961,
    loadProfileScaleQ=1.40961,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.2,
    tappingProfileName="TappingCycle_T_43",
    num_BEVs=0) annotation (Placement(transformation(extent={{165.92,-571.04},{180.92,-556.04}})));

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
    loadProfileName="SFH35",
    loadProfileScaleP=4.17539,
    loadProfileScaleQ=4.17539,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_44",
    num_BEVs=0) annotation (Placement(transformation(extent={{116.92,-578.04},{131.92,-563.04}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=2.00792,
    loadProfileScaleQ=2.00792,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_45",
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=2,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=7200.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf())}) annotation (Placement(transformation(extent={{-58.08,352.96},{-43.08,367.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  // BEV Specific Data

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_46(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH28",
    loadProfileScaleP=2.0437,
    loadProfileScaleQ=2.0437,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_46",
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=3,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-191.08,72.96},{-176.08,87.96}})));

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
    loadProfileName="SFH22",
    loadProfileScaleP=2.5736,
    loadProfileScaleQ=2.5736,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_47",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,317.96},{47.92,332.96}})));

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
    usePV=true,
    PV_peakPower=10626.4,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_48",
    num_BEVs=0) annotation (Placement(transformation(extent={{165.92,-599.04},{180.92,-584.04}})));

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
    loadProfileName="SFH22",
    loadProfileScaleP=1.45579,
    loadProfileScaleQ=1.45579,
    usePV=true,
    PV_peakPower=4310.67,
    useBattery=true,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_49",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,-25.04},{-50.08,-10.04}})));

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
    loadProfileName="SFH28",
    loadProfileScaleP=3.09363,
    loadProfileScaleQ=3.09363,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_50",
    Q_HP_nom=6837.81,
    A_living=154.681,
    A_wall=93.4347,
    A_window=30.9363,
    A_roof=154.681,
    A_ground=154.681,
    V_air=386.704,
    U_wall=0.283149,
    U_window=1.30926,
    U_roof=0.201852,
    U_ground=0.352778,
    thermalMass=22768500.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-156.08,317.96},{-141.08,332.96}})));

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
    loadProfileName="SFH9",
    loadProfileScaleP=3.47145,
    loadProfileScaleQ=3.47145,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_51",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,-109.04},{-176.08,-94.04}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=2.45619,
    loadProfileScaleQ=2.45619,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_52",
    num_BEVs=0) annotation (Placement(transformation(extent={{164.92,156.96},{179.92,171.96}})));

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
    loadProfileName="SFH38",
    loadProfileScaleP=2.00734,
    loadProfileScaleQ=2.00734,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_53",
    num_BEVs=0) annotation (Placement(transformation(extent={{164.92,-102.04},{179.92,-87.04}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=2.60968,
    loadProfileScaleQ=2.60968,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_54",
    num_BEVs=0) annotation (Placement(transformation(extent={{39.92,-88.04},{54.92,-73.04}})));

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
    loadProfileName="SFH8",
    loadProfileScaleP=3.90509,
    loadProfileScaleQ=3.90509,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_55",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-375.04},{152.92,-360.04}})));

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
    loadProfileName="SFH4",
    loadProfileScaleP=3.41417,
    loadProfileScaleQ=3.41417,
    usePV=true,
    PV_peakPower=10107.7,
    useBattery=true,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_56",
    num_BEVs=0) annotation (Placement(transformation(extent={{116.92,-627.04},{131.92,-612.04}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_57(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH4",
    loadProfileScaleP=3.23326,
    loadProfileScaleQ=3.23326,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_57",
    num_BEVs=0) annotation (Placement(transformation(extent={{-149.08,212.96},{-134.08,227.96}})));

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
    num_BEVs=0) annotation (Placement(transformation(extent={{109.92,-515.04},{124.92,-500.04}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=1.94558,
    loadProfileScaleQ=1.94558,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_59",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-4.04},{152.92,10.96}})));

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
    loadProfileName="SFH18",
    loadProfileScaleP=2.08137,
    loadProfileScaleQ=2.08137,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_60",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,289.96},{47.92,304.96}})));

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
    loadProfileName="SFH23",
    loadProfileScaleP=2.86377,
    loadProfileScaleQ=2.86377,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_61",
    num_BEVs=0) annotation (Placement(transformation(extent={{109.92,-599.04},{124.92,-584.04}})));

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
    loadProfileName="SFH40",
    loadProfileScaleP=3.02022,
    loadProfileScaleQ=3.02022,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_62",
    Q_HP_nom=7698.73,
    A_living=151.011,
    A_wall=92.6844,
    A_window=30.2022,
    A_roof=151.011,
    A_ground=151.011,
    V_air=377.528,
    U_wall=0.384374,
    U_window=1.60698,
    U_roof=0.261397,
    U_ground=0.442095,
    thermalMass=22362800.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,149.96},{47.92,164.96}})));

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
    loadProfileName="SFH12",
    loadProfileScaleP=2.79343,
    loadProfileScaleQ=2.79343,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_63",
    Q_HP_nom=7066.5,
    A_living=139.671,
    A_wall=90.2484,
    A_window=27.9343,
    A_roof=139.671,
    A_ground=139.671,
    V_air=349.178,
    U_wall=0.371058,
    U_window=1.56782,
    U_roof=0.253563,
    U_ground=0.430345,
    thermalMass=21098600.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,44.96},{47.92,59.96}})));

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
    loadProfileName="SFH20",
    loadProfileScaleP=1.3996,
    loadProfileScaleQ=1.3996,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_64",
    num_BEVs=0) annotation (Placement(transformation(extent={{165.92,-676.04},{180.92,-661.04}})));

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
    loadProfileName="SFH32",
    loadProfileScaleP=2.35145,
    loadProfileScaleQ=2.35145,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_65",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,2.96},{-50.08,17.96}})));

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
    loadProfileName="SFH16",
    loadProfileScaleP=2.99911,
    loadProfileScaleQ=2.99911,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_66",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,86.96},{152.92,101.96}})));

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
    loadProfileName="SFH31",
    loadProfileScaleP=2.3849,
    loadProfileScaleQ=2.3849,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_67",
    num_BEVs=0) annotation (Placement(transformation(extent={{165.92,-627.04},{180.92,-612.04}})));

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
    loadProfileName="SFH25",
    loadProfileScaleP=2.49413,
    loadProfileScaleQ=2.49413,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_68",
    num_BEVs=0) annotation (Placement(transformation(extent={{165.92,-515.04},{180.92,-500.04}})));

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
    loadProfileName="SFH31",
    loadProfileScaleP=1.80909,
    loadProfileScaleQ=1.80909,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_69",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,58.96},{152.92,73.96}})));

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
    loadProfileName="SFH25",
    loadProfileScaleP=2.28871,
    loadProfileScaleQ=2.28871,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_70",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,16.96},{-176.08,31.96}})));

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
    loadProfileName="SFH32",
    loadProfileScaleP=3.56455,
    loadProfileScaleQ=3.56455,
    usePV=true,
    PV_peakPower=10552.9,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_71",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,37.96},{-50.08,52.96}})));

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
    loadProfileName="SFH34",
    loadProfileScaleP=2.32723,
    loadProfileScaleQ=2.32723,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_72",
    num_BEVs=0) annotation (Placement(transformation(extent={{-135.08,142.96},{-120.08,157.96}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=3.7697,
    loadProfileScaleQ=3.7697,
    usePV=true,
    PV_peakPower=11160.3,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_73",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-403.04},{152.92,-388.04}})));

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
    loadProfileName="SFH10",
    loadProfileScaleP=1.64533,
    loadProfileScaleQ=1.64533,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_74",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-193.04},{152.92,-178.04}})));

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
    loadProfileName="SFH19",
    loadProfileScaleP=2.46391,
    loadProfileScaleQ=2.46391,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_75",
    num_BEVs=0) annotation (Placement(transformation(extent={{-45.08,212.96},{-30.08,227.96}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=1.92034,
    loadProfileScaleQ=1.92034,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_76",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,-46.04},{-176.08,-31.04}})));

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
    loadProfileName="SFH11",
    loadProfileScaleP=1.82734,
    loadProfileScaleQ=1.82734,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_77",
    num_BEVs=0) annotation (Placement(transformation(extent={{164.92,-67.04},{179.92,-52.04}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=2.91058,
    loadProfileScaleQ=2.91058,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_78",
    num_BEVs=0) annotation (Placement(transformation(extent={{165.92,-655.04},{180.92,-640.04}})));

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
    loadProfileName="SFH39",
    loadProfileScaleP=3.04422,
    loadProfileScaleQ=3.04422,
    usePV=true,
    PV_peakPower=9012.49,
    useBattery=true,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_79",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,142.96},{-176.08,157.96}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=2.29082,
    loadProfileScaleQ=2.29082,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_80",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,9.96},{47.92,24.96}})));

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
    loadProfileName="SFH20",
    loadProfileScaleP=1.68017,
    loadProfileScaleQ=1.68017,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_81",
    num_BEVs=0) annotation (Placement(transformation(extent={{165.92,-487.04},{180.92,-472.04}})));

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
    loadProfileName="SFH14",
    loadProfileScaleP=2.71315,
    loadProfileScaleQ=2.71315,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_82",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,177.96},{-50.08,192.96}})));

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
    loadProfileName="SFH25",
    loadProfileScaleP=2.49557,
    loadProfileScaleQ=2.49557,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_83",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,-130.04},{152.92,-115.04}})));

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
    loadProfileName="SFH31",
    loadProfileScaleP=2.43188,
    loadProfileScaleQ=2.43188,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_84",
    num_BEVs=0) annotation (Placement(transformation(extent={{136.92,-627.04},{151.92,-612.04}})));

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
    loadProfileName="SFH7",
    loadProfileScaleP=3.00687,
    loadProfileScaleQ=3.00687,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_85",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,121.96},{152.92,136.96}})));

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
    loadProfileName="SFH38",
    loadProfileScaleP=3.21069,
    loadProfileScaleQ=3.21069,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_86",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,394.96},{47.92,409.96}})));

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
    loadProfileName="SFH35",
    loadProfileScaleP=3.78939,
    loadProfileScaleQ=3.78939,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_87",
    num_BEVs=0) annotation (Placement(transformation(extent={{-191.08,-172.04},{-176.08,-157.04}})));

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
    loadProfileName="SFH16",
    loadProfileScaleP=2.17278,
    loadProfileScaleQ=2.17278,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_88",
    num_BEVs=0) annotation (Placement(transformation(extent={{144.92,23.96},{159.92,38.96}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=5.45128,
    loadProfileScaleQ=5.45128,
    usePV=true,
    PV_peakPower=16138.7,
    useBattery=true,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_89",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,429.96},{152.92,444.96}})));

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
    loadProfileName="SFH31",
    loadProfileScaleP=3.72723,
    loadProfileScaleQ=3.72723,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_90",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,184.96},{47.92,199.96}})));

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
    loadProfileName="SFH36",
    loadProfileScaleP=2.99841,
    loadProfileScaleQ=2.99841,
    usePV=true,
    PV_peakPower=8878.47,
    useBattery=true,
    useEHP=true,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_91",
    Q_HP_nom=6654.2,
    A_living=149.921,
    A_wall=92.4579,
    A_window=29.9841,
    A_roof=149.921,
    A_ground=149.921,
    V_air=374.801,
    U_wall=0.283511,
    U_window=1.31033,
    U_roof=0.202065,
    U_ground=0.353098,
    thermalMass=22241900.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,429.96},{47.92,444.96}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=3.81122,
    loadProfileScaleQ=3.81122,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_92",
    num_BEVs=1,
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=4,
        Bat_Capacity=360000000.0,
        Bat_SOCStart=1.0,
        Bat_PowerLimit=11000.0, Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-65.08,72.96},{-50.08,87.96}})));

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
    loadProfileName="SFH34",
    loadProfileScaleP=5.6467,
    loadProfileScaleQ=5.6467,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.95,
    tappingProfileName="TappingCycle_T_93",
    num_BEVs=0) annotation (Placement(transformation(extent={{137.92,394.96},{152.92,409.96}})));

  // Basic Parameters

  // Photovoltaics

  // Battery Electric Storage

  // Electric Heat Pump

  // Battery Electric Vehicle

  TransiEnt.Components.Electrical.Prosumer.Prosumer household_94(
    data_local=data_local,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    data_weatherLocation=weatherLocation,
    data_weatherYear=weatherYear,
    loadProfileName="SFH32",
    loadProfileScaleP=2.75106,
    loadProfileScaleQ=2.75106,
    usePV=true,
    PV_peakPower=8144.59,
    useBattery=true,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_94",
    num_BEVs=0) annotation (Placement(transformation(extent={{32.92,72.96},{47.92,87.96}})));

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
    loadProfileName="SFH27",
    loadProfileScaleP=3.37818,
    loadProfileScaleQ=3.37818,
    usePV=false,
    useBattery=false,
    useEHP=true,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_95",
    Q_HP_nom=8447.77,
    A_living=168.909,
    A_wall=96.1832,
    A_window=33.7818,
    A_roof=168.909,
    A_ground=168.909,
    V_air=422.273,
    U_wall=0.380014,
    U_window=1.59416,
    U_roof=0.258832,
    U_ground=0.438248,
    thermalMass=24326300.0,
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,282.96},{-50.08,297.96}})));

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
    loadProfileName="SFH3",
    loadProfileScaleP=3.55329,
    loadProfileScaleQ=3.55329,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.6,
    tappingProfileName="TappingCycle_T_96",
    num_BEVs=0) annotation (Placement(transformation(extent={{-156.08,247.96},{-141.08,262.96}})));

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
    loadProfileName="SFH30",
    loadProfileScaleP=2.26799,
    loadProfileScaleQ=2.26799,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.5,
    tappingProfileName="TappingCycle_T_97",
    num_BEVs=0) annotation (Placement(transformation(extent={{-156.08,387.96},{-141.08,402.96}})));

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
    loadProfileName="SFH9",
    loadProfileScaleP=4.09294,
    loadProfileScaleQ=4.09294,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.75,
    tappingProfileName="TappingCycle_T_98",
    num_BEVs=0) annotation (Placement(transformation(extent={{-156.08,422.96},{-141.08,437.96}})));

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
    loadProfileName="SFH29",
    loadProfileScaleP=2.3262,
    loadProfileScaleQ=2.3262,
    usePV=false,
    useBattery=false,
    useEHP=false,
    V_BST = 0.3,
    tappingProfileName="TappingCycle_T_99",
    num_BEVs=0) annotation (Placement(transformation(extent={{-65.08,394.96},{-50.08,409.96}})));

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
    U_P=20e3,
    U_S=400,
    epp_p(v(start=20000)),
    epp_n(v(start=400))) annotation (Placement(transformation(extent={{-116,492},{-96,512}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));
  Models_CyEntEE.CellModels.CPP.DecouplingGrids decouplingGrids annotation (Placement(transformation(extent={{-78,492},{-58,512}})));
  Bus.LVGridControlBus controlBus annotation (Placement(transformation(extent={{-110,40},{-90,60}})));
  TransiEnt.Components.Sensors.SmartMeter GridMeter annotation (Placement(transformation(extent={{-40,492},{-20,512}})));
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
  connect(controlBus.line_58, line_58.controlBus) annotation();
  connect(controlBus.line_59, line_59.controlBus) annotation();
  connect(controlBus.line_60, line_60.controlBus) annotation();
  connect(controlBus.line_61, line_61.controlBus) annotation();
  connect(controlBus.line_62, line_62.controlBus) annotation();
  connect(controlBus.line_63, line_63.controlBus) annotation();
  connect(controlBus.line_64, line_64.controlBus) annotation();
  connect(controlBus.line_65, line_65.controlBus) annotation();
  connect(controlBus.line_66, line_66.controlBus) annotation();
  connect(controlBus.line_67, line_67.controlBus) annotation();
  connect(controlBus.line_68, line_68.controlBus) annotation();
  connect(controlBus.line_69, line_69.controlBus) annotation();
  connect(controlBus.line_70, line_70.controlBus) annotation();
  connect(controlBus.line_71, line_71.controlBus) annotation();
  connect(controlBus.line_72, line_72.controlBus) annotation();
  connect(controlBus.line_73, line_73.controlBus) annotation();
  connect(controlBus.line_74, line_74.controlBus) annotation();
  connect(controlBus.line_75, line_75.controlBus) annotation();
  connect(controlBus.line_76, line_76.controlBus) annotation();
  connect(controlBus.line_77, line_77.controlBus) annotation();
  connect(controlBus.line_78, line_78.controlBus) annotation();
  connect(controlBus.line_79, line_79.controlBus) annotation();
  connect(controlBus.line_80, line_80.controlBus) annotation();
  connect(controlBus.line_81, line_81.controlBus) annotation();
  connect(controlBus.line_82, line_82.controlBus) annotation();
  connect(controlBus.line_83, line_83.controlBus) annotation();
  connect(controlBus.line_84, line_84.controlBus) annotation();
  connect(controlBus.line_85, line_85.controlBus) annotation();
  connect(controlBus.line_86, line_86.controlBus) annotation();
  connect(controlBus.line_87, line_87.controlBus) annotation();
  connect(controlBus.line_88, line_88.controlBus) annotation();
  connect(controlBus.line_89, line_89.controlBus) annotation();
  connect(controlBus.line_90, line_90.controlBus) annotation();
  connect(controlBus.line_91, line_91.controlBus) annotation();
  connect(controlBus.line_92, line_92.controlBus) annotation();
  connect(controlBus.line_93, line_93.controlBus) annotation();
  connect(controlBus.line_94, line_94.controlBus) annotation();
  connect(controlBus.line_95, line_95.controlBus) annotation();
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

  // ---- Connect lines -----------------------------------------------------------------------

  connect(line_1.epp_p, node_8.epp) annotation (Line(points={{-85.08,127.96},{-82.58,142.96}}));
  connect(line_1.epp_n, node_95.epp) annotation (Line(points={{-80.08,127.96},{-82.58,107.96}}));
  connect(line_2.epp_p, node_19.epp) annotation (Line(points={{-176.08,267.96},{-173.58,247.96}}));
  connect(line_2.epp_n, node_49.epp) annotation (Line(points={{-171.08,267.96},{-173.58,282.96}}));
  connect(line_3.epp_p, node_81.epp) annotation (Line(points={{117.92,-418.04},{120.42,-438.04}}));
  connect(line_3.epp_n, node_31.epp) annotation (Line(points={{122.92,-418.04},{120.42,-403.04}}));
  connect(line_4.epp_p, node_21.epp) annotation (Line(points={{121.42,-327.04},{120.42,-347.04}}));
  connect(line_4.epp_n, node_14.epp) annotation (Line(points={{126.42,-327.04},{127.42,-312.04}}));
  connect(line_5.epp_p, node_5.epp) annotation (Line(points={{-85.08,162.96},{-82.58,177.96}}));
  connect(line_5.epp_n, node_8.epp) annotation (Line(points={{-80.08,162.96},{-82.58,142.96}}));
  connect(line_6.epp_p, node_43.epp) annotation (Line(points={{145.92,-498.54},{148.42,-487.04}}));
  connect(line_6.epp_n, node_68.epp) annotation (Line(points={{150.92,-498.54},{148.42,-515.04}}));
  connect(line_7.epp_p, node_61.epp) annotation (Line(points={{121.42,141.96},{120.42,121.96}}));
  connect(line_7.epp_n, node_42.epp) annotation (Line(points={{126.42,141.96},{127.42,156.96}}));
  connect(line_8.epp_p, node_14.epp) annotation (Line(points={{121.42,-295.54},{127.42,-312.04}}));
  connect(line_8.epp_n, node_71.epp) annotation (Line(points={{126.42,-295.54},{120.42,-284.04}}));
  connect(line_9.epp_p, node_84.epp) annotation (Line(points={{145.92,-638.54},{148.42,-627.04}}));
  connect(line_9.epp_n, node_2.epp) annotation (Line(points={{150.92,-638.54},{148.42,-655.04}}));
  connect(line_10.epp_p, node_30.epp) annotation (Line(points={{117.92,-358.54},{120.42,-375.04}}));
  connect(line_10.epp_n, node_21.epp) annotation (Line(points={{122.92,-358.54},{120.42,-347.04}}));
  connect(line_11.epp_p, node_29.epp) annotation (Line(points={{121.42,-113.54},{120.42,-130.04}}));
  connect(line_11.epp_n, node_83.epp) annotation (Line(points={{126.42,-113.54},{127.42,-102.04}}));
  connect(line_12.epp_p, node_25.epp) annotation (Line(points={{145.92,-582.54},{148.42,-571.04}}));
  connect(line_12.epp_n, node_64.epp) annotation (Line(points={{150.92,-582.54},{148.42,-599.04}}));
  connect(line_13.epp_p, node_9.epp) annotation (Line(points={{-211.08,-29.54},{-208.58,-18.04}}));
  connect(line_13.epp_n, node_87.epp) annotation (Line(points={{-206.08,-29.54},{-208.58,-46.04}}));
  connect(line_14.epp_p, node_40.epp) annotation (Line(points={{93.42,-610.54},{92.42,-599.04}}));
  connect(line_14.epp_n, node_55.epp) annotation (Line(points={{98.42,-610.54},{99.42,-627.04}}));
  connect(line_15.epp_p, node_91.epp) annotation (Line(points={{12.92,414.96},{15.42,429.96}}));
  connect(line_15.epp_n, node_57.epp) annotation (Line(points={{17.92,414.96},{15.42,394.96}}));
  connect(line_16.epp_p, node_74.epp) annotation (Line(points={{44.42,449.96},{120.42,429.96}}));
  connect(line_16.epp_n, node_63.epp) annotation (Line(points={{49.42,449.96},{-26.58,464.96}}));
  connect(line_17.epp_p, node_56.epp) annotation (Line(points={{107.42,-470.54},{99.42,-487.04}}));
  connect(line_17.epp_n, node_76.epp) annotation (Line(points={{112.42,-470.54},{120.42,-459.04}}));
  connect(line_18.epp_p, node_87.epp) annotation (Line(points={{-211.08,-57.54},{-208.58,-46.04}}));
  connect(line_18.epp_n, node_65.epp) annotation (Line(points={{-206.08,-57.54},{-208.58,-74.04}}));
  connect(line_19.epp_p, node_23.epp) annotation (Line(points={{-197.08,162.96},{-180.58,177.96}}));
  connect(line_19.epp_n, node_75.epp) annotation (Line(points={{-192.08,162.96},{-208.58,142.96}}));
  connect(line_20.epp_p, node_4.epp) annotation (Line(points={{121.42,12.46},{120.42,-4.04}}));
  connect(line_20.epp_n, node_12.epp) annotation (Line(points={{126.42,12.46},{127.42,23.96}}));
  connect(line_21.epp_p, node_69.epp) annotation (Line(points={{-172.58,232.96},{-166.58,212.96}}));
  connect(line_21.epp_n, node_19.epp) annotation (Line(points={{-167.58,232.96},{-173.58,247.96}}));
  connect(line_22.epp_p, node_41.epp) annotation (Line(points={{16.42,274.96},{15.42,289.96}}));
  connect(line_22.epp_n, node_38.epp) annotation (Line(points={{21.42,274.96},{22.42,254.96}}));
  connect(line_23.epp_p, node_31.epp) annotation (Line(points={{117.92,-386.54},{120.42,-403.04}}));
  connect(line_23.epp_n, node_30.epp) annotation (Line(points={{122.92,-386.54},{120.42,-375.04}}));
  connect(line_24.epp_p, node_45.epp) annotation (Line(points={{-85.08,302.96},{-82.58,317.96}}));
  connect(line_24.epp_n, node_47.epp) annotation (Line(points={{-80.08,302.96},{-82.58,282.96}}));
  connect(line_25.epp_p, node_47.epp) annotation (Line(points={{-85.08,267.96},{-82.58,282.96}}));
  connect(line_25.epp_n, node_52.epp) annotation (Line(points={{-80.08,267.96},{-82.58,247.96}}));
  connect(line_26.epp_p, node_57.epp) annotation (Line(points={{12.92,376.46},{15.42,394.96}}));
  connect(line_26.epp_n, node_58.epp) annotation (Line(points={{17.92,376.46},{15.42,352.96}}));
  connect(line_27.epp_p, node_51.epp) annotation (Line(points={{-207.58,-152.04},{-201.58,-137.04}}));
  connect(line_27.epp_n, node_59.epp) annotation (Line(points={{-202.58,-152.04},{-208.58,-172.04}}));
  connect(line_28.epp_p, node_92.epp) annotation (Line(points={{16.42,-68.04},{15.42,-53.04}}));
  connect(line_28.epp_n, node_27.epp) annotation (Line(points={{21.42,-68.04},{22.42,-88.04}}));
  connect(line_29.epp_p, node_42.epp) annotation (Line(points={{121.42,173.46},{127.42,156.96}}));
  connect(line_29.epp_n, node_37.epp) annotation (Line(points={{126.42,173.46},{120.42,184.96}}));
  connect(line_30.epp_p, node_3.epp) annotation (Line(points={{-85.08,-8.54},{-82.58,2.96}}));
  connect(line_30.epp_n, node_32.epp) annotation (Line(points={{-80.08,-8.54},{-82.58,-25.04}}));
  connect(line_31.epp_p, node_37.epp) annotation (Line(points={{117.92,204.96},{120.42,184.96}}));
  connect(line_31.epp_n, node_36.epp) annotation (Line(points={{122.92,204.96},{120.42,219.96}}));
  connect(line_32.epp_p, node_49.epp) annotation (Line(points={{-176.08,302.96},{-173.58,282.96}}));
  connect(line_32.epp_n, node_79.epp) annotation (Line(points={{-171.08,302.96},{-173.58,317.96}}));
  connect(line_33.epp_p, node_1.epp) annotation (Line(points={{121.42,-50.54},{127.42,-67.04}}));
  connect(line_33.epp_n, node_28.epp) annotation (Line(points={{126.42,-50.54},{120.42,-39.04}}));
  connect(line_34.epp_p, node_64.epp) annotation (Line(points={{145.92,-610.54},{148.42,-599.04}}));
  connect(line_34.epp_n, node_84.epp) annotation (Line(points={{150.92,-610.54},{148.42,-627.04}}));
  connect(line_35.epp_p, node_93.epp) annotation (Line(points={{117.92,309.96},{120.42,289.96}}));
  connect(line_35.epp_n, node_67.epp) annotation (Line(points={{122.92,309.96},{120.42,324.96}}));
  connect(line_36.epp_p, node_24.epp) annotation (Line(points={{-85.08,22.96},{-82.58,37.96}}));
  connect(line_36.epp_n, node_3.epp) annotation (Line(points={{-80.08,22.96},{-82.58,2.96}}));
  connect(line_37.epp_p, node_79.epp) annotation (Line(points={{-172.58,337.96},{-173.58,317.96}}));
  connect(line_37.epp_n, node_54.epp) annotation (Line(points={{-167.58,337.96},{-166.58,352.96}}));
  connect(line_38.epp_p, node_65.epp) annotation (Line(points={{-211.08,-89.04},{-208.58,-74.04}}));
  connect(line_38.epp_n, node_77.epp) annotation (Line(points={{-206.08,-89.04},{-208.58,-109.04}}));
  connect(line_39.epp_p, node_22.epp) annotation (Line(points={{-85.08,57.96},{-82.58,72.96}}));
  connect(line_39.epp_n, node_24.epp) annotation (Line(points={{-80.08,57.96},{-82.58,37.96}}));
  connect(line_40.epp_p, node_62.epp) annotation (Line(points={{117.92,379.96},{120.42,359.96}}));
  connect(line_40.epp_n, node_53.epp) annotation (Line(points={{122.92,379.96},{120.42,394.96}}));
  connect(line_41.epp_p, node_68.epp) annotation (Line(points={{149.42,-530.04},{148.42,-515.04}}));
  connect(line_41.epp_n, node_80.epp) annotation (Line(points={{154.42,-530.04},{155.42,-550.04}}));
  connect(line_42.epp_p, node_63.epp) annotation (Line(points={{-8.08,449.96},{-26.58,464.96}}));
  connect(line_42.epp_n, node_91.epp) annotation (Line(points={{-3.08,449.96},{15.42,429.96}}));
  connect(line_43.epp_p, node_38.epp) annotation (Line(points={{16.42,239.96},{22.42,254.96}}));
  connect(line_43.epp_n, node_20.epp) annotation (Line(points={{21.42,239.96},{15.42,219.96}}));
  connect(line_44.epp_p, node_17.epp) annotation (Line(points={{-85.08,197.96},{-82.58,212.96}}));
  connect(line_44.epp_n, node_5.epp) annotation (Line(points={{-80.08,197.96},{-82.58,177.96}}));
  connect(line_45.epp_p, node_39.epp) annotation (Line(points={{12.92,61.46},{15.42,72.96}}));
  connect(line_45.epp_n, node_94.epp) annotation (Line(points={{17.92,61.46},{15.42,44.96}}));
  connect(line_46.epp_p, node_44.epp) annotation (Line(points={{121.42,-232.54},{120.42,-249.04}}));
  connect(line_46.epp_n, node_34.epp) annotation (Line(points={{126.42,-232.54},{127.42,-221.04}}));
  connect(line_47.epp_p, node_46.epp) annotation (Line(points={{12.92,169.96},{15.42,184.96}}));
  connect(line_47.epp_n, node_82.epp) annotation (Line(points={{17.92,169.96},{15.42,149.96}}));
  connect(line_48.epp_p, node_58.epp) annotation (Line(points={{12.92,337.96},{15.42,352.96}}));
  connect(line_48.epp_n, node_78.epp) annotation (Line(points={{17.92,337.96},{15.42,317.96}}));
  connect(line_49.epp_p, node_33.epp) annotation (Line(points={{-169.08,162.96},{-152.58,142.96}}));
  connect(line_49.epp_n, node_23.epp) annotation (Line(points={{-164.08,162.96},{-180.58,177.96}}));
  connect(line_50.epp_p, node_20.epp) annotation (Line(points={{12.92,204.96},{15.42,219.96}}));
  connect(line_50.epp_n, node_46.epp) annotation (Line(points={{17.92,204.96},{15.42,184.96}}));
  connect(line_51.epp_p, node_94.epp) annotation (Line(points={{12.92,29.96},{15.42,44.96}}));
  connect(line_51.epp_n, node_89.epp) annotation (Line(points={{17.92,29.96},{15.42,9.96}}));
  connect(line_52.epp_p, node_36.epp) annotation (Line(points={{117.92,239.96},{120.42,219.96}}));
  connect(line_52.epp_n, node_7.epp) annotation (Line(points={{122.92,239.96},{120.42,254.96}}));
  connect(line_53.epp_p, node_34.epp) annotation (Line(points={{121.42,-204.54},{127.42,-221.04}}));
  connect(line_53.epp_n, node_11.epp) annotation (Line(points={{126.42,-204.54},{120.42,-193.04}}));
  connect(line_54.epp_p, node_75.epp) annotation (Line(points={{-211.08,127.96},{-208.58,142.96}}));
  connect(line_54.epp_n, node_10.epp) annotation (Line(points={{-206.08,127.96},{-208.58,107.96}}));
  connect(line_55.epp_p, node_85.epp) annotation (Line(points={{-211.08,1.96},{-208.58,16.96}}));
  connect(line_55.epp_n, node_9.epp) annotation (Line(points={{-206.08,1.96},{-208.58,-18.04}}));
  connect(line_56.epp_p, node_53.epp) annotation (Line(points={{117.92,414.96},{120.42,394.96}}));
  connect(line_56.epp_n, node_74.epp) annotation (Line(points={{122.92,414.96},{120.42,429.96}}));
  connect(line_57.epp_p, node_16.epp) annotation (Line(points={{-155.08,127.96},{-152.58,107.96}}));
  connect(line_57.epp_n, node_33.epp) annotation (Line(points={{-150.08,127.96},{-152.58,142.96}}));
  connect(line_58.epp_p, node_6.epp) annotation (Line(points={{117.92,75.46},{120.42,58.96}}));
  connect(line_58.epp_n, node_18.epp) annotation (Line(points={{122.92,75.46},{120.42,86.96}}));
  connect(line_59.epp_p, node_71.epp) annotation (Line(points={{117.92,-264.04},{120.42,-284.04}}));
  connect(line_59.epp_n, node_44.epp) annotation (Line(points={{122.92,-264.04},{120.42,-249.04}}));
  connect(line_60.epp_p, node_2.epp) annotation (Line(points={{145.92,-663.04},{148.42,-655.04}}));
  connect(line_60.epp_n, node_66.epp) annotation (Line(points={{150.92,-663.04},{148.42,-676.04}}));
  connect(line_61.epp_p, node_60.epp) annotation (Line(points={{93.42,-498.54},{92.42,-515.04}}));
  connect(line_61.epp_n, node_56.epp) annotation (Line(points={{98.42,-498.54},{99.42,-487.04}}));
  connect(line_62.epp_p, node_77.epp) annotation (Line(points={{-207.58,-120.54},{-208.58,-109.04}}));
  connect(line_62.epp_n, node_51.epp) annotation (Line(points={{-202.58,-120.54},{-201.58,-137.04}}));
  connect(line_63.epp_p, node_48.epp) annotation (Line(points={{96.92,-561.54},{99.42,-578.04}}));
  connect(line_63.epp_n, node_86.epp) annotation (Line(points={{101.92,-561.54},{99.42,-550.04}}));
  connect(line_64.epp_p, node_35.epp) annotation (Line(points={{-85.08,411.46},{-82.58,422.96}}));
  connect(line_64.epp_n, node_88.epp) annotation (Line(points={{-80.08,411.46},{-82.58,394.96}}));
  connect(line_65.epp_p, node_95.epp) annotation (Line(points={{-85.08,92.96},{-82.58,107.96}}));
  connect(line_65.epp_n, node_22.epp) annotation (Line(points={{-80.08,92.96},{-82.58,72.96}}));
  connect(line_66.epp_p, node_78.epp) annotation (Line(points={{12.92,306.46},{15.42,317.96}}));
  connect(line_66.epp_n, node_41.epp) annotation (Line(points={{17.92,306.46},{15.42,289.96}}));
  connect(line_67.epp_p, node_12.epp) annotation (Line(points={{121.42,43.96},{127.42,23.96}}));
  connect(line_67.epp_n, node_6.epp) annotation (Line(points={{126.42,43.96},{120.42,58.96}}));
  connect(line_68.epp_p, node_83.epp) annotation (Line(points={{124.92,-82.04},{127.42,-102.04}}));
  connect(line_68.epp_n, node_1.epp) annotation (Line(points={{129.92,-82.04},{127.42,-67.04}}));
  connect(line_69.epp_p, node_89.epp) annotation (Line(points={{12.92,-5.04},{15.42,9.96}}));
  connect(line_69.epp_n, node_15.epp) annotation (Line(points={{17.92,-5.04},{15.42,-25.04}}));
  connect(line_70.epp_p, node_15.epp) annotation (Line(points={{12.92,-36.54},{15.42,-25.04}}));
  connect(line_70.epp_n, node_92.epp) annotation (Line(points={{17.92,-36.54},{15.42,-53.04}}));
  connect(line_71.epp_p, node_80.epp) annotation (Line(points={{149.42,-558.04},{155.42,-550.04}}));
  connect(line_71.epp_n, node_25.epp) annotation (Line(points={{154.42,-558.04},{148.42,-571.04}}));
  connect(line_72.epp_p, node_23.epp) annotation (Line(points={{-176.08,197.96},{-180.58,177.96}}));
  connect(line_72.epp_n, node_69.epp) annotation (Line(points={{-171.08,197.96},{-166.58,212.96}}));
  connect(line_73.epp_p, node_72.epp) annotation (Line(points={{117.92,-141.54},{120.42,-158.04}}));
  connect(line_73.epp_n, node_29.epp) annotation (Line(points={{122.92,-141.54},{120.42,-130.04}}));
  connect(line_74.epp_p, node_90.epp) annotation (Line(points={{-176.08,407.96},{-173.58,387.96}}));
  connect(line_74.epp_n, node_13.epp) annotation (Line(points={{-171.08,407.96},{-173.58,422.96}}));
  connect(line_75.epp_p, node_86.epp) annotation (Line(points={{93.42,-530.04},{99.42,-550.04}}));
  connect(line_75.epp_n, node_60.epp) annotation (Line(points={{98.42,-530.04},{92.42,-515.04}}));
  connect(line_76.epp_p, node_88.epp) annotation (Line(points={{-81.58,376.46},{-82.58,394.96}}));
  connect(line_76.epp_n, node_50.epp) annotation (Line(points={{-76.58,376.46},{-75.58,352.96}}));
  connect(line_77.epp_p, node_73.epp) annotation (Line(points={{-211.08,61.46},{-208.58,72.96}}));
  connect(line_77.epp_n, node_26.epp) annotation (Line(points={{-206.08,61.46},{-208.58,44.96}}));
  connect(line_78.epp_p, node_70.epp) annotation (Line(points={{-155.08,92.96},{-152.58,72.96}}));
  connect(line_78.epp_n, node_16.epp) annotation (Line(points={{-150.08,92.96},{-152.58,107.96}}));
  connect(line_79.epp_p, node_76.epp) annotation (Line(points={{117.92,-446.04},{120.42,-459.04}}));
  connect(line_79.epp_n, node_81.epp) annotation (Line(points={{122.92,-446.04},{120.42,-438.04}}));
  connect(line_80.epp_p, node_96.epp) annotation (Line(points={{12.92,96.46},{15.42,114.96}}));
  connect(line_80.epp_n, node_39.epp) annotation (Line(points={{17.92,96.46},{15.42,72.96}}));
  connect(line_81.epp_p, node_18.epp) annotation (Line(points={{117.92,106.96},{120.42,86.96}}));
  connect(line_81.epp_n, node_61.epp) annotation (Line(points={{122.92,106.96},{120.42,121.96}}));
  connect(line_82.epp_p, node_11.epp) annotation (Line(points={{117.92,-173.04},{120.42,-193.04}}));
  connect(line_82.epp_n, node_72.epp) annotation (Line(points={{122.92,-173.04},{120.42,-158.04}}));
  connect(line_83.epp_p, node_54.epp) annotation (Line(points={{-172.58,372.96},{-166.58,352.96}}));
  connect(line_83.epp_n, node_90.epp) annotation (Line(points={{-167.58,372.96},{-173.58,387.96}}));
  connect(line_84.epp_p, node_52.epp) annotation (Line(points={{-85.08,232.96},{-82.58,247.96}}));
  connect(line_84.epp_n, node_17.epp) annotation (Line(points={{-80.08,232.96},{-82.58,212.96}}));
  connect(line_85.epp_p, node_28.epp) annotation (Line(points={{117.92,-19.04},{120.42,-39.04}}));
  connect(line_85.epp_n, node_4.epp) annotation (Line(points={{122.92,-19.04},{120.42,-4.04}}));
  connect(line_86.epp_p, node_67.epp) annotation (Line(points={{117.92,344.96},{120.42,324.96}}));
  connect(line_86.epp_n, node_62.epp) annotation (Line(points={{122.92,344.96},{120.42,359.96}}));
  connect(line_87.epp_p, node_7.epp) annotation (Line(points={{117.92,274.96},{120.42,254.96}}));
  connect(line_87.epp_n, node_93.epp) annotation (Line(points={{122.92,274.96},{120.42,289.96}}));
  connect(line_88.epp_p, node_82.epp) annotation (Line(points={{12.92,134.96},{15.42,149.96}}));
  connect(line_88.epp_n, node_96.epp) annotation (Line(points={{17.92,134.96},{15.42,114.96}}));
  connect(line_89.epp_p, node_26.epp) annotation (Line(points={{-211.08,33.46},{-208.58,44.96}}));
  connect(line_89.epp_n, node_85.epp) annotation (Line(points={{-206.08,33.46},{-208.58,16.96}}));
  connect(line_90.epp_p, node_50.epp) annotation (Line(points={{-81.58,337.96},{-75.58,352.96}}));
  connect(line_90.epp_n, node_45.epp) annotation (Line(points={{-76.58,337.96},{-82.58,317.96}}));
  connect(line_91.epp_p, node_10.epp) annotation (Line(points={{-211.08,92.96},{-208.58,107.96}}));
  connect(line_91.epp_n, node_73.epp) annotation (Line(points={{-206.08,92.96},{-208.58,72.96}}));
  connect(line_92.epp_p, node_76.epp) annotation (Line(points={{131.92,-470.54},{120.42,-459.04}}));
  connect(line_92.epp_n, node_43.epp) annotation (Line(points={{136.92,-470.54},{148.42,-487.04}}));
  connect(line_93.epp_p, node_63.epp) annotation (Line(points={{-57.08,446.46},{-26.58,464.96}}));
  connect(line_93.epp_n, node_35.epp) annotation (Line(points={{-52.08,446.46},{-82.58,422.96}}));
  connect(line_94.epp_p, node_13.epp) annotation (Line(points={{-102.58,446.46},{-173.58,422.96}}));
  connect(line_94.epp_n, node_63.epp) annotation (Line(points={{-97.58,446.46},{-26.58,464.96}}));
  connect(line_95.epp_p, node_40.epp) annotation (Line(points={{93.42,-586.04},{92.42,-599.04}}));
  connect(line_95.epp_n, node_48.epp) annotation (Line(points={{98.42,-586.04},{99.42,-578.04}}));

  // ---- Connect households to nodes ---------------------------------------------------------

  connect(node_16.epp, household_1.epp) annotation (Line(points={{-152.58,107.96},{-127.58,107.96}}));
  connect(node_62.epp, household_2.epp) annotation (Line(points={{120.42,359.96},{145.42,359.96}}));
  connect(node_93.epp, household_3.epp) annotation (Line(points={{120.42,289.96},{145.42,289.96}}));
  connect(node_1.epp, household_4.epp) annotation (Line(points={{127.42,-67.04},{152.42,-67.04}}));
  connect(node_96.epp, household_5.epp) annotation (Line(points={{15.42,114.96},{40.42,114.96}}));
  connect(node_37.epp, household_6.epp) annotation (Line(points={{120.42,184.96},{145.42,184.96}}));
  connect(node_86.epp, household_7.epp) annotation (Line(points={{99.42,-550.04},{124.42,-550.04}}));
  connect(node_44.epp, household_8.epp) annotation (Line(points={{120.42,-249.04},{145.42,-249.04}}));
  connect(node_7.epp, household_9.epp) annotation (Line(points={{120.42,254.96},{145.42,254.96}}));
  connect(node_81.epp, household_10.epp) annotation (Line(points={{120.42,-438.04},{145.42,-438.04}}));
  connect(node_54.epp, household_11.epp) annotation (Line(points={{-166.58,352.96},{-141.58,352.96}}));
  connect(node_70.epp, household_12.epp) annotation (Line(points={{-152.58,72.96},{-127.58,72.96}}));
  connect(node_20.epp, household_13.epp) annotation (Line(points={{15.42,219.96},{40.42,219.96}}));
  connect(node_83.epp, household_14.epp) annotation (Line(points={{127.42,-102.04},{152.42,-102.04}}));
  connect(node_8.epp, household_15.epp) annotation (Line(points={{-82.58,142.96},{-57.58,142.96}}));
  connect(node_80.epp, household_16.epp) annotation (Line(points={{155.42,-550.04},{180.42,-550.04}}));
  connect(node_34.epp, household_17.epp) annotation (Line(points={{127.42,-221.04},{152.42,-221.04}}));
  connect(node_45.epp, household_18.epp) annotation (Line(points={{-82.58,317.96},{-57.58,317.96}}));
  connect(node_95.epp, household_19.epp) annotation (Line(points={{-82.58,107.96},{-57.58,107.96}}));
  connect(node_26.epp, household_20.epp) annotation (Line(points={{-208.58,44.96},{-183.58,44.96}}));
  connect(node_38.epp, household_21.epp) annotation (Line(points={{22.42,254.96},{47.42,254.96}}));
  connect(node_34.epp, household_22.epp) annotation (Line(points={{127.42,-221.04},{172.42,-221.04}}));
  connect(node_28.epp, household_23.epp) annotation (Line(points={{120.42,-39.04},{145.42,-39.04}}));
  connect(node_21.epp, household_24.epp) annotation (Line(points={{120.42,-347.04},{145.42,-347.04}}));
  connect(node_67.epp, household_25.epp) annotation (Line(points={{120.42,324.96},{145.42,324.96}}));
  connect(node_72.epp, household_26.epp) annotation (Line(points={{120.42,-158.04},{145.42,-158.04}}));
  connect(node_35.epp, household_27.epp) annotation (Line(points={{-82.58,422.96},{-57.58,422.96}}));
  connect(node_42.epp, household_28.epp) annotation (Line(points={{127.42,156.96},{152.42,156.96}}));
  connect(node_15.epp, household_29.epp) annotation (Line(points={{15.42,-25.04},{40.42,-25.04}}));
  connect(node_17.epp, household_30.epp) annotation (Line(points={{-82.58,212.96},{-57.58,212.96}}));
  connect(node_92.epp, household_31.epp) annotation (Line(points={{15.42,-53.04},{40.42,-53.04}}));
  connect(node_10.epp, household_32.epp) annotation (Line(points={{-208.58,107.96},{-183.58,107.96}}));
  connect(node_36.epp, household_33.epp) annotation (Line(points={{120.42,219.96},{145.42,219.96}}));
  connect(node_52.epp, household_34.epp) annotation (Line(points={{-82.58,247.96},{-57.58,247.96}}));
  connect(node_65.epp, household_35.epp) annotation (Line(points={{-208.58,-74.04},{-183.58,-74.04}}));
  connect(node_14.epp, household_36.epp) annotation (Line(points={{127.42,-312.04},{152.42,-312.04}}));
  connect(node_51.epp, household_37.epp) annotation (Line(points={{-201.58,-137.04},{-176.58,-137.04}}));
  connect(node_49.epp, household_38.epp) annotation (Line(points={{-173.58,282.96},{-148.58,282.96}}));
  connect(node_9.epp, household_39.epp) annotation (Line(points={{-208.58,-18.04},{-183.58,-18.04}}));
  connect(node_58.epp, household_40.epp) annotation (Line(points={{15.42,352.96},{40.42,352.96}}));
  connect(node_56.epp, household_41.epp) annotation (Line(points={{99.42,-487.04},{124.42,-487.04}}));
  connect(node_71.epp, household_42.epp) annotation (Line(points={{120.42,-284.04},{145.42,-284.04}}));
  connect(node_25.epp, household_43.epp) annotation (Line(points={{148.42,-571.04},{173.42,-571.04}}));
  connect(node_48.epp, household_44.epp) annotation (Line(points={{99.42,-578.04},{124.42,-578.04}}));
  connect(node_50.epp, household_45.epp) annotation (Line(points={{-75.58,352.96},{-50.58,352.96}}));
  connect(node_73.epp, household_46.epp) annotation (Line(points={{-208.58,72.96},{-183.58,72.96}}));
  connect(node_78.epp, household_47.epp) annotation (Line(points={{15.42,317.96},{40.42,317.96}}));
  connect(node_64.epp, household_48.epp) annotation (Line(points={{148.42,-599.04},{173.42,-599.04}}));
  connect(node_32.epp, household_49.epp) annotation (Line(points={{-82.58,-25.04},{-57.58,-25.04}}));
  connect(node_79.epp, household_50.epp) annotation (Line(points={{-173.58,317.96},{-148.58,317.96}}));
  connect(node_77.epp, household_51.epp) annotation (Line(points={{-208.58,-109.04},{-183.58,-109.04}}));
  connect(node_42.epp, household_52.epp) annotation (Line(points={{127.42,156.96},{172.42,156.96}}));
  connect(node_83.epp, household_53.epp) annotation (Line(points={{127.42,-102.04},{172.42,-102.04}}));
  connect(node_27.epp, household_54.epp) annotation (Line(points={{22.42,-88.04},{47.42,-88.04}}));
  connect(node_30.epp, household_55.epp) annotation (Line(points={{120.42,-375.04},{145.42,-375.04}}));
  connect(node_55.epp, household_56.epp) annotation (Line(points={{99.42,-627.04},{124.42,-627.04}}));
  connect(node_69.epp, household_57.epp) annotation (Line(points={{-166.58,212.96},{-141.58,212.96}}));
  connect(node_60.epp, household_58.epp) annotation (Line(points={{92.42,-515.04},{117.42,-515.04}}));
  connect(node_4.epp, household_59.epp) annotation (Line(points={{120.42,-4.04},{145.42,-4.04}}));
  connect(node_41.epp, household_60.epp) annotation (Line(points={{15.42,289.96},{40.42,289.96}}));
  connect(node_40.epp, household_61.epp) annotation (Line(points={{92.42,-599.04},{117.42,-599.04}}));
  connect(node_82.epp, household_62.epp) annotation (Line(points={{15.42,149.96},{40.42,149.96}}));
  connect(node_94.epp, household_63.epp) annotation (Line(points={{15.42,44.96},{40.42,44.96}}));
  connect(node_66.epp, household_64.epp) annotation (Line(points={{148.42,-676.04},{173.42,-676.04}}));
  connect(node_3.epp, household_65.epp) annotation (Line(points={{-82.58,2.96},{-57.58,2.96}}));
  connect(node_18.epp, household_66.epp) annotation (Line(points={{120.42,86.96},{145.42,86.96}}));
  connect(node_84.epp, household_67.epp) annotation (Line(points={{148.42,-627.04},{173.42,-627.04}}));
  connect(node_68.epp, household_68.epp) annotation (Line(points={{148.42,-515.04},{173.42,-515.04}}));
  connect(node_6.epp, household_69.epp) annotation (Line(points={{120.42,58.96},{145.42,58.96}}));
  connect(node_85.epp, household_70.epp) annotation (Line(points={{-208.58,16.96},{-183.58,16.96}}));
  connect(node_24.epp, household_71.epp) annotation (Line(points={{-82.58,37.96},{-57.58,37.96}}));
  connect(node_33.epp, household_72.epp) annotation (Line(points={{-152.58,142.96},{-127.58,142.96}}));
  connect(node_31.epp, household_73.epp) annotation (Line(points={{120.42,-403.04},{145.42,-403.04}}));
  connect(node_11.epp, household_74.epp) annotation (Line(points={{120.42,-193.04},{145.42,-193.04}}));
  connect(node_17.epp, household_75.epp) annotation (Line(points={{-82.58,212.96},{-37.58,212.96}}));
  connect(node_87.epp, household_76.epp) annotation (Line(points={{-208.58,-46.04},{-183.58,-46.04}}));
  connect(node_1.epp, household_77.epp) annotation (Line(points={{127.42,-67.04},{172.42,-67.04}}));
  connect(node_2.epp, household_78.epp) annotation (Line(points={{148.42,-655.04},{173.42,-655.04}}));
  connect(node_75.epp, household_79.epp) annotation (Line(points={{-208.58,142.96},{-183.58,142.96}}));
  connect(node_89.epp, household_80.epp) annotation (Line(points={{15.42,9.96},{40.42,9.96}}));
  connect(node_43.epp, household_81.epp) annotation (Line(points={{148.42,-487.04},{173.42,-487.04}}));
  connect(node_5.epp, household_82.epp) annotation (Line(points={{-82.58,177.96},{-57.58,177.96}}));
  connect(node_29.epp, household_83.epp) annotation (Line(points={{120.42,-130.04},{145.42,-130.04}}));
  connect(node_55.epp, household_84.epp) annotation (Line(points={{99.42,-627.04},{144.42,-627.04}}));
  connect(node_61.epp, household_85.epp) annotation (Line(points={{120.42,121.96},{145.42,121.96}}));
  connect(node_57.epp, household_86.epp) annotation (Line(points={{15.42,394.96},{40.42,394.96}}));
  connect(node_59.epp, household_87.epp) annotation (Line(points={{-208.58,-172.04},{-183.58,-172.04}}));
  connect(node_12.epp, household_88.epp) annotation (Line(points={{127.42,23.96},{152.42,23.96}}));
  connect(node_74.epp, household_89.epp) annotation (Line(points={{120.42,429.96},{145.42,429.96}}));
  connect(node_46.epp, household_90.epp) annotation (Line(points={{15.42,184.96},{40.42,184.96}}));
  connect(node_91.epp, household_91.epp) annotation (Line(points={{15.42,429.96},{40.42,429.96}}));
  connect(node_22.epp, household_92.epp) annotation (Line(points={{-82.58,72.96},{-57.58,72.96}}));
  connect(node_53.epp, household_93.epp) annotation (Line(points={{120.42,394.96},{145.42,394.96}}));
  connect(node_39.epp, household_94.epp) annotation (Line(points={{15.42,72.96},{40.42,72.96}}));
  connect(node_47.epp, household_95.epp) annotation (Line(points={{-82.58,282.96},{-57.58,282.96}}));
  connect(node_19.epp, household_96.epp) annotation (Line(points={{-173.58,247.96},{-148.58,247.96}}));
  connect(node_90.epp, household_97.epp) annotation (Line(points={{-173.58,387.96},{-148.58,387.96}}));
  connect(node_13.epp, household_98.epp) annotation (Line(points={{-173.58,422.96},{-148.58,422.96}}));
  connect(node_88.epp, household_99.epp) annotation (Line(points={{-82.58,394.96},{-57.58,394.96}}));

  // ---- Connect transformer to node ---------------------------------------------------------

  connect(epp, epp) annotation (Line(
      points={{0,108},{0,108}},
      color={0,127,0},
      thickness=0.5));
  connect(simpleTransformerComplex.epp_p, epp) annotation (Line(
      points={{-116,502},{-124,502},{-124,420},{-72,420},{-72,416},{0,416},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(simpleTransformerComplex.epp_n, decouplingGrids.epp_p) annotation (Line(
      points={{-96,502},{-78,502}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_a, decouplingGrids.epp_n) annotation (Line(
      points={{-39.2,502},{-58,502}},
      color={28,108,200},
      thickness=0.5));
  connect(GridMeter.epp_b, node_63.epp) annotation (Line(
      points={{-30,492},{-26.58,492},{-26.58,464.96}},
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
          extent={{-360,100},{-240,20}},
          lineColor={102,44,145},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-358,98},{-242,22}},
          textColor={102,44,145},
          horizontalAlignment=TextAlignment.Left,
          textString="Scenario: LV-rural-2
Topology: SimBench 1-LV-rural2--0-sw
Degree of urbanisation: Rural
Technology Mix: Today
Number of Prosumers: 99
Number of PV: 12
Number of BES: 6
Number of EHP: 8
Number of BEV: 4")}),
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
          textString="%LV_rural_2_T")}));
end LV_rural_2_T;
