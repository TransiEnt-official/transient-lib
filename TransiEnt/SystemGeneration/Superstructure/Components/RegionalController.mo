within TransiEnt.SystemGeneration.Superstructure.Components;
model RegionalController "Dummy regional Model for \"local\" controling"
  //________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.0                             //
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
// Gas- und Wärme-Institut Essen                                                  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________
  extends TransiEnt.Basics.Icons.SuperstructureIcon;

  // _____________________________________________
  //
  //              General Parameters
  // _____________________________________________
  parameter Integer Region=1 "Define Region Number";

  parameter Integer DifferentTypesOfPowerPlants "0 to x";
  parameter Integer DifferentTypesOfPowerToGasPlants "0 or 1";
  parameter Integer DifferentTypesOfGasStorage "0 or 1";

  parameter Boolean PowerPlantsInThisRegion=if DifferentTypesOfPowerPlants > 0 then true else false "true, if power plants exist in region";
  parameter Boolean PowerToGasPlantsInThisRegion=if DifferentTypesOfPowerToGasPlants > 0 then true else false "true, if power to gas plants exist in region";
  parameter Boolean GasStorageInThisRegion=if DifferentTypesOfGasStorage > 0 then true else false "true, if gas storages exist in region";

  //Gas Grid
  parameter Modelica.Units.SI.Pressure p_gasGrid_desired=simCenter.p_amb_const + simCenter.p_eff_2 "desired gas grid pressure in region" annotation (Dialog(group="GasGrid"));
  parameter Modelica.Units.SI.PressureDifference p_gasGrid_desired_bandwidth=0 "band width around p_gasGrid_desired in which the set value varies depending on the SOC of the gas storage" annotation (Dialog(group="GasGrid"));

  //CCS
  final parameter Boolean ptGTypeIsMethanation=if PowerToGasPlantsInThisRegion == false then false else not (powerToGasInstancesRecord.powerToGasType == .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.PowerToGasType(
                                                                                                                                                                                                        1) or powerToGasInstancesRecord.powerToGasType == .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.PowerToGasType(
                                                                                                                                                                                                        2) or powerToGasInstancesRecord.powerToGasType == .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.PowerToGasType(
                                                                                                                                                                                                        3));
  final parameter Boolean CO2NeededForPowerToGas=if PowerToGasPlantsInThisRegion == false then false elseif ptGTypeIsMethanation then true else false annotation (Dialog(group="PowerPlants/PtG"));
  final parameter Boolean CCSInPowerPlants=if PowerPlantsInThisRegion == false then false elseif max(powerPlantInstancesRecord.powerPlantRecord[:].CO2_Deposition_Rate) > 0 then true else false;

  //PowerPlants/ToGas
  parameter Boolean useHydrogenFromPtGInPowerPlants=false annotation (Dialog(group="PowerPlants/PtG"));
  parameter Boolean typeIsWOStorage=if PowerToGasPlantsInThisRegion == false then false else (powerToGasInstancesRecord.powerToGasType == .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.PowerToGasType(
                                                                                                                                                                                                        1) or powerToGasInstancesRecord.powerToGasType == .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.PowerToGasType(
                                                                                                                                                                                                        6));

  parameter Integer usageOfWasteHeatOfPtG=1 "Waste heat usage of PtG" annotation (Dialog(group="PowerPlants/PtG"), choices(
      choice=1 "No Usage",
      choice=2 "CO2 Desorption",
      choice=3 "District Heating"));

  // Gas Port Splitting for connection to multiple gas nodes
  parameter Integer n_gasPortOut_powerPlants=1 annotation (Dialog(group="GasPortSplitter"));
  parameter Real splitRatio_powerPlants[max(1, n_gasPortOut_powerPlants)]={0.1} annotation (Dialog(group="GasPortSplitter"));

  //---Failures---//
  parameter Modelica.Units.SI.Pressure p_min_operating_PowerPlants=1e5 "gas pressure threshold at which powerplants turn off" annotation (dialog(tab="Failures"));
  parameter Modelica.Units.SI.Pressure p_min_operating_PowerPlants_backin=2e5 "gas pressure threshold at which powerplants turn back on after turning off" annotation (dialog(tab="Failures"));

  //---Instance Records--//
  //----Gas Storage---//
  parameter .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.Records.InstancesRecords.GasStorageInstancesRecord gasStorageInstancesRecord annotation (Dialog(tab="Records", group="Gas Storages"));

  //---- Power plants---//
  final parameter Integer nPowerPlants=powerPlantInstancesRecord.nPowerPlants annotation (Dialog(tab="Records", group="Power Plants"));
  parameter .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.Records.InstancesRecords.PowerPlantInstancesRecord powerPlantInstancesRecord annotation (Dialog(tab="Records", group="Power Plants"));

  //----Power to gas---//
   parameter .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.Records.InstancesRecords.PowerToGasInstancesRecord powerToGasInstancesRecord annotation (Dialog(tab="Records", group="Power To Gas"));

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________
  outer TransiEnt.SimCenter simCenter;

  Controller.ControlGasStorage_oneWay controlGasStorage(
    Vgeo_per_mMax=gasStorageInstancesRecord.gasStorageRecord.Vgeo_per_mMax,
    m_flow_inMax=gasStorageInstancesRecord.gasStorageRecord.m_flow_inMax,
    m_flow_outMax=gasStorageInstancesRecord.gasStorageRecord.m_flow_outMax,
    GasStrorageTypeNo=gasStorageInstancesRecord.gasStorageRecord.GasStrorageTypeNo,
    failure_table=failure_gasStorage_tabel,
    p_gasGrid_desired=p_gasGrid_desired,
    p_gasGrid_desired_bandwidth=p_gasGrid_desired_bandwidth) if GasStorageInThisRegion annotation (Placement(transformation(extent={{-10,-9.1111},{10,9.1111}},
        rotation=180,
        origin={0,58.8889})));
public
  MasterBusControl masterBusControl annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={0,100}),  iconTransformation(extent={{-20,-20},{20,20}},
        rotation=0,
        origin={0,100})));
  Controller.ControlCO2 controlCO2(
    CCSInPowerPlants=CCSInPowerPlants,
    CO2NeededForPowerToGas=CO2NeededForPowerToGas,
    usageOfWasteHeatOfPtG=usageOfWasteHeatOfPtG,
    powertToGas_P_el_n=powerToGasInstancesRecord.powerToGasRecord.P_el_n,
    powerToGas_eta_n=powerToGasInstancesRecord.powerToGasRecord.eta_n) annotation (Placement(transformation(extent={{10,12},{-10,30}})));
  Controller.ControlPowerToGas controlPowerToGasStorage(
    DifferentTypesOfPowerToGasPlants=1,
    useHydrogenFromPtGInPowerPlants=useHydrogenFromPtGInPowerPlants,
    usageOfWasteHeatOfPtG=usageOfWasteHeatOfPtG,
    CO2NeededForPowerToGas=CO2NeededForPowerToGas,
    P_el_n=powerToGasInstancesRecord.powerToGasRecord.P_el_n,
    eta_n=powerToGasInstancesRecord.powerToGasRecord.eta_n,
    typeIsMethanation=ptGTypeIsMethanation,
    typeIsWOStorage=typeIsWOStorage,
    p_gasGrid_desired=p_gasGrid_desired) if PowerToGasPlantsInThisRegion annotation (Placement(transformation(extent={{10,-68},{-10,-48}})));
  InputBus inputBus annotation (Placement(transformation(extent={{-20,-120},{20,-80}}), iconTransformation(extent={{-20,-120},{20,-80}})));
  Controller.ControlPowerPlant controlPowerPlant(
    DifferentTypesOfPowerPlants=nPowerPlants,
    p_min=p_min_operating_PowerPlants,
    p_min_backin=p_min_operating_PowerPlants_backin,
    powerPlants_P_el_n=powerPlantInstancesRecord.powerPlantRecord[:].P_el_n,
    n_gasPortOut_split=n_gasPortOut_powerPlants,
    splitRatio=splitRatio_powerPlants) if PowerPlantsInThisRegion annotation (Placement(transformation(extent={{-8,-28},{12,-10}})));
equation
  if GasStorageInThisRegion then
    connect(masterBusControl.GasStorageSystem, controlGasStorage.controlBus) annotation (Line(
      points={{0.1,100.1},{-40,100.1},{-40,59.9012},{-9.8,59.9012}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
    connect(masterBusControl.GasStorageSystem.pGas_gasStorage, controlGasStorage.p_gas_region) annotation (Line(
      points={{0.1,100.1},{40,100.1},{40,59.6988},{10.4,59.6988}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  end if;
  for i in 1:nPowerPlants loop

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for CCS/////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//     connect(controlCO2.controlBus, powerPlantSystem[i].controlBus) annotation (Line(
//         points={{-242,62.2222},{-242,-2},{-10.2,-2}},
//         color={255,204,51},
//         thickness=0.5));
  end for;

  connect(masterBusControl.CO2System, controlCO2.controlBus) annotation (Line(
      points={{0.1,100.1},{-40,100.1},{-40,20},{-10,20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(masterBusControl.PowerToGasSystem, controlPowerToGasStorage.controlBus) annotation (Line(
      points={{0.1,100.1},{-40,100.1},{-40,-60},{-10,-60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(masterBusControl.PowerToGasSystem.pGas_pTG, controlPowerToGasStorage.p_gas_region) annotation (Line(
      points={{0.1,100.1},{40,100.1},{40,-54},{11,-54}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(masterBusControl.PowerToGasSystem.H2gasFrac, controlPowerToGasStorage.gasComposition) annotation (Line(
      points={{0.1,100.1},{40,100.1},{40,-66},{11,-66}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(inputBus.P_set_PowerPlant, controlPowerPlant.P_el_set_in) annotation (Line(
      points={{0.1,-99.9},{-20,-99.9},{-20,-20.05},{-9.25,-20.05}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(masterBusControl.PowerPlantSystem.gasPressure, controlPowerPlant.p_gas) annotation (Line(
      points={{0.1,100.1},{-40,100.1},{-40,-24.05},{-9.25,-24.05}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(masterBusControl.PowerPlantSystem.P_max_noCCs, controlPowerPlant.P_max_PowerPlant_in) annotation (Line(
      points={{0.1,100.1},{-40,100.1},{-40,-16.05},{-9.25,-16.05}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlPowerPlant.P_max_PowerPlant_out, masterBusControl.PowerPlantSystem.P_max_PowerPlant_out) annotation (Line(points={{12.4,-16},{20,-16},{20,100.1},{0.1,100.1}},
                                                                                                                                                                          color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlPowerPlant.P_el_set_out, masterBusControl.PowerPlantSystem.P_el_set_out) annotation (Line(points={{12.5,-23.9},{20,-23.9},{20,100.1},{0.1,100.1}},
                                                                                                                                                              color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(inputBus.P_set_PtG, controlPowerToGasStorage.u2) annotation (Line(
      points={{0.1,-99.9},{30,-99.9},{30,-60},{11,-60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-34,54},{-26,33}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-14,54},{-6,33}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{6,54},{14,33}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{26,54},{34,33}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-48,33},{48,-28}},
          lineColor={135,135,135},
          fillPattern=none,
          lineThickness=5,
          fillColor=None),
        Rectangle(
          extent={{-34,-30},{-26,-51}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-14,-30},{-6,-51}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{6,-30},{14,-51}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{26,-30},{34,-51}},
          lineColor={0,0,0},
          fillColor={255,191,30},
          fillPattern=FillPattern.Solid)}),                      Diagram(coordinateSystem(preserveAspectRatio=false)));
end RegionalController;
