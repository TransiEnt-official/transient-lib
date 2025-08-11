within TransiEnt.Producer.Gas.BiogasPlant.MaterialValues.Records;
record ManureParticles "Record for suspended particles in manure"





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
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//





  extends BaseSuspendedSolids(
    final name="manureParticles",
    final rho=1524 "Density of (activated) sludge solids acc. Chen, Y. R. (1983). Thermal properties of beef cattle manure.",
    final cp=1400 "Specific Heat Capacity of sludge particles calculated from Chen, Y. R. (1983). Thermal properties of beef cattle manure.");
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>Record&nbsp;for&nbsp;suspended&nbsp;particles&nbsp;in&nbsp;manure according to [1].</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>[1] Chen,&nbsp;Y.&nbsp;R.&nbsp;(1983).&nbsp;Thermal&nbsp;properties&nbsp;of&nbsp;beef&nbsp;cattle&nbsp;manure.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model created by Philipp Jahneke (philipp.koziol@tuhh.de), August 2018</p>
</html>"));
end ManureParticles;
