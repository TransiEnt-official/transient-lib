within TransiEnt.Consumer.Heat.Check;
model TestHeatConsumerNode
  extends TransiEnt.Basics.Icons.Checkmodel;
  inner SimCenter            simCenter(
    p_nom={60000000000,160000000000},
    activate_consumer_pipes=0,
    activate_volumes=false,
    T_supply=383.15,
    T_return=363.15,                   K(displayUnit="mm") = 2e-05,
    redeclare model DHN_Pipe_Manufacturer = TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.Base.DHN_Pipes.DN_IsoPlus)
                                                                    annotation (Placement(transformation(extent={{-62,76},{-42,96}})));
  inner Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_ground annotation (Placement(transformation(extent={{-32,34},{-16,50}})));
  Modelica.Blocks.Sources.RealExpression T_amb(y=simCenter.Variable_Ground_Temperature.value) annotation (Placement(transformation(extent={{-68,32},{-48,52}})));

   Real der_dp;

  inner ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-92,76},{-72,96}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi Grid_Supply_In(p_const(displayUnit="bar") = simCenter.p_nom[2], T_const(displayUnit="degC") = 383.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-80,2})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi Grid_Return_Out(p_const(displayUnit="bar") = simCenter.p_nom[1], T_const(displayUnit="degC") = 363.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-78,-30})));
  HeatConsumerSubstation consumer annotation (Placement(transformation(extent={{60,36},{80,56}})));
  TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.DoublePipePair_L2 doublePipePair_L2 annotation (Placement(transformation(extent={{4,-22},{24,-2}})));
  TransiEnt.Components.Heat.node node annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,10})));
equation
   der_dp = 0; //der(KDO.dp_control.p_out);

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
      points={{24,-8},{65,-8},{65,10}},
      color={175,0,0},
      thickness=0.5));
  connect(node.waterPort_supply[2], consumer.waterPortIn) annotation (Line(
      points={{65,10},{64,10},{64,36}},
      color={175,0,0},
      thickness=0.5));
  connect(doublePipePair_L2.waterPortIn_return, node.waterPort_return[2]) annotation (Line(
      points={{24.2,-16},{82,-16},{82,10.1},{74.5,10.1}},
      color={175,0,0},
      thickness=0.5));
  connect(consumer.waterPortOut, node.waterPort_return[1]) annotation (Line(
      points={{76.1,35.9},{76.1,10.1},{74.5,10.1}},
      color={175,0,0},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=604800,
      Interval=3600,
      Tolerance=0.001,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput(events=false),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>Test environment for a heat consumer with the node model</p>
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
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Stefanie Ruppert, 2025</span></p>
</html>"));
end TestHeatConsumerNode;
