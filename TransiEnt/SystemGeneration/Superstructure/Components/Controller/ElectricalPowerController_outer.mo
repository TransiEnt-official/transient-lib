within TransiEnt.SystemGeneration.Superstructure.Components.Controller;
model ElectricalPowerController_outer "Controller for superstructure masks, currently supports only 2 types of power plants"

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

  outer TransiEnt.SimCenter simCenter;
  extends TransiEnt.Basics.Icons.Controller;
  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  parameter Integer MaximumDifferentTypesOfPowerPlants;
  parameter Integer MaximumDifferentTypesOfElectricalStorages;
  parameter Integer MaximumDifferentTypesOfPtG;

  parameter Integer NumberOfPowerplantsOverAllRegions;
  parameter Integer NumberOfElectricalStoragesOverAllRegions;
  parameter Integer NumberOfPowerToGasPlantsOverAllRegions;
  parameter Integer NumberOfElectricalHeatersOverAllRegions;

  // From Superstructures Portfolio
  final parameter Integer Region[nRegions]=1:nRegions "Define Region Numbers" annotation (Dialog(group="General"));

  final parameter Integer DifferentTypesOfPowerPlants[nRegions]={powerPlantInstancesRecord[i].nPowerPlants for i in 1:nRegions} "Amount of different power plant types";
  final parameter Integer DifferentTypesOfPowerToGasPlants[nRegions]={powerToGasInstancesRecord[i].nPowerToGasPlants for i in 1:nRegions} "Amount of different power to gas plant types";
  final parameter Integer DifferentTypesOfGasStorage[nRegions]={gasStorageInstancesRecord[i].nGasStorages for i in 1:nRegions} "Amount of different gas storage types";

  //GasGrid
  parameter Modelica.Units.SI.Pressure p_gasGrid_desired[nRegions]=fill(simCenter.p_amb_const + simCenter.p_eff_2, nRegions) "desired gas grid pressure in region" annotation (Dialog(group="GasGrid"));
  parameter Modelica.Units.SI.PressureDifference p_gasGrid_desired_bandwidth[nRegions]=fill(0, nRegions) "band width around p_gasGrid_desired in which the set value varies depending on the SOC of the gas storage" annotation (Dialog(group="GasGrid"));

  //---Failures---//
  parameter Modelica.Units.SI.Pressure p_min_operating_PowerPlants=1e5 "gas pressure threshold at which powerplants turn off" annotation (dialog(tab="Failures"));
  parameter Modelica.Units.SI.Pressure p_min_operating_PowerPlants_backin=2e5 "gas pressure threshold at which powerplants turn back on after turning off" annotation (dialog(tab="Failures"));

  //---Technologies---//

  parameter Boolean useHydrogenFromPtGInPowerPlants[nRegions]=fill(false, nRegions) "Hydrogen from PtG is fed directly into powerplants" annotation (Dialog(group="Power To Gas", tab="Technology Parametrization"));

  parameter Integer usageOfWasteHeatOfPtG[nRegions]=fill(1, nRegions) "Waste heat usage of PtG: 1=No usage, 2=CO2 Desorption, 3=DistrictHeating(currently disabled)" annotation (Dialog(
      group="Power To Gas",
      tab="Technology Parametrization",
      choices(
        choice=1 "No Usage",
        choice=2 "CO2 Desorption",
        choice=3 "District Heating")));

  //---Instance Records--//

  //---- Power plants---//
  parameter .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.Records.InstancesRecords.PowerPlantInstancesRecord powerPlantInstancesRecord[nRegions]=powerPlantInstancesRecordRegionInfo "Power plant parametrization" annotation (Dialog(group="Powerplants", tab="Technology Parametrization"));

  //----Power to gas---//
  parameter .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.Records.InstancesRecords.PowerToGasInstancesRecord[nRegions] powerToGasInstancesRecord=powerToGasInstancesRecordRegionInfo "PtG system parametrization" annotation (Dialog(group="Power To Gas", tab="Technology Parametrization"));

  //----Gas Storage---//
  parameter .TransiEnt.SystemGeneration.Superstructure.Portfolios.Portfolio_Example.Records.InstancesRecords.GasStorageInstancesRecord gasStorageInstancesRecord[nRegions]=gasStorageInstancesRecordRegionInfo "Gas Storage parametrization" annotation (Dialog(group="Gas Storages", tab="Technology Parametrization"));

  // _____________________________________________
  //
  //              Visible Parameters
  // _____________________________________________

public
  parameter Integer nRegions=3;
  parameter Integer MeritOrderPositionElectricStorages=1 "Electric Storages" annotation (Dialog(group="MeritOrder Position"), choices(
      __Dymola_radioButtons=true,
      choice=1 "1",
      choice=2 "2",
      choice=3 "3",
      choice=4 "4"));
  parameter Integer MeritOrderPositionPowerToGas=4 "Power-to-Gas" annotation (Dialog(group="MeritOrder Position"), choices(
      __Dymola_radioButtons=true,
      choice=1 "1",
      choice=2 "2",
      choice=3 "3",
      choice=4 "4"));
  parameter Integer MeritOrderPositionElectricHeater=2 "Electric Heater (District Heating)" annotation (Dialog(group="MeritOrder Position"), choices(
      __Dymola_radioButtons=true,
      choice=1 "1",
      choice=2 "2",
      choice=3 "3",
      choice=4 "4"));

  parameter Integer powerPlantMatrix[max(1, NumberOfPowerplantsOverAllRegions),2];
  parameter Integer electricalStorageMatrix[max(1, NumberOfElectricalStoragesOverAllRegions),2];
  parameter Integer ptGMatrix[max(1, NumberOfPowerToGasPlantsOverAllRegions),2];
  parameter Integer electricalHeaterMatrix[max(1, NumberOfElectricalHeatersOverAllRegions),2];

  parameter Modelica.Units.SI.Power P_nom_PowerPlant[max(1, NumberOfPowerplantsOverAllRegions)] "nominal power of power plants";
  parameter Modelica.Units.SI.Power P_min_const_PowerPlant[max(1, NumberOfPowerplantsOverAllRegions)] "minimum power of power plants";
  parameter Modelica.Units.SI.Power P_max_const_PowerPlant[max(1, NumberOfPowerplantsOverAllRegions)] "minimum power of power plants";

  parameter Modelica.Units.SI.Power P_nom_load_ElectricalStorage_input[max(1, NumberOfElectricalStoragesOverAllRegions)] "nominal loading power of electrical storages";
  parameter Modelica.Units.SI.Power P_nom_unload_ElectricalStorage_input[max(1, NumberOfElectricalStoragesOverAllRegions)] "nominal unloading power of electrical storages";

  parameter Modelica.Units.SI.Power P_nom_load_PtG_input[max(1, NumberOfPowerToGasPlantsOverAllRegions)] "nominal power of PtG-plants";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________
  Modelica.Blocks.Routing.RealPassThrough
                                        P_set_PowerPlant[nRegions,MaximumDifferentTypesOfPowerPlants] annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={110,-40})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_set_ElectricalStorage[nRegions,MaximumDifferentTypesOfElectricalStorages] annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={110,-4})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_set_PtG[nRegions,max(1, MaximumDifferentTypesOfPtG)] annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={110,30})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_curtailment_Region[nRegions] annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={110,60})));
  Modelica.Blocks.Routing.RealPassThrough
                                        P_set_ElectricalHeater[nRegions] annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={110,-70})));

  Modelica.Blocks.Routing.RealPassThrough
                                       P_max_load_storage[nRegions,MaximumDifferentTypesOfElectricalStorages] if MaximumDifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-70,-110})));
  Modelica.Blocks.Routing.RealPassThrough
                                       P_max_unload_storage[nRegions,MaximumDifferentTypesOfElectricalStorages] if MaximumDifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-30,-110})));
  Modelica.Blocks.Routing.RealPassThrough
                            P_storage_is[nRegions,MaximumDifferentTypesOfElectricalStorages] if MaximumDifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={8,-110})));
  Modelica.Blocks.Routing.RealPassThrough
                                       P_ElectricalHeater_max[nRegions] annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-110,80})));
  Modelica.Blocks.Routing.RealPassThrough
                                       P_PowerToGasPlant_is[nRegions] annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-110,48})));
  Modelica.Blocks.Routing.RealPassThrough
                                       P_renewable[nRegions] annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={-110,-80})));
  Modelica.Blocks.Routing.RealPassThrough
                                       P_PowerPlant_is[nRegions] annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-110,-48})));
  Modelica.Blocks.Routing.RealPassThrough
                                       P_PowerPlant_max[nRegions,MaximumDifferentTypesOfPowerPlants] annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-110,-20})));
  Modelica.Blocks.Routing.RealPassThrough
                                       P_residual_Region[nRegions] annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={50,-110})));
  Modelica.Blocks.Routing.RealPassThrough
                                       P_DAC[nRegions] annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-110,16})));
  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Sources.RealExpression P_set_PowerPlant_nonExistent[nRegions,MaximumDifferentTypesOfPowerPlants](y=-1e9) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={76,-36})));
  Modelica.Blocks.Sources.RealExpression P_set_ElectricalStorage_nonExistent[nRegions,MaximumDifferentTypesOfElectricalStorages] annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={76,0})));
  Modelica.Blocks.Sources.RealExpression P_set_PtG_nonExistent[nRegions,max(1, MaximumDifferentTypesOfPtG)] annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={76,34})));

  Modelica.Blocks.Sources.RealExpression Zero(y=0) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={-32,-40})));

  Modelica.Blocks.Math.Gain P_set_PowerPlants_mod[mod.n_PowerPlant](each k=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={50,-40})));

  //this internal controller indexes all plants with one number, so some outside inputs(two dimensions) have to be flattened during connection
  TransiEnt.SystemGeneration.Superstructure.Components.Controller.ElectricalPowerController_inner mod(
    Region=nRegions,
    P_min_const_PowerPlant=P_min_const_PowerPlant,
    P_max_const_PowerPlant=P_max_const_PowerPlant,
    P_nom_PowerPlant=P_nom_PowerPlant,
    P_nom_load_ElectricalStorage=P_nom_load_ElectricalStorage_input,
    P_nom_unload_ElectricalStorage=P_nom_unload_ElectricalStorage_input,
    P_nom_load_PtG=P_nom_load_PtG_input,
    MeritOrderPositionElectricalStorage=MeritOrderPositionElectricStorages,
    MeritOrderPositionPtG=MeritOrderPositionPowerToGas,
    MeritOrderPositionElectricalHeater=MeritOrderPositionElectricHeater,
    MaximumDifferentTypesOfPowerPlants=MaximumDifferentTypesOfPowerPlants,
    NumberOfPowerplantsOverAllRegions=NumberOfPowerplantsOverAllRegions,
    NumberOfPowerToGasPlantsOverAllRegions=NumberOfPowerToGasPlantsOverAllRegions,
    NumberOfElectricalStoragesOverAllRegions=NumberOfElectricalStoragesOverAllRegions,
    NumberOfElectricalHeatersOverAllRegions=NumberOfElectricalHeatersOverAllRegions,
    powerPlantTypeDefinition={if powerPlantMatrix[i, 2] == 1 then 2 else 1 for i in 1:NumberOfPowerplantsOverAllRegions},
    powerPlantMatrix=powerPlantMatrix,
    regionOfElectricalStorage=electricalStorageMatrix[:, 1],
    regionOfPtGPlant=ptGMatrix[:, 1],
    regionOfElectricalHeater={(if Modelica.Math.Vectors.find(i, electricalHeaterMatrix[:, 1]) <> 0 then i else 0) for i in 1:nRegions},
    regionOfPowerPlant=powerPlantMatrix[:, 1]) annotation (Placement(transformation(extent={{-6,-10},{14,10}})));

  Modelica.Blocks.Math.Gain P_set_ElectricalStorages_mod[mod.n_ElectricalStorage](k=1) if MaximumDifferentTypesOfElectricalStorages >= 1 annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={50,-4})));

protected
  InputBus inputBus[nRegions] annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={80,100}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={80,100})));
  OutputBus outputBus[nRegions] annotation (Placement(transformation(extent={{-100,80},{-60,120}}),iconTransformation(extent={{-100,80},{-60,120}})));
public
  MasterBus masterBus annotation (Placement(transformation(extent={{-20,80},{20,120}}), iconTransformation(extent={{-20,80},{20,120}})));

  RegionalController regionalController[nRegions](
    Region=Region,
    DifferentTypesOfPowerPlants=DifferentTypesOfPowerPlants,
    DifferentTypesOfPowerToGasPlants=DifferentTypesOfPowerToGasPlants,
    DifferentTypesOfGasStorage=DifferentTypesOfGasStorage,
    p_gasGrid_desired=p_gasGrid_desired,
    p_gasGrid_desired_bandwidth=p_gasGrid_desired_bandwidth,
    useHydrogenFromPtGInPowerPlants=useHydrogenFromPtGInPowerPlants,
    usageOfWasteHeatOfPtG=usageOfWasteHeatOfPtG,
    p_min_operating_PowerPlants=p_min_operating_PowerPlants,
    p_min_operating_PowerPlants_backin=p_min_operating_PowerPlants_backin,
    gasStorageInstancesRecord=gasStorageInstancesRecord,
    powerPlantInstancesRecord=powerPlantInstancesRecord,
    powerToGasInstancesRecord=powerToGasInstancesRecord) annotation (Placement(transformation(extent={{160,100},{200,140}})));
equation

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  //Powerplants
  for i in 1:nRegions loop
    for j in 1:MaximumDifferentTypesOfPowerPlants loop
      //1. sees if index is in list of powerplants by substraction and checking for scalar product of difference being 0
      if min((abs(powerPlantMatrix - fill({i,j}, max(1, NumberOfPowerplantsOverAllRegions))))*[1; 1]) == 0 then
        //2a. if yes: this row index (of list of powerplants) is connected to P_set_PowerPlant through P_set_PowerPlants_mod (which is used for a possible gain?)
        connect(P_set_PowerPlants_mod[Modelica.Math.Vectors.find(0, vector((abs(powerPlantMatrix - fill({i,j}, max(1, NumberOfPowerplantsOverAllRegions))))*[1; 1]))].y, P_set_PowerPlant[i, j].u) annotation (Line(points={{61,-40},{98,-40}},  color={0,0,127}));
        //2b. also the Pmax input of the mod controller as row index is handed over from input
        connect(mod.P_max_input_PowerPlant[Modelica.Math.Vectors.find(0, vector((abs(powerPlantMatrix - fill({i,j}, max(1, NumberOfPowerplantsOverAllRegions))))*[1; 1]))], P_PowerPlant_max[i, j].y) annotation (Line(points={{-8,0},{-84,0},{-84,-20},{-99,-20}},   color={0,0,127}));
      else
        //3.output indices referring to nonexisting plants are set to 0
        connect(P_set_PowerPlant_nonExistent[i, j].y, P_set_PowerPlant[i, j].u) annotation (Line(points={{87,-36},{98,-36},{98,-40}},           color={0,0,127}));
      end if;
    end for;
  end for;

  //Electrical Storages
  for i in 1:nRegions loop
    if MaximumDifferentTypesOfElectricalStorages < 1 then
      //1. if no electrical strorages exist: internal controller gets zero
      connect(mod.P_max_load_ElectricalStorage[1], Zero.y) annotation (Line(points={{4,-12},{4,-40},{-21,-40}},   color={0,0,127}));
      connect(mod.P_max_unload_ElectricalStorage[1], Zero.y) annotation (Line(points={{0,-12},{0,-40},{-21,-40}},   color={0,0,127}));
      connect(mod.P_is_ElectricalStorage[1], Zero.y) annotation (Line(points={{8,-12},{8,-40},{-21,-40}}, color={0,0,127}));
    else
      for j in 1:MaximumDifferentTypesOfElectricalStorages loop
        //2. see if electrical storage exists at this index
        if min((abs(electricalStorageMatrix[:, 1:2] - fill({i,j}, NumberOfElectricalStoragesOverAllRegions)))*[1; 1]) == 0 then
          //connect output to mod gain
          connect(P_set_ElectricalStorages_mod[Modelica.Math.Vectors.find(0, vector(((abs(electricalStorageMatrix - fill({i,j}, max(1, NumberOfElectricalStoragesOverAllRegions))))*[1; 1])))].y, P_set_ElectricalStorage[i, j].u) annotation (Line(points={{61,-4},{98,-4}},
                                                                                                                                                                                                  color={0,0,127}));
          //connect inputs to internal controller:     P_storage_is & max_load & min_load
          connect(mod.P_max_load_ElectricalStorage[Modelica.Math.Vectors.find(0, vector(((abs(electricalStorageMatrix - fill({i,j}, max(1, NumberOfElectricalStoragesOverAllRegions))))*[1; 1])))], P_max_load_storage[i, j].y) annotation (Line(points={{4,-12},{4,-72},{-70,-72},{-70,-99}},    color={0,0,127}));
          connect(mod.P_max_unload_ElectricalStorage[Modelica.Math.Vectors.find(0, vector(((abs(electricalStorageMatrix - fill({i,j}, max(1, NumberOfElectricalStoragesOverAllRegions))))*[1; 1])))], P_max_unload_storage[i, j].y) annotation (Line(points={{0,-12},{0,-66},{-30,-66},{-30,-99}},    color={0,0,127}));
          connect(mod.P_is_ElectricalStorage[Modelica.Math.Vectors.find(0, vector(((abs(electricalStorageMatrix - fill({i,j}, max(1, NumberOfElectricalStoragesOverAllRegions))))*[1; 1])))], P_storage_is[i, j].y) annotation (Line(points={{8,-12},{8,-99}},
                                                                                                                                                                                                  color={0,0,127}));
        else
          //3.output indices referring to nonexisting el stroages are set to 0
          connect(P_set_ElectricalStorage_nonExistent[i, j].y, P_set_ElectricalStorage[i, j].u) annotation (Line(points={{87,0},{98,0},{98,-4}},        color={0,0,127}));
        end if;
      end for;
    end if;
  end for;

  //Power To Gas plants
  for i in 1:nRegions loop
    if MaximumDifferentTypesOfPtG < 1 then
      //1. if no PtG exists: internal controller gets zero
      connect(mod.P_is_PowerToGasPlant[1], Zero.y) annotation (Line(points={{-8,-8},{-18,-8},{-18,-40},{-21,-40}},  color={0,0,127}));
      connect(mod.P_DAC[1], Zero.y) annotation (Line(points={{-8,8},{-18,8},{-18,-40},{-21,-40}},  color={0,0,127}));
      connect(P_set_PtG_nonExistent.y, P_set_PtG.u) annotation (Line(points={{87,34},{98,34},{98,30}},          color={0,0,127}));
    else
      for j in 1:MaximumDifferentTypesOfPtG loop
        //2. see if  PtG exists at this index
        if min((abs(ptGMatrix - fill({i,j}, max(1, NumberOfPowerToGasPlantsOverAllRegions))))*[1; 1]) == 0 then
          //internal controller output is connected to real output
          connect(mod.P_set_PtG[Modelica.Math.Vectors.find(0, vector(((abs(ptGMatrix - fill({i,j}, max(1, NumberOfPowerToGasPlantsOverAllRegions))))*[1; 1])))], P_set_PtG[i, j].u) annotation (Line(points={{15,0},{26,0},{26,30},{98,30}}, color={0,0,127}));
          //connect inputs to controllers: P_is_PtG & P_DAC
          connect(mod.P_is_PowerToGasPlant[Modelica.Math.Vectors.find(0, vector(((abs(ptGMatrix - fill({i,j}, max(1, NumberOfPowerToGasPlantsOverAllRegions))))*[1; 1])))], P_PowerToGasPlant_is[i].y) annotation (Line(points={{-8,-8},{-76,-8},{-76,48},{-99,48}},   color={0,0,127}));
          connect(mod.P_DAC[Modelica.Math.Vectors.find(0, vector(((abs(ptGMatrix - fill({i,j}, max(1, NumberOfPowerToGasPlantsOverAllRegions))))*[1; 1])))], P_DAC[i].y) annotation (Line(points={{-8,8},{-86,8},{-86,16},{-99,16}},   color={0,0,127}));
        else
          //3.output indices referring to nonexisting PtG are set to 0
          connect(P_set_PtG_nonExistent[i, j].y, P_set_PtG[i, j].u) annotation (Line(points={{87,34},{98,34},{98,30}},          color={0,0,127}));
        end if;
      end for;
    end if;
  end for;

  //other outputs
  connect(mod.P_set_PowerPlant, P_set_PowerPlants_mod.u) annotation (Line(points={{15,4},{28,4},{28,-40},{38,-40}},color={0,0,127}));
  connect(mod.P_set_Storage, P_set_ElectricalStorages_mod.u) annotation (Line(points={{15,-4},{38,-4}},              color={0,0,127}));
  connect(mod.P_set_ElectricalHeater, P_set_ElectricalHeater.u) annotation (Line(points={{15,-8},{24,-8},{24,-70},{98,-70}}, color={0,0,127}));
  connect(mod.P_curtailment_Region, P_curtailment_Region.u) annotation (Line(points={{15,8},{24,8},{24,60},{98,60}}, color={0,0,127}));
  //other inputs
  connect(P_ElectricalHeater_max.y, mod.P_max_ElectricalHeater) annotation (Line(points={{-99,80},{-66,80},{-66,-60},{-4,-60},{-4,-12}},    color={0,0,127}));
  connect(P_renewable.y, mod.P_renewable) annotation (Line(points={{-99,-80},{-86,-80},{-86,4},{-8,4}},   color={0,0,127}));
  connect(P_PowerPlant_is.y, mod.P_is_PowerPlant) annotation (Line(points={{-99,-48},{-80,-48},{-80,-4},{-8,-4}},   color={0,0,127}));
  connect(mod.P_residual_Region, P_residual_Region.y) annotation (Line(points={{12,-12},{12,-90},{50,-90},{50,-99}},color={0,0,127}));

  connect(P_curtailment_Region.y, inputBus.P_set_curtailment) annotation (Line(points={{121,60},{154,60},{154,100.1},{80.1,100.1}},
                                                                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_set_ElectricalStorage.y, inputBus.P_set_ElectricalStorage) annotation (Line(points={{121,-4},{154,-4},{154,100.1},{80.1,100.1}},
                                                                                                                  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_set_PowerPlant.y, inputBus.P_set_PowerPlant) annotation (Line(points={{121,-40},{154,-40},{154,100.1},{80.1,100.1}},
                                                                                                                        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_set_ElectricalHeater.y, inputBus.P_set_ElectricalHeater) annotation (Line(points={{121,-70},{154,-70},{154,100.1},{80.1,100.1}},
                                                                                                                                    color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_set_PtG[:, 1].y, inputBus.P_set_PtG) annotation (Line(points={{121,30},{154,30},{154,100.1},{80.1,100.1}},
                                                                                                                  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(outputBus.P_ElectricalHeater_max, P_ElectricalHeater_max.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,80},{-122,80}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus.P_PowerToGasPlant_is, P_PowerToGasPlant_is.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,48},{-122,48}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus.P_DAC, P_DAC.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,16},{-122,16}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus.P_PowerPlant_is, P_PowerPlant_is.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,-48},{-122,-48}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus.P_renewable, P_renewable.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,-80},{-122,-80}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus.P_surplus_region, P_residual_Region.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,-140},{50,-140},{50,-122}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));

  connect(outputBus.P_PowerPlant_max, P_PowerPlant_max.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,-20},{-122,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus.P_max_load_storage, P_max_load_storage.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,-140},{-70,-140},{-70,-122}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus.P_max_unload_storage, P_max_unload_storage.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,-140},{-30,-140},{-30,-122}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus.P_storage_is, P_storage_is.u) annotation (Line(
      points={{-79.9,100.1},{-154,100.1},{-154,-140},{8,-140},{8,-122}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputBus, masterBus.outputBus) annotation (Line(
      points={{-80,100},{-40,100},{-40,100.1},{0.1,100.1}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(inputBus, masterBus.inputBus) annotation (Line(
      points={{80,100},{40,100},{40,100.1},{0.1,100.1}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(masterBus.f_grid, mod.f_grid) annotation (Line(
      points={{0.1,100.1},{0.1,56},{0,56},{0,12}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));

  //____________________________________
  //
  //     Control Connections
  //____________________________________
  connect(masterBus.MasterBusControl, regionalController.masterBusControl)  annotation (Line(
      points={{0.1,100.1},{0.1,140},{180,140}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(inputBus, regionalController.inputBus) annotation (Line(
      points={{80,100},{180,100}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model is intended to hand over variables from input to the inner controller and vice versa. The structure of the variables is changed in some cases to allow an easier control.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Oliver Sch&uuml;lting (oliver.schuelting@tuhh.de), Nov 2020</p>
</html>"));
end ElectricalPowerController_outer;
