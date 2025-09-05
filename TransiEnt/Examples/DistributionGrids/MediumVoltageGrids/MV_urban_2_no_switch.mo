within TransiEnt.Examples.DistributionGrids.MediumVoltageGrids;
model MV_urban_2_no_switch "Urban medium voltage distribution grid scenario with variable technology penetration scenario."
  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String development_scenario="Intermediate" annotation (choices(
      choice="Today" "Today",
      choice="Intermediate" "Intermediate",
      choice="Future" "Future"), Dialog(group="Scenario choice"));

  parameter String weatherLocation="Hamelin"
                                            annotation (Dialog(group="Scenario choice"));

  parameter String weatherYear="2019" annotation (Dialog(group="Scenario choice"));

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for battery system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for heating system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for vehicle system" annotation (Evaluate=true, Dialog(group="External Control"));

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

  // ---- Knoten rechter Zweig ----------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Node node_1(epp(v(start=10000))) annotation (Placement(transformation(extent={{6,-56},{0,-50}})));
  TransiEnt.Components.Electrical.Grid.Node node_41(epp(v(start=10000))) annotation (Placement(transformation(extent={{44,42},{38,48}})));
  TransiEnt.Components.Electrical.Grid.Node node_42(epp(v(start=10000))) annotation (Placement(transformation(extent={{56,154},{50,160}})));
  TransiEnt.Components.Electrical.Grid.Node node_43(epp(v(start=10000))) annotation (Placement(transformation(extent={{56,282},{50,288}})));
  TransiEnt.Components.Electrical.Grid.Node node_44(epp(v(start=10000))) annotation (Placement(transformation(extent={{56,414},{50,420}})));
  TransiEnt.Components.Electrical.Grid.Node node_45(epp(v(start=10000))) annotation (Placement(transformation(extent={{58,552},{52,558}})));
  TransiEnt.Components.Electrical.Grid.Node node_46(epp(v(start=10000))) annotation (Placement(transformation(extent={{56,726},{50,732}})));
  TransiEnt.Components.Electrical.Grid.Node node_47(epp(v(start=10000))) annotation (Placement(transformation(extent={{52,862},{46,868}})));
  TransiEnt.Components.Electrical.Grid.Node node_48(epp(v(start=10000))) annotation (Placement(transformation(extent={{48,994},{42,1000}})));
  TransiEnt.Components.Electrical.Grid.Node node_49(epp(v(start=10000))) annotation (Placement(transformation(extent={{46,1126},{40,1132}})));
  TransiEnt.Components.Electrical.Grid.Node node_50(epp(v(start=10000))) annotation (Placement(transformation(extent={{44,1262},{38,1268}})));

  // ---- Lines rechter Zweig -----------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_31(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=100,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{16,-12},{22,-6}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_32(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=120,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{34,94},{40,100}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_33(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=270,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{48,220},{54,226}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_34(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=270,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{54,352},{60,358}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_35(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=260,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{52,486},{58,492}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_36(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=150,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{54,644},{60,650}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_37(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=400,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{48,800},{54,806}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_38(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=190,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{46,934},{52,940}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_39(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=110,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{44,1052},{50,1058}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_40(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=90,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{42,1194},{48,1200}})));

  // ---- Nodes  linker Zweig ----------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.Node node_51(epp(v(start=10000))) annotation (Placement(transformation(extent={{-52,34},{-46,40}})));
  TransiEnt.Components.Electrical.Grid.Node node_52(epp(v(start=10000))) annotation (Placement(transformation(extent={{-100,132},{-94,138}})));
  TransiEnt.Components.Electrical.Grid.Node node_53(epp(v(start=10000))) annotation (Placement(transformation(extent={{-124,222},{-118,228}})));
  TransiEnt.Components.Electrical.Grid.Node node_54(epp(v(start=10000))) annotation (Placement(transformation(extent={{-144,354},{-138,360}})));
  TransiEnt.Components.Electrical.Grid.Node node_55(epp(v(start=10000))) annotation (Placement(transformation(extent={{-152,510},{-146,516}})));
  TransiEnt.Components.Electrical.Grid.Node node_56(epp(v(start=10000))) annotation (Placement(transformation(extent={{-154,678},{-148,684}})));
  TransiEnt.Components.Electrical.Grid.Node node_57(epp(v(start=10000))) annotation (Placement(transformation(extent={{-162,838},{-156,844}})));
  TransiEnt.Components.Electrical.Grid.Node node_58(epp(v(start=10000))) annotation (Placement(transformation(extent={{-160,986},{-154,992}})));

  // ---- Lines linker Zweig -----------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_41(
    r=0.1e-3,
    x=0.0974e-3,
    b=150.796e-9,
    i_n=471,
    length=110,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{-30,-14},{-24,-8}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_42(
    r=0.1e-3,
    x=0.0974e-3,
    b=150.796e-9,
    i_n=471,
    length=350,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{-74,80},{-68,86}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_43(
    r=0.1e-3,
    x=0.0974e-3,
    b=150.796e-9,
    i_n=471,
    length=220,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{-110,176},{-104,182}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_44(
    r=0.1e-3,
    x=0.0974e-3,
    b=150.796e-9,
    i_n=471,
    length=350,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{-132,288},{-126,294}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_45(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=390,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{-144,432},{-138,438}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_46(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=430,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{-156,596},{-150,602}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_47(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=330,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{-154,756},{-148,762}})));
  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_48(
    r=0.122e-3,
    x=0.105e-3,
    b=143.257e-9,
    i_n=416,
    length=290,
    epp_p(v(start=10000)),
    epp_n(v(start=10000))) annotation (Placement(transformation(extent={{-158,916},{-152,922}})));

  // ---- Transformator und Power Port ------------------------------------------------------------

  TransiEnt.Components.Electrical.PowerTransformation.SimpleTransformerComplex simpleTransformerComplex(
    UseRatio=false,
    ratio=5.5,
    U_P=110e3,
    U_S=10e3) annotation (Placement(transformation(extent={{74,-106},{50,-132}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{100,-130},{120,-110}}), iconTransformation(extent={{90,-10},{110,10}})));

  // ---- Niederspannungsnetze --------------------------------------------------------------------

  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_1(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{60,20},{80,40}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_2(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{106,122},{126,142}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_3(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{80,260},{100,280}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_4(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{100,380},{120,400}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_4 lV_semiurb_4_1(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{100,520},{120,540}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_5(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{100,700},{120,720}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_6(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{100,820},{120,840}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_7(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{80,960},{100,980}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_urban_6 lV_urban_6_1(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{104,1100},{124,1120}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_urban_6 lV_urban_6_2(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{80,1240},{100,1260}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_8(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{-120,0},{-100,20}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_urban_6 lV_urban_6_3(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{-140,100},{-120,120}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_urban_6 lV_urban_6_4(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{-180,180},{-160,200}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_9(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{-180,320},{-160,340}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_10(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{-200,480},{-180,500}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_urban_6 lV_urban_6_5(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{-212,652},{-192,672}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_urban_6 lV_urban_6_6(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{-198,988},{-178,1008}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_semiurb_5 lV_semiurb_5_11(
    smartMeterConfiguration=smartMeterConfiguration,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    development_scenario=development_scenario) annotation (Placement(transformation(extent={{-220,820},{-200,840}})));

  // ------------------------------------------------------------------------------------------
  //   Interface part
  // ------------------------------------------------------------------------------------------
  Basics.Interfaces.General.ControlBus            controlBus annotation (Placement(transformation(extent={{-10,-12},{10,8}})));

  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------
equation
  // Connect Interfaces
  connect(lV_semiurb_5_1.controlBus, controlBus.Subgrid_Semiurb5_1) annotation();
  connect(lV_semiurb_5_2.controlBus, controlBus.Subgrid_Semiurb5_2) annotation();
  connect(lV_semiurb_5_3.controlBus, controlBus.Subgrid_Semiurb5_3) annotation();
  connect(lV_semiurb_5_4.controlBus, controlBus.Subgrid_Semiurb5_4) annotation();
  connect(lV_semiurb_5_5.controlBus, controlBus.Subgrid_Semiurb5_5) annotation();
  connect(lV_semiurb_5_6.controlBus, controlBus.Subgrid_Semiurb5_6) annotation();
  connect(lV_semiurb_5_7.controlBus, controlBus.Subgrid_Semiurb5_7) annotation();
  connect(lV_semiurb_5_8.controlBus, controlBus.Subgrid_Semiurb5_8) annotation();
  connect(lV_semiurb_5_9.controlBus, controlBus.Subgrid_Semiurb5_9) annotation();
  connect(lV_semiurb_5_10.controlBus, controlBus.Subgrid_Semiurb5_10) annotation();
  connect(lV_semiurb_5_11.controlBus, controlBus.Subgrid_Semiurb5_11) annotation();
  connect(lV_semiurb_4_1.controlBus, controlBus.Subgrid_Semiurb4_1) annotation();
  connect(lV_urban_6_1.controlBus, controlBus.Subgrid_Urban6_1) annotation();
  connect(lV_urban_6_2.controlBus, controlBus.Subgrid_Urban6_2) annotation();
  connect(lV_urban_6_3.controlBus, controlBus.Subgrid_Urban6_3) annotation();
  connect(lV_urban_6_4.controlBus, controlBus.Subgrid_Urban6_4) annotation();
  connect(lV_urban_6_5.controlBus, controlBus.Subgrid_Urban6_5) annotation();
  connect(lV_urban_6_6.controlBus, controlBus.Subgrid_Urban6_6) annotation();

  // Connect Lines
  connect(line_31.epp_p, node_1.epp) annotation (Line(points={{16,-9},{3,-56}}));
  connect(line_31.epp_n, node_41.epp) annotation (Line(points={{22,-9},{41,42}}));
  connect(line_32.epp_p, node_41.epp) annotation (Line(points={{34,97},{41,42}}));
  connect(line_32.epp_n, node_42.epp) annotation (Line(points={{40,97},{53,154}}));
  connect(line_33.epp_p, node_42.epp) annotation (Line(points={{48,223},{53,154}}));
  connect(line_33.epp_n, node_43.epp) annotation (Line(points={{54,223},{53,282}}));
  connect(line_34.epp_p, node_43.epp) annotation (Line(points={{54,355},{53,282}}));
  connect(line_34.epp_n, node_44.epp) annotation (Line(points={{60,355},{53,414}}));
  connect(line_35.epp_p, node_44.epp) annotation (Line(points={{52,489},{53,414}}));
  connect(line_35.epp_n, node_45.epp) annotation (Line(points={{58,489},{55,552}}));
  connect(line_36.epp_p, node_45.epp) annotation (Line(points={{54,647},{55,552}}));
  connect(line_36.epp_n, node_46.epp) annotation (Line(points={{60,647},{53,726}}));
  connect(line_37.epp_p, node_46.epp) annotation (Line(points={{48,803},{53,726}}));
  connect(line_37.epp_n, node_47.epp) annotation (Line(points={{54,803},{49,862}}));
  connect(line_38.epp_p, node_47.epp) annotation (Line(points={{46,937},{49,862}}));
  connect(line_38.epp_n, node_48.epp) annotation (Line(points={{52,937},{45,994}}));
  connect(line_39.epp_p, node_48.epp) annotation (Line(points={{44,1055},{45,994}}));
  connect(line_39.epp_n, node_49.epp) annotation (Line(points={{50,1055},{43,1126}}));
  connect(line_40.epp_p, node_49.epp) annotation (Line(points={{42,1197},{43,1126}}));
  connect(line_40.epp_n, node_50.epp) annotation (Line(points={{48,1197},{41,1262}}));

  connect(line_41.epp_p, node_1.epp) annotation (Line(points={{-30,-11},{3,-56}}));
  connect(line_41.epp_n, node_51.epp) annotation (Line(points={{-24,-11},{-49,34}}));
  connect(line_42.epp_p, node_51.epp) annotation (Line(points={{-74,83},{-49,34}}));
  connect(line_42.epp_n, node_52.epp) annotation (Line(points={{-68,83},{-97,132}}));
  connect(line_43.epp_p, node_52.epp) annotation (Line(points={{-110,179},{-97,132}}));
  connect(line_43.epp_n, node_53.epp) annotation (Line(points={{-104,179},{-121,222}}));
  connect(line_44.epp_p, node_53.epp) annotation (Line(points={{-132,291},{-121,222}}));
  connect(line_44.epp_n, node_54.epp) annotation (Line(points={{-126,291},{-141,354}}));
  connect(line_45.epp_p, node_54.epp) annotation (Line(points={{-144,435},{-141,354}}));
  connect(line_45.epp_n, node_55.epp) annotation (Line(points={{-138,435},{-149,510}}));
  connect(line_46.epp_p, node_55.epp) annotation (Line(points={{-156,599},{-149,510}}));
  connect(line_46.epp_n, node_56.epp) annotation (Line(points={{-150,599},{-151,678}}));
  connect(line_47.epp_p, node_56.epp) annotation (Line(points={{-154,759},{-151,678}}));
  connect(line_47.epp_n, node_57.epp) annotation (Line(points={{-148,759},{-159,838}}));
  connect(line_48.epp_p, node_57.epp) annotation (Line(points={{-158,919},{-159,838}}));
  connect(line_48.epp_n, node_58.epp) annotation (Line(points={{-152,919},{-157,986}}));

  connect(simpleTransformerComplex.epp_n, node_1.epp) annotation (Line(
      points={{50,-119},{20,-119},{20,-56},{3,-56}},
      color={28,108,200},
      thickness=0.5));
  connect(simpleTransformerComplex.epp_p, epp) annotation (Line(
      points={{74,-119},{92,-119},{92,-104},{110,-104},{110,-120}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_1.epp, node_41.epp) annotation (Line(
      points={{70,40.8},{70,48},{52,48},{52,36},{40,36},{40,44},{32,44},{32,42},{41,42}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_2.epp, node_42.epp) annotation (Line(
      points={{116,142.8},{116,152},{64,152},{64,148},{52,148},{52,156},{44,156},{44,154},{53,154}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_3.epp, node_43.epp) annotation (Line(
      points={{90,280.8},{90,296},{44,296},{44,282},{53,282}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_4.epp, node_44.epp) annotation (Line(
      points={{110,400.8},{110,432},{52,432},{52,408},{53,408},{53,414}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_4_1.epp, node_45.epp) annotation (Line(
      points={{110,540.8},{110,572},{55,572},{55,552}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_5.epp, node_46.epp) annotation (Line(
      points={{110,720.8},{110,744},{44,744},{44,726},{53,726}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_6.epp, node_47.epp) annotation (Line(
      points={{110,840.8},{110,880},{48,880},{48,856},{49,856},{49,862}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_7.epp, node_48.epp) annotation (Line(
      points={{90,980.8},{90,1012},{44,1012},{44,988},{45,988},{45,994}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_1.epp, node_49.epp) annotation (Line(
      points={{114,1120.8},{114,1144},{43,1144},{43,1126}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_2.epp, node_50.epp) annotation (Line(
      points={{90,1260.8},{90,1276},{32,1276},{32,1262},{41,1262}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_8.epp, node_51.epp) annotation (Line(
      points={{-110,20.8},{-112,20.8},{-112,28},{-49,28},{-49,34}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_3.epp, node_52.epp) annotation (Line(
      points={{-130,120.8},{-132,120.8},{-132,128},{-108,128},{-108,124},{-97,124},{-97,132}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_4.epp, node_53.epp) annotation (Line(
      points={{-170,200.8},{-146,200.8},{-146,222},{-121,222}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_9.epp, node_54.epp) annotation (Line(
      points={{-170,340.8},{-172,340.8},{-172,348},{-141,348},{-141,354}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_10.epp, node_55.epp) annotation (Line(
      points={{-190,500.8},{-192,500.8},{-192,508},{-160,508},{-160,504},{-149,504},{-149,510}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_5.epp, node_56.epp) annotation (Line(
      points={{-202,672.8},{-204,672.8},{-204,680},{-164,680},{-164,672},{-151,672},{-151,678}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_6.epp, node_58.epp) annotation (Line(
      points={{-188,1008.8},{-188,1016},{-172,1016},{-172,980},{-157,980},{-157,986}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_11.epp, node_57.epp) annotation (Line(
      points={{-210,840.8},{-212,840.8},{-212,856},{-159,856},{-159,838}},
      color={28,108,200},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-36,42},{-40,38}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{60,-42},{54,-48}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-6,38},{-10,34}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{12,24},{8,20}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{20,4},{16,0}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{26,-14},{22,-18}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{30,-30},{26,-34}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{64,-42},{58,-48}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{0,-38},{-4,-42}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-38,-20},{-42,-24}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-58,22},{-62,18}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-56,-2},{-60,-6}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,-30},{-22,-34}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{20,-44},{16,-48}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{40,-44},{36,-48}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-36,40},{-10,36},{10,22},{18,2},{24,-16},{28,-32},{38,-46},{18,-46},{-2,-40},{-20,-32},{-40,-22},{-58,-4},{-60,20},{-52,30},{-52,38}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-38,40},{-48,34}},
          color={28,108,200},
          thickness=0.5),
        Text(
          extent={{-60,-100},{60,-120}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="%name
Urban MV Ring
"),     Line(
          points={{10,22},{20,28}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{46,38},{46,30},{54,30},{54,38},{46,38}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{44,36},{50,44},{56,36}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{22,38},{22,30},{30,30},{30,38},{22,38}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{20,36},{26,44},{32,36}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{34,30},{34,22},{42,22},{42,30},{34,30}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{32,28},{38,36},{44,28}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{34,46},{34,38},{42,38},{42,46},{34,46}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{32,44},{38,52},{44,44}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-86,-8},{-86,-16},{-78,-16},{-78,-8},{-86,-8}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-88,-10},{-82,-2},{-76,-10}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-74,-18},{-74,-26},{-66,-26},{-66,-18},{-74,-18}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-76,-20},{-70,-12},{-64,-20}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-46,-40},{-46,-48},{-38,-48},{-38,-40},{-46,-40}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-48,-42},{-42,-34},{-36,-42}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-58,-32},{-58,-40},{-50,-40},{-50,-32},{-58,-32}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-60,-34},{-54,-26},{-48,-34}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-62,-8},{-58,-4}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-42,-26},{-40,-22}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{18,56},{60,16}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{38,-46},{42,-46},{50,-46},{54,-46}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{-94,0},{-60,-34}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-66,-24},{-34,-56}},
          lineColor={28,108,200},
          lineThickness=0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=259200, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>Mit dem Parameter scenario k&ouml;nnen verschiedene Szenarien gew&auml;hlt werden.</p>
<p>Szenario <span style=\"color: #00aa00;\">Originales Szenario</span>: Originale Daten </p>
<p><br>Szenario <span style=\"color: #00aa00;\">High Simultaneity</span>: Temperatur f&uuml;r das gesamte Jahr um 10K gesenkt. LV_semiurb_4 hat in diesem Szenario 5 BEV Profile, LV_semiurb_5 und LV_urban_6 haben jeweils 10 BEV Profile. Es sind die ersten 5 bzw. 10 originale BEV Profile. Die h&ouml;her nummerierten BEV Profile sind Kopien dieser 5 bzw. 10 Originale. Das ist in jeder Datei in der 3.Zeile an der ID zu erkennen. </p>
<p><br>Szenario <span style=\"color: #00aa00;\">Kalte Dunkelflaute</span>: Temperatur f&uuml;r das gesamte Jahr um 10K gesenkt. Strahlungsintensit&auml;t(direkt und diffus) mit 0.3 skaliert. Windst&auml;rke mit 0.3 skaliert.</p>
</html>"));
end MV_urban_2_no_switch;
