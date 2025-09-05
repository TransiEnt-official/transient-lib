within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record BEV_Data

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
  parameter Boolean useBEV=true
    annotation (choices(__Dymola_checkBox=true), Dialog(group="Electric Vehicle"));
  parameter Integer id=0;
  parameter Modelica.Units.SI.Energy Bat_Capacity(displayUnit="kWh") = 90e3*3600 "Battery capacity in Joule"
    annotation (Dialog(group="Battery"));
  parameter Real Bat_SOCStart(unit="1",displayUnit="%") = 0.5 "Battery Charge at start"
    annotation (Dialog(group="Battery"));
  parameter Modelica.Units.SI.Power Bat_PowerLimit(displayUnit="kW") = 15000
    "Charge and discharge power" annotation (Dialog(group="Battery"));

  replaceable parameter TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110 Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()
      constrainedby TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_measurements
      annotation (Dialog(group="Overall"), choices(
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110() "Renault Zoe R110",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90() "Renault Zoe R90",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3() "Volkswagen ID3",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4() "Volkswagen ID4",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf() "Nissan Leaf",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Peugeot_ION() "Peugeot ION"));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end BEV_Data;
