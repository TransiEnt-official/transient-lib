within TransiEnt.Producer.Combined.LargeScaleCHP.Check;
model TestCHP_balancingControlOffer "Example how the CHP model provides information about balancing power reserves"

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
  Modelica.Blocks.Sources.RealExpression P_set(y=if time < 5e4 then -Plant.pQDiagram[1].P_min else -Plant.pQDiagram[1].P_max)
                                                        annotation (Placement(
        transformation(
        extent={{-11,-9.5},{11,9.5}},
        rotation=0,
        origin={-73,31.5})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency Grid(useInputConnector=false) annotation (Placement(transformation(extent={{20,50},{32,62}})));
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
    isSecondaryControlActive=true,
    T_feed_init=363.15) annotation (Placement(transformation(extent={{-36,-22},{10,22}})));

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
  Modelica.Blocks.Sources.Constant
                               P_el_SB_set(k=0)
                 annotation (Placement(transformation(
        extent={{-11,-9.5},{11,9.5}},
        rotation=0,
        origin={-71,7.5})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink annotation (Placement(transformation(extent={{50,22},{30,42}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=16e5) annotation (Placement(transformation(extent={{82,22},{62,42}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1000)
                                                               annotation (Placement(transformation(extent={{98,9},{78,29}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=65*4200) annotation (Placement(transformation(extent={{98,-4},{78,13}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource1
                                                                    annotation (Placement(transformation(extent={{66,6},{46,26}})));
function plotResult

  constant String resultFileName = "TestCHP_balancingControlOffer.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();
createPlot(id=1, position={0, 0, 730, 629}, y={"Plant.pQDiagram.P_max", "Plant.pQDiagram.P_min", "Plant.P_el_CHP_is",
"Plant.P_el_is"}, range={0.0, 90000.0, -50000000.0, 250000000.0}, grid=true, colors={{28,108,200}, {199,191,198}, {238,46,47}, {0,140,72}}, thicknesses={0.5, 0.5, 0.25, 0.25}, filename=resultFileName);
createPlot(id=1, position={0, 0, 730, 311}, y={"Plant.plantState.startup.active"}, range={0.0, 90000.0, -0.2, 1.2000000000000002}, grid=true, subPlot=2, colors={{28,108,200}}, filename=resultFileName);
createPlot(id=2, position={746, 0, 728, 629}, y={"Plant.controlPowerModel.P_pr_neg_offer", "Plant.controlPowerModel.P_pr_pos_offer"}, range={0.0, 90000.0, -500000.0, 4500000.0}, grid=true, colors={{28,108,200}, {238,46,47}}, filename=resultFileName);
createPlot(id=2, position={746, 0, 728, 311}, y={"Plant.controlPowerModel.P_sec_neg_offer", "Plant.controlPowerModel.P_sec_pos_offer"}, range={0.0, 90000.0, -5000000.0, 35000000.0}, grid=true, subPlot=2, colors={{28,108,200}, {238,46,47}}, filename=resultFileName);

   resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
equation
  connect(Plant.epp,Grid. epp) annotation (Line(
      points={{8.85,6.6},{10,6.6},{10,56},{20,56}},
      color={0,135,135},
      thickness=0.5));
  connect(Plant.P_set,P_set. y) annotation (Line(points={{-27.03,16.8667},{-27.03,31.5},{-60.9,31.5}},
                                                                                           color={0,0,127}));
  connect(Q_flow_set.y, Plant.Q_flow_set) annotation (Line(points={{-6.9,47.5},{-4,47.5},{-4,16.8667},{-4.49,16.8667}},   color={0,0,127}));
  connect(Plant.eye, PQDiagram.eyeIn) annotation (Line(points={{12.3,-20.1667},{20,-20.1667},{20,-20},{61.8,-20}}, color={28,108,200}));
  connect(Plant.eye, infoBoxLargeCHP.eye) annotation (Line(points={{12.3,-20.1667},{20,-20.1667},{20,-38},{24,-38},{24,-38.2},{26.9,-38.2}}, color={28,108,200}));
equation
  connect(P_el_SB_set.y, Plant.P_SB_set) annotation (Line(points={{-58.9,7.5},{-42,7.5},{-42,20},{-33.47,20},{-33.47,12.65}}, color={0,0,127}));
  connect(realExpression2.y,fluidSink. p_in) annotation (Line(points={{61,32},{48,32}},   color={0,0,127}));
  connect(realExpression3.y, fluidSource1.m_flow_in) annotation (Line(points={{77,19},{64,19}}, color={0,0,127}));
  connect(realExpression4.y, fluidSource1.h_in) annotation (Line(points={{77,4.5},{74,4.5},{74,4},{72,4},{72,14},{64,14}}, color={0,0,127}));
  connect(fluidSink.port_a, Plant.outlet) annotation (Line(points={{30,32},{22,32},{22,30},{20,30},{20,-4.76667},{10.46,-4.76667}}, color={0,0,0}));
  connect(fluidSource1.port_a, Plant.inlet) annotation (Line(points={{46,16},{40,16},{40,-9.9},{10.46,-9.9}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    experiment(StopTime=86400),
    __Dymola_experimentSetupOutput(equidistant=false),
    Icon(graphics,
         coordinateSystem(extent={{-120,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for chp plants regarding information about  balancing power reserves</p>
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
end TestCHP_balancingControlOffer;
