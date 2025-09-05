within TransiEnt.Components.Electrical.Prosumer;
model Prosumer
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
//________________________________________________________________________________//
  extends TransiEnt.Basics.Icons.Household;
  import Modelica.Blocks.Types.Init;
  import TransiEnt.Basics.Types.ControlType;

  outer TransiEnt.SimCenter simCenter;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------

  // --- Electrical -------------------------------------------------------------------------

  parameter Modelica.Units.SI.ActivePower loadProfileScaleP(displayUnit="kW")
    annotation (Dialog(group="Electrical"));

  parameter Modelica.Units.SI.ReactivePower loadProfileScaleQ(displayUnit="kvar")
    annotation (Dialog(group="Electrical"));

  // --- PV ---------------------------------------------------------------------------------

  parameter Boolean usePV=true
    annotation (choices(__Dymola_checkBox=true), Dialog(group="Generation"));

  parameter Modelica.Units.SI.Power PV_peakPower(displayUnit="kW")=10000
    "peak power of PV plant" annotation (Dialog(enable=usePV, group="Generation"));

  parameter Modelica.Units.SI.Angle PV_slope(displayUnit="deg") = 10/180*Modelica.Constants.pi
    "slope of the tilted surface" annotation (Dialog(enable=usePV, group="Generation"));

  parameter Modelica.Units.SI.Angle PV_azimuth(displayUnit="deg") = 0/180*Modelica.Constants.pi
    "surface azimuth angle" annotation (Dialog(enable=usePV, group="Generation"));

  parameter Modelica.Units.SI.Power ApparentPowerMax=PV_peakPower/0.9
    "maximum apparent power of pv inverter"
    annotation (Dialog(enable=usePV, group="Generation"));

  parameter Boolean usePVSwitch=false annotation (Dialog(enable=usePV, group="Generation"));

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Internal
    "Type of control for PV"
    annotation (Dialog(enable=usePV, group="Generation"));

  // --- Storage ----------------------------------------------------------------------------

  parameter Boolean useBattery=true
    annotation (choices(__Dymola_checkBox=true), Dialog(group="Battery"));

  parameter Modelica.Units.SI.Energy Bat_Capacity(displayUnit="kWh")=20e3*3600
    "Battery Capacity" annotation (Dialog(enable=useBattery, group="Battery"));

  parameter Modelica.Units.SI.Power Bat_PowerLimit(displayUnit="kW") = PV_peakPower
    "Charge and discharge power" annotation (Dialog(enable=useBattery, group="Battery"));

  parameter Real Bat_SOCStart=0.5 "SOC at simulation start"
    annotation (Dialog(enable=useBattery, group="Battery"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Internal
    "Type of control for BES"
    annotation (Dialog(enable=useBattery, group="Battery"));

  // --- Heating System ---------------------------------------------------------------------

  parameter Boolean useEHP=true
    annotation (choices(__Dymola_checkBox=true), Dialog(group="Heating System"));

  parameter Modelica.Units.SI.HeatFlowRate Q_HP_nom=5e3 "nominal heat flow rate of heat pump"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.Volume V_BST(displayUnit="l") = 800
    "volume of buffer storage tank"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.Area A_living=240 "living area"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.Area A_wall=100 "area of exterior walls"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.Area A_window=40 "area of windows"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.Area A_roof=240 "area of rooftop"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.Area A_ground=240 "area of ground of house"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.Volume V_air=600 "Volume of air inside the house"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_wall=0.28
    "heat transfer coefficient of walls"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_window=1.30
    "heat transfer coefficient of windows"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_roof=0.20
    "heat transfer coefficient of rooftop"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_ground=0.35
    "heat transfer coefficient of ground of house"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter Modelica.Units.SI.HeatCapacity thermalMass=19e6 "total thermal mass of building"
    annotation (Dialog(enable=useEHP, group="Heating System"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Internal
    "Type of control for heating system"
    annotation (Evaluate=true, Dialog(enable=useEHP, group="Heating System"));

  parameter Boolean heatingBusActive=true
    "Activate heat pump control bus"
    annotation (Evaluate=true, Dialog(enable=useEHP, group="Heating System"));

  // --- Electric Vehicle--------------------------------------------------------------------

  parameter Integer num_BEVs=1 "number of BEVs"
  annotation (Dialog(group="Electric Vehicle"));

  TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data bev_data[num_BEVs]={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(id=1)} if (num_BEVs > 0) "Data of BEVs" annotation (Dialog(group="Electric Vehicle"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Internal
    "Type of control for BEVs"
    annotation (Evaluate=true, Dialog(enable=useEHP, group="Electric Vehicle"));

  // --- Controller -------------------------------------------------------------------------

  parameter Boolean useControlBus = true
    annotation(choices(__Dymola_checkBox=true), Dialog(group="Controller"));

  // --- Data -------------------------------------------------------------------------------

  parameter String data_local="" "path to simulation data" annotation (Dialog(group="Data"));

  constant String loadProfileName="" "name of load profile" annotation (Evaluate=true,Dialog(group="Data"));

  parameter String tappingProfileName="" "name of tapping profile"
    annotation (Evaluate=true,Dialog(group="Data"));

  parameter Modelica.Units.SI.Time data_timeOffset(displayUnit="h")=0
    annotation (Dialog(group="Data"));

  parameter String data_weatherLocation="" "name of load profile"
    annotation (Dialog(group="Data"));

  parameter String data_weatherYear="" "year of weather data in yyyy"
    annotation (Dialog(group="Data"));

  // --- Measuring --------------------------------------------------------------------------

  parameter Boolean manualConfiguration=false
    annotation (choices(__Dymola_checkBox=true), Dialog(group="Metering"));

  parameter String configuration = "Ideal" "choose the basic configuration" annotation (Dialog(group="Metering", enable=not manualConfiguration), choices(
      choice="Ideal" "Ideal measurements",
      choice="TAF10" "Tarifanwendungsfall 10 (German standard)",
      choice="TAF7" "Tarifanwendungsfall 7 (German standard)"));

  parameter Boolean useNoise=false "Activates Noise Generator"
    annotation (Dialog(group="Metering", enable=manualConfigurationn));
  parameter Boolean useDelay=false "Activates Delay Generator"
    annotation (Dialog(group="Metering", enable=manualConfiguration));
  parameter Modelica.Units.SI.PerUnit sigma_I=0.01 "Standard Deviation of the Current Sensor"
    annotation (Dialog(group="Metering", enable=manualConfiguration));
  parameter Modelica.Units.SI.PerUnit sigma_V=0.01 "Standard Deviation of the Voltage Sensor"
    annotation (Dialog(group="Metering", enable=manualConfiguration));
  parameter Modelica.Units.SI.PerUnit sigma_Delay=10 "Standard Deviation of the Voltage Sensor"
    annotation (Dialog(group="Metering", enable=manualConfiguration));
  parameter Integer samplePeriod=60 "Sample Period for the noise generator of the Smart Meter"
    annotation (Dialog(group="Metering", enable=manualConfiguration));
  parameter Integer maxDelay=60 "Maximum Delay Time"
    annotation (Dialog(group="Metering", enable=manualConfiguration));

  // --- Initialization ---------------------------------------------------------------------

  parameter Init initType=Init.NoInit
    "Type of initialization (1: no init, 2: steady state, others do not apply)"
    annotation (Evaluate=true, Dialog(group="Initialization"));

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------

  Basics.Interfaces.General.ControlBus controlBus                  annotation (Placement(transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-120,-20},{-80,20}})));

  // ----------------------------------------------------------------------------------------
  //   Components
  // ----------------------------------------------------------------------------------------

  // --- Controller -------------------------------------------------------------------------

  Storage.Electrical.Controller.BES_Controller        BES_Controller(
      Bat_PowerLimit=Bat_PowerLimit, controlType=batteryControlType)
    if useBattery
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));

  // --- Smart Meter ------------------------------------------------------------------------

  Sensors.SmartMeter smartMeter(
    useStandardConfiguration=not manualConfiguration,
    configuration=configuration,
    useNoise=useNoise,
    useDelay=useDelay,
    sigma_I=sigma_I,
    sigma_V=sigma_V,
    sigma_Delay=sigma_Delay,
    samplePeriod=samplePeriod,
    maxDelay=maxDelay)         annotation (Placement(transformation(extent={{-10,-78},{10,-58}})));

  // --- Load -------------------------------------------------------------------------------

  Boundaries.Electrical.ComplexPower.PQBoundary     inflexibleLoad(
    v_n=400,
    useInputConnectorP=true,
    useInputConnectorQ=true)
    annotation (Placement(transformation(extent={{-70,-76},{-50,-56}})));

  // --- Electric connection ----------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort  epp
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));

  // --- Battery ----------------------------------------------------------------------------

  Storage.Electrical.BatterySimple        batterySimple(
    Bat_Capacity=Bat_Capacity,
    Bat_SOCStart=Bat_SOCStart,
    Bat_PowerLimit=Bat_PowerLimit) if useBattery annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,0})));

  // --- PV ---------------------------------------------------------------------------------

  Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.PVPlantControllable PV(
    controlType=photovoltaicControlType,
    P_inst=PV_peakPower,
    slope=PV_slope,
    surfaceAzimuthAngle=PV_azimuth,
    useControlBus=useControlBus) if usePV annotation (Placement(transformation(extent={{-20,20},{0,40}})));

  // --- Heating ----------------------------------------------------------------------------

  Consumer.Heat.SpaceHeating.Heating     heating(
    Q_HP=Q_HP_nom,
    A_living=A_living,
    A_wall=A_wall,
    A_window=A_window,
    A_roof=A_roof,
    A_ground=A_ground,
    V_air=V_air,
    U_wall=U_wall,
    U_window=U_window,
    U_roof=U_roof,
    U_ground=U_ground,
    thermalMass=thermalMass,
    t_onOff_minOff=180,
    t_onOff_minOn=900,
    V_HS=V_BST,
    tappingProfilePath=data_local + "TappingCycles/" + tappingProfileName + ".txt",
    controlType=heatingControlType,
    busActive=heatingBusActive,
    initType=Modelica.Blocks.Types.Init.NoInit,
    heatpump(Power(useInputConnectorQ=false)))  if useEHP annotation (Placement(transformation(extent={{40,60},{60,80}})));

  // --- inverter ---------------------------------------------------------------------------

  // --- Electric Vehicle--------------------------------------------------------------------

  Consumer.Electrical.ElectricVehicle.BatteryElectricVehicle batteryElectricVehicle[num_BEVs](
    Capacity=bev_data[:].Bat_Capacity,
    SOC_initial=bev_data[:].Bat_SOCStart,
    P_nominal=bev_data[:].Bat_PowerLimit,
    Charger_Params=bev_data[:].Bev_type,
    each controlType=bevControlType) if num_BEVs > 0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-2})));

  // --- Data -------------------------------------------------------------------------------

  TransiEnt.Basics.Tables.Ambient.GenericTemperatureDataTableResource
                                                          genericTemperatureDataTableResource(
                                                                            fileName=data_local + "WeatherData/" + data_weatherLocation + "_" + data_weatherYear + "_Temp.txt") if usePV or useEHP annotation (Placement(transformation(extent={{-100,80},{-80,100}})));

  TransiEnt.Basics.Tables.Ambient.GenericDHIDNIDataTableResource genericDHIDNIDataTable(fileName_dir=data_local + "WeatherData/" + data_weatherLocation + "_" + data_weatherYear + "_Solar_Dir.txt", fileName_diff=data_local + "WeatherData/" + data_weatherLocation + "_" + data_weatherYear + "_Solar_Diff.txt") if usePV annotation (Placement(transformation(extent={{-100,50},{-80,70}})));

  TransiEnt.Basics.Tables.Ambient.GenericWindspeedDataTableResource genericWindspeedDataTable(fileName=data_local + "WeatherData/" + data_weatherLocation + "_" + data_weatherYear + "_Wind.txt") if usePV annotation (Placement(transformation(extent={{-100,20},{-80,40}})));

  TransiEnt.Basics.Tables.ElectricGrid.GenericLoadProfileDataTableResource table_LoadProfilePQ(
    powerScaleP=loadProfileScaleP,
    powerScaleQ=loadProfileScaleQ,
    fileName=data_local + "LoadProfiles/" + loadProfileName + ".txt") annotation (Placement(transformation(extent={{-94,-46},{-74,-26}})));

  TransiEnt.Basics.Tables.DrivingProfiles.GenericDrivingProfileDataTableResource table_Vehicle_V2[num_BEVs](fileName={data_local + "/VehicleData/BEV_Profile_" + String(bev_data[i].id) + ".txt" for i in 1:num_BEVs}) if num_BEVs > 0;

  // ----------------------------------------------------------------------------------------
  //   Variables
  // ----------------------------------------------------------------------------------------

  // ----------------------------------------------------------------------------------------
  //   Equation part
  // ----------------------------------------------------------------------------------------

  Modelica.Blocks.Sources.BooleanExpression BES_bool(y=useBattery) annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
  Modelica.Blocks.Sources.BooleanExpression EHP_bool(y=useEHP) annotation (Placement(transformation(extent={{-140,-120},{-120,-100}})));
  Modelica.Blocks.Sources.RealExpression Number_of_BEVs(y=num_BEVs) annotation (Placement(transformation(extent={{-140,-140},{-120,-120}})));
  Modelica.Blocks.Sources.RealExpression Battery_power(y=batterySimple.epp.P) if useBattery
                                                                              annotation (Placement(transformation(extent={{-140,-160},{-120,-140}})));
  Modelica.Blocks.Sources.RealExpression Battery_power1(y=epp.P)              if useBattery
                                                                              annotation (Placement(transformation(extent={{-140,0},{-120,20}})));
  Modelica.Blocks.Sources.BooleanExpression PV_bool(y=usePV) annotation (Placement(transformation(extent={{-140,-80},{-120,-60}})));
equation
  // iterate over all BEVs
  for i in 1:num_BEVs loop
    //connect to Vehicle Meter
    // Tables for Connection and SOC_Consumption
    connect(batteryElectricVehicle[i].isConnected, table_Vehicle_V2[i].isConnected);
    connect(batteryElectricVehicle[i].SOC_consumption, table_Vehicle_V2[i].SOC_Consumption);
    connect(batteryElectricVehicle[i].controlBus, controlBus.BEV[i]);
    connect(batteryElectricVehicle[i].epp, smartMeter.epp_a) annotation (Line(
      points={{40.2,-2},{16,-2},{16,-30},{-16,-30},{-16,-68},{-9.2,-68}},
      color={28,108,200},
      thickness=0.5));
  end for;

  // --- conditional connections ------------------------------------------------------------

  // External Controller Connections
  if useControlBus then
    // PV
   connect(controlBus.PV, PV.controlBus);

    // Battery
    if (batteryControlType == ControlType.Limit_P) then
      connect(controlBus.BES.P_limit, BES_Controller.P_BES) annotation();
      connect(controlBus.BES.SignalActive, BES_Controller.Signal_P_external) annotation();
    end if;

    if (batteryControlType == ControlType.External_P) then
      connect(controlBus.BES.P_external, BES_Controller.P_BES) annotation();
      connect(controlBus.BES.SignalActive, BES_Controller.Signal_P_external) annotation();
    end if;

    if (batteryControlType == ControlType.Priority) then
      connect(controlBus.BES.Signal_Priority_Charge, BES_Controller.Signal_Priority_Charge) annotation();
      connect(controlBus.BES.Signal_Priority_Discharge, BES_Controller.Signal_Priority_Discharge) annotation();
    end if;

    // Heating
    if heatingBusActive then
      connect(controlBus.Heating, heating.controlBus);
    end if;
    // Outputs
    connect(smartMeter.controlBus, controlBus.Meter) annotation();
    connect(batterySimple.P_max, controlBus.BES.P_max) annotation();
    connect(Battery_power.y, controlBus.BES.P) annotation (Line(points={{-119,-150},{-108,-150},{-108,-80},{-102,-80},{-102,-22},{-100,-22},{-100,0}},
                                                                                                                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  end if;

  // Internal Controller Connections

  // --- normal connections -----------------------------------------------------------------

  connect(genericDHIDNIDataTable.direct, PV.DNI_in) annotation (Line(points={{-81.2,64},{-72,64},{-72,32.4},{-22,32.4}},
                                                                                                                  color={0,0,127}));
  connect(genericDHIDNIDataTable.diffuse, PV.DHI_in) annotation (Line(points={{-81.2,56},{-32,56},{-32,27.4},{-22,27.4}},
                                                                                                               color={0,0,127}));
  connect(genericWindspeedDataTable.value, PV.WindSpeed_in) annotation (Line(points={{-80,29.8},{-36,29.8},{-36,22},{-22,22}},   color={0,0,127}));
  connect(smartMeter.epp_b, epp) annotation (Line(
      points={{9.2,-68},{9.2,-84},{0,-84},{0,-100}},
      color={0,127,0},
      thickness=0.5));
  connect(inflexibleLoad.epp, smartMeter.epp_a) annotation (Line(
      points={{-70,-66},{-74,-66},{-74,-80},{-30,-80},{-30,-68},{-9.2,-68}},
      color={28,108,200},
      thickness=0.5));
  connect(BES_Controller.P_BES_out, batterySimple.P_set) annotation (Line(
      points={{-40,0},{-40,-16},{-28,-16},{-28,-10.6}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(BES_bool.y, controlBus.Configuration.BESActive) annotation (Line(points={{-119,-90},{-116,-90},{-116,-24},{-144,-24},{-144,0},{-100,0}},
                                                                                                                      color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EHP_bool.y, controlBus.Configuration.HeatingActive) annotation (Line(points={{-119,-110},{-104,-110},{-104,-24},{-100,-24},{-100,0}},
                                                                                                                            color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Number_of_BEVs.y, controlBus.Configuration.BEVNumber) annotation (Line(points={{-119,-130},{-112,-130},{-112,-24},{-100,-24},{-100,0}},
                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PV.epp, smartMeter.epp_a) annotation (Line(
      points={{-0.7,29.4},{4,29.4},{4,-30},{-16,-30},{-16,-68},{-9.2,-68}},
      color={28,108,200},
      thickness=0.5));

  connect(table_LoadProfilePQ.P, inflexibleLoad.P_el_set) annotation (Line(
      points={{-75.2,-32},{-66,-32},{-66,-55}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(table_LoadProfilePQ.Q, inflexibleLoad.Q_el_set) annotation (Line(
      points={{-75.2,-40},{-54,-40},{-54,-55}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(heating.epp, smartMeter.epp_a) annotation (Line(
      points={{58.5714,62.8571},{58.5714,12},{4,12},{4,-30},{-16,-30},{-16,-68},{-9.2,-68}},
      color={28,108,200},
      thickness=0.5));
  connect(batterySimple.epp, smartMeter.epp_a) annotation (Line(
      points={{-30,0},{-34,0},{-34,-68},{-9.2,-68}},
      color={28,108,200},
      thickness=0.5));

  connect(genericTemperatureDataTableResource.Kelvin, heating.T_amb) annotation (Line(points={{-81,93},{34,93},{34,75.7143},{40.8571,75.7143}}, color={0,0,127}));
  connect(genericTemperatureDataTableResource.Celsius, PV.T_in) annotation (Line(points={{-81,87},{-30,87},{-30,38},{-22,38}}, color={0,0,127}));
  connect(BES_Controller.P_smartMeter, Battery_power1.y) annotation (Line(points={{-62,8},{-116,8},{-116,10},{-119,10}}, color={0,127,127}));
  connect(PV_bool.y, controlBus.Configuration.PVActive) annotation (Line(points={{-119,-70},{-114,-70},{-114,-26},{-124,-26},{-124,0},{-100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The purpose of this model is to combine different technological features of modern residential households into one Prosumer model. The model main components are:</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">TransiEnt.Components.Sensors.SmartMeter : A model for generating realistic measurements/information outputs of Smart Meters.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">TransiEnt.Storage.Electrical.BatterySimple: A model for household battery electric storage systems.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">TransiEnt.Consumer.Electrical.ElectricVehicle.BatteryElectricVehicle: A model for a Battery Electric Vehicle and its behaviour when charging with non-public charging infrastructure (wallboxes)</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">TransiEnt.Consumer.Heat.SpaceHeating.Heating: A model for the building heating combining a dynamic heat loss model dependent on the households dimensions, an electric heatpump and an electrical heater rod.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.PVPlantControllable: A photovoltaic power plant with controllable reactive behaviour.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">TransiEnt.Components.Boundaries.Electrical.ComplexPower.PQBoundary_new: A PQ boundary to represent inflexible load profiles within a complex RMS grid simulation.</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Please have a further look in the subcomponents.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Please have a further look in the subcomponents.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">controlBus</span></b> for input and output parameters regarding power setpoints, limitations and measurements.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">See parameter and variable descriptions in the code.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Please have a further look in the subcomponents.</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p>Choose the configuration of the subcomponents for your purpose.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p>Please have a further look in the subcomponents.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><code>[1] </code>T. Steffen, B. Wiegel, D. Babazadeh, A. Youssfi, C. Becker and V. Turau, &quot;Generation of realistic Smart Meter Data from Prosumers for future energy system scenarios,&quot; <i>NEIS 2022; Conference on Sustainable Energy Supply and Energy Storage Systems</i>, Hamburg, Germany, 2022, pp. 1-6. </p>
<p><code>[2]</code> B. Wiegel, T. Steffen, D. Babazadeh and C. Becker, &quot;Towards a more comprehensive open-source model for interdisciplinary smart integrated energy systems,&quot; <i>2023 11th Workshop on Modelling and Simulation of Cyber-Physical Energy Systems (MSCPES)</i>, San Antonio, TX, USA, 2023, pp. 1-7, doi: 10.1109/MSCPES58582.2023.10123432.</p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<pre>Added by Tom Steffen and B&eacute;la Wiegel, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</pre>
</html>"));
end Prosumer;
