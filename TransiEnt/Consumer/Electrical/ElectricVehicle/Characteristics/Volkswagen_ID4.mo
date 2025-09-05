within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record Volkswagen_ID4
  extends TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_measurements;
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
<p><img src=\"modelica://TransiEnt/Images/ElectricVehicle/2023-11_Combined_Data_VW_ID4_2020_overview.png\"/>[2]</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The record data has been plausibility checked against the data in the literature source. [1]</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<pre>This research has been performed using the ERIGrid 2.0 Research Infrastructure and is part of a project that has received funding from the European Union&rsquo;s Horizon 2020 
Research and Innovation Programme under the Grant Agreement No. 870620. The support of the European Research Infrastructure ERIGrid 2.0 and its partner DTU is very much appreciated. 
Report: https://zenodo.org/records/17054821 


This research was funded by the Federal Ministry for Economic Affairs and Climate Action in the project &ldquo;EffiziEntEE &ndash; 
Effiziente Einbindung hoher Anteile Erneuerbarer Energien in technisch-wirtschaftlich integrierte Energiesysteme&rdquo; under the project number 03EI1050


[1] K. Sevdari, L. Calearo, B. H. Bakken, P. B. Andersen, und M. Marinelli, &ldquo;Experimental Validation of Onboard Electric Vehicle Chargers to Improve the Efficiency of Smart Charging Operation,&rdquo; Sustainable Energy Technologies and Assessments, Bd. 60, S. 103512, Dec. 2023.</pre>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<pre>Volkswagen_ID4 by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</pre>
</html>"));
end Volkswagen_ID4;
