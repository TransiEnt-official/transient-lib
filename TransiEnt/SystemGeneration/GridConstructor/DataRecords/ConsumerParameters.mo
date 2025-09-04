within TransiEnt.SystemGeneration.GridConstructor.DataRecords;
record ConsumerParameters "Record with (default) scaling factors to scale the demands of the consumers within the GridConstructor"


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
    parameter Real factor_electricity=1 "scaling factor electricity demand";
    parameter Real factor_heat=1 "scaling factor heat demand";
    parameter Real factor_warmwater=1 "scaling factor warmwater demand";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Purpose of model</span></b></p>
<p>The record ist used to redeclare the parameters <span style=\"font-family: Courier New;\">heatDemand, waterDemand </span>and<span style=\"font-family: Courier New;\"> electricityDemand </span>of the model Demand_Table_combined via the model GridElement. As default all parameters within the record are set to 1, so that the demands given via table are not changed. The scaling faktors can be used to scale those demands without having to change the values of the tables.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Remarks for Usage</span></b> </p>
<p>Changing the values within the record, will change the scaling of all consumers equally. To change the scaling factors of single consumers, please use the parameter dialogue of the GridConstructors within your model.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">References</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created during IntegraNet I </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Documentation update, January 2025</span></p>
</html>"));
end ConsumerParameters;
