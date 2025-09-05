within TransiEnt.SystemGeneration.Superstructure.Components;
expandable connector ControlBus

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
  extends Modelica.Icons.SignalSubBus;

  Real pGas_gasStorage;
  Real pGas_pTG;
  Real H2gasFrac[busVariableDeclaration.nFracH2];
  Real gasPressure[busVariableDeclaration.n_gasPortOut_powerPlants];
  Real P_max_noCCS[busVariableDeclaration.MaximalDifferentTypesOfPowerPlants];
  Real P_max_PowerPlant_out[busVariableDeclaration.MaximalDifferentTypesOfPowerPlants];
  Real P_el_set_out[busVariableDeclaration.MaximalDifferentTypesOfPowerPlants];

protected
  final outer
        BusVariableDeclaration busVariableDeclaration annotation ();

  annotation ();
end ControlBus;
