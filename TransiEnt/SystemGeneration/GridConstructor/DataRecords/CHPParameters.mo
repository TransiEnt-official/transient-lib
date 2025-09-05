within TransiEnt.SystemGeneration.GridConstructor.DataRecords;
record CHPParameters "(Default) CHP system parameters for usage within the GridConstructor"



//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.3                             //
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
// Gas- und WÃ¤rme-Institut Essen                                                  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//





 // _____________________________________________
 //
 //            Parameter
 // _____________________________________________
  parameter SI.Efficiency eta_total_CHP=1.05 "CHP overall efficiency";
  parameter SI.Efficiency eta_boiler=1.05 "Boiler efficiency of CHP system";
  parameter SI.Power Q_CHP=4000 "Heat output of CHP";
  parameter SI.Power P_CHP=8000 "Electric power output of CHP";
  parameter SI.Temperature T_storage_max=363.15 "Maximum storage temperature" annotation (HideResult=true);
  parameter SI.Temperature T_storage_min=303.15 "Minimum storage temperature" annotation (HideResult=true);
  parameter SI.Volume V_storage=0.5 "Volume of the Storage" annotation (HideResult=true);
  parameter SI.Height h_storage=1.3 "Height of heat storage" annotation (HideResult=true);
  parameter Modelica.Units.NonSI.Temperature_degC T_storage_amb=15 "Assumed constant temperature in tank installation room" annotation (HideResult=true);
  parameter SI.SurfaceCoefficientOfHeatTransfer k_storage=0.08 "Coefficient of heat Transfer" annotation (HideResult=true);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Purpose of model</span></b></p>
<p>Accommodates all via GridConstructor adjustable parameters for the CHP system used in IndependentTechnologies.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Remarks for Usage</span></b> </p>
<p>Changing the values within the record, will change the default values for the CHP system of all consumers equally (as long as no other values are given within your model). To change the parameters of the CHP system of a single consumer, please use the parameter dialogue of the GridConstructors (tab &quot;CHP&quot;) within your model.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">References</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created during IntegraNet I </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Documentation update, January 2025</span></p>
</html>"));
end CHPParameters;
