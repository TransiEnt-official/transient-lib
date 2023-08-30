  //________________________________________________________________________________//
  // TransiEnt Library, version: 2.0.2  development version               		      //
  //                                                                                //
  // Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
  // Copyright 2021, Hamburg University of Technology.                              //
  //________________________________________________________________________________//
  //                                                                                //
  // TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
  // supported by the German Federal Ministry of Economics and Energy 		          //
  // (FKZ 03ET4003, 03ET4048, 0324027, 03EI1008).			                              //
  // The TransiEnt Library research team consists of the following project partners://
  // Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
  // Institute of Energy Systems (Hamburg University of Technology),                //
  // Institute of Electrical Power and Energy Technology                            //
  // (Hamburg University of Technology)                                             //
  // Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
  // Gas- und Wärme-Institut Essen						                                      //	
  // and 		                                                                        //
  // XRG Simulation GmbH (Hamburg, Germany).                                        //
  //________________________________________________________________________________//
  
Thank you for choosing the TransiEnt Library for your simulation purposes!
Please read the following steps for a successful usage.

This version of the TransiEnt library is the current development version based on the latest/stable version. It may contain some bugs or hasn't tested for all cases. For trouble-free simulation, we refer to the latest/stable version.

*******************************************
Installation:
*******************************************

1. Download transient-lib and copy the library to your preferred folder

Currently, only Dymola provides full suppport of TransiEnt. The development team has tested all models carefully using Dymola 2022x.

2. Download the ClaRa library from the official website https://www.claralib.com/ and copy unzipped library files into! the transient-lib folder


3. Open the Library using a MOS Script
----------------------------------------
In order to use the TransiEnt Library a few external libraries have to be loaded and some modelica environment variables have to be set. You can perform all required steps automatically by running the script loadTransiEnt.mos located in the directory where the TransiEnt Library is located on your computer.

Before doing this, you have to replace "ADD_YOUR_PATH_TO_TRANSIENT_HERE" (Line 2 of loadTransiEnt.mos) with the absolute path to the directory where the transient Library is located. Line 2 should look something like the following (use front slashes):

repopath="d:$DYMOLA$/Modelica/Library/TransiEnt";

Furthermore, you should replace "ADD_YOUR_PATH_FOR_RESULTS_HERE" (Line 3 of loadTransiEnt.mos)  with the absolute path to the directory where you want to save your results. This enables you to call the functions named 'plotResults' in the Examples and Testers of the Library which will show you some relevant simulation results. Line 3 should look something like this (use front slashes):

resultpath="c:/simulationsresults";

Please make sure that this directory exists (will not be created automatically).

The libraries required and automatically loaded by the script are the following:
* TransiEnt ("Simulation of coupled energy networks")
* ClaRa ("Simulation fo Clausius Rankine Cycles")
* TILMedia (for the calculation of media data)

Additionally the Modelica Library "Buildings Library" is necessary for certain components of the TransiEnt Library.

Note: The models of FluidDissipation library which are important for the use of TransiEnt Library, are now part of ClaRa v.1.3.0 and therefore not additionally listed anymore.

The script can be called from dymola by Simulation -> Simulation -> Script -> RunScript

Alternatively you can add the script to your dymola.mos to load TransiEnt automatically every time dymola is started. The dymola.mos is located in $DYMOLA_INSTALLATION_FOLDER$/insert/dymola.mos. The required line would look like this:

RunScript("d:$DYMOLA$/Modelica/Library/TransiEnt/loadWorkspace.mos")

*******************************************
Release Notes :	
*******************************************

 
***New Features***
 
Heating Components
- New DHN Substation heat exchanger Producer.Heat.Heat2Heat.Indirect_HEX_const_T_out_L1 with setpoint return temperature
- Linearization of pressure calculations for Components.Heat.VolumesValvesFittings.Pipes.SinglePipe_L2 and Components.Heat.VolumesValvesFittings.Pipes.DoublePipePair_L2 to improve simulation speed
- Exchanged Fluid Volume in Components.Heat.VolumesValvesFittings.Pipes.SinglePipe_L2 from ClaRa.Components.VolumesValvesFittings.Fittings.SplitVLE_L2_flex to Components.Heat.VolumesValvesFittings.Pipes.Base.Fluid_Volume

Sysem Generation
- Added consumer statics to GridConstructor in SystemGeneration.GridConstructor.Base.PartialTechnologies and SystemGeneration.GridConstructor.Base.IndependetTechnologies

***Renamed***

Heating Components
- Renamed model Producer.Heat.Heat2Heat.Indirect_HEX_L1 to Producer.Heat.Heat2Heat.Indirect_HEX_const_dT_L1
- Renamed parameter dT_soll to dT_set in Producer.Heat.Heat2Heat.Indirect_Hex_const_dT_L1


***Fixed Bugs***

General 
- Correction of variable reference within pVModule in TransiEnt.SystemGeneration.GridConstructor.IndependentTechnologies
- Change of table interpolation settings in TestGridConstructor to improve simulation speed
- Changed unit of longitude and latitude in parametrization of solar heating technology in TransiEnt.SystemGeneration.GridConstructor.GridConstructor
- Corrected sign error in TransiEnt.Components.Statistics.Collectors.GlobalCollectors.HeatingPowerStatistics
- Changed Typeof Resource in TransiEnt.Producer.Combined.SmallScaleCHP.SmallScaleCHP_simple to Cogeneration instead of Conventional
- Added local collectors collectCosts and collectElectricPower to TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.PVModule, TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.PVPlant, TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.GHI_Input.PVModule and  TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.GHI_Input.PVPlant, TransiEnt.Producer.Electrical.Photovoltaics.DataSheetBasedPV
- Corrected bus that prevented use of absolute paths for tables in Basics.Tables.Combined.CombinedTables.Demand_3Tables and Basics.Tables.Combined.CombinedTables.Demand_Table_combined

Electrical Components
- changed sign in Storage.Electrical.Check.TestLeadAcidBattery for proper operation
- Corrected value in Producer.Electrical.Photovoltaics.Base.MPPEfficiencyModel 

Storage
- corrected equation in Storage.Heat.HotWaterStorage_constProp_L4.HotWaterStorage_constProp_L4 for correct calculation of the heat storage's volume

Heating Components
- Correction of formula to calculate SolarTime in TransiEnt.Producer.Heat.SolarThermal.Base.SolarTime
- Replaced the pressure calculation for height difference in district heating pipes in Components.Heat.VolumesValvesFittings.Pipes.Base.dp_residencetime
- Moved Components.Heat.VolumesValvesFittings.Pipes.Base.dp_residencetime between the heat transfer calculations to improve computation speed by decoupling pressure calculations
- Limited residence time in Components.Heat.VolumesValvesFittings.Pipes.Base.dp_residencetime to 10 h to improve initialization
- The DHN parameters depth and lambda_ground in Components.Heat.VolumsValvesFittings.Pipes.Base.HT_Single_Buried_L2 are now correctly passed with simCenter and Components.Heat.VolumesValvesFittings.Pipes.Base.pipe_parameters
- The threshold block for storage temperature was replaced by a hysteresis in Producer.Heat.SolarThermal.Control.ControllerPumpSolarCollectorTandG to improve simulation speed
- Added parameter for nominal electric power of backup heater in Producer.Heat.Power2Heat.Heatpump.BivalentHeatPumpWithControl to pass its value from the HeatPumpSystem level to the ElectricBoiler
- Moved parameter assignment to the Controller.Base.Controller in Producer.Heat.Power2Heat.Heatpump.BivalentHeatPumpWithControl to maintain the values when the controller model is changed
- Calculation of the nominal thermal power of the ElectricBoiler from the given nominal electrical power in Producer.Heat.Power2Heat.Heatpump.BivalentHeatPumpWithControl
- Aligned the Producer.Heat.Power2Heat.ElectricBoiler.ElectricBoiler model with the Producer.Heat.Power2Heat.Heatpump.Heatpump model by using replaceable models for the PowerPort and PowerBoundary model. Settings for the PowerBoundaryModel in SystemGeneration.GridConstructor.IndependentTechnologies were changed to make simulations with the setting „CalculateHeater=True“ work. The redeclaration of the PowerPortModel and the PowerBoundaryModel was adjusted in HotWaterStorage_const_Prop_L4 and Producer.Heat.Power2Heat.Heatpump.BivalentHeatPumpWithControl.
- Corrected sign Error in Components.Statistics.Collectors.GlobalCollectors.HeatingPowerStatistics


***Others***
- Deleted the model Components.Heat.VolumesValvesFittings.Pipes.Base.DoublePipePair_Base_L2 since it wasn't used

*******************************************	
Contact:	
*******************************************
	transientlibrary@tuhh.de