within TransiEnt.Components.Electrical.Prosumer.Check;
model Check_Prosumer "Test Model for automated generatrion from CDB and Prosumer"

  extends TransiEnt.Basics.Icons.Checkmodel;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------

  constant String data_local=Modelica.Utilities.System.getEnvironmentVariable("cyentee_data_dir")
                          "Directory containing load profile data";

  // ----------------------------------------------------------------------------------------
  //   Components
  // ----------------------------------------------------------------------------------------

  inner TransiEnt.SimCenter simCenter
    annotation (Placement(transformation(extent={{-88,78},{-68,98}})));
  inner TransiEnt.ModelStatistics modelStatistics
    annotation (Placement(transformation(extent={{-50,78},{-30,98}})));

TransiEnt.Components.Electrical.Prosumer.Prosumer household_noController(
    data_local=data_local,
    tappingProfileName="LV_rural_1/TappingCycle_A_1",
    data_weatherLocation="Hamelin",
    data_weatherYear="2019",
    configuration="TAF10",
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
    bev_data={Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        useBEV=true,
        id=1,
        Bat_Capacity=132480000.0,
        Bat_SOCStart=0.5,
        Bat_PowerLimit=7200.0,
        Bev_type=Models_CyEntEE.CellModels.ElectricVehicle.Data.Renault_Zoe_R90()),Models_CyEntEE.CellModels.Data.Records.BEV_Data(
        id=2,
        Bat_PowerLimit=11000.0,
        Bev_type=Models_CyEntEE.CellModels.ElectricVehicle.Data.Renault_Zoe_R90())}) annotation (Placement(transformation(extent={{-19.8,-19.73},{20,20}})));

  TransiEnt.Components.Boundaries.Electrical.ComplexPower.SlackBoundary ElectricGrid(v_gen=400, f_n=50) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={100,0})));

  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-66,8},{-54,20}})));
equation

  connect(household_noController.epp, ElectricGrid.epp) annotation (Line(
      points={{0.1,-19.73},{0.1,-30},{0,-30},{0,-40},{70,-40},{70,0},{80,0}},
      color={28,108,200},
      thickness=0.5));
  connect(controlBus, household_noController.controlBus) annotation (Line(
      points={{-100,0},{-26,0},{-26,0.135},{-19.8,0.135}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end Check_Prosumer;
