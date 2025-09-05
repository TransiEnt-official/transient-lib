within TransiEnt.Consumer.Heat.Check;
model TestHeatConsumerNode "a model to test the Heat Consumer with node and district heating pipe"

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
//________________________________________________________________________________//  extends TransiEnt.Basics.Icons.Checkmodel;
  inner SimCenter            simCenter(
    p_nom={60000000000,160000000000},
    activate_consumer_pipes=1,
    activate_volumes=false,
    T_supply=353.15,
    T_return=333.15,                   K(displayUnit="mm") = 2e-05,
    redeclare model DHN_Pipe_Manufacturer = TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.Base.DHN_Pipes.DN_IsoPlus)
                                                                    annotation (Placement(transformation(extent={{-62,76},{-42,96}})));
  inner Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_ground annotation (Placement(transformation(extent={{-32,34},{-16,50}})));
  Modelica.Blocks.Sources.RealExpression T_amb(y=simCenter.Variable_Ground_Temperature.value) annotation (Placement(transformation(extent={{-68,32},{-48,52}})));



  inner ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-92,76},{-72,96}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi Grid_Supply_In(p_const(displayUnit="bar") = simCenter.p_nom[2], T_const(displayUnit="degC") = simCenter.T_supply)
                                                                                                                                                             annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-80,2})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi Grid_Return_Out(p_const(displayUnit="bar") = simCenter.p_nom[1], T_const(displayUnit="degC") = simCenter.T_return)
                                                                                                                                                              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-78,-30})));
  HeatConsumerSubstation Consumer annotation (Placement(transformation(extent={{60,36},{80,56}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.DoublePipePair_L2 doublePipePair_L2(DN=40)
                                                                                            annotation (Placement(transformation(extent={{4,-22},{24,-2}})));
  TransiEnt.Components.Heat.node node(n=2)
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,10})));
equation

  connect(T_amb.y, T_ground.T) annotation (Line(points={{-47,42},{-33.6,42}}, color={0,0,127}));
  connect(Grid_Supply_In.steam_a, doublePipePair_L2.waterPortIn_supply) annotation (Line(
      points={{-70,2},{-12,2},{-12,-8},{4,-8}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(Grid_Return_Out.steam_a, doublePipePair_L2.waterPortOut_return) annotation (Line(
      points={{-68,-30},{-12,-30},{-12,-16},{4,-16}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(T_ground.port, doublePipePair_L2.heat_supply) annotation (Line(points={{-16,42},{14,42},{14,-2}}, color={191,0,0}));
  connect(T_ground.port, doublePipePair_L2.heat_return) annotation (Line(points={{-16,42},{8,42},{8,2},{-6,2},{-6,-26},{14,-26},{14,-22}}, color={191,0,0}));
  connect(doublePipePair_L2.waterPortOut_supply, node.waterPort_supply[1]) annotation (Line(
      points={{24,-8},{65.4,-8},{65.4,10}},
      color={175,0,0},
      thickness=0.5));
  connect(node.waterPort_supply[2],Consumer. waterPortIn) annotation (Line(
      points={{64.6,10},{64,10},{64,36}},
      color={175,0,0},
      thickness=0.5));
  connect(doublePipePair_L2.waterPortIn_return, node.waterPort_return[2]) annotation (Line(
      points={{24.2,-16},{82,-16},{82,10.1},{74.075,10.1}},
      color={175,0,0},
      thickness=0.5));
  connect(Consumer.waterPortOut, node.waterPort_return[1]) annotation (Line(
      points={{76.1,35.9},{76.1,10.1},{74.925,10.1}},
      color={175,0,0},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
                                                                                                   Text(
          extent={{14,-54},{88,-92}},
          lineColor={0,0,0},
          textString="Look at:
Consumer.T_in_sub.T_celsius
Consumer.T_out_sub.T_celsius
Consumer.substation.m_flow_in.m_flow
Consumer.Q_demand")}),
    experiment(
      StopTime=604800,
      Interval=3600,
      Tolerance=0.001,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput(events=false),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Test environment for a heat consumer with the node model. </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">A sample week is simulated so that one can see how a consumer is supplied by a heating network. </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The node model is added to illustrate its potential use for decoupling purposes. In principle, it can also serve as a junction.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">For further district heating simulations based on these models, see:</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">J. Benthin, S. Kippelt, A. Spina (Hrsg.): EnEff:W&auml;rme: IQDortmund: Konzeptionierung eines integrierten W&auml;rmenetzes zur sektoren&uuml;bergreifenden Quartiersversorgung in Dortmund; Gemeinsamer Abschlussbericht des Forschungsvorhabens; Gas- und W&auml;rme-Institut Essen e.V., ef.Ruhr GmbH, ie3 Institut f&uuml;r Energiesysteme, Energieeffizienz und Energiewirtschaft der Technische Universit&auml;t Dortmund (2023) (<a href=\"https://www.gwi-essen.de/medien/publikationen/abschlussberichte/2024/iq_dortmund.pdf\">iq_dortmund.pdf</a>)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Stefanie Ruppert, 2025</span></p>
</html>"));
end TestHeatConsumerNode;
