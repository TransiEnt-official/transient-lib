within TransiEnt.SystemGeneration.Superstructure.Components;
model Superstructure "Representation of a certain region in terms of consumption and production of electrical power and gas"

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
  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________
  extends TransiEnt.Basics.Icons.SuperstructureIcon;

  // _____________________________________________
  //
  //              General Parameters
  // _____________________________________________

  parameter Integer MaximalDifferentTypesOfPowerPlants;
  parameter Integer MaximalDifferentTypesOfElectricalStorages;

  replaceable package Config = Portfolios.Portfolio_Example constrainedby Portfolios.Base        annotation (choicesAllMatching=true);
  parameter Integer Region=1 "Define Region Number";

  parameter Integer DifferentTypesOfPowerPlants "0 to x";
  parameter Integer DifferentTypesOfCHPPlants "0 or 1";
  parameter Integer DifferentTypesOfElectricalStorages "0 to x";
  parameter Integer DifferentTypesOfPowerToGasPlants "0 or 1";
  parameter Integer DifferentTypesOfElectricHeater "0 or 1";
  parameter Integer DifferentTypesOfGasBoiler "0 or 1";
  parameter Integer DifferentTypesOfGasStorage "0 or 1";

  parameter Boolean CHPPlantsInThisRegion=if DifferentTypesOfCHPPlants > 0 then true else false "true, if CHP plants exist in region";

  parameter Boolean ElectricalHeaterInThisRegion=if DifferentTypesOfElectricHeater > 0 then true else false "true, if electrical heater exist in region";
  parameter Boolean PowerPlantsInThisRegion=if DifferentTypesOfPowerPlants > 0 then true else false "true, if power plants exist in region";
  parameter Boolean PowerToGasPlantsInThisRegion=if DifferentTypesOfPowerToGasPlants > 0 then true else false "true, if power to gas plants exist in region";
  parameter Boolean ElectricalStoragesInThisRegion=if DifferentTypesOfElectricalStorages > 0 then true else false "true, if electrical storages exist in region";
  parameter Boolean GasBoilerInThisRegion=if DifferentTypesOfGasBoiler > 0 then true else false "true, if gas boiler exist in region";
  parameter Boolean GasStorageInThisRegion=if DifferentTypesOfGasStorage > 0 then true else false "true, if gas storages exist in region";

  parameter Boolean useVariableHydrogenFraction=false;

  parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium_CO2=simCenter.gasModel1 "CO2 model to be used";
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium=simCenter.gasModel1 "Gas model to be used" annotation (Dialog(group="Fundamental Definitions"));
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium_Hydrogen=simCenter.gasModel3 "Hydrogen model zo be used" annotation (Dialog(group="Fundamental Definitions"));
  parameter Modelica.Units.SI.MassFlowRate m_flow_small=0.1 "small leakage mass flow for numerical stability";

  //PowerPlants/ToGas
  parameter Integer[2] slackBoundaryPosition "Indices [Region, MaxDifferentTypesOfPowerplants] of where the epp slack boundary is positioned";
  parameter Boolean useHydrogenFromPtGInPowerPlants=false annotation (Dialog(group="PowerPlants/PtG"));
  final parameter Boolean ptGTypeIsMethanation=if PowerToGasPlantsInThisRegion == false then false else not (powerToGasInstancesRecord.powerToGasType == Config.PowerToGasType(1) or powerToGasInstancesRecord.powerToGasType == Config.PowerToGasType(2) or powerToGasInstancesRecord.powerToGasType == Config.PowerToGasType(3));
  //parameter SI.Mass m_start_CO2_storage=0;//moved to record

  final parameter Boolean CO2NeededForPowerToGas=if PowerToGasPlantsInThisRegion == false then false elseif ptGTypeIsMethanation then true else false annotation (Dialog(group="PowerPlants/PtG"));
  final parameter Boolean CCSInPowerPlants=if PowerPlantsInThisRegion == false then false elseif max(powerPlantInstancesRecord.powerPlantRecord[:].CO2_Deposition_Rate) > 0 then true else false;
  final parameter Real CO2StorageNeeded=if PowerToGasPlantsInThisRegion == false and CCSInPowerPlants == false then 0 elseif CO2NeededForPowerToGas or CCSInPowerPlants == true then 1 else 0 annotation (Dialog(group="PowerPlants/PtG"));

  parameter Integer usageOfWasteHeatOfPtG=1 "Waste heat usage of PtG" annotation (Dialog(group="PowerPlants/PtG"), choices(
      choice=1 "No Usage",
      choice=2 "CO2 Desorption",
      choice=3 "District Heating"));

  parameter Real splitHeatingDemand_heatingGrid=1 - splitHeatingDemand_heatingGrid "Fraction of table data values referring to the heating grid" annotation (Dialog(group="PowerPlants/PtG"));
  parameter Real splitHeatingDemand_localHeating=1 "Fraction of table data values referring to local heating" annotation (Dialog(group="PowerPlants/PtG"));

  //HeatingGrid
  parameter Modelica.Units.NonSI.Temperature_degC T_supply_max_districtHeating=149 annotation (Dialog(group="HeatingGrid"));
  parameter Modelica.Units.NonSI.Temperature_degC T_return_min_districtHeating=49 annotation (Dialog(group="HeatingGrid"));

  //GasGrid
  parameter Modelica.Units.SI.Pressure p_gasGrid_desired=simCenter.p_amb_const + simCenter.p_eff_2 "desired gas grid pressure in region" annotation (Dialog(group="GasGrid"));
  parameter Modelica.Units.SI.PressureDifference p_gasGrid_desired_bandwidth=0 "band width around p_gasGrid_desired in which the set value varies depending on the SOC of the gas storage" annotation (Dialog(group="GasGrid"));

  final parameter Integer NeededGasPortsForJunction=integer(3 + TransiEnt.Basics.Functions.boolean2integer(PowerToGasPlantsInThisRegion) + nPowerPlants + TransiEnt.Basics.Functions.boolean2integer(GasStorageInThisRegion) + TransiEnt.Basics.Functions.boolean2integer(ElectricalHeaterInThisRegion or CHPPlantsInThisRegion)) annotation (Dialog(group="GasGrid"));
  //+TransiEnt.Basics.Functions.boolean2integer(useImportExportBoundary));

  // parameter Real gridLosses_districtHeating=0.127   moved to record
  //inner
  inner parameter Modelica.Units.SI.MassFraction xi_const_noZeroMassFlow[max(simCenter.gasModel1.nc - 1, 1)]=if simCenter.gasModel1.nc == 1 then {1} elseif simCenter.gasModel1.nc == 2 then {1} else {0.85883115,0.06193993,0.01007228,0.00201834,0.04370946,0.02342884} annotation (Dialog(group="GasGrid"));

  parameter Boolean useOneGasPortOnly=true annotation (Dialog(group="GasGrid"));
  final parameter Integer n_gasPort=if useOneGasPortOnly then 1 else 6 annotation (Dialog(group="GasGrid"));

  parameter Boolean useImportExportBoundary=false "useOneGasPortOnly has to be turned on for this" annotation (Dialog(enable=useOneGasPortOnly, group="GasGrid"));

  parameter Real junctionVolume=10676.7 "Central gas volume if useOneGasPortOnly" annotation (Dialog(group="GasGrid"));

  // Gas Port Splitting for connection to multiple gas nodes
  parameter Integer n_gasPortOut_powerPlants=1 annotation (Dialog(group="GasPortSplitter"));
  parameter Integer n_gasPortOut_localDemand=1 annotation (Dialog(group="GasPortSplitter"));
  parameter Real splitRatio_powerPlants[max(1, n_gasPortOut_powerPlants)]={0.1} annotation (Dialog(group="GasPortSplitter"));
  parameter Real splitRatio_localDemand[max(1, n_gasPortOut_localDemand)]={0.1} annotation (Dialog(group="GasPortSplitter"));

  //---Failures---//
  parameter Modelica.Units.SI.Pressure p_min_operating_PowerPlants=1e5 "gas pressure threshold at which powerplants turn off" annotation (dialog(tab="Failures"));
  parameter Modelica.Units.SI.Pressure p_min_operating_PowerPlants_backin=2e5 "gas pressure threshold at which powerplants turn back on after turning off" annotation (dialog(tab="Failures"));
  parameter Modelica.Units.SI.Pressure p_min_operating_localDemand=1e5 "gas pressure threshold at which local consumers turn off" annotation (dialog(tab="Failures"));
  parameter Modelica.Units.SI.Pressure p_min_operating_localDemand_backin=2e5 "gas pressure threshold at which powerplants turn back on after turning off" annotation (dialog(tab="Failures"));

  //---Tables---//
  parameter String localElectricDemand_pathToTable;
  parameter Real localElectricDemand_constantMultiplier=1.0 "Multiply output with constant factor";
  parameter String localGasDemand_pathToTable;
  parameter Real localGasDemand_constantMultiplier=1.0 "Multiply output with constant factor";
  parameter String localSolarthermalProduction_pathToTable;
  parameter Real localSolarthermalProduction_constantMultiplier=1.0 "Multiply output with constant factor";

  parameter String localTemperature_pathToTable;
  parameter Real localTemperature_constantMultiplier=1.0 "Multiply output with constant factor";
  parameter String localHeatDemand_pathToTable;
  parameter Real localHeatDemand_constantMultiplier=1.0 "Multiply output with constant factor";

  parameter String localBiogasProduction_pathToTable;
  parameter Real localBiogasProduction_constantMultiplier=1.0 "Multiply output with constant factor";
  parameter String localWindOffshoreProduction_pathToTable;
  parameter Real localWindOffshoreProduction_constantMultiplier=1.0 "Multiply output with constant factor";
  parameter String localBiomassProduction_pathToTable;
  parameter Real localBiomassProduction_constantMultiplier=1.0 "Multiply output with constant factor";
  parameter String localPhotovoltaicProduction_pathToTable;
  parameter Real localPhotovoltaicProduction_constantMultiplier=1.0 "Multiply output with constant factor";
  parameter String localWindOnshoreProduction_pathToTable;
  parameter Real localWindOnshoreProduction_constantMultiplier=1.0 "Multiply output with constant factor";

  //---Instance Records--//
  //----Electrical Storage---//
  parameter Config.Records.InstancesRecords.ElectricalStorageInstancesRecord electricalStorageInstancesRecord=Config.Records.InstancesRecords.ElectricalStorageInstancesRecord() annotation (Dialog(tab="Records", group="Electrical Storages"));

  //----Gas Storage---//
  parameter Config.Records.InstancesRecords.GasStorageInstancesRecord gasStorageInstancesRecord=Config.Records.InstancesRecords.GasStorageInstancesRecord() annotation (Dialog(tab="Records", group="Gas Storages"));

  //---- Power plants---//
  final parameter Integer nPowerPlants=powerPlantInstancesRecord.nPowerPlants annotation (Dialog(tab="Records", group="Power Plants"));
  parameter Config.Records.InstancesRecords.PowerPlantInstancesRecord powerPlantInstancesRecord=Config.Records.InstancesRecords.PowerPlantInstancesRecord() annotation (Dialog(tab="Records", group="Power Plants"));

  //----Local demand---//
  parameter Config.Records.InstancesRecords.LocalDemandInstancesRecord localDemandInstancesRecord=Config.Records.InstancesRecords.LocalDemandInstancesRecord() annotation (Dialog(tab="Records", group="Local Demand"));

  //----Local Renewable Production---//
  parameter Config.Records.InstancesRecords.LocalRenewableProductionInstancesRecord localRenewableProductionInstancesRecord=Config.Records.InstancesRecords.LocalRenewableProductionInstancesRecord() annotation (Dialog(tab="Records", group="Local Renewable Production"));

  //----CO2System---//
  parameter Config.Records.InstancesRecords.CO2SystemInstancesRecord cO2SystemInstancesRecord=Config.Records.InstancesRecords.CO2SystemInstancesRecord() annotation (Dialog(tab="Records", group="CO2System"));

  //----Power to gas---//
  parameter Config.Records.InstancesRecords.PowerToGasInstancesRecord powerToGasInstancesRecord=Config.Records.InstancesRecords.PowerToGasInstancesRecord() annotation (Dialog(tab="Records", group="Power To Gas"));

  //----Heating Grid---//
  parameter Config.Records.InstancesRecords.HeatingGridSystemStorageInstancesRecord heatingGridSystemStorageInstancesRecord=Config.Records.InstancesRecords.HeatingGridSystemStorageInstancesRecord() annotation (Dialog(tab="Records", group="Heating Grid"));

  // ---------- Gas Port Connect -------------
  final parameter Integer connectLocalDemand=1;
  final parameter Integer connectlocalRenewableProduction=2;
  final parameter Integer connectGasStorages=3;
  final parameter Integer connectPowerToGas=if GasStorageInThisRegion then 4 else 3;
  final parameter Integer connectPowerPlants=if GasStorageInThisRegion and PowerToGasPlantsInThisRegion then 5 elseif GasStorageInThisRegion or PowerToGasPlantsInThisRegion then 4 else 3;

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________
  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(rotation=0, extent={{115,3},{125,13}})));
  TransiEnt.Basics.Interfaces.Gas.RealGasPortIn gasPortIn[n_gasPort](each Medium=simCenter.gasModel1) annotation (Placement(transformation(extent={{112,-42},{132,-22}})));

  Modelica.Blocks.Routing.RealPassThrough
                                        P_PowerPlant_is annotation (Placement(transformation(extent={{93,87},{99,93}})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_ElectricalHeater_max annotation (Placement(transformation(extent={{93,-73},{99,-67}})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_surplus_region annotation (Placement(transformation(extent={{93,-83},{99,-77}})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_renewable annotation (Placement(transformation(extent={{93,-99},{99,-93}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  //----Electrical Storage----//
  Config.ElectricalStorageSystem electricalStorageSystem[DifferentTypesOfElectricalStorages](
    redeclare package Config = Config,
    electricalStorageType=electricalStorageInstancesRecord.electricalStorageType,
    electricalStorageRecord=electricalStorageInstancesRecord.electricalStorageRecord) if ElectricalStoragesInThisRegion annotation (Placement(transformation(extent={{-10,-72},{10,-52}})));

  //----Gas Storage----//
  Config.GasStorageSystem gasStorageSystem(
    medium=medium,
    p_gasGrid_desired=p_gasGrid_desired,
    redeclare package Config = Config,
    gasStorageType=gasStorageInstancesRecord.gasStorageType,
    gasStorageRecord=gasStorageInstancesRecord.gasStorageRecord) if GasStorageInThisRegion annotation (Placement(transformation(extent={{-10,44},{10,64}})));

  //----Power Plants----//
  Config.PowerPlantSystem powerPlantSystem[nPowerPlants](
    each mediumGas=medium,
    each medium_CO2=medium_CO2,
    each m_flow_small=m_flow_small,
    each CO2StorageNeeded=CO2StorageNeeded,
    isSlack={(if slackBoundaryPosition[1] == Region and slackBoundaryPosition[2] == j then true else false) for j in 1:nPowerPlants},
    redeclare package Config = Config,
    each CCSInPowerPlants=CCSInPowerPlants,
    each useHydrogenFromPtGInPowerPlants=useHydrogenFromPtGInPowerPlants,
    powerPlantType=powerPlantInstancesRecord.powerPlantType,
    powerPlantRecord=powerPlantInstancesRecord.powerPlantRecord) if PowerPlantsInThisRegion annotation (Placement(transformation(extent={{-10,-12},{10,8}})));

  Modelica.Blocks.Sources.RealExpression gasPressure[n_gasPortOut_powerPlants](y=gasPortIn[1].p) annotation (Placement(transformation(rotation=0, extent={{-58,124},{-42,138}})));

  TransiEnt.Components.Gas.VolumesValvesFittings.Fittings.RealGasJunction_L2_nPorts_isoth junction1(
    n_ports=NeededGasPortsForJunction,
    volume=junctionVolume,
    m_flow_nom=ones(junction1.n_ports)*(junction1.volume*48.3588/60)) if useOneGasPortOnly annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={44,-32})));

  //----Local Demand----//
  Config.LocalDemand localDemand(
    medium=medium,
    p_min=p_min_operating_localDemand,
    p_min_backin=p_min_operating_localDemand_backin,
    p_gasGrid_desired=p_gasGrid_desired,
    n_gasPortOut_split=n_gasPortOut_localDemand,
    splitRatio=splitRatio_localDemand,
    localDemandRecord=localDemandInstancesRecord.localDemandRecord,
    localElectricDemand_pathToTable=localElectricDemand_pathToTable,
    localElectricDemand_constantMultiplier=localElectricDemand_constantMultiplier,
    localGasDemand_pathToTable=localGasDemand_pathToTable,
    localGasDemand_constantMultiplier=localGasDemand_constantMultiplier,
    localSolarthermalProduction_pathToTable=localSolarthermalProduction_pathToTable,
    localSolarthermalProduction_constantMultiplier=localSolarthermalProduction_constantMultiplier) annotation (Placement(transformation(extent={{-10,-128},{10,-106}})));
  TransiEnt.Basics.Tables.GenericDataTable DataTable_HeatDemand(
    use_absolute_path=true,
    absolute_path=localHeatDemand_pathToTable,
    constantfactor=localHeatDemand_constantMultiplier) annotation (Placement(transformation(extent={{-96,-128},{-86,-118}})));
  Modelica.Blocks.Math.Gain gain_HeatingDemand_HeatingGrid(k=splitHeatingDemand_heatingGrid) annotation (Placement(transformation(extent={{-78,-118},{-72,-112}})));
  Modelica.Blocks.Math.Gain gain_HeatingDemand_LocalDemand(k=splitHeatingDemand_localHeating) annotation (Placement(transformation(extent={{-78,-130},{-72,-124}})));
  TransiEnt.Basics.Tables.GenericDataTable DataTable_Temperature(
    use_absolute_path=true,
    absolute_path=localTemperature_pathToTable,
    constantfactor=localTemperature_constantMultiplier) annotation (Placement(transformation(extent={{-96,-114},{-86,-104}})));

  inner Modelica.Units.SI.Temperature T_region=DataTable_Temperature.y1;

  TransiEnt.Components.Sensors.ElectricPowerComplex electricPowerComplex_load annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={16,-122})));
  TransiEnt.Components.Electrical.Grid.IdealPhaseShifter centralPhaseShifter if simCenter.idealSuperstructLocalGrid annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={121,-5})));

  //----Local Renewable Porduction----//
  Config.LocalRenewableProduction localRenewableProduction(
    medium=medium,
    localRenewableProductionRecord=localRenewableProductionInstancesRecord.localRenewableProductionRecord,
    useWindOffshoreInThisRegion=true,
    localBiogasProduction_pathToTable=localBiogasProduction_pathToTable,
    localBiogasProduction_constantMultiplier=localBiogasProduction_constantMultiplier,
    localWindOffshoreProduction_pathToTable=localWindOffshoreProduction_pathToTable,
    localWindOffshoreProduction_constantMultiplier=localWindOffshoreProduction_constantMultiplier,
    localBiomassProduction_pathToTable=localBiomassProduction_pathToTable,
    localBiomassProduction_constantMultiplier=localBiomassProduction_constantMultiplier,
    localPhotovoltaicProduction_pathToTable=localPhotovoltaicProduction_pathToTable,
    localPhotovoltaicProduction_constantMultiplier=localPhotovoltaicProduction_constantMultiplier,
    localWindOnshoreProduction_pathToTable=localWindOnshoreProduction_pathToTable,
    localWindOnshoreProduction_constantMultiplier=localWindOnshoreProduction_constantMultiplier) annotation (Placement(transformation(extent={{-10,-102},{10,-80}})));

  TransiEnt.Components.Sensors.ElectricPowerComplex electricPowerComplex_localRenewableProduction annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=0,
        origin={16,-92})));

  //----CO2System----//
  Config.CO2System cO2System(
    medium=medium_CO2,
    CO2NeededForPowerToGas=CO2NeededForPowerToGas,
    CO2StorageNeeded=CO2StorageNeeded,
    nPowerPlants=powerPlantInstancesRecord.nPowerPlants,
    cO2SystemRecord=cO2SystemInstancesRecord.cO2SystemRecord) if CO2StorageNeeded > 0 annotation (Placement(transformation(extent={{-10,16},{10,36}})));

  //----PowerToGasSystem----//
  Config.PowerToGasSystem powerToGasSystem(
    medium=medium,
    usageOfWasteHeatOfPtG=usageOfWasteHeatOfPtG,
    medium_Hydrogen=medium_Hydrogen,
    m_flow_small=m_flow_small,
    powerToGasRecord=powerToGasInstancesRecord.powerToGasRecord,
    medium_CO2=medium_CO2,
    useVariableHydrogenFraction=useVariableHydrogenFraction,
    useHydrogenFromPtGInPowerPlants=useHydrogenFromPtGInPowerPlants,
    CO2NeededForPowerToGas=CO2NeededForPowerToGas,
    T_supply_max_districtHeating=T_supply_max_districtHeating,
    powerToGasType=powerToGasInstancesRecord.powerToGasType) if PowerToGasPlantsInThisRegion annotation (Placement(transformation(extent={{-40,-44},{-20,-24}})));

  //----heating grid ---//
  Config.HeatingGrid heatingGridSystem_Storage(
    useExternalHeatSource=if usageOfWasteHeatOfPtG == 3 then true else false,
    T_wasteHeat=if PowerToGasPlantsInThisRegion and ptGTypeIsMethanation then T_supply_max_districtHeating else 68,
    T_supply_max_districtHeating=T_supply_max_districtHeating,
    T_return_min_districtHeating=T_return_min_districtHeating,
    heatingGridSystemStorageRecord=heatingGridSystemStorageInstancesRecord.heatingGridSystemStorageRecord,
    CHPPlantsInThisRegion=CHPPlantsInThisRegion,
    ElectricalHeaterInThisRegion=ElectricalHeaterInThisRegion) if DifferentTypesOfCHPPlants + DifferentTypesOfElectricHeater >= 1 annotation (Placement(transformation(extent={{-10,82},{10,102}})));

  //----other blocks----//
  Modelica.Blocks.Sources.RealExpression expression_pGas_pTG(y=gasPortIn[1].p) annotation (Placement(transformation(extent={{-58,164},{-42,178}})));
  Modelica.Blocks.Sources.RealExpression expression_H2gasFrac[max(simCenter.gasModel1.nc - 1, 1)](y=if simCenter.gasModel1.nc == 1 then {1} else inStream(powerToGasSystem.gasPortOut_1.xi_outflow)) if PowerToGasPlantsInThisRegion annotation (Placement(transformation(extent={{-58,152},{-42,166}})));
  Modelica.Blocks.Sources.RealExpression realExpression14(y=273.15 + 100) if CO2NeededForPowerToGas and (usageOfWasteHeatOfPtG == 1 or usageOfWasteHeatOfPtG == 3) annotation (Placement(transformation(extent={{-46,32},{-36,40}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature if CO2NeededForPowerToGas and (usageOfWasteHeatOfPtG == 1 or usageOfWasteHeatOfPtG == 3) annotation (Placement(transformation(extent={{-32,34},{-28,38}})));
  //Modelica.Blocks.Sources.RealExpression PP_gasMassFlow(y=sum(powerPlantSystem[:].massFlowSensor_PowerPlants.m_flow)) annotation (Placement(transformation(rotation=0, extent={{-88,-50},{-74,-40}})));

  TransiEnt.Consumer.Gas.GasConsumer_HFlow_NCV boundaryImportExportInRegion(
    xi_const=if simCenter.gasModel1.nc == 2 then {1} else simCenter.gasModel1.xi_default,
    variable_H_flow=false,
    H_flow_const=0,
    mode="Both",
    usePIDcontroller=false,
    flowDefinition=2) if useOneGasPortOnly and useImportExportBoundary annotation (Placement(transformation(extent={{140,8},{160,28}})));

  Modelica.Blocks.Sources.RealExpression Zero annotation (Placement(transformation(
        extent={{-5,-7},{5,7}},
        rotation=0,
        origin={53,105})));

  Modelica.Blocks.Math.MultiSum localSurplusPowerIntern(nu=if DifferentTypesOfCHPPlants + DifferentTypesOfElectricHeater >= 1 then 3 else 2) annotation (Placement(transformation(extent={{82,-84},{90,-76}})));

  Modelica.Blocks.Math.MultiSum sum_P_Powerplants_is(nu=1 + nPowerPlants) annotation (Placement(transformation(extent={{66,-2},{72,4}})));
  Modelica.Blocks.Math.MultiSum sum_m_flow_powerPlant_is(nu=1 + nPowerPlants) annotation (Placement(transformation(extent={{66,-10},{72,-4}})));
  Modelica.Blocks.Math.MultiSum sum_P_PtG_is(nu=1 + (if (PowerToGasPlantsInThisRegion) then 1 else 0)) annotation (Placement(transformation(extent={{66,-40},{72,-34}})));
  Modelica.Blocks.Math.MultiSum sum_m_flow_PtG_is(nu=1 + (if (PowerToGasPlantsInThisRegion)  then 1 else 0)) annotation (Placement(transformation(extent={{66,-48},{72,-42}})));
  Modelica.Blocks.Math.MultiSum sum_E_electricalStorage_is(nu=1 + DifferentTypesOfElectricalStorages) annotation (Placement(transformation(extent={{66,-62},{72,-56}})));
  Modelica.Blocks.Math.MultiSum sum_P_electricalStorage_is(nu=1 + DifferentTypesOfElectricalStorages) annotation (Placement(transformation(extent={{66,-70},{72,-64}})));
  Modelica.Blocks.Math.MultiSum sum_m_gasStorage_is(nu=1 + DifferentTypesOfGasStorage) annotation (Placement(transformation(extent={{68,44},{74,50}})));
  Modelica.Blocks.Math.MultiSum sum_m_flow_gasStorage_is(nu=1 + DifferentTypesOfGasStorage) annotation (Placement(transformation(extent={{68,52},{74,58}})));
  Modelica.Blocks.Math.MultiSum sum_m_flow_CO2fromPowerplants(nu=1 + (if (CO2StorageNeeded>0) then 1 else 0)) annotation (Placement(transformation(extent={{68,22},{74,28}})));
  Modelica.Blocks.Math.MultiSum sum_m_flow_CO2toPtG(nu=1 + (if (CO2StorageNeeded>0) then 1 else 0)) annotation (Placement(transformation(extent={{68,30},{74,36}})));
  Modelica.Blocks.Math.MultiSum sum_P_CO2DAC_is(nu=1 + (if (CO2StorageNeeded>0) then 1 else 0)) annotation (Placement(transformation(extent={{68,14},{74,20}})));
  Modelica.Blocks.Math.MultiSum sum_P_heatingGrid_is(nu=1 + (if (DifferentTypesOfElectricHeater + DifferentTypesOfGasBoiler + DifferentTypesOfCHPPlants) > 0 then 2 else 0)) annotation (Placement(transformation(extent={{68,88},{74,94}})));
  Modelica.Blocks.Math.MultiSum sum_m_flow_heatingGridGas_is(nu=1 + (if (DifferentTypesOfElectricHeater + DifferentTypesOfGasBoiler + DifferentTypesOfCHPPlants) > 0 then 1 else 0)) annotation (Placement(transformation(extent={{68,80},{74,86}})));

  Records.Summary summary(
    P_set_powerPlants=sum({inputBus.P_set_PowerPlant}),
    P_set_PtG=sum({inputBus.P_set_PtG}),
    P_set_electricStorages=sum({inputBus.P_set_ElectricalStorage}),
    P_set_electricHeaters=(if (DifferentTypesOfCHPPlants + DifferentTypesOfElectricHeater) >= 1 then sum({inputBus.P_set_ElectricalHeater}) else 0),
    P_set_curtailment=sum({inputBus.P_set_curtailment}),
    electricProduction_powerplants_P=sum_P_Powerplants_is.y,
    electricProduction_renewables_biomass_P=localRenewableProduction.BiomassPlant.epp.P,
    electricProduction_renewables_windOnShore_P=localRenewableProduction.windOnshorePlant.epp.P,
    electricProduction_renewables_windOffShore_P=localRenewableProduction.WindOffshorePlant.epp.P,
    electricProduction_renewables_photovoltaic_P=localRenewableProduction.PVPlant.epp.P,
    electricConsumption_localDemand_P=localDemand.load.epp.P,
    electricConsumption_localHeating_P=localDemand.epp.P - localDemand.load.epp.P,
    electricConsumption_PtG_P=sum_P_PtG_is.y,
    electricConsumption_heatingGrid_P=sum_P_heatingGrid_is.y,
    electricConsumption_DAC_P=sum_P_CO2DAC_is.y,
    gasProduction_renewables_biogas_m_flow=localRenewableProduction.bioGas_HFlow.massflowSensor.m_flow,
    gasProduction_PtG_m_flow=sum_m_flow_PtG_is.y,
    gasConsumption_localHeating_m_flow=localDemand.gasPortOut.m_flow - localDemand.gasConsumer_HFlow.fluidPortIn.m_flow,
    gasConsumption_localDirectUse_m_flow=localDemand.gasConsumer_HFlow.fluidPortIn.m_flow,
    gasConsumption_powerPlants_m_flow=sum_m_flow_powerPlant_is.y,
    gasConsumption_heatingGrid_m_flow=sum_m_flow_heatingGridGas_is.y,
    storages_electricStorages_E=sum_E_electricalStorage_is.y,
    storages_gasStorage_m=sum_m_gasStorage_is.y,
    CO2Sytem_fromPowerPlants_m_flow=sum_m_flow_CO2fromPowerplants.y,
    storages_electricStorages_P=sum_P_electricalStorage_is.y,
    storages_gasStorage_m_flow=sum_m_flow_gasStorage_is.y,
    CO2Sytem_toPtG_m_flow=sum_m_flow_CO2toPtG.y,
    HeatFlow_localHeatingDemand=localDemand.Q_flow,
    HeatFlow_solarthermalProduction=localDemand.gain_SolarthermalProduction.y,
    eppBoundary_f=epp.f,
    eppBoundary_v=epp.v,
    eppBoundray_P=epp.P,
    eppBoundary_Q=epp.Q,
    gasBoundary_p=sum(gasPortIn[:].p)/n_gasPort,
    gasBoundary_m_flow=sum(gasPortIn.m_flow)) annotation (Placement(transformation(extent={{-114,-104},{-94,-84}})));

  InputBus inputBus annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-100,120}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-100,120})));
  OutputBus outputBus annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={100,120}),
                         iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={100,120})));
  Modelica.Blocks.Routing.RealPassThrough P_PowerPlant_maxOut[MaximalDifferentTypesOfPowerPlants] if DifferentTypesOfPowerPlants >= 1 annotation (Placement(transformation(extent={{107,67},{113,73}})));
  Modelica.Blocks.Routing.RealPassThrough P_storage_isOut[MaximalDifferentTypesOfElectricalStorages] if DifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(extent={{107,-113},{113,-107}})));
  Modelica.Blocks.Routing.RealPassThrough P_max_unload_storageOut[MaximalDifferentTypesOfElectricalStorages] if DifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(extent={{107,-133},{113,-127}})));
  Modelica.Blocks.Routing.RealPassThrough P_max_load_storageOut[MaximalDifferentTypesOfElectricalStorages] if DifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(extent={{107,-123},{113,-117}})));
  MasterBusControl masterBusControl annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={0,120}),  iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={0,120})));
  Modelica.Blocks.Sources.RealExpression expression_pGas_gasStorage(y=gasPortIn[1].p) annotation (Placement(transformation(extent={{-58,136},{-42,150}})));
  Modelica.Blocks.Routing.RealPassThrough P_max_noCCSout[MaximalDifferentTypesOfPowerPlants] if DifferentTypesOfPowerPlants >= 1 annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={-82,16})));
equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for electrical storages/////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public
  Modelica.Blocks.Routing.RealPassThrough
                                        P_PowerPlant_max[DifferentTypesOfPowerPlants] if DifferentTypesOfPowerPlants >= 1 annotation (Placement(transformation(extent={{93,67},{99,73}})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_DAC annotation (Placement(transformation(extent={{93,47},{99,53}})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_PowerToGasPlant_is annotation (Placement(transformation(extent={{93,27},{99,33}})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_storage_is[DifferentTypesOfElectricalStorages] if DifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(extent={{93,-113},{99,-107}})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_max_load_storage[DifferentTypesOfElectricalStorages] if DifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(extent={{93,-123},{99,-117}})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_max_unload_storage[DifferentTypesOfElectricalStorages] if DifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(extent={{93,-133},{99,-127}})));
equation
  for i in 1:DifferentTypesOfElectricalStorages loop
    connect(electricalStorageSystem[i].epp, epp) annotation (Line(
        points={{10,-62},{40,-62},{40,8},{120,8}},
        color={28,108,200},
        thickness=0.5));
  end for;
  connect(electricalStorageSystem.P_max_load_storage, P_max_load_storage.u) annotation (Line(points={{11.6,-64},{52,-64},{52,-120},{92.4,-120}},color={0,0,127}));
  connect(electricalStorageSystem.P_max_unload_storage, P_max_unload_storage.u) annotation (Line(points={{11.6,-67.8},{12,-67.8},{12,-68},{48,-68},{48,-130},{92.4,-130}},
                                                                                                                                                        color={0,0,127}));
  connect(electricalStorageSystem.P_storage_is, P_storage_is.u) annotation (Line(points={{11.6,-71},{11.6,-71.5},{56,-71.5},{56,-110},{92.4,-110}},
                                                                                                                                               color={0,0,127}));
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for gas storages////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if useOneGasPortOnly then
    connect(gasStorageSystem.gasPortIn, junction1.gasPort[connectGasStorages + 1]) annotation (Line(
        points={{10,53.2},{32,53.2},{32,-32},{44,-32}},
        color={255,255,0},
        thickness=1.5));
  else
    connect(gasStorageSystem.gasPortIn, gasPortIn[connectGasStorages]);
  end if;

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for power plants////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  for i in 1:nPowerPlants loop
    connect(powerPlantSystem[i].epp_OUT, epp) annotation (Line(
        points={{0,8},{120,8}},
        color={28,108,200},
        thickness=0.5));
    connect(masterBusControl.CO2System, powerPlantSystem[i].controlBus) annotation (Line(
        points={{0.1,120.1},{-66,120.1},{-66,-2},{-10.2,-2}},
        color={255,204,51},
        thickness=0.5));
    connect(powerToGasSystem.controlBus, powerPlantSystem[i].controlBus) annotation (Line(
        points={{-40.8,-34},{-66,-34},{-66,-2},{-10.2,-2}},
        color={255,204,51},
        thickness=0.5));
    if useHydrogenFromPtGInPowerPlants then
      connect(powerPlantSystem[i].gasPortIn1, powerToGasSystem.gasPortOut_H2_toPowerPlant) annotation (Line(
          points={{10,-8},{22,-8},{22,-32},{-20,-32}},
          color={170,213,255},
          thickness=1.5));
    else
    end if;
    if useOneGasPortOnly then
      connect(powerPlantSystem[i].gasPortIn, junction1.gasPort[i + connectPowerPlants]) annotation (Line(
          points={{10,-2},{32,-2},{32,-32},{44,-32}},
          color={255,255,0},
          thickness=1.5));
    else
      connect(powerPlantSystem[i].gasPortIn, gasPortIn[i + connectPowerPlants - 1]);
    end if;
  end for;

  connect(cO2System.gasPortIn, powerPlantSystem.gasPortOut_CDE) annotation (Line(
      points={{10.2,32},{24,32},{24,2},{10,2}},
      color={215,215,215},
      thickness=1.5));

  connect(P_PowerPlant_is.u, sum_P_Powerplants_is.y) annotation (Line(points={{92.4,90},{78,90},{78,1},{72.51,1}},      color={0,0,127}));

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for local demand////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  if useOneGasPortOnly then
    connect(junction1.gasPort[1], gasPortIn[1]) annotation (Line(
        points={{44,-32},{122,-32}},
        color={255,255,0},
        thickness=1.5));
    connect(localDemand.gasPortOut, junction1.gasPort[connectLocalDemand + 1]) annotation (Line(
        points={{10,-114},{32,-114},{32,-32},{44,-32}},
        color={255,255,0},
        thickness=1.5));
  else
    connect(localDemand.gasPortOut, gasPortIn[connectLocalDemand]);
  end if;

  connect(DataTable_HeatDemand.y1, gain_HeatingDemand_LocalDemand.u) annotation (Line(points={{-85.5,-123},{-82,-123},{-82,-127},{-78.6,-127}}, color={0,0,127}));
  connect(gain_HeatingDemand_LocalDemand.y, localDemand.Q_flow) annotation (Line(points={{-71.7,-127},{-16,-127},{-16,-120},{-12,-120}}));
  connect(electricPowerComplex_load.epp_OUT, epp) annotation (Line(
      points={{19.76,-122},{40,-122},{40,8},{120,8}},
      color={28,108,200},
      thickness=0.5));

  connect(localDemand.epp, electricPowerComplex_load.epp_IN) annotation (Line(
      points={{10,-122},{12.32,-122}},
      color={28,108,200},
      thickness=0.5));

  connect(localDemand.Load, localSurplusPowerIntern.u[2]) annotation (Line(points={{11.4,-127.2},{82,-127.2},{82,-80}},           color={0,0,127}));
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for local demand and local renewable production/////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  connect(localSurplusPowerIntern.u[1], localRenewableProduction.P_RE_potential) annotation (Line(points={{82,-80},{82,-82.8},{11,-82.8}},           color={0,0,127}));

  connect(localRenewableProduction.epp, electricPowerComplex_localRenewableProduction.epp_IN) annotation (Line(
      points={{10,-92},{12.32,-92}},
      color={28,108,200},
      thickness=0.5));
  connect(electricPowerComplex_localRenewableProduction.epp_OUT, epp) annotation (Line(
      points={{19.76,-92},{40,-92},{40,8},{120,8}},
      color={28,108,200},
      thickness=0.5));

  if useOneGasPortOnly then
    connect(localRenewableProduction.gasPortOut, junction1.gasPort[connectlocalRenewableProduction]) annotation (Line(
        points={{10,-98},{32,-98},{32,-32},{44,-32}},
        color={255,255,0},
        thickness=1.5));
  else
    connect(localRenewableProduction.gasPortOut, gasPortIn[connectlocalRenewableProduction]);
  end if;

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for power-to-gas plants/////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  connect(powerToGasSystem.epp_OUT, epp) annotation (Line(
      points={{-28.4,-24},{-28.4,-18},{40,-18},{40,8},{120,8}},
      color={28,108,200},
      thickness=0.5));
  connect(powerToGasSystem.gasPortIn_CO2, cO2System.gasPortOut) annotation (Line(
      points={{-20,-26},{16,-26},{16,22},{10,22}},
      color={215,215,215},
      thickness=1.5));

  if useOneGasPortOnly then
    connect(powerToGasSystem.gasPortOut_1, junction1.gasPort[connectPowerToGas + 1]) annotation (Line(
        points={{-20,-36},{32,-36},{32,-32},{44,-32}},
        color={255,255,0},
        thickness=1.5));
  else
    connect(powerToGasSystem.gasPortOut_1, gasPortIn[connectPowerToGas]);
  end if;

  if PowerToGasPlantsInThisRegion and ptGTypeIsMethanation then
    if usageOfWasteHeatOfPtG == 2 then
      connect(powerToGasSystem.port_a, cO2System.port_a) annotation (Line(points={{-24,-44},{-24,36},{-6,36}}, color={191,0,0}));
    elseif usageOfWasteHeatOfPtG == 3 then
      connect(powerToGasSystem.fluidPortIn, heatingGridSystem_Storage.WaterPortOut_ExternalHeatSource) annotation (Line(
          points={{-34,-44},{-34,-52},{-52,-52},{-52,78},{4,78},{4,81.8}},
          color={175,0,0},
          thickness=0.5));
      connect(powerToGasSystem.fluidPortOut, heatingGridSystem_Storage.WaterPortIn_ExternalHeatSource) annotation (Line(
          points={{-36,-44},{-36,-48},{-50,-48},{-50,82},{-4,82},{-4,81.8}},
          color={175,0,0},
          thickness=0.5));
    end if;
  else
    if usageOfWasteHeatOfPtG == 3 then
      connect(powerToGasSystem.fluidPortIn, heatingGridSystem_Storage.WaterPortOut_ExternalHeatSource);
      connect(powerToGasSystem.fluidPortOut, heatingGridSystem_Storage.WaterPortIn_ExternalHeatSource);
    end if;
  end if;

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for heating grid////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  connect(DataTable_HeatDemand.y1, gain_HeatingDemand_HeatingGrid.u) annotation (Line(points={{-85.5,-123},{-82,-123},{-82,-115},{-78.6,-115}}, color={0,0,127}));

  connect(heatingGridSystem_Storage.P_el_CHP, localSurplusPowerIntern.u[3]) annotation (Line(points={{11.4,98},{82,98},{82,-80}},             color={0,0,127}));
  connect(gain_HeatingDemand_HeatingGrid.y, heatingGridSystem_Storage.Q_demand) annotation (Line(points={{-71.7,-115},{-58,-115},{-58,96.2},{-12,96.2}}));
  connect(heatingGridSystem_Storage.epp, epp) annotation (Line(
      points={{9.5,86.6},{40,86.6},{40,8},{120,8}},
      color={28,108,200},
      thickness=0.5));
  if useOneGasPortOnly then
    connect(junction1.gasPort[integer(4 + TransiEnt.Basics.Functions.boolean2integer(PowerToGasPlantsInThisRegion) + nPowerPlants + TransiEnt.Basics.Functions.boolean2integer(GasStorageInThisRegion))], heatingGridSystem_Storage.gasPortIn) annotation (Line(
        points={{44,-32},{32,-32},{32,83},{10,83}},
        color={255,255,0},
        thickness=1.5));
  else
    connect(heatingGridSystem_Storage.gasPortIn, gasPortIn[3]);
  end if;

  if DifferentTypesOfElectricHeater >= 1 then
    connect(heatingGridSystem_Storage.P_ElectricalHeater_max, P_ElectricalHeater_max.u) annotation (Line(points={{11.4,101},{11.4,100.5},{86.1,100.5},{86.1,-70},{92.4,-70}},
                                                                                                                                                            color={0,0,127}));
  else
    connect(P_ElectricalHeater_max.u, Zero.y);
  end if;
  //connect(P_ElectricalHeater_max, heatingGridSystem_Storage.P_ElectricalHeater_max) annotation (Line(points={{112,-66},{92,-66},{92,113},{11.4,113}}, color={0,0,127}));

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for CO2System/////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  connect(realExpression14.y, prescribedTemperature.T) annotation (Line(points={{-35.5,36},{-32.4,36}}, color={0,0,127}));
  connect(prescribedTemperature.port, cO2System.port_a) annotation (Line(points={{-28,36},{-6,36}}, color={191,0,0}));
  connect(cO2System.epp, powerToGasSystem.epp_IN) annotation (Line(
      points={{6,36.2},{6,40},{40,40},{40,-18},{-32,-18},{-32,-24}},
      color={28,108,200},
      thickness=0.5));

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////connect statements for other components/////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  connect(centralPhaseShifter.epp, epp) annotation (Line(
      points={{116,-5},{110,-5},{110,8},{120,8}},
      color={28,108,200},
      thickness=0.5));

  if useOneGasPortOnly and useImportExportBoundary then
    connect(junction1.gasPort[NeededGasPortsForJunction], boundaryImportExportInRegion.fluidPortIn);
  end if;

  connect(cO2System.P_el, P_DAC.u) annotation (Line(
      points={{-10.4,24},{-24,24},{-24,10},{88,10},{88,50},{92.4,50}},
      color={0,135,135},
      pattern=LinePattern.Dash));

  connect(localRenewableProduction.P_RE_potential, P_renewable.u) annotation (Line(points={{11,-82.8},{72,-82.8},{72,-96},{92.4,-96}},color={0,0,127}));
  connect(P_surplus_region.u, localSurplusPowerIntern.y) annotation (Line(points={{92.4,-80},{90.68,-80}}, color={0,0,127}));

  //sum

  connect(Zero.y, sum_P_heatingGrid_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,91},{68,91}},   color={0,0,127}));
  connect(Zero.y, sum_m_flow_heatingGridGas_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,83},{68,83}}, color={0,0,127}));
  connect(Zero.y, sum_m_flow_gasStorage_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,55},{68,55}}, color={0,0,127}));
  connect(Zero.y, sum_m_gasStorage_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,47},{68,47}}, color={0,0,127}));
  connect(Zero.y, sum_m_flow_CO2toPtG.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,33},{68,33}}, color={0,0,127}));
  connect(Zero.y, sum_m_flow_CO2fromPowerplants.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,25},{68,25}}, color={0,0,127}));
  connect(Zero.y, sum_P_CO2DAC_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,10},{66,10},{66,14},{68,14},{68,17}}, color={0,0,127}));
  connect(Zero.y, sum_P_Powerplants_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,1},{66,1}},   color={0,0,127}));
  connect(Zero.y, sum_m_flow_powerPlant_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,-7},{66,-7}},
                                                                                                              color={0,0,127}));
  connect(Zero.y, sum_P_PtG_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,-37},{66,-37}}, color={0,0,127}));
  connect(Zero.y, sum_m_flow_PtG_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,-45},{66,-45}}, color={0,0,127}));
  connect(Zero.y, sum_E_electricalStorage_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,-59},{66,-59}}, color={0,0,127}));
  connect(Zero.y, sum_P_electricalStorage_is.u[1]) annotation (Line(points={{58.5,105},{60,105},{60,-67},{66,-67}}, color={0,0,127}));

  connect(heatingGridSystem_Storage.P_ElectricalHeater_max, sum_P_heatingGrid_is.u[1+(if (DifferentTypesOfElectricHeater + DifferentTypesOfGasBoiler + DifferentTypesOfCHPPlants) > 0 then 1 else 0)]) annotation (Line(points={{11.4,101},{60,101},{60,91},{68,91}},   color={0,0,127}));
  connect(heatingGridSystem_Storage.P_el_CHP, sum_P_heatingGrid_is.u[1+(if (DifferentTypesOfElectricHeater + DifferentTypesOfGasBoiler + DifferentTypesOfCHPPlants) > 0 then 2 else 0)]) annotation (Line(points={{11.4,98},{58,98},{58,91},{68,91}},     color={0,0,127}));
  connect(heatingGridSystem_Storage.m_flow_gas, sum_m_flow_heatingGridGas_is.u[1+(if (DifferentTypesOfElectricHeater + DifferentTypesOfGasBoiler + DifferentTypesOfCHPPlants) > 0 then 1 else 0)]) annotation (Line(points={{11.4,95},{56,95},{56,83},{68,83}},   color={0,0,127}));

  connect(gasStorageSystem.m_flow_storage, sum_m_flow_gasStorage_is.u[1 .+(1:DifferentTypesOfGasStorage)]) annotation (Line(points={{11,59},{60,59},{60,55},{68,55}}, color={0,0,127}));
  connect(gasStorageSystem.m_storage, sum_m_gasStorage_is.u[1 .+(1:DifferentTypesOfGasStorage)]) annotation (Line(points={{11,61},{56,61},{56,47},{68,47}}, color={0,0,127}));

  connect(cO2System.m_flow_toPtG, sum_m_flow_CO2toPtG.u[1 + (if (CO2StorageNeeded>0) then 1 else 0)]) annotation (Line(points={{11,17.2},{60,17.2},{60,33},{68,33}}, color={0,0,127}));
  connect(cO2System.m_flow_fromPowerplants, sum_m_flow_CO2fromPowerplants.u[1 + (if (CO2StorageNeeded>0) then 1 else 0)]) annotation (Line(points={{11,19.2},{56,19.2},{56,25},{68,25}}, color={0,0,127}));
  connect(cO2System.P_el, sum_P_CO2DAC_is.u[1 + (if (CO2StorageNeeded>0) then 1 else 0)]) annotation (Line(
      points={{-10.4,24},{-24,24},{-24,10},{66,10},{66,16},{68,16},{68,17}},
      color={0,135,135},
      pattern=LinePattern.Dash));

  connect(powerPlantSystem.P_Powerplant_is, sum_P_Powerplants_is.u[1 .+ (1:nPowerPlants)]) annotation (Line(
      points={{10.6,7},{48,7},{48,1},{66,1}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(powerPlantSystem.m_flow_Powerplant_is, sum_m_flow_powerPlant_is.u[1 .+ (1:nPowerPlants)]) annotation (Line(points={{10.6,5},{44,5},{44,-7},{66,-7}}, color={0,0,127}));

  connect(powerToGasSystem.P, sum_P_PtG_is.u[1 + (if (PowerToGasPlantsInThisRegion)  then 1 else 0)]) annotation (Line(
      points={{-40.4,-36.6},{-52,-36.6},{-52,-50},{56,-50},{56,-38},{66,-38},{66,-37}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(powerToGasSystem.m_flow_gas_out, sum_m_flow_PtG_is.u[1 + (if (PowerToGasPlantsInThisRegion)  then 1 else 0)]) annotation (Line(points={{-40.4,-39.6},{-40.4,-46},{60,-46},{60,-45},{66,-45}}, color={0,0,127}));

  connect(electricalStorageSystem.E_storage_is, sum_E_electricalStorage_is.u[1 .+(1:DifferentTypesOfElectricalStorages)]) annotation (Line(points={{11.6,-55},{60,-55},{60,-59},{66,-59}}, color={0,0,127}));
  connect(electricalStorageSystem.P_storage_is, sum_P_electricalStorage_is.u[1 .+(1:DifferentTypesOfElectricalStorages)]) annotation (Line(points={{11.6,-71},{60,-71},{60,-67},{66,-67}}, color={0,0,127}));

  connect(sum_m_flow_powerPlant_is.y, powerToGasSystem.PP_m_flowGas) annotation (Line(points={{72.51,-7},{74,-7},{74,-16},{-48,-16},{-48,-43},{-40,-43}},
                                                                                                                                                      color={0,0,127}));
  connect(sum_P_PtG_is.y, P_PowerToGasPlant_is.u) annotation (Line(points={{72.51,-37},{72.51,-36},{90,-36},{90,30},{92.4,30}},
                                                                                                                     color={0,0,127}));

  connect(inputBus.P_set_ElectricalHeater, heatingGridSystem_Storage.P_set_ElectricalHeater) annotation (Line(
      points={{-99.9,120.1},{-99.9,100},{-12,100},{-12,101}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(inputBus.P_set_ElectricalStorage, electricalStorageSystem.P_set) annotation (Line(
      points={{-99.9,120.1},{-99.9,-54},{-54,-54},{-54,-54.05},{-11.55,-54.05}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(inputBus.P_set_curtailment, localRenewableProduction.P_curtailment) annotation (Line(
      points={{-99.9,120.1},{-99.9,-82.4},{-12,-82.4}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(P_PowerPlant_is.y, outputBus.P_PowerPlant_is) annotation (Line(points={{99.3,90},{170,90},{170,120.1},{100.1,120.1}},
                                                                                                                       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_DAC.y, outputBus.P_DAC) annotation (Line(points={{99.3,50},{170,50},{170,120.1},{100.1,120.1}},
                                                                                                 color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_ElectricalHeater_max.y, outputBus.P_ElectricalHeater_max) annotation (Line(points={{99.3,-70},{170,-70},{170,120.1},{100.1,120.1}},
                                                                                                                                     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_surplus_region.y, outputBus.P_surplus_region) annotation (Line(points={{99.3,-80},{170,-80},{170,120.1},{100.1,120.1}},
                                                                                                                         color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_renewable.y, outputBus.P_renewable) annotation (Line(points={{99.3,-96},{170,-96},{170,120.1},{100.1,120.1}},
                                                                                                               color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_PowerToGasPlant_is.y, outputBus.P_PowerToGasPlant_is) annotation (Line(points={{99.3,30},{170,30},{170,120.1},{100.1,120.1}},
                                                                                                                               color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));

  // _____________________________________________
  //
  //                   Connects for fillup
  // _____________________________________________
  //Power Plants
  for j in 1:MaximalDifferentTypesOfPowerPlants loop
    if j <= DifferentTypesOfPowerPlants then
      connect(P_PowerPlant_max[j].y, P_PowerPlant_maxOut[j].u) annotation (Line(points={{99.3,70},{106.4,70}},                    color={0,0,127}));
      connect(powerPlantSystem.P_max_noCCs, P_max_noCCSout.u) annotation (Line(points={{-10.6,5.2},{-82,5.2},{-82,12.4}},   color={0,0,127}));

    else
      connect(Zero.y, P_PowerPlant_maxOut[j].u) annotation (Line(points={{58.5,105},{58.5,104.5},{60.5,104.5},{60.5,70},{106.4,70}},
                                                                                                               color={0,0,127}));
      connect(Zero.y, P_max_noCCSout.u) annotation (Line(points={{58.5,105},{60,105},{60,12.4},{-82,12.4}},                    color={0,0,127}));
    end if;
  end for;

  //Electrical Storages
  for j in 1:MaximalDifferentTypesOfElectricalStorages loop
    if j <= DifferentTypesOfElectricalStorages then
      connect(P_storage_is[j].y, P_storage_isOut[j].u) annotation (Line(points={{99.3,-110},{106.4,-110}},                                                 color={0,0,127}));
      connect(P_max_load_storage[j].y, P_max_load_storageOut[j].u) annotation (Line(points={{99.3,-120},{106.4,-120}},                                                color={0,0,127}));
      connect(P_max_unload_storage[j].y, P_max_unload_storageOut[j].u) annotation (Line(points={{99.3,-130},{106.4,-130}},                                          color={0,0,127}));
    else
      connect(Zero.y, P_storage_isOut[j].u) annotation (Line(points={{58.5,105},{60,105},{60,-110},{106.4,-110}},
                                                                                                               color={0,0,127}));
      connect(Zero.y, P_max_load_storageOut[j].u) annotation (Line(points={{58.5,105},{60,105},{60,-120},{106.4,-120}},color={0,0,127}));
      connect(Zero.y, P_max_unload_storageOut[j].u) annotation (Line(points={{58.5,105},{60,105},{60,-130},{106.4,-130}},color={0,0,127}));
    end if;
  end for;

  connect(P_PowerPlant_maxOut.y, outputBus.P_PowerPlant_max) annotation (Line(points={{113.3,70},{170,70},{170,120.1},{100.1,120.1}},
                                                                                                                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_storage_isOut.y, outputBus.P_storage_is) annotation (Line(points={{113.3,-110},{170,-110},{170,120.1},{100.1,120.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_max_load_storageOut.y, outputBus.P_max_load_storage) annotation (Line(points={{113.3,-120},{170,-120},{170,120.1},{100.1,120.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_max_unload_storageOut.y, outputBus.P_max_unload_storage) annotation (Line(points={{113.3,-130},{170,-130},{170,120.1},{100.1,120.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(masterBusControl.GasStorageSystem, gasStorageSystem.controlBus) annotation (Line(
      points={{0.1,120.1},{-66,120.1},{-66,54},{-10,54}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(expression_pGas_gasStorage.y, masterBusControl.GasStorageSystem.pGas_gasStorage) annotation (Line(points={{-41.2,143},{-26,143},{-26,120.1},{0.1,120.1}},
                                                                                                                                                     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(cO2System.controlBus, masterBusControl.CO2System) annotation (Line(
      points={{-10,26},{-66,26},{-66,120.1},{0.1,120.1}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(powerToGasSystem.controlBus, masterBusControl.PowerToGasSystem) annotation (Line(
      points={{-40.8,-34},{-66,-34},{-66,120.1},{0.1,120.1}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(expression_H2gasFrac.y, masterBusControl.PowerToGasSystem.H2gasFrac) annotation (Line(points={{-41.2,159},{-26,159},{-26,120.1},{0.1,120.1}},
                                                                                                                                                  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(expression_pGas_pTG.y, masterBusControl.PowerToGasSystem.pGas_pTG) annotation (Line(points={{-41.2,171},{-26,171},{-26,120.1},{0.1,120.1}},
                                                                                                                                                color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(gasPressure.y, masterBusControl.PowerPlantSystem.gasPressure) annotation (Line(points={{-41.2,131},{-26,131},{-26,120.1},{0.1,120.1}},
                                                                                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(masterBusControl.PowerPlantSystem.P_max_PowerPlant_out, P_PowerPlant_max.u) annotation (Line(
      points={{0.1,120.1},{44,120.1},{44,70},{92.4,70}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(masterBusControl.PowerPlantSystem.P_el_set_out, powerPlantSystem.P_el_set) annotation (Line(
      points={{0.1,120.1},{-66,120.1},{-66,7.4},{-10.6,7.4}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(P_max_noCCSout.y, masterBusControl.PowerPlantSystem.P_max_noCCs) annotation (Line(points={{-82,19.3},{-82,120.1},{0.1,120.1}},      color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
     annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-120},{120,120}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-140},{120,120}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>The superstructure component provides a representation of a certain region in terms of consumption and production of power and gas. This representation is comprised of multiple elements that connect with the central electric and gas ports and either consume or generate gas or electrical power. Superstructures are to be used as arrays enclosed in <a href=\"ResiliEntEE.Superstructure_JB_DELIVERY.Portfolios.Portfolio_Example.Superstructures_PortfolioMask\">superstructure portolio masks</a> for maximum utilization.</p>
<p>See <a href=\"ResiliEntEE.Superstructure_JB_DELIVERY.SuperstructureUsageGuide\">usage guide</a> for more information.</p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span> </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span> </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>Outputs:</p>
<ul>
<li>epp: complex electric power port</li>
<li>gasPort: gas port</li>
<li>P_renewable: output current renewable power </li>
<li>P_max_unload_storage: output current electrical storage maximum unload power</li>
<li>P_max_load_storage: output current electrical storage maximum load power</li>
<li>P_storage_is: output current electrical storage power</li>
<li>P_PowerToGasPlant_is: output current power to gas plants consumed power</li>
<li>P_PowerPlant_max: output current powerplant relative potential power output</li>
<li>P_PowerPlant_is: output current powerplant power in each region</li>
<li>P_ElectricalHeater_max: output current potential of local heating grid power to heat</li>
<li>P_DAC: output current direct air capture power consumption</li>
</ul>
<p>Inputs:</p>
<ul>
<li>P_curtailment: input current curtailment of renewables setpoint</li>
<li>P_set_ElectricalHeater: input local heating grid power to heat setpoint</li>
<li>P_set_ElectricalStorage: input current electrical storage setpoint power</li>
<li>P_set_PowerPlant: input current power plant setpoint power</li>
<li>P_set_PtG: input current power to gas setpoint power</li>
</ul>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span> </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span> </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span> </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p>(no remarks) </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span> </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><br>Model created by Oliver Sch&uuml;lting (oliver.schuelting@tuhh.de), Nov 2020</p>
<p>Model redesigned by Jon Babst (babst@xrg-simulation.de), 06.09.2021</p>
</html>"));
end Superstructure;
