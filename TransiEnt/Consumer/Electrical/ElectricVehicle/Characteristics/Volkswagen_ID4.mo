within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record Volkswagen_ID4
  extends Models_CyEntEE.CellModels.ElectricVehicle.Data.BEV_measurements;
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
  // Gas- und Wärme-Institut Essen                                                  //
  // and                                                                            //
  // XRG Simulation GmbH (Hamburg, Germany).                                        //
  //                                                                                //
  //                                                                                //
  // Data Record from ERIGrid 2.0 Project MOVES                                     //
  //                                                                                //
  // Last Author: Tom Steffen, Last Update: 12.08.2025, Email: tom.steffen@tuhh.de  //
  //________________________________________________________________________________//

  parameter Real eta_mean_over_P_grid_and_V_grid[:,:] = [0.0, 400.0;4100.0, 0.8540212414079775;6500.0, 0.9075810333134954;6600.0, 0.8982492530634091;8600.0, 0.9076432755406225;8700.0, 0.9145651132287294;10700.0, 0.8999280471257506;10900.0, 0.9074777748708281;11000.0, 0.9156695303534464;11100.0, 0.9176503936458992];

  parameter Real P_loss_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;0.0, 0.0;4100.0, 598.9016357738647;6500.0, 604.8645571645513;6600.0, 669.2682467307802;8600.0, 796.894828045986;8700.0, 740.9659919825071;10700.0, 1070.9410470385758;10900.0, 1012.1219205939663;11000.0, 928.571091495063;11100.0, 911.2618766364416];

  parameter Real Q_grid_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;4100.0, -577.9349706518381;6500.0, -530.3187366670282;6600.0, -530.3662957314203;8600.0, -474.2667219764012;8700.0, -475.8985034013605;10700.0, -438.6491659538066;10800.0, -444.0378891941392;10900.0, -419.3471679039169;11000.0, -423.1726135107196;11100.0, -424.7360851563424];

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-80,60},{80,-60}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-70,40},{70,-40}},
          textColor={0,149,152},
          horizontalAlignment=TextAlignment.Left,
          textString="Data Record for the efficiency (eta) and reactive power (Q) profiles 
over the Battery Power (P_bat) measured for Volkswagen ID4

Use CombiTable2Ds for the data to smoothen outliers

Measurements where taken in the ERIGrid 2.0 Project MOVES")}));
end Volkswagen_ID4;
