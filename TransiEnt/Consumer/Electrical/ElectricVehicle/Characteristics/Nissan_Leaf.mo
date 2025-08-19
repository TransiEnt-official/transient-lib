within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record Nissan_Leaf
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

  parameter Real eta_mean_over_P_grid_and_V_grid[:,:] = [0.0, 400.0;1400.0, 0.8409140884692236;1500.0, 0.8208911390282563;1600.0, 0.7741494484214092;1700.0, 0.697639968128957;1800.0, 0.7530612262406898;1900.0, 0.8050690703990894;2000.0, 0.8224764074372704;2100.0, 0.716637534546759;2200.0, 0.7860867768422214;2300.0, 0.7472018725984476;2400.0, 0.8585550457898314;2500.0, 0.827339435272291;2600.0, 0.7706761067997693;2700.0, 0.7978965160274326;2800.0, 0.7788504374799727;2900.0, 0.8363180794035291;3000.0, 0.8494368847137874;3100.0, 0.8548956549680007;3200.0, 0.8411515246066531;3300.0, 0.8536653284483333;3400.0, 0.8713940434430829;3500.0, 0.8010077278252757;3600.0, 0.8460827973849145;3700.0, 0.8370946982338575;3800.0, 0.8505885673122275;3900.0, 0.8418773290070384;4000.0, 0.8592561306892478;4100.0, 0.875325646279445;4200.0, 0.8546187194639742;4300.0, 0.8335378973252823;4400.0, 0.8499097977942224;4500.0, 0.8330861772465119;4600.0, 0.8624244236895214;4700.0, 0.8380313898206122;4800.0, 0.8616657004444926;4900.0, 0.8595691248127381;5000.0, 0.8839059831328951;5100.0, 0.8513068354205574;5200.0, 0.8310819489299124;5300.0, 0.8638138377469454;5400.0, 0.8553687906094148;5500.0, 0.8812638964994459;5600.0, 0.8567330119524056;5700.0, 0.865857496596392;5800.0, 0.8513615282933373;5900.0, 0.8334143900640437;6000.0, 0.8742515761943718;6100.0, 0.8759282850294182;6200.0, 0.8842835927922522;6300.0, 0.8761357947486503;6400.0, 0.8645118207282912;6600.0, 0.8889774376355509];

  parameter Real P_loss_over_P_bat_and_V_grid[:,:] = [0.0, 400.0;0.0, 0.0;1400.0, 217.86956416666663;1500.0, 274.1719548269581;1600.0, 353.2944619913421;1700.0, 513.8927902;1800.0, 441.5435870531914;1900.0, 368.4432301388889;2000.0, 352.72874729166665;2100.0, 596.2976806944445;2200.0, 476.93222143874647;2300.0, 572.1028033333333;2400.0, 343.02799027777775;2500.0, 428.8911063173652;2600.0, 597.7855586666666;2700.0, 549.0841862619048;2800.0, 624.7935511111111;2900.0, 477.3211755454543;3000.0, 446.9200992857143;3100.0, 453.56095839999995;3200.0, 505.7044415454545;3300.0, 482.08019833333316;3400.0, 435.2897166666667;3500.0, 697.8708316666667;3600.0, 554.76890690625;3700.0, 598.5152799180327;3800.0, 571.2817912857143;3900.0, 615.7037486307693;4000.0, 559.4434241441443;4100.0, 510.9313083523809;4200.0, 605.5423690123457;4300.0, 720.0431480555555;4400.0, 658.8443150347223;4500.0, 752.7323973333329;4600.0, 633.038826740413;4700.0, 762.9901252083331;4800.0, 666.7243133864118;4900.0, 685.2125458008658;5000.0, 581.1160446666669;5100.0, 758.9992795238095;5200.0, 881.3159021111111;5300.0, 722.0985392464878;5400.0, 777.2479148655913;5500.0, 656.1696755079365;5600.0, 801.8467000000004;5700.0, 763.9731978571428;5800.0, 860.9089963888887;5900.0, 980.9053983333329;6000.0, 754.7369885714286;6100.0, 759.1534666666666;6200.0, 719.9891944444446;6300.0, 777.3369083986925;6400.0, 870.6470400000006;6600.0, 728.9541121091953];

  parameter Real Q_grid_over_P_bat_and_V_grid[:,:] = [0.0, 360.0, 400.0, 440.0;1200.0, -127.16799999999996, -158.95999999999995, -190.75199999999995;1300.0, -141.79414634146343, -177.2426829268293, -212.69121951219515;1400.0, -136.63458333333332, -170.79322916666666, -204.951875;1500.0, -150.8353369763206, -188.54417122040076, -226.2530054644809;1600.0, -154.7937662337662, -193.49220779220778, -232.19064935064932;1700.0, -150.8544, -188.56799999999998, -226.28159999999997;1800.0, -166.51497872340425, -208.14372340425533, -249.7724680851064;1900.0, -171.37333333333336, -214.2166666666667, -257.06000000000006;2000.0, -177.39, -221.73749999999998, -266.085;2100.0, -173.4551851851852, -216.8189814814815, -260.1827777777778;2200.0, -179.59825261158596, -224.49781576448245, -269.39737891737894;2300.0, -182.28558730158733, -227.85698412698414, -273.42838095238096;2400.0, -182.01728395061733, -227.52160493827165, -273.02592592592595;2500.0, -184.61477045908183, -230.7684630738523, -276.92215568862275;2600.0, -184.82666666666668, -231.03333333333333, -277.24;2700.0, -186.31047619047615, -232.8880952380952, -279.4657142857142;2800.0, -186.9111111111111, -233.63888888888886, -280.3666666666666;2900.0, -188.00000000000003, -235.00000000000003, -282.00000000000006;3000.0, -190.52428571428572, -238.15535714285716, -285.7864285714286;3100.0, -187.89155555555556, -234.86444444444444, -281.83733333333333;3200.0, -192.446303030303, -240.55787878787876, -288.6694545454545;3300.0, -192.13, -240.1625, -288.195;3400.0, -195.06, -243.82500000000002, -292.59000000000003;3500.0, -190.19666666666666, -237.74583333333334, -285.29499999999996;3600.0, -192.13841666666667, -240.17302083333334, -288.207625;3700.0, -194.93726775956284, -243.67158469945355, -292.4059016393443;3800.0, -191.8622857142857, -239.8278571428571, -287.79342857142854;3900.0, -195.7065846153846, -244.63323076923075, -293.5598769230769;4000.0, -199.0072072072072, -248.759009009009, -298.51081081081077;4100.0, -193.73379047619048, -242.1672380952381, -290.6006857142857;4200.0, -197.16246913580247, -246.45308641975308, -295.7437037037037;4300.0, -197.20825396825396, -246.51031746031742, -295.8123809523809;4400.0, -200.0461111111111, -250.05763888888887, -300.06916666666666;4500.0, -195.41777777777773, -244.27222222222215, -293.1266666666666;4600.0, -198.12389380530973, -247.65486725663717, -297.18584070796464;4700.0, -198.01583333333332, -247.51979166666666, -297.02375;4800.0, -198.69528662420382, -248.36910828025478, -298.0429299363057;4900.0, -201.26389610389612, -251.57987012987016, -301.8958441558442;5000.0, -200.24, -250.3, -300.36;5100.0, -199.8857142857143, -249.85714285714286, -299.8285714285714;5200.0, -199.33333333333343, -249.1666666666668, -299.00000000000017;5300.0, -199.69180076628354, -249.6147509578544, -299.5377011494253;5400.0, -205.3103225806451, -256.6379032258064, -307.96548387096766;5500.0, -199.61523809523806, -249.5190476190476, -299.4228571428571;5600.0, -200.46666666666667, -250.58333333333331, -300.7;5700.0, -199.95238095238093, -249.94047619047618, -299.92857142857144;5800.0, -200.5222222222222, -250.65277777777777, -300.78333333333336;5900.0, -201.89999999999998, -252.37499999999997, -302.84999999999997;6000.0, -200.00680272108843, -250.00850340136054, -300.01020408163265;6100.0, -200.8, -251.0, -301.2;6200.0, -199.968, -249.95999999999998, -299.952;6300.0, -201.15137254901958, -251.43921568627448, -301.7270588235294;6400.0, -199.6, -249.5, -299.4;6600.0, -199.86436781609197, -249.83045977011494, -299.79655172413794];

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-80,60},{80,-60}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=1), Text(
          extent={{-70,40},{70,-40}},
          textColor={0,149,152},
          horizontalAlignment=TextAlignment.Left,
          textString="Data Record for the efficiency (eta) and reactive power (Q) profiles 
over the Battery Power (P_bat) measured for Nissan Leaf

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
<p><img src=\"modelica://TransiEnt/Images/ElectricVehicle/2024-03_Combined_Data_Nissan_Leaf_overview.png\"/>[2]</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The record data has been plausibility checked against the data in the literature source. [1]</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: Courier New;\">This project is funded by the German Federal Ministry of Economics and Climate Protection (BMWK) as part of the joint project &quot;EffiziEntEE &ndash; Effiziente Einbindung hoher Anteile Erneuerbarer Energien in technisch-wirtschaftlich integrierte Energiesysteme&quot; (funding code: 03EI1050A) and the ERIGrid 2.0 project.</span></p>
<p><span style=\"font-family: Courier New;\">[1] K. Sevdari, L. Calearo, B. H. Bakken, P. B. Andersen, und M. Marinelli, &ldquo;Experimental Validation of Onboard Electric Vehicle Chargers to Improve the Efficiency of Smart Charging Operation,&rdquo; Sustainable Energy Technologies and Assessments, Bd. 60, S. 103512, Dec. 2023.</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: Courier New;\">Nissan_Leaf by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</span></p>
</html>"));
end Nissan_Leaf;
