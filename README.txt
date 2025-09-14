  //________________________________________________________________________________//
  // TransiEnt Library, version: 2.0.3  			               	    //
  //                                                                                //
  // Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
  // Copyright 2021, Hamburg University of Technology.                              //
  //________________________________________________________________________________//
  //                                                                                //
  // TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
  // supported by the German Federal Ministry of Economics and Energy 		    //
  // (FKZ 03ET4003, 03ET4048, 0324027, 03EI1008).			            //
  // The TransiEnt Library research team consists of the following project partners://
  // Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
  // Institute of Energy Systems (Hamburg University of Technology),                //
  // Institute of Electrical Power and Energy Technology                            //
  // (Hamburg University of Technology)                                             //
  // Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
  // Gas- und Wärme-Institut Essen						    //	
  // and 		                                                            //
  // XRG Simulation GmbH (Hamburg, Germany).                                        //
  //________________________________________________________________________________//
  
Thank you for choosing the TransiEnt Library for your simulation purposes!
Please read the following steps for a successful usage.

This version of the TransiEnt library is the current development version based on the latest/stable version. It may contain some bugs or hasn't tested for all cases. For trouble-free simulation, we refer to the latest/stable version.

*******************************************
Installation:
*******************************************

1. Download transient-lib and copy the library to your preferred folder

Currently, only Dymola provides full suppport of TransiEnt. The development team has tested all models carefully using Dymola 2025x Refresh1. Except for the superstructure models, which only work perfectly until Dymola 2023.

2. Download the ClaRa library 1.8.1 from the official github page (https://github.com/xrg-simulation/ClaRa-official/releases/tag/1.8.1). Copy the content of the unzipped folder ClaRa-official-1.8.1 into! the transient-lib folder named ClaRa.
Or fork our repository and checkout the hash of our Release. Don't forget to update the submodules. An installation structure can be found at https://www.tuhh.de/transient-ee/getting-started/installation-instruction.


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
* ClaRa ("Simulation of Clausius Rankine Cycles")
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
 
Superstructure
	- Previously internally defined controllers removed from physical model
	- Control models now completely outside superstructure
	- Bus system for internal ad external communication  
	- At present only compatible with Dymola2023x or below

Heating Components
	- inserted numerically improved models for the simulation of large-scale district heating networks (DHN)
	- created a Tutorial (on website) with corresponding Tutorial models for giving an overview on how to simulate DHN using the TransiEnt Library

Electrical Components
	- new prosumer model that includes Battery Electric Vehicles (BEV), Building Heating Systems with Electric Heat Pumps, Battery Energy Storage Systems, and Photovoltaics, enabling a realistic and modular representation of prosumer behavior and energy Management
	- a series of low- and medium-voltage grid scenarios based on the SimBench dataset have been added, covering urban, semi-urban, and rural configurations. These examples provide valuable test cases for grid simulation and analysis, facilitating validation and further development of grid-related models
	- All new components include internal controllers that reflect typical customer base loads and can be simulated directly. Moreover, the models are designed for external interaction, allowing integration with control algorithms implemented outside Modelica. This enables large-scale studies on electrical low- and medium-voltage systems, supporting investigations into modern energy management techniques such as congestion analysis and flexibility assessments.


***Renamed***


***Fixed Bugs***


***Others***
- Better documentation of Heat Models and GridConstructor


*******************************************
Acknowledgement for Release 3.0.0
*******************************************
This research has been performed among other things using the ERIGrid 2.0 Research Infrastructure and is part of a project that has received funding from the European Union’s Horizon 2020 Research and Innovation Programme under the Grant Agreement No. 870620. The support of the European Research Infrastructure ERIGrid 2.0 and its partner DTU is very much appreciated.

This research was funded by the Federal Ministry for Economic Affairs and Climate Action in the projects “EffiziEntEE” (03EI1050A), “Integranet“ (0324027B), “IntegranetII“ (03EI1008B).

*******************************************	
Contact:	
*******************************************
	transientlibrary@tuhh.de