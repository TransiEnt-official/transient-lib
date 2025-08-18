within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record Volkswagen_ID3
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

  parameter Real eta_mean_over_P_grid_and_V_grid[:,:] = [0.0, 400.0;4200.0, 0.9405541938357677;4300.0, 0.9445237501994509;4600.0, 0.9377931935265715;4700.0, 0.9368713831332726;5300.0, 0.9338662973981198;5400.0, 0.9416087994124366;6000.0, 0.9329296793687278;6700.0, 0.9404071794579479;6800.0, 0.9276291476482935;7400.0, 0.9390391931474378;8100.0, 0.934496064630003;8800.0, 0.9383882535917584;9500.0, 0.9376828675861981;10200.0, 0.93309161267398;10900.0, 0.9353085226710157;11100.0, 0.9231225318671692;11200.0, 0.9148170879746138];

  parameter Real P_loss_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;0.0, 0.0;4200.0, 252.30424307839917;4300.0, 236.03207280616874;4600.0, 289.06066146296166;4700.0, 293.73224744476767;5300.0, 352.70209582891493;5400.0, 313.0603690185545;6000.0, 404.7443149895731;6700.0, 400.97667974930783;6800.0, 488.67928481920603;7400.0, 451.57322178849415;8100.0, 531.9773185158512;8800.0, 542.254487059208;9500.0, 590.9250964041319;10200.0, 682.8225869578462;10900.0, 705.5408133880304;11100.0, 856.2714320068733;11200.0, 950.8970069500151];

  parameter Real Q_grid_over_P_bat_and_V_grid[:,:] = [0.0, 360.0, 400.0, 440.0;4200.0, -476.75588972431075, -595.9448621553885, -715.1338345864662;4300.0, -480.4122324159021, -600.5152905198776, -720.6183486238532;4600.0, -473.24107424960505, -591.5513428120063, -709.8616113744075;4700.0, -474.83224400871455, -593.5403050108931, -712.2483660130717;5300.0, -463.0759002770083, -578.8448753462604, -694.6138504155125;5400.0, -463.98888888888877, -579.986111111111, -695.9833333333331;6000.0, -451.04061895551257, -563.8007736943907, -676.5609284332689;6700.0, -437.3689298043729, -546.7111622554661, -656.0533947065594;6800.0, -438.3752212389381, -547.9690265486727, -657.5628318584072;7400.0, -423.64640883977904, -529.5580110497237, -635.4696132596686;8100.0, -410.3166023166024, -512.895752895753, -615.4749034749037;8800.0, -401.37550274223025, -501.7193784277878, -602.0632541133454;9500.0, -396.00588235294117, -495.00735294117646, -594.0088235294118;10200.0, -392.40077972709554, -490.50097465886944, -588.6011695906433;10900.0, -382.61091581868635, -478.2636447733579, -573.9163737280295;11100.0, -372.183216070154, -465.2290200876925, -558.274824105231;11200.0, -374.2779761904762, -467.84747023809524, -561.4169642857144];

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-80,60},{80,-60}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-70,40},{70,-40}},
          textColor={0,149,152},
          horizontalAlignment=TextAlignment.Left,
          textString="Data Record for the efficiency (eta) and reactive power (Q) profiles 
over the Battery Power (P_bat) measured for Volkswagen ID3

Use CombiTable2Ds for the data to smoothen outliers

Measurements where taken in the ERIGrid 2.0 Project MOVES")}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of record</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The purpose of this record is to provide the data for efficiency, active power loss and reactive power for the TransiEnt.Consumer.Electrical.ElectricVehicle.BEVOnboardCharger.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Empirical model based on measurements from the ERIGrid 2.0 Project MOVES.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p>(no remarks)</p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Measurement data plotted: The mean data was used for the arrays. Obvious outliers, which where not removed by bad data detection were not used for the data arrays.</span></p>
<p><img src=\"modelica://TransiEnt/Images/ElectricVehicle/2024-03_Combined_Data_Volkswagen_ID3_overview.png\"/>[2]</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The record data has been plausibility checked against the data in the literature source. [1]</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: Courier New;\">This project is funded by the German Federal Ministry of Economics and Climate Protection (BMWK) as part of the joint project &quot;EffiziEntEE &ndash; Effiziente Einbindung hoher Anteile Erneuerbarer Energien in technisch-wirtschaftlich integrierte Energiesysteme&quot; (funding code: 03EI1050A) and the ERIGrid 2.0 project.</span></p>
<p><span style=\"font-family: Courier New;\">[1] K. Sevdari, L. Calearo, B. H. Bakken, P. B. Andersen, und M. Marinelli, &ldquo;Experimental Validation of Onboard Electric Vehicle Chargers to Improve the Efficiency of Smart Charging Operation,&rdquo; Sustainable Energy Technologies and Assessments, Bd. 60, S. 103512, Dec. 2023.</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: Courier New;\">Volkswagen_ID3 by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</span></p>
</html>"));
end Volkswagen_ID3;
