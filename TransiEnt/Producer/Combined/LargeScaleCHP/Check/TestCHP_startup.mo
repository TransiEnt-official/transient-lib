within TransiEnt.Producer.Combined.LargeScaleCHP.Check;
model TestCHP_startup "Example how the continuous plant model behaves when ramping up"

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
  Modelica.Blocks.Sources.RealExpression P_min(y=-Plant.pQDiagram[1].P_min)
                                                        annotation (Placement(
        transformation(
        extent={{-11,-9.5},{11,9.5}},
        rotation=0,
        origin={-51,65.5})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency Grid(useInputConnector=false) annotation (Placement(transformation(extent={{18,82},{30,94}})));
  CHP Plant(
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
    t_startup=7200,
    T_feed_init=363.15,
    useGasPort=false)
                    annotation (Placement(transformation(extent={{-38,18},{8,62}})));

  Modelica.Blocks.Sources.Ramp Q_flow_set(
    height=-290e6,
    duration=86400,
    offset=0,
    startTime=0) annotation (Placement(transformation(
        extent={{-11,-9.5},{11,9.5}},
        rotation=0,
        origin={-21,87.5})));
  Components.Visualization.PQDiagram_Display PQDiagram(PQCharacteristics=Base.Characteristics.PQ_Characteristics_WT()) annotation (Placement(transformation(extent={{64,6},{94,34}})));
  Components.Visualization.InfoBoxLargeCHP infoBoxLargeCHP annotation (Placement(transformation(extent={{28,-11},{46,11}})));
  Modelica.Blocks.Sources.RealExpression P_min1(y=-Plant.pQDiagram[1].P_min)
                                                        annotation (Placement(
        transformation(
        extent={{-11,-9.5},{11,9.5}},
        rotation=0,
        origin={-59,-38.5})));
  Components.Boundaries.Electrical.ActivePower.Frequency Grid1(useInputConnector=false) annotation (Placement(transformation(extent={{10,-14},{22,-2}})));
  CHP Plant1(
    quantity=2,
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
    t_startup=7200,
    useGasPort=true,
    integrateHeatFlow=false,
    integrateElectricPower=false,
    integrateElectricPowerChp=false,
    T_feed_init=363.15)
                    annotation (Placement(transformation(extent={{-46,-82},{0,-38}})));
  Modelica.Blocks.Sources.Ramp Q_flow_set1(
    height=-290e6,
    duration=86400,
    offset=0,
    startTime=0) annotation (Placement(transformation(
        extent={{-11,-9.5},{11,9.5}},
        rotation=0,
        origin={-29,-16.5})));
  Components.Visualization.PQDiagram_Display PQDiagram1(PQCharacteristics=Base.Characteristics.PQ_Characteristics_WT())
                                                                                                                       annotation (Placement(transformation(extent={{56,-94},{86,-66}})));
  Components.Visualization.InfoBoxLargeCHP infoBoxLargeCHP1
                                                           annotation (Placement(transformation(extent={{16,-111},{34,-89}})));
  Components.Boundaries.Gas.BoundaryRealGas_pTxi boundary_pTxi annotation (Placement(transformation(extent={{78,-32},{58,-12}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource annotation (Placement(transformation(extent={{76,-60},{56,-40}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1000)
                                                               annotation (Placement(transformation(extent={{108,-57},{88,-37}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=65*4200) annotation (Placement(transformation(extent={{108,-70},{88,-53}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink annotation (Placement(transformation(extent={{64,68},{44,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=16e5) annotation (Placement(transformation(extent={{96,68},{76,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1000)
                                                               annotation (Placement(transformation(extent={{112,49},{92,69}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=65*4200) annotation (Placement(transformation(extent={{112,36},{92,53}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource1
                                                                    annotation (Placement(transformation(extent={{80,46},{60,66}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink1
                                                                annotation (Placement(transformation(extent={{118,-36},{98,-16}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=16e5) annotation (Placement(transformation(extent={{150,-36},{130,-16}})));
function plotResult

  constant String resultFileName = "TestCHP_startup.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

createPlot(id=1, position={745, 0, 728, 629}, y={"Plant.pQDiagram.P_max", "Plant.pQDiagram.P_min", "Plant.P_el_CHP_is"}, range={0.0, 25.0, -50000000.0, 250000000.0}, grid=true, colors={{28,108,200}, {199,191,198}, {238,46,47}}, thicknesses={0.5, 0.5, 0.25}, filename=resultFileName);
createPlot(id=1, position={745, 0, 728, 205}, y={"Plant.plantState.P_el_set_lim", "Plant.P_limit.y", "Plant.P.y"}, range={0.0, 25.0, -50000000.0, 200000000.0}, grid=true, subPlot=2, colors={{28,108,200}, {238,46,47}, {0,140,72}}, filename=resultFileName);
createPlot(id=1, position={745, 0, 728, 206}, y={"Plant.plantState.startup.active"}, range={0.0, 25.0, -0.5, 1.5}, grid=true, subPlot=3, colors={{28,108,200}}, filename=resultFileName);
   resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
equation
  connect(Plant.epp,Grid. epp) annotation (Line(
      points={{6.85,46.6},{8,46.6},{8,88},{18,88}},
      color={0,135,135},
      thickness=0.5));
  connect(Plant.P_set,P_min. y) annotation (Line(points={{-29.03,56.8667},{-29.03,65.5},{-38.9,65.5}},
                                                                                           color={0,0,127}));
  connect(Q_flow_set.y, Plant.Q_flow_set) annotation (Line(points={{-8.9,87.5},{-6,87.5},{-6,56.8667},{-6.49,56.8667}},   color={0,0,127}));
  connect(Plant.eye, PQDiagram.eyeIn) annotation (Line(points={{10.3,19.8333},{18,19.8333},{18,20},{59.8,20}},     color={28,108,200}));
  connect(Plant.eye, infoBoxLargeCHP.eye) annotation (Line(points={{10.3,19.8333},{18,19.8333},{18,2},{22,2},{22,1.8},{28.9,1.8}},           color={28,108,200}));
equation
  connect(Plant1.epp, Grid1.epp) annotation (Line(
      points={{-1.15,-53.4},{0,-53.4},{0,-8},{10,-8}},
      color={0,135,135},
      thickness=0.5));
  connect(Plant1.P_set, P_min1.y) annotation (Line(points={{-37.03,-43.1333},{-37.03,-38.5},{-46.9,-38.5}}, color={0,0,127}));
  connect(Q_flow_set1.y, Plant1.Q_flow_set) annotation (Line(points={{-16.9,-16.5},{-14,-16.5},{-14,-43.1333},{-14.49,-43.1333}}, color={0,0,127}));
  connect(Plant1.eye, PQDiagram1.eyeIn) annotation (Line(points={{2.3,-80.1667},{10,-80.1667},{10,-80},{51.8,-80}}, color={28,108,200}));
  connect(Plant1.eye, infoBoxLargeCHP1.eye) annotation (Line(points={{2.3,-80.1667},{10,-80.1667},{10,-98},{14,-98},{14,-98.2},{16.9,-98.2}}, color={28,108,200}));
  connect(Plant1.gasPortIn, boundary_pTxi.gasPort) annotation (Line(
      points={{0,-44.9667},{40,-44.9667},{40,-22},{58,-22}},
      color={255,255,0},
      thickness=1.5));
  connect(realExpression.y,fluidSource. m_flow_in) annotation (Line(points={{87,-47},{74,-47}},   color={0,0,127}));
  connect(realExpression1.y,fluidSource. h_in) annotation (Line(points={{87,-61.5},{84,-61.5},{84,-62},{82,-62},{82,-52},{74,-52}},
                                                                                                                  color={0,0,127}));
  connect(realExpression2.y,fluidSink. p_in) annotation (Line(points={{75,78},{62,78}},   color={0,0,127}));
  connect(Plant.outlet, fluidSink.port_a) annotation (Line(points={{8.46,35.2333},{18,35.2333},{18,78},{44,78}}, color={0,0,0}));
  connect(fluidSource.port_a, Plant1.inlet) annotation (Line(points={{56,-50},{8,-50},{8,-69.9},{0.46,-69.9}}, color={0,0,0}));
  connect(realExpression3.y, fluidSource1.m_flow_in) annotation (Line(points={{91,59},{78,59}}, color={0,0,127}));
  connect(realExpression4.y, fluidSource1.h_in) annotation (Line(points={{91,44.5},{88,44.5},{88,44},{86,44},{86,54},{78,54}}, color={0,0,127}));
  connect(fluidSource1.port_a, Plant.inlet) annotation (Line(points={{60,56},{20,56},{20,30.1},{8.46,30.1}}, color={0,0,0}));
  connect(realExpression5.y, fluidSink1.p_in) annotation (Line(points={{129,-26},{116,-26}}, color={0,0,127}));
  connect(fluidSink1.port_a, Plant1.outlet) annotation (Line(points={{98,-26},{66,-26},{66,-32},{16,-32},{16,-64.7667},{0.46,-64.7667}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{160,100}})),
    experiment(StopTime=86400),
    __Dymola_experimentSetupOutput(equidistant=false),
    Icon(graphics,
         coordinateSystem(extent={{-100,-100},{160,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for an upramping combined heat and power plant</p>
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
end TestCHP_startup;
