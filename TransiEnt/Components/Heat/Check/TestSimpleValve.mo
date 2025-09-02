within TransiEnt.Components.Heat.Check;
model TestSimpleValve

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
  //          Import and Class Hierachy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Checkmodel;


  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

  TransiEnt.Components.Heat.VolumesValvesFittings.SimpleValve simpleValve(delta_p_nom=10000) annotation (Placement(transformation(extent={{-6,-22},{14,-2}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{42,-22},{22,-2}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=1e5)
                                                             annotation (Placement(transformation(extent={{70,-22},{50,-2}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink1
                                                           annotation (Placement(transformation(extent={{-40,-22},{-20,-2}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=2e5)
                                                             annotation (Placement(transformation(extent={{-76,-22},{-56,-2}})));
  Modelica.Blocks.Sources.Step step(
    height=0.7,
    offset=0.3,
    startTime=3600) annotation (Placement(transformation(extent={{-42,28},{-22,48}})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________
  connect(simpleValve.outlet, sink.port_a) annotation (Line(points={{14,-12},{22,-12}}, color={0,0,0}));
  connect(realExpression1.y, sink.p_in) annotation (Line(points={{49,-12},{44.5,-12},{44.5,-12},{40,-12}},     color={0,0,127}));
  connect(sink1.port_a, simpleValve.inlet) annotation (Line(points={{-20,-12},{-6,-12}}, color={0,0,0}));
  connect(realExpression2.y, sink1.p_in) annotation (Line(points={{-55,-12},{-46.5,-12},{-46.5,-12},{-38,-12}},     color={0,0,127}));
  connect(step.y, simpleValve.OpeningValveIn) annotation (Line(points={{-21,38},{4,38},{4,-2}}, color={0,0,127}));
  annotation (experiment(StopTime=7200, __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model:</span></h4>
<p>Test model for the verification of the simple valve model. The opening of the valve is changed with a step function after 3600 seconds. Two pressure boundaries are used, setting a pressure difference of 1 bar. Because of the change of the opening the mass flow rate increases during the simulation. </p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>The model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end TestSimpleValve;
