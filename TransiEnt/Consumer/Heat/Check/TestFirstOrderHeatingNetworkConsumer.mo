within TransiEnt.Consumer.Heat.Check;
model TestFirstOrderHeatingNetworkConsumer



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



  extends TransiEnt.Basics.Icons.Checkmodel;

  FirstOrderHeatingNetworkConsumer ConsumerStation(
    T_return_const=50 + 273.15,
    m_flow_init=1000,
    T_massflow_ctrl=2) annotation (Placement(transformation(extent={{12,-10},{-8,10}})));
  Modelica.Blocks.Sources.Constant Q_th_demand(k=250e6) annotation (Placement(transformation(extent={{36,18},{16,38}})));
  Modelica.Blocks.Sources.Step     T_feed(
    height=20,
    offset=100,
    startTime=100)                                      annotation (Placement(transformation(extent={{-151,9},{-131,29}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(extent={{-64,14},{-44,34}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink fluidSink annotation (Placement(transformation(extent={{-60,-28},{-40,-8}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=10e5) annotation (Placement(transformation(extent={{-92,-28},{-72,-8}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.1)  annotation (Placement(transformation(extent={{-108,44},{-88,64}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=T_feed.y*4200)
                                                                 annotation (Placement(transformation(extent={{-108,12},{-88,32}})));
equation
  connect(Q_th_demand.y, ConsumerStation.Q_flow_demand) annotation (Line(points={{15,28},{2.4,28},{2.4,9.4}},
                                                                                                    color={0,0,127}));
public
function plotResult

  constant String resultFileName = "TestFirstOrderHeatingNetworkConsumer.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

createPlot(id=1, position={809, 0, 791, 817}, y={"districtHeatingSupply.eye.T"}, range={0.0, 200.0, 98.0, 122.0}, grid=true, colors={{28,108,200}}, filename=resultFileName);
createPlot(id=1, position={809, 0, 791, 406}, y={"districtHeatingReturn.steam_a.m_flow"}, range={0.0, 200.0, 750.0, 1150.0}, grid=true, subPlot=2, colors={{28,108,200}}, filename=resultFileName);

   resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
equation
  connect(fluidSink.port_a, ConsumerStation.fluidPortOut) annotation (Line(points={{-40,-18},{-18,-18},{-18,-8},{-8,-8}}, color={0,0,0}));
  connect(realExpression2.y, fluidSink.p_in) annotation (Line(points={{-71,-18},{-58,-18}}, color={0,0,127}));
  connect(fluidSource.port_a, ConsumerStation.fluidPortIn) annotation (Line(points={{-44,24},{-32,24},{-32,-4},{-8,-4}}, color={0,0,0}));
  connect(realExpression1.y, fluidSource.m_flow_in) annotation (Line(points={{-87,54},{-80,54},{-80,27},{-62,27}}, color={0,0,127}));
  connect(realExpression3.y, fluidSource.h_in) annotation (Line(points={{-87,22},{-62,22}}, color={0,0,127}));
  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},{100,100}})),
    experiment(StopTime=200),
    __Dymola_experimentSetupOutput(equidistant=false),
    Icon(graphics,
         coordinateSystem(extent={{-160,-100},{100,100}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>Test environment for a first order heating network consumer with a variable feed temperature and a constant heat flow rate demand</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
</html>"));
end TestFirstOrderHeatingNetworkConsumer;
