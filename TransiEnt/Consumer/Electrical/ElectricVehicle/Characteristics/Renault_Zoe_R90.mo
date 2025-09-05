within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record Renault_Zoe_R90
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

  parameter Real eta_mean_over_P_grid_and_V_grid[:,:] = [0.0, 400.0;1900.0, 0.7179055909388967;2000.0, 0.7126740786291575;2500.0, 0.7796820268334171;3100.0, 0.8286941770010146;3700.0, 0.8628287360777832;3800.0, 0.85860097477918;4300.0, 0.8838317429974195;4400.0, 0.8833302894764582;5000.0, 0.9027148789619595;5600.0, 0.9138518066533334;6300.0, 0.933401472010231;6700.0, 0.9567118134787858;6800.0, 0.9414131099058853;6900.0, 0.9524231117759085;7000.0, 0.9547259116968275;7100.0, 0.9509204541477564;7200.0, 0.9360177085405269;7300.0, 0.9532502217760191;7400.0, 0.9514388648234081;7500.0, 0.9411465512248446;7600.0, 0.9417604549310601;7700.0, 0.9347949987032232;7800.0, 0.9412493421562314;7900.0, 0.9399400853502237;8000.0, 0.9495942887507004;8100.0, 0.9465499642896822;8200.0, 0.9676383862622032;8300.0, 0.9518918340243341;8400.0, 0.9492474670566647;8700.0, 0.9517381040676778;9000.0, 0.9572380566808371;9300.0, 0.9566628103564342;9400.0, 0.9589667174932833;9600.0, 0.9322350360799921;9700.0, 0.9577236776421498;10000.0, 0.9630597230333314;10300.0, 0.9658990254692581;10400.0, 0.9684233777704164;10600.0, 0.963992503988296;10700.0, 0.965008521671424;10900.0, 0.9720953292744101;11000.0, 0.9727563201039189];

  parameter Real P_loss_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;1900.0, 546.8038329026701;2000.0, 564.4068627450981;2500.0, 555.5408037475345;3100.0, 535.512482168331;3700.0, 512.8180983847284;3800.0, 531.3052168021679;4300.0, 504.78124999999994;4400.0, 508.59915966386546;5000.0, 487.22343324250676;5600.0, 484.48295880149817;6300.0, 417.05016181229774;6700.0, 290.6500000000003;6800.0, 398.9999999999996;6900.0, 327.8401360544218;7000.0, 315.97916666666646;7100.0, 348.3333333333327;7200.0, 461.0683050847458;7300.0, 340.36458333333303;7400.0, 361.44714506172835;7500.0, 439.2001070090957;7600.0, 443.8136363636364;7700.0, 501.0265604249669;7800.0, 456.66452991452985;7900.0, 472.8724489795921;8000.0, 405.52500000000026;8100.0, 431.35793871866304;8200.0, 265.9999999999987;8300.0, 401.1428571428571;8400.0, 424.9847396768401;8700.0, 419.34546703296706;9000.0, 385.4757486979166;9300.0, 404.60948477751765;9400.0, 384.09782608695645;9600.0, 652.0260416666669;9700.0, 409.0323787409701;10000.0, 369.37554484973606;10300.0, 352.12168674698796;10400.0, 327.3382352941171;10600.0, 382.8323129251701;10700.0, 373.05873015873;10900.0, 305.43191056910536;11000.0, 298.88060538116594];

  parameter Real Q_grid_over_P_bat_and_V_grid[:,:] = [0.0, 360.0, 400.0, 440.0;1900.0, -3170.839965546942, -3963.5499569336775, -4756.259948320413;2000.0, -3169.8311324529814, -3962.288915566227, -4754.7466986794725;2500.0, -3159.1021203155824, -3948.8776503944778, -4738.653180473373;3100.0, -3135.5694721825957, -3919.461840228245, -4703.354208273894;3700.0, -3118.145374449339, -3897.681718061674, -4677.218061674009;3800.0, -3117.941463414634, -3897.426829268293, -4676.912195121951;4300.0, -3099.870833333333, -3874.838541666666, -4649.80625;4400.0, -3099.8440336134454, -3874.805042016807, -4649.7660504201685;5000.0, -3080.293188010899, -3850.366485013624, -4620.4397820163485;5600.0, -3061.302921348315, -3826.6286516853934, -4591.954382022473;6300.0, -3010.745631067961, -3763.432038834951, -4516.118446601941;6700.0, -2972.1866666666665, -3715.233333333333, -4458.28;6800.0, -2962.4, -3703.0000000000005, -4443.6;6900.0, -2958.7891156462583, -3698.4863945578227, -4438.183673469387;7000.0, -2951.741666666667, -3689.677083333333, -4427.6125;7100.0, -2942.6, -3678.25, -4413.9;7200.0, -2934.3335141242937, -3667.916892655367, -4401.50027118644;7300.0, -2927.438888888889, -3659.2986111111113, -4391.158333333334;7400.0, -2916.223148148148, -3645.278935185185, -4374.334722222222;7500.0, -2914.5730337078653, -3643.2162921348317, -4371.859550561798;7600.0, -2904.5557575757575, -3630.694696969697, -4356.833636363636;7700.0, -2908.1675962815407, -3635.209495351926, -4362.251394422311;7800.0, -2906.0957264957265, -3632.6196581196577, -4359.1435897435895;7900.0, -2957.514285714286, -3696.8928571428573, -4436.271428571428;8000.0, -2868.380000000001, -3585.4750000000013, -4302.5700000000015;8100.0, -2866.3103064066854, -3582.8878830083568, -4299.465459610028;8200.0, -2854.8, -3568.5, -4282.200000000001;8300.0, -2845.161904761904, -3556.4523809523803, -4267.742857142856;8400.0, -2842.1026929982045, -3552.6283662477554, -4263.154039497306;8700.0, -2817.353846153846, -3521.6923076923076, -4226.030769230769;9000.0, -2791.6773437499996, -3489.5966796874995, -4187.516015624999;9300.0, -2740.939032006245, -3426.1737900078056, -4111.408548009367;9400.0, -2733.6376811594205, -3417.0471014492755, -4100.45652173913;9600.0, -2658.0930555555556, -3322.6163194444443, -3987.139583333333;9700.0, -2643.6785345717235, -3304.5981682146544, -3965.5178018575857;10000.0, -2554.1547143840335, -3192.6933929800416, -3831.2320715760497;10300.0, -2342.6726506024097, -2928.340813253012, -3514.0089759036146;10400.0, -2303.0266666666666, -2878.7833333333333, -3454.54;10600.0, -2027.8160544217685, -2534.7700680272105, -3041.7240816326525;10700.0, -2020.0812698412701, -2525.1015873015876, -3030.121904761905;10900.0, -1920.4024390243906, -2400.5030487804884, -2880.603658536586;11000.0, -1779.4838565022421, -2224.3548206278024, -2669.225784753363];

 annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-80,60},{80,-60}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-70,40},{70,-40}},
          textColor={0,149,152},
          horizontalAlignment=TextAlignment.Left,
          textString="Data Record for the efficiency (eta) and reactive power (Q) profiles 
over the Battery Power (P_bat) measured for Renault Zoe R90

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
<p><img src=\"modelica://TransiEnt/Images/ElectricVehicle/2024-03_Combined_Data_Renault_Zoe_R90_overview.png\"/>[2]</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The record data has been plausibility checked against the data in the literature source. [1]</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<pre>This research has been performed using the ERIGrid 2.0 Research Infrastructure and is part of a project that has received funding from the European Union&rsquo;s Horizon 2020 
Research and Innovation Programme under the Grant Agreement No. 870620. The support of the European Research Infrastructure ERIGrid 2.0 and its partner DTU is very much appreciated. 
Report: https://zenodo.org/records/17054821 

This research was funded by the Federal Ministry for Economic Affairs and Climate Action in the project &ldquo;EffiziEntEE &ndash; 
Effiziente Einbindung hoher Anteile Erneuerbarer Energien in technisch-wirtschaftlich integrierte Energiesysteme&rdquo; under the project number 03EI1050A.

[1] K. Sevdari, L. Calearo, B. H. Bakken, P. B. Andersen, und M. Marinelli, &ldquo;Experimental Validation of Onboard Electric Vehicle Chargers to Improve the Efficiency of Smart Charging Operation,&rdquo; Sustainable Energy Technologies and Assessments, Bd. 60, S. 103512, Dec. 2023.</pre>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<pre>Renault_Zoe_R90 by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</pre>
</html>"));
end Renault_Zoe_R90;
