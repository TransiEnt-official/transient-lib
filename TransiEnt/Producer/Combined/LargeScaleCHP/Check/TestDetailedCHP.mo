within TransiEnt.Producer.Combined.LargeScaleCHP.Check;
model TestDetailedCHP "Tester for DetailedCHP model"
  extends TransiEnt.Basics.Icons.Checkmodel;




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




  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));

  TransiEnt.Producer.Combined.LargeScaleCHP.DetailedCHP detailedCHP(typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.BlackCoal)                                                                                                                    annotation (Placement(transformation(extent={{-116,-50},{60,58}})));
  Components.Boundaries.Electrical.ActivePower.Frequency
                                                       electricGrid(useInputConnector=false) annotation (Placement(transformation(extent={{50,42},{70,62}})));

  TransiEnt.Components.Visualization.InfoBoxLargeCHP infoBoxLargeCHP annotation (Placement(transformation(extent={{-10,-86},{38,-46}})));
  Modelica.Blocks.Sources.Ramp ramp3(
    offset=-60e6,
    duration=2e4,
    startTime=5e4,
    height=-120e6) annotation (Placement(transformation(extent={{-80,42},{-64,58}})));
  TransiEnt.Components.Visualization.PQDiagram_Display pQDiagram_Display annotation (Placement(transformation(extent={{46,-88},{96,-40}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    startTime=2e4,
    height=60e6,
    offset=-140e6,
    duration=2e4) annotation (Placement(transformation(extent={{-80,16},{-64,32}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink(h=52*4200)
                                                                annotation (Placement(transformation(extent={{76,-22},{56,-2}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource annotation (Placement(transformation(extent={{70,8},{50,28}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=4.5e5)
                                                                 annotation (Placement(transformation(extent={{100,-22},{80,-2}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=-300) annotation (Placement(transformation(extent={{100,18},{80,38}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=45*4200)
                                                                 annotation (Placement(transformation(extent={{100,6},{80,26}})));
equation
  connect(detailedCHP.epp, electricGrid.epp) annotation (Line(
      points={{21.7895,14.8},{37.75,14.8},{37.75,52},{50,52}},
      color={0,135,135},
      thickness=0.5));
  connect(detailedCHP.eye, infoBoxLargeCHP.eye) annotation (Line(points={{25.2632,-19.4783},{24,-19.4783},{24,-38},{-14,-38},{-14,-42},{-14,-62.7273},{-7.6,-62.7273},{-7.6,-62.7273}},
                                                                                          color={28,108,200}));
  connect(ramp3.y, detailedCHP.Q_flow_set) annotation (Line(points={{-63.2,50},{-60,50},{-60,40},{8.35789,40},{8.35789,27.9478}},
                                                                                                                          color={0,0,127}));
  connect(detailedCHP.eye, pQDiagram_Display.eyeIn) annotation (Line(points={{25.2632,-19.4783},{36,-19.4783},{36,-64},{39,-64}},    color={28,108,200}));
  connect(ramp1.y, detailedCHP.P_set) annotation (Line(points={{-63.2,24},{-52,24},{-52,27.9478},{-14.3368,27.9478}}, color={0,0,127}));
  connect(realExpression2.y, fluidSink.p_in) annotation (Line(points={{79,-12},{74,-12}}, color={0,0,127}));
  connect(realExpression1.y, fluidSource.m_flow_in) annotation (Line(points={{79,28},{74,28},{74,21},{68,21}}, color={0,0,127}));
  connect(realExpression3.y, fluidSource.h_in) annotation (Line(points={{79,16},{68,16}}, color={0,0,127}));
  connect(fluidSource.port_a, detailedCHP.outlet) annotation (Line(points={{50,18},{50,18},{50,0.243478},{23.4105,0.243478}}, color={0,0,0}));
  connect(fluidSink.port_a, detailedCHP.inlet) annotation (Line(points={{56,-12},{42,-12},{42,-6.33043},{23.4105,-6.33043}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                                         Bitmap(extent={{-98,-96},{-20,-42}}, fileName="modelica://TransiEnt/Images/PQ_WW1.PNG")}), experiment(
      StopTime=86400,
      Interval=900,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput(equidistant=false, events=false),
    __Dymola_experimentFlags(
      Advanced(
        EvaluateAlsoTop=true,
        GenerateVariableDependencies=false,
        OutputModelicaCode=false),
      Evaluate=true,
      OutputCPUtime=true,
      OutputFlatModelica=false),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for the detailed chp model</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4.Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end TestDetailedCHP;
