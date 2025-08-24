within TransiEnt.Components.Electrical.Prosumer.Check;
model Check_Prosumer "Prosumer"

  extends TransiEnt.Basics.Icons.Checkmodel;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------

  constant String data_local="modelica://TransiEnt/Tables/distribution/LV_rural_1/normaleBedingungen/"
                          "Directory containing load profile data";

  // ----------------------------------------------------------------------------------------
  //   Components
  // ----------------------------------------------------------------------------------------

  inner TransiEnt.SimCenter simCenter
    annotation (Placement(transformation(extent={{-88,78},{-68,98}})));
  inner TransiEnt.ModelStatistics modelStatistics
    annotation (Placement(transformation(extent={{-50,78},{-30,98}})));

TransiEnt.Components.Electrical.Prosumer.Prosumer Prosumer(
    photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Limit_P,
    batteryControlType=TransiEnt.Basics.Types.ControlType.Limit_P,
    heatingControlType=TransiEnt.Basics.Types.ControlType.Limit_P,
    bevControlType=TransiEnt.Basics.Types.ControlType.Limit_P,
    data_local=data_local,
    tappingProfileName="TappingCycle_A_1",
    data_weatherLocation="Hamelin",
    data_weatherYear="2019",
    configuration="TAF7",
    loadProfileName="SFH4",
    loadProfileScaleP=6,
    loadProfileScaleQ=6,
    usePV=true,
    PV_peakPower=10848.4,
    useBattery=true,
    Bat_Capacity=34560000,
    Bat_PowerLimit=6000,
    Bat_SOCStart=1.0,
    useEHP=true,
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
    num_BEVs=2,
    bev_data={TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=0.5,
        Bat_PowerLimit=7200.0,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90()),TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_Data(
        id=2,
        Bat_PowerLimit=11000,
        Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3())}) annotation (Placement(transformation(extent={{-19.8,-19.73},{20,20}})));

  TransiEnt.Components.Boundaries.Electrical.ComplexPower.SlackBoundary_new
                                                                        ElectricGrid(
    v_n=400,
    isFrequencyRoot=true,                                                                       f_n=50) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={100,0})));

  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-66,8},{-54,20}})));
  Modelica.Blocks.Sources.Step step(height=1000, startTime=43200) annotation (Placement(transformation(extent={{-180,20},{-160,40}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=43200) annotation (Placement(transformation(extent={{-180,-40},{-160,-20}})));
  TransiEnt.Basics.Interfaces.General.ControlBus bevBus[2];
equation


  connect(Prosumer.epp, ElectricGrid.epp) annotation (Line(
      points={{0.1,-19.73},{0.1,-30},{0,-30},{0,-40},{70,-40},{70,0},{80,0}},
      color={28,108,200},
      thickness=0.5));
  connect(controlBus, Prosumer.controlBus) annotation (Line(
      points={{-100,0},{-26,0},{-26,0.135},{-19.8,0.135}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));

  for i in 1:2 loop
    connect(bevBus[i], controlBus.BEV[i]);
    connect(step.y, bevBus[i].P_limit);
    connect(booleanStep.y, bevBus[i].SignalActive);
  end for;

  connect(step.y, controlBus.BES.P_limit) annotation(Line(points={{-159,30},{-100,30},{-100,0}}));
  connect(step.y, controlBus.Heating.P_limit);
  connect(step.y, controlBus.PV.P_limit);
  connect(booleanStep.y, controlBus.BES.SignalActive) annotation(Line(points={{-159,-30},{-100,-30},{-100,0}}));
  connect(booleanStep.y, controlBus.Heating.SignalActive);
  connect(booleanStep.y, controlBus.PV.SignalActive);
  annotation (experiment(StopTime=259200, __Dymola_Algorithm="Dassl"));
end Check_Prosumer;
