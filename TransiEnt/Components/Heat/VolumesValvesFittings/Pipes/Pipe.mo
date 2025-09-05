within TransiEnt.Components.Heat.VolumesValvesFittings.Pipes;
model Pipe "Pipe model. Extends form Clara TubeBundle_L1_TML component"



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



  extends ClaRa.Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L1_TML;
  annotation (Icon(graphics={
        Rectangle(
          extent={{118,50},{140,-50}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-140,50},{-118,-50}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-114,40},{114,-40}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-106,32},{106,-32}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-106,-12},{-12,-20}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-14,-12},{-4,22},{2,14},{-8,-20},{-12,-20},{-14,-12}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-4,22},{108,22},{108,14},{2,14},{-4,22}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-132,42},{-114,-42}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{114,42},{132,-42}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{108,40},{118,50},{118,42},{114,38},{108,40}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-118,50},{-108,40},{-114,38},{-118,42},{-118,50}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-118,-50},{-108,-40},{-112,-36},{-120,-44},{-118,-50}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{114,-38},{120,-44},{118,-50},{108,-40},{114,-38}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A transmission line model of a pipe featuring an analytical energy balance. Therefore, the accuracy of the model doesn&apos;t depend on the number of states. Only a linear pressure loss can be considered. It was designed to simulate pipes with a higher length while avoiding too many states. The same effect can be achieved with the plug-flow concept described in the SinglePipe_L2. It is recommended to use the SinglePipe_L2 model for such use cases. The model was extended from the ClaRa library. </p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<ul>
<li>Dynamic energy balance (analytical)</li>
<li>Linear pressure loss</li>
<li>No reverse flow possible</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>Flow reversal is not supported. A quadratic pressure loss model can&apos;t be considered.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>inlet:fluidPortIn</p>
<p>outlet: fluidportOut</p>
<p>heat: heat port</p>
<p>eye</p>
<h4><span style=\"color: #008000\">Remarks for Usage</span></h4>
<p>When this model is used for modelling a district heating network, non-linear systems of equations might occur. </p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>This model was extended from the ClaRa library. </p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>The model was documented by Jan Westphal (j.westphal@tuhh.de) in January 2025</p>
</html>"));
end Pipe;
