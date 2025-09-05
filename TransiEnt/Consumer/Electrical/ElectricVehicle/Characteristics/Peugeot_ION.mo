within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record Peugeot_ION
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
  // Gas- und Wärme-Institut Essen                                                  //
  // and                                                                            //
  // XRG Simulation GmbH (Hamburg, Germany).                                        //
  //                                                                                //
  //                                                                                //
  // Data Record from ERIGrid 2.0 Project MOVES                                     //
  //                                                                                //
  // Last Author: Tom Steffen, Last Update: 12.08.2025, Email: tom.steffen@tuhh.de  //
  //________________________________________________________________________________//

  parameter Real eta_mean_over_P_grid_and_V_grid[:,:] = [0.0, 400.0; 100.0, 0.008796041781198461;2400.0, 0.7975756206465837;2800.0, 0.8117474640057233;3100.0, 0.8236266006040877;3500.0, 0.8451119993947478;3800.0, 0.865982887354383;4100.0, 0.8357377911762918;4500.0, 0.824795936832579;4800.0, 0.8235345061622662;5100.0, 0.8699799222694338;5200.0, 0.8304214188876319;5500.0, 0.8502366120971292;5800.0, 0.8825705281056626;6200.0, 0.8877580234613983;6500.0, 0.9018436220971641;6900.0, 0.896959779302995;7200.0, 0.90748943914222;7600.0, 0.9126355225452483;7900.0, 0.9014136482653815;8300.0, 0.9178843954456944;8600.0, 0.9176938839529745;9600.0, 0.880454284035355;9900.0, 0.8988644211955392;10200.0, 0.8648943213542788;10600.0, 0.8910225102091551;10900.0, 0.876586933809701;11200.0, 0.8776739963897684;11300.0, 0.8917104005032128;11600.0, 0.877630563436194;11900.0, 0.8748997220985546;12300.0, 0.8820604969555157;12600.0, 0.8855992895213951;13000.0, 0.8850553912905126;13300.0, 0.8900538355063113;13700.0, 0.8896813472229448;14000.0, 0.8926012650080776;14400.0, 0.8920123868726836;14700.0, 0.8775495777644252;15100.0, 0.8921566865917777;16500.0, 0.901991065544368;17200.0, 0.8966628300185743;17500.0, 0.8814472659688515;17600.0, 0.8587024618427311;17700.0, 0.869016413662712;17800.0, 0.8590168857649851];

  parameter Real P_loss_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;0.0, 0.0;100.0, 64.01903518416711;2400.0, 493.95885671304984;2800.0, 523.2450733752618;3100.0, 549.416087751371;3500.0, 535.665356004251;3800.0, 508.86331360946735;4100.0, 679.0610503282273;4500.0, 783.5977507029053;4800.0, 849.2266195524145;5100.0, 668.7457831325299;5200.0, 873.8780201342283;5500.0, 822.3398785425098;5800.0, 684.7544378698226;6200.0, 692.9207509881427;6500.0, 639.6721231766616;6900.0, 707.3565137614682;7200.0, 667.4164461247639;7600.0, 661.3986813186816;7900.0, 781.6451263537909;8300.0, 679.4654485049834;8600.0, 708.6545931758532;9600.0, 1142.169771863118;9900.0, 1000.6406557377054;10200.0, 1381.9464169381104;10600.0, 1151.9914351851858;10900.0, 1346.3770961145196;11200.0, 1375.9239382239375;11300.0, 1218.6018518518504;11600.0, 1417.710546875;11900.0, 1492.0915119363397;12300.0, 1447.1133663366338;12600.0, 1443.1981395348837;13000.0, 1489.416535433071;13300.0, 1462.5361204013384;13700.0, 1506.3295566502452;14000.0, 1504.5506097560963;14400.0, 1551.3878504672907;14700.0, 1801.9853932584274;15100.0, 1626.1988235294118;16500.0, 1616.8987804878057;17200.0, 1775.5862745098034;17500.0, 2077.205063291139;17600.0, 2486.271428571428;17700.0, 2317.887421383647;17800.0, 2511.19068627451];

  parameter Real Q_grid_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;100.0, -45.99072547403133;2400.0, -2715.9101165851825;2800.0, -2754.3721174004195;3100.0, -2776.61182205972;3500.0, -2786.01912858661;3800.0, -2773.100591715976;4100.0, -2745.8599562363243;4500.0, -2699.4151827553887;4800.0, -2638.877502944641;5100.0, -2580.120481927711;5200.0, -2569.0788590604025;5500.0, -2497.5263157894738;5800.0, -2377.940828402367;6200.0, -2256.755928853755;6500.0, -2140.5397082658023;6900.0, -2005.9009174311923;7200.0, -1863.7731568998108;7600.0, -1722.6065934065934;7900.0, -1611.7960288808663;8300.0, -1508.259136212625;8600.0, -1384.767716535433;9600.0, -3266.152091254753;9900.0, -3214.511475409836;10200.0, -3157.9462540716613;10600.0, -3077.587962962963;10900.0, -3003.689161554192;11200.0, -2915.7837837837837;11300.0, -2915.1666666666665;11600.0, -2818.9101562500005;11900.0, -2714.6870026525203;12300.0, -2614.7698019801987;12600.0, -2481.1162790697667;13000.0, -2346.240157480315;13300.0, -2217.1304347826085;13700.0, -2086.507389162562;14000.0, -1957.9512195121954;14400.0, -1804.4485981308417;14700.0, -1694.1348314606741;15100.0, -1561.4117647058822;16500.0, -1130.5609756097558;17200.0, -904.8431372549019;17500.0, -646.2530120481929;17600.0, -626.3308270676691;17700.0, -632.503144654088;17800.0, -621.2107843137255];

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-80,60},{80,-60}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-70,40},{70,-40}},
          textColor={0,149,152},
          horizontalAlignment=TextAlignment.Left,
          textString="Data Record for the efficiency (eta) and reactive power (Q) profiles 
over the Battery Power (P_bat) measured for Peugeot ION

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
<p><img src=\"modelica://TransiEnt/Images/ElectricVehicle/2023-11_Combined_Data_Peugeot_ION_overview.png\"/>[2]</p>
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
<pre>Peugeot_ION by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</pre>
</html>"));
end Peugeot_ION;
