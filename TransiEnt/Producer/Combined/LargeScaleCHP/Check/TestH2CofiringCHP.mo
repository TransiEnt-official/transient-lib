within TransiEnt.Producer.Combined.LargeScaleCHP.Check;
model TestH2CofiringCHP "Example how the continuous plant model behaves when ramping up"

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
  extends TransiEnt.Basics.Icons.Checkmodel;
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-70,79},{-50,99}})));
  Modelica.Blocks.Sources.RealExpression P_min(y=-Plant.pQDiagram[1].P_max)
                                                        annotation (Placement(
        transformation(
        extent={{-11,-9.5},{11,9.5}},
        rotation=0,
        origin={-49,25.5})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency Grid(useInputConnector=false) annotation (Placement(transformation(extent={{20,50},{32,62}})));
  H2CofiringCHP Plant(
    typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.BlackCoal,
    typeOfCO2AllocationMethod=2,
    h_nom=547e3,
    eta_th_const=0.696296,
    p_nom=20e5,
    m_flow_nom=750,
    PQCharacteristics=Base.Characteristics.PQ_Characteristics_WT(),
    P_el_n=200e6,
    Q_flow_n_CHP=290e6,
    Q_flow_n_Peak=0,
    P_el_init=0,
    Q_flow_init=0,
    Q_flow_SG_init=0,
    T_feed_init=363.15) annotation (Placement(transformation(extent={{-42,-24},{4,20}})));

  Modelica.Blocks.Sources.Ramp Q_flow_set(
    height=-290e6,
    duration=86400,
    offset=0,
    startTime=0) annotation (Placement(transformation(
        extent={{-11,-9.5},{11,9.5}},
        rotation=0,
        origin={-19,47.5})));
  Components.Visualization.PQDiagram_Display PQDiagram(PQCharacteristics=Base.Characteristics.PQ_Characteristics_WT()) annotation (Placement(transformation(extent={{66,-34},{96,-6}})));
  Components.Visualization.InfoBoxLargeCHP infoBoxLargeCHP annotation (Placement(transformation(extent={{26,-51},{44,-29}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=43200) annotation (Placement(transformation(extent={{-76,-14},{-56,6}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink annotation (Placement(transformation(extent={{66,68},{46,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=16e5) annotation (Placement(transformation(extent={{98,68},{78,88}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource1
                                                                    annotation (Placement(transformation(extent={{82,52},{62,72}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1000)
                                                               annotation (Placement(transformation(extent={{114,55},{94,75}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=65*4200) annotation (Placement(transformation(extent={{114,42},{94,59}})));
function plotResult

  constant String resultFileName = "TestH2CoincinerationCHP.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

createPlot(id=1, position={0, 0, 1616, 851}, y={"Plant.eta_el", "Plant.eta_th", "Plant.eta_total"}, range={0.0, 88000.0, -0.6000000000000001, 1.0}, grid=true, colors={{28,108,200}, {238,46,47}, {0,140,72}}, filename=resultFileName);
createPlot(id=1, position={0, 0, 1616, 281}, y={"Plant.collectCosts.Q_flow_gen_H2"}, range={0.0, 88000.0, -5000000.0, 30000000.0}, grid=true, subPlot=2, colors={{28,108,200}}, filename=resultFileName);
createPlot(id=1, position={0, 0, 1616, 280}, y={"Plant.collectCosts.h2Available"}, range={0.0, 88000.0, -0.2, 1.2000000000000002}, grid=true, subPlot=3, colors={{28,108,200}}, filename=resultFileName);

   resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
equation
  connect(Plant.epp,Grid. epp) annotation (Line(
      points={{2.85,7.2},{10,7.2},{10,56},{20,56}},
      color={0,135,135},
      thickness=0.5));
  connect(Plant.P_set,P_min. y) annotation (Line(points={{-33.03,18.4},{-33.03,25.5},{-36.9,25.5}},
                                                                                           color={0,0,127}));
  connect(Q_flow_set.y, Plant.Q_flow_set) annotation (Line(points={{-6.9,47.5},{-4,47.5},{-4,18.4},{-10.49,18.4}},        color={0,0,127}));
  connect(Plant.eye, PQDiagram.eyeIn) annotation (Line(points={{6.3,-22},{6.3,-20},{61.8,-20}},                    color={28,108,200}));
  connect(Plant.eye, infoBoxLargeCHP.eye) annotation (Line(points={{6.3,-22},{20,-22},{20,-38},{24,-38},{24,-38.2},{26.9,-38.2}},            color={28,108,200}));
equation
  connect(booleanStep.y, Plant.h2Available) annotation (Line(points={{-55,-4},{-40.62,-4}}, color={255,0,255}));
  connect(realExpression2.y,fluidSink. p_in) annotation (Line(points={{77,78},{64,78}},   color={0,0,127}));
  connect(realExpression3.y, fluidSource1.m_flow_in) annotation (Line(points={{93,65},{80,65}}, color={0,0,127}));
  connect(realExpression4.y, fluidSource1.h_in) annotation (Line(points={{93,50.5},{90,50.5},{90,50},{88,50},{88,60},{80,60}}, color={0,0,127}));
  connect(Plant.outlet, fluidSink.port_a) annotation (Line(points={{4.46,-5.2},{18,-5.2},{18,30},{34,30},{34,78},{46,78}}, color={0,0,0}));
  connect(Plant.inlet, fluidSource1.port_a) annotation (Line(points={{4.46,-10.8},{50,-10.8},{50,62},{62,62}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    experiment(StopTime=86400),
    __Dymola_experimentSetupOutput(equidistant=false),
    Icon(graphics,
         coordinateSystem(extent={{-120,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for an H2 cofiring CHP</p>
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
end TestH2CofiringCHP;
