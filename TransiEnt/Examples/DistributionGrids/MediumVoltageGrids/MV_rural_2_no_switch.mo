within TransiEnt.Examples.DistributionGrids.MediumVoltageGrids;
model MV_rural_2_no_switch "Rural medium voltage distribution grid scenario with variable technology penetration scenario."
  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------



  parameter String development_scenario="Intermediate" annotation (choices(
      choice="Today" "Today",
      choice="Intermediate" "Intermediate",
      choice="Future" "Future"), Dialog(group="Scenario choice"));

  parameter String weatherLocation="Aldersbach" annotation (Dialog(group="Scenario choice"));

  parameter String weatherYear="2024" annotation (Dialog(group="Scenario choice"));

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Limit_P "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Limit_P "Type of control for battery system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Limit_P "Type of control for heating system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Limit_P "Type of control for vehicle system" annotation (Evaluate=true, Dialog(group="External Control"));

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

  TransiEnt.Components.Electrical.Grid.Node node_1(epp(v(start=20000))) annotation (Placement(transformation(extent={{24.48,24.33},{29.48,29.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_14(epp(v(start=20000))) annotation (Placement(transformation(extent={{-10.52,45.33},{-5.52,50.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_13(epp(v(start=20000))) annotation (Placement(transformation(extent={{-148.52,192.33},{-143.52,197.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_12(epp(v(start=20000))) annotation (Placement(transformation(extent={{-227.52,276.33},{-222.52,281.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_11(epp(v(start=20000))) annotation (Placement(transformation(extent={{-353.52,430.33},{-348.52,435.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_2(epp(v(start=20000))) annotation (Placement(transformation(extent={{-45.52,31.33},{-40.52,36.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_3(epp(v(start=20000))) annotation (Placement(transformation(extent={{-136.52,87.33},{-131.52,92.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_4(epp(v(start=20000))) annotation (Placement(transformation(extent={{-330.52,171.33},{-325.52,176.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_5(epp(v(start=20000))) annotation (Placement(transformation(extent={{-430.52,206.33},{-425.52,211.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_6(epp(v(start=20000))) annotation (Placement(transformation(extent={{-591.52,255.33},{-586.52,260.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_7(epp(v(start=20000))) annotation (Placement(transformation(extent={{-773.52,318.33},{-768.52,323.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_8(epp(v(start=20000))) annotation (Placement(transformation(extent={{-829.52,360.33},{-824.52,365.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_9(epp(v(start=20000))) annotation (Placement(transformation(extent={{-892.52,444.33},{-887.52,449.33}})));
  TransiEnt.Components.Electrical.Grid.Node node_10(epp(v(start=20000))) annotation (Placement(transformation(extent={{-731.52,549.33},{-726.52,554.33}})));

  // ---- Lines (between nodes) ---------------------------------------------------------------

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph Line_1(
    r=0.000443,
    x=0.000132,
    b=596.903000023e-9,
    i_n=220,
    length=300.000000,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{6.98,34.83},{11.98,39.83}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph Line_2(
    r=0.000443,
    x=0.000132,
    b=596.903000023e-9,
    i_n=220,
    length=250.000000,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-80.52,118.83},{-75.52,123.83}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_43(
    r=0.000443,
    x=0.000132,
    b=596.903000023e-9,
    i_n=220,
    length=200,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-189.02,234.33},{-184.02,239.33}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_44(
    r=8.342e-4,
    x=3.82e-4,
    b=287.456e-9,
    i_n=170,
    length=4200,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-290.52,353.33},{-285.52,358.33}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_53(
    r=0.000443,
    x=0.000132,
    b=596.903000023e-9,
    i_n=220,
    length=700,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-511.02,230.83},{-506.02,235.83}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_54(
    r=0.000443,
    x=0.000132,
    b=596.903000023e-9,
    i_n=220,
    length=3400,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-682.52,286.83},{-677.52,291.83}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_55(
    r=0.000443,
    x=0.000132,
    b=596.903000023e-9,
    i_n=220,
    length=1700,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-801.52,339.33},{-796.52,344.33}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_56(
    r=0.000443,
    x=0.000132,
    b=596.903000023e-9,
    i_n=220,
    length=500,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-861.02,402.33},{-856.02,407.33}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_142(
    r=8.342e-4,
    x=3.82e-4,
    b=287.456e-9,
    i_n=170,
    length=400,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-542.52,489.83},{-537.52,494.83}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_49(
    r=2.53e-4,
    x=1.19e-4,
    b=722.566e-9,
    i_n=283,
    length=400,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-10.52,21.83},{-5.52,26.83}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_50(
    r=8.342e-4,
    x=3.82e-4,
    b=287.456e-9,
    i_n=170,
    length=2700,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-91.02,59.33},{-86.02,64.33}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_51(
    r=8.342e-4,
    x=3.82e-4,
    b=287.456e-9,
    i_n=170,
    length=400,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-234.52,129.33},{-229.52,134.33}})));

  TransiEnt.Components.Electrical.Grid.PiModelComplexEfficient3ph line_52(
    r=8.342e-4,
    x=3.82e-4,
    b=287.456e-9,
    i_n=170,
    length=5000,
    epp_p(v(start=20000)),
    epp_n(v(start=20000))) annotation (Placement(transformation(extent={{-381.52,188.83},{-376.52,193.83}})));

  // ---- Transformer node --------------------------------------------------------------------
  TransiEnt.Components.Electrical.PowerTransformation.SimpleTransformerComplex simpleTransformerComplex(UseRatio=true, ratio=5.5) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={80,40})));
  // ---- Subcells ----------------------------------------------------------------------------

  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_1 lV_rural_1_1(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-138,330},{-80,388}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_1 lV_rural_1_2(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-28,258},{30,316}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_1 lV_rural_1_3(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{58,154},{116,212}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_1 lV_rural_1_4(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-336,-62},{-278,-4}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_1 lV_rural_1_5(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-800,144},{-740,204}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_1 lV_rural_1_6(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-972,200},{-910,262}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_1 lV_rural_1_8(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-1088,274},{-1024,338}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_2 lV_rural_2_1(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-638,38},{-578,98}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_2 lV_rural_2_2(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-1078,414},{-1018,474}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_2 lV_rural_2_3(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{-256,-152},{-196,-92}})));

  // ---- Commercial Components ---------------------------------------------------------------
  TransiEnt.Producer.Electrical.Wind.Windturbine windturbine_1700kW(
    P_el_n(displayUnit="MW") = 1700000,
    redeclare TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp,
    beta_start=0) annotation (Placement(transformation(extent={{-800,668},{-738,726}})));
  Basics.Tables.Ambient.GenericWindspeedDataTableResource table_Wind(fileName="modelica://TransiEnt/Tables/distribution/WeatherData/Hamelin_2019_Wind.txt") annotation (Placement(transformation(extent={{-954,670},{-896,728}})));
  TransiEnt.Producer.Electrical.Wind.Windturbine windturbine_4000kW(
    P_el_n(displayUnit="MW") = 4000000,
    redeclare TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp,
    beta_start=0) annotation (Placement(transformation(extent={{-434,542},{-372,600}})));
  TransiEnt.Producer.Electrical.Wind.Windturbine windturbine_2000kW(
    P_el_n(displayUnit="MW") = 2000000,
    redeclare TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp,
    beta_start=0) annotation (Placement(transformation(extent={{-168,-228},{-106,-170}})));
  Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.PVPlantControllable pVPlantControllable(P_inst=125000) annotation (Placement(transformation(extent={{-592,-62},{-538,-8}})));
  Basics.Tables.ElectricGrid.GenericLoadProfileDataTableResource table_LoadProfile_G3_A(
    powerScaleP=225700,
    powerScaleQ=89100,
    fileName="modelica://TransiEnt/Tables/distribution//CommercialLoadProfiles/G3-A.txt") annotation (Placement(transformation(
        extent={{-24,-23},{24,23}},
        rotation=180,
        origin={76,-255})));
  Components.Boundaries.Electrical.ComplexPower.PQBoundary_new LoadProfile_G3_A(
    v_n=20000,
    useInputConnectorP=true,
    useInputConnectorQ=true) annotation (Placement(transformation(
        extent={{-28,-26},{28,26}},
        rotation=180,
        origin={-8,-182})));
  Basics.Tables.ElectricGrid.GenericLoadProfileDataTableResource table_LoadProfile_L2_M(
    powerScaleP=343400,
    powerScaleQ=135600,
    fileName="modelica://TransiEnt/Tables/distribution/CommercialLoadProfiles/L2-M.txt") annotation (Placement(transformation(
        extent={{-24,-23},{24,23}},
        rotation=180,
        origin={-744,483})));
  Components.Boundaries.Electrical.ComplexPower.PQBoundary_new LoadProfile_L2_M(
    v_n=20000,
    useInputConnectorP=true,
    useInputConnectorQ=true) annotation (Placement(transformation(
        extent={{-28,-26},{28,26}},
        rotation=180,
        origin={-828,556})));

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------
  Scenarios_CyEntEE.MV_Grids.Bus.MVGridControlBus controlBus annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  // ------------------------------------------------------------------------------------------
  //   Equation part
  // ------------------------------------------------------------------------------------------
  Basics.Tables.Ambient.GenericTemperatureDataTableResource genericTemperatureDataTableResource(fileName=ModelicaServices.ExternalReferences.loadResource("modelica://TransiEnt/Tables/distribution/WeatherData/Hamelin_2019_Temp.txt")) annotation (Placement(transformation(extent={{-700,-20},{-680,0}})));
  Basics.Tables.Ambient.GenericDHIDNIDataTableResource genericDHIDNIDataTableResource(fileName_dir=ModelicaServices.ExternalReferences.loadResource("modelica://TransiEnt/Tables/distribution/WeatherData/Hamelin_2019_Solar_Dir.txt"), fileName_diff=ModelicaServices.ExternalReferences.loadResource("modelica://TransiEnt/Tables/distribution/WeatherData/Hamelin_2019_Solar_Diff.txt")) annotation (Placement(transformation(extent={{-700,-60},{-680,-40}})));
equation
  // ---- Connect Interfaces ------------------------------------------------------------------
  connect(lV_rural_1_1.controlBus, controlBus.Subgrid_Rural1_1) annotation();
  connect(lV_rural_1_2.controlBus, controlBus.Subgrid_Rural1_2) annotation();
  connect(lV_rural_1_3.controlBus, controlBus.Subgrid_Rural1_3) annotation();
  connect(lV_rural_1_4.controlBus, controlBus.Subgrid_Rural1_4) annotation();
  connect(lV_rural_1_5.controlBus, controlBus.Subgrid_Rural1_5) annotation();
  connect(lV_rural_1_6.controlBus, controlBus.Subgrid_Rural1_6) annotation();
  connect(lV_rural_1_8.controlBus, controlBus.Subgrid_Rural1_7) annotation();
  connect(lV_rural_2_1.controlBus, controlBus.Subgrid_Rural2_1) annotation();
  connect(lV_rural_2_2.controlBus, controlBus.Subgrid_Rural2_2) annotation();
  connect(lV_rural_2_3.controlBus, controlBus.Subgrid_Rural2_3) annotation();

  // ---- Connect lines -----------------------------------------------------------------------

  connect(Line_1.epp_p, node_1.epp) annotation (Line(points={{6.98,37.33},{26.98,24.33}}));
  connect(Line_1.epp_n, node_14.epp) annotation (Line(points={{11.98,37.33},{-8.02,45.33}}));
  connect(Line_2.epp_p, node_14.epp) annotation (Line(points={{-80.52,121.33},{-8.02,45.33}}));
  connect(Line_2.epp_n, node_13.epp) annotation (Line(points={{-75.52,121.33},{-146.02,192.33}}));
  connect(line_43.epp_p, node_13.epp) annotation (Line(points={{-189.02,236.83},{-146.02,192.33}}));
  connect(line_43.epp_n, node_12.epp) annotation (Line(points={{-184.02,236.83},{-225.02,276.33}}));
  connect(line_44.epp_p, node_12.epp) annotation (Line(points={{-290.52,355.83},{-225.02,276.33}}));
  connect(line_44.epp_n, node_11.epp) annotation (Line(points={{-285.52,355.83},{-351.02,430.33}}));
  connect(line_53.epp_p, node_5.epp) annotation (Line(points={{-511.02,233.33},{-428.02,206.33}}));
  connect(line_53.epp_n, node_6.epp) annotation (Line(points={{-506.02,233.33},{-589.02,255.33}}));
  connect(line_54.epp_p, node_6.epp) annotation (Line(points={{-682.52,289.33},{-589.02,255.33}}));
  connect(line_54.epp_n, node_7.epp) annotation (Line(points={{-677.52,289.33},{-771.02,318.33}}));
  connect(line_55.epp_p, node_7.epp) annotation (Line(points={{-801.52,341.83},{-771.02,318.33}}));
  connect(line_55.epp_n, node_8.epp) annotation (Line(points={{-796.52,341.83},{-827.02,360.33}}));
  connect(line_56.epp_p, node_8.epp) annotation (Line(points={{-861.02,404.83},{-827.02,360.33}}));
  connect(line_56.epp_n, node_9.epp) annotation (Line(points={{-856.02,404.83},{-890.02,444.33}}));
  connect(line_142.epp_p, node_11.epp) annotation (Line(points={{-542.52,492.33},{-351.02,430.33}}));
  connect(line_142.epp_n, node_10.epp) annotation (Line(points={{-537.52,492.33},{-729.02,549.33}}));
  connect(line_50.epp_p, node_2.epp) annotation (Line(points={{-91.02,61.83},{-43.02,31.33}}));
  connect(line_50.epp_n, node_3.epp) annotation (Line(points={{-86.02,61.83},{-134.02,87.33}}));
  connect(line_51.epp_p, node_3.epp) annotation (Line(points={{-234.52,131.83},{-134.02,87.33}}));
  connect(line_51.epp_n, node_4.epp) annotation (Line(points={{-229.52,131.83},{-328.02,171.33}}));
  connect(line_52.epp_p, node_4.epp) annotation (Line(points={{-381.52,191.33},{-328.02,171.33}}));
  connect(line_52.epp_n, node_5.epp) annotation (Line(points={{-376.52,191.33},{-428.02,206.33}}));

  // ---- Connect households to nodes ---------------------------------------------------------

  // ---- Connect transformer to node ---------------------------------------------------------

  connect(lV_rural_1_4.epp, node_3.epp) annotation (Line(
      points={{-307,-1.68},{-134.02,-1.68},{-134.02,87.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_5.epp, node_6.epp) annotation (Line(
      points={{-770,206.4},{-589.02,206.4},{-589.02,255.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_6.epp, node_7.epp) annotation (Line(
      points={{-941,264.48},{-771.02,264.48},{-771.02,318.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_8.epp, node_8.epp) annotation (Line(
      points={{-1056,340.56},{-827.02,340.56},{-827.02,360.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_2_1.epp, node_5.epp) annotation (Line(
      points={{-608,100.4},{-464,100.4},{-464,206.33},{-428.02,206.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_2_2.epp, node_9.epp) annotation (Line(
      points={{-1048,476.4},{-912,476.4},{-912,464},{-890.02,464},{-890.02,444.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_2_3.epp, node_2.epp) annotation (Line(
      points={{-226,-89.6},{-106,-89.6},{-106,34},{-74,34},{-74,31.33},{-43.02,31.33}},
      color={28,108,200},
      thickness=0.5));
  connect(line_49.epp_n, node_1.epp) annotation (Line(
      points={{-5.52,24.33},{26.98,24.33}},
      color={28,108,200},
      thickness=0.5));
  connect(line_49.epp_p, node_2.epp) annotation (Line(
      points={{-10.52,24.33},{-10.52,31.33},{-43.02,31.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_1.epp, node_12.epp) annotation (Line(
      points={{-109,390.32},{-64,390.32},{-64,276.33},{-225.02,276.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_2.epp, node_13.epp) annotation (Line(
      points={{1,318.32},{48,318.32},{48,192.33},{-146.02,192.33}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_3.epp, node_14.epp) annotation (Line(
      points={{87,214.32},{136,214.32},{136,136},{-8.02,136},{-8.02,45.33}},
      color={28,108,200},
      thickness=0.5));
  connect(table_Wind.value, windturbine_1700kW.v_wind) annotation (Line(points={{-896,698.42},{-824,698.42},{-824,714.69},{-796.59,714.69}}, color={0,0,127}));
  connect(table_Wind.value, windturbine_4000kW.v_wind) annotation (Line(points={{-896,698.42},{-778,698.42},{-778,788},{-410,788},{-410,588.69},{-430.59,588.69}}, color={0,0,127}));
  connect(table_Wind.value, windturbine_2000kW.v_wind) annotation (Line(points={{-896,698.42},{-898,698.42},{-898,844},{-860,844},{-860,952},{-1252,952},{-1252,-181.31},{-164.59,-181.31}}, color={0,0,127}));
  connect(pVPlantControllable.WindSpeed_in, windturbine_2000kW.v_wind) annotation (Line(points={{-597.4,-56.6},{-597.4,-181.31},{-164.59,-181.31}}, color={0,0,127}));
  connect(LoadProfile_L2_M.epp, node_10.epp) annotation (Line(
      points={{-800,556},{-744,556},{-744,549.33},{-729.02,549.33}},
      color={28,108,200},
      thickness=0.5));
  connect(node_1.epp, simpleTransformerComplex.epp_n) annotation (Line(
      points={{26.98,24.33},{60,24.33},{60,40}},
      color={28,108,200},
      thickness=0.5));
  connect(LoadProfile_G3_A.epp, simpleTransformerComplex.epp_n) annotation (Line(
      points={{20,-182},{60,-182},{60,40}},
      color={28,108,200},
      thickness=0.5));
  connect(epp, simpleTransformerComplex.epp_p) annotation (Line(
      points={{100,0},{100,40}},
      color={28,108,200},
      thickness=0.5));
  connect(node_4.epp, pVPlantControllable.epp) annotation (Line(
      points={{-328.02,171.33},{-328.02,16},{-512,16},{-512,-36.62},{-539.89,-36.62}},
      color={28,108,200},
      thickness=0.5));
  connect(windturbine_2000kW.epp, simpleTransformerComplex.epp_n) annotation (Line(
      points={{-109.1,-178.7},{-112,-178.7},{-112,-128},{60,-128},{60,40}},
      color={28,108,200},
      thickness=0.5));
  connect(table_LoadProfile_G3_A.P, LoadProfile_G3_A.P_el_set) annotation (Line(
      points={{54.88,-264.2},{8.8,-264.2},{8.8,-210.6}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(table_LoadProfile_G3_A.Q, LoadProfile_G3_A.Q_el_set) annotation (Line(
      points={{54.88,-245.8},{-24.8,-245.8},{-24.8,-210.6}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(table_LoadProfile_L2_M.Q, LoadProfile_L2_M.Q_el_set) annotation (Line(
      points={{-765.12,492.2},{-844.8,492.2},{-844.8,527.4}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(table_LoadProfile_L2_M.P, LoadProfile_L2_M.P_el_set) annotation (Line(
      points={{-765.12,473.8},{-811.2,473.8},{-811.2,527.4}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(node_11.epp, windturbine_4000kW.epp) annotation (Line(
      points={{-351.02,430.33},{-351.02,591.3},{-375.1,591.3}},
      color={28,108,200},
      thickness=0.5));
  connect(node_10.epp, windturbine_1700kW.epp) annotation (Line(
      points={{-729.02,549.33},{-729.02,717.3},{-741.1,717.3}},
      color={28,108,200},
      thickness=0.5));
  connect(genericDHIDNIDataTableResource.direct, pVPlantControllable.DNI_in) annotation (Line(points={{-681.2,-46},{-624,-46},{-624,-28.52},{-597.4,-28.52}}, color={0,0,127}));
  connect(genericDHIDNIDataTableResource.diffuse, pVPlantControllable.DHI_in) annotation (Line(points={{-681.2,-54},{-616,-54},{-616,-42.02},{-597.4,-42.02}}, color={0,0,127}));
  connect(genericTemperatureDataTableResource.Celsius, pVPlantControllable.T_in) annotation (Line(points={{-681,-13},{-672,-13.4},{-597.4,-13.4}}, color={0,0,127}));
  annotation (
    experiment(
      StartTime=17280000,
      StopTime=172886400,
      __Dymola_Algorithm="Cvode"),
    Documentation(info="<html>
<p>Mit dem Parameter <span style=\"color: #0000ff;\">development_scenario</span> k&ouml;nnen folgende Szenarien f&uuml;r Entwicklungen gew&auml;hlt werden:</p>
<p><br><span style=\"color: #0000ff;\">Today</span>: heutige Stand der Verteilung von PVs, Batteriespeichern, W&auml;rmepumpen und BEVs in den Netzen (In der Datenbank als Szenario T)</p>
<p><br><span style=\"color: #0000ff;\">Intermediate</span>: Stand der Verteilung von PVs, Batteriespeichern, W&auml;rmepumpen und BEVs in den Netzen zwischen Today und Future (In der Datenbank als Szenario I)</p>
<p><br><span style=\"color: #0000ff;\">Future</span>: Stand der Verteilung von PVs, Batteriespeichern, W&auml;rmepumpen und BEVs bei vollst&auml;ndig erreichter Energiewende (In der Datenbank als Szenario A)</p>
<p><br>Durch die Auswahl des <span style=\"color: #0000ff;\">development_scenario</span> wird in dem LV Netz eines der entsprechend definierten LV_..._T/I/A ausgew&auml;hlt. Die anderen beiden werden unwirksam.</p>
<p><br>Mit dem Parameter <span style=\"color: #00aa00;\">condition_scenario</span> k&ouml;nnen folgende Szenarien f&uuml;r Bedingungen gew&auml;hlt werden:</p>
<p><br><span style=\"color: #00aa00;\">Normale Bedingungen</span>: Originale Daten </p>
<p><br><span style=\"color: #00aa00;\">High Simultaneity</span>: Temperatur f&uuml;r das gesamte Jahr um 10K gesenkt. Zudem gibt es eine hohe Gleichzeitigkeit in den BEV Profilen. LV_rural_1 hat in diesem Szenario 5 unterschiedliche BEV Profile, LV_rural_2 hat 10 unterschiedliche. Es sind die ersten 5 bzw. 10 originale BEV Profile. Die h&ouml;her nummerierten BEV Profile sind Kopien dieser 5 bzw. 10 Originale. Das ist in jeder Datei in der 3.Zeile an der ID zu erkennen.</p>
<p><br><span style=\"color: #00aa00;\">Kalte Dunkelflaute</span>: Temperatur f&uuml;r das gesamte Jahr um 10K gesenkt. Strahlungsintensit&auml;t(direkt und diffus) mit 0.3 skaliert. Windst&auml;rke mit 0.3 skaliert.</p>
</html>"),
    Icon(graphics={
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
          extent={{-100,-100},{100,-140}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="%name
Rural MV Ring
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
          lineThickness=0.5)}));
end MV_rural_2_no_switch;
