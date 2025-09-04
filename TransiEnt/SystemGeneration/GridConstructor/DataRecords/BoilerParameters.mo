within TransiEnt.SystemGeneration.GridConstructor.DataRecords;
record BoilerParameters "Record containing the (default) boiler parameter for usage within the GridConstructor"



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
   parameter SI.Efficiency eta=1.05 "Boiler efficiency";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Purpose of model</span></b></p>
<p>The record contains the default value for the efficiency of the boilers. The default value is set to an efficiency of 1.05. If no other individual value is given within the GridConstructor, the parameter is handed down to the model IndependentTechnologies and used for the parameter eta of the model boiler.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Remarks for Usage</span></b> </p>
<p>Changing the values within the record, will change the default values for the boiler efficiency of all consumers equally (as long as no other values are given within your model). To change the boiler efficiency of a single consumer, please use the parameter dialogue of the GridConstructors (tab &quot;Boiler&quot;) within your model.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">References</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created during IntegraNet I </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Documentation update, January 2025</span></p>
</html>"));
end BoilerParameters;
