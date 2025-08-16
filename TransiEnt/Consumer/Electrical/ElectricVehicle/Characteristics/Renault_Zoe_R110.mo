within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record Renault_Zoe_R110
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

  parameter Real eta_mean_over_P_grid_and_V_grid[:,:] = [0.0, 400.0;100.0, 0.03545305911711557;2100.0, 0.5928942906859673;4900.0, 0.7613319586705374;5500.0, 0.8193552835215018;5600.0, 0.8256878757073182;6300.0, 0.842666861361646;6400.0, 0.831800246295481;6900.0, 0.8374704783597712;7000.0, 0.7892108654750251;7700.0, 0.8547195935084195;7800.0, 0.8436214403460441;8400.0, 0.8693219979578339;9300.0, 0.8704401202696763;10500.0, 0.6905744234958219;10600.0, 0.8750632818598676;11000.0, 0.8198855393555811;11100.0, 0.8897300212000424];

  parameter Real P_loss_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;0.0, 0.0; 100.0, 69.18827983822388;2100.0, 856.6508742797695;4900.0, 1163.1837583774939;5500.0, 998.6930166457287;5600.0, 971.5022647200772;6300.0, 995.9262537107718;6400.0, 1073.1278438555235;6900.0, 1124.591345778714;7000.0, 1466.0113352272729;7700.0, 1124.0773212305987;7800.0, 1214.4209559667788;8400.0, 1099.1137992814324;9300.0, 1202.5678111379202;10500.0, 3261.7524181547615;10600.0, 1321.6719497902786;11000.0, 1987.4359779174792;11100.0, 1220.8961019614453];

  parameter Real Q_grid_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;100.0, -4608.993976421994;2100.0, -4534.816645326505;4900.0, -2871.6689526184546;5500.0, -2720.1834170854268;5600.0, -2719.2362934362936;6300.0, -2504.8371501272263;6400.0, -2507.9884225759765;6900.0, -3289.3770287141074;7000.0, -3339.963636363638;7700.0, -3828.320399113082;7800.0, -3837.7106552357627;8400.0, -3784.7147248693514;9300.0, -3685.8972602739723;10500.0, -2935.531746031745;10600.0, -2936.5092524056254;11000.0, -2383.3917394623018;11100.0, -2389.1748674541905];

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-80,60},{80,-60}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-70,40},{70,-40}},
          textColor={0,149,152},
          horizontalAlignment=TextAlignment.Left,
          textString="Data Record for the efficiency (eta) and reactive power (Q) profiles 
over the Battery Power (P_bat) measured for Renault Zoe R110

Use CombiTable2Ds for the data to smoothen outliers

Measurements where taken in the ERIGrid 2.0 Project MOVES")}));
end Renault_Zoe_R110;
