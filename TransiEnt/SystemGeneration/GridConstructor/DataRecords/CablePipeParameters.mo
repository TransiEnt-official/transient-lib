within TransiEnt.SystemGeneration.GridConstructor.DataRecords;
record CablePipeParameters "Record containing the (default) values of cable and pipe parameters"



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
  parameter ClaRa.Basics.Units.Length diameter_i=0.1
    "Inner diameter of the pipe segments in the Basic_Grid_Elements";
  parameter ClaRa.Basics.Units.Length l_pipe=50
    "Length of the gas pipe segments in the Basic_Grid_Elements";
  parameter SI.Length l_cable=50
    "Length of the cable segments in the Basic_Grid_Elements";
  parameter TransiEnt.Components.Electrical.Grid.Characteristics.LVCabletypes
    CableType=TransiEnt.Components.Electrical.Grid.Characteristics.LVCabletypes.K4
    "Type of low voltage cable in the Basic_Grid_Elements";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Purpose of model</span></b></p>
<p>The record contains the default values for the diameter <span style=\"font-family: Courier New;\">diameter_i</span> and length <span style=\"font-family: Courier New;\">l_pipe</span> of gas pipes and the length <span style=\"font-family: Courier New;\">l_cable</span> of electric cables, as well as the type of the electric cable within the GridElements.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Remarks for Usage</span></b> </p>
<p>Changing the values within the record, will change the default values of all GridElements within GridConstructors equally (as long as no other values are given within your model). To change the pipe or cable parameters of a single GridElement, please use the parameter dialogue of the GridConstructors (tab &quot;<span style=\"font-family: Courier New;\">Cables&nbsp;and&nbsp;Piping</span>&quot;) within your model.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">References</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created during IntegraNet I </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Documentation update, January 2025</span></p>
</html>"));
end CablePipeParameters;
