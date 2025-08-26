within TransiEnt.Components.Heat.Check;
model TestPump "Test model for the simple pump model"

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
  //          Instances of other classes
  // _____________________________________________

  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{-60,-26},{-40,-6}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=1e5)
                                                             annotation (Placement(transformation(extent={{-72,-4},{-52,16}})));
  TransiEnt.Components.Heat.SimplePump pump(rho=998.207) annotation (Placement(transformation(extent={{-32,-78},{-12,-58}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.1)
                                                             annotation (Placement(transformation(extent={{-62,-72},{-42,-52}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1.2e5)
                                                             annotation (Placement(transformation(extent={{38,-48},{58,-28}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink1 annotation (Placement(transformation(extent={{50,-70},{70,-50}})));
  TransiEnt.Components.Heat.PumpVLE_L1_simple pumpVLE_L1_simple(presetVariableType="m_flow", m_flow_fixed=0.1) annotation (Placement(transformation(extent={{-10,-160},{10,-140}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi(p_const=1.2e5) annotation (Placement(transformation(extent={{54,-160},{34,-140}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi1(p_const=1e5) annotation (Placement(transformation(extent={{-58,-160},{-38,-140}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{92,60},{112,80}})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(realExpression4.y, sink.p_in) annotation (Line(points={{-51,6},{-30,6},{-30,-16.2},{-42,-16.2}}, color={0,0,127}));
  connect(sink.port_a, pump.inlet) annotation (Line(points={{-60,-16},{-94,-16},{-94,-70},{-32.2,-70},{-32.2,-68}}, color={0,0,0}));
  connect(realExpression1.y, pump.m_flow) annotation (Line(points={{-41,-62},{-31.4,-62}}, color={0,0,127}));
  connect(sink1.port_a, pump.outlet) annotation (Line(points={{50,-60},{-6,-60},{-6,-68},{-11.8,-68}}, color={0,0,0}));
  connect(realExpression2.y, sink1.p_in) annotation (Line(points={{59,-38},{74,-38},{74,-36},{84,-36},{84,-60.2},{68,-60.2}}, color={0,0,127}));
  connect(pumpVLE_L1_simple.fluidPortOut, boundaryVLE_pTxi.steam_a) annotation (Line(
      points={{10,-150},{34,-150}},
      color={175,0,0},
      thickness=0.5));
  connect(pumpVLE_L1_simple.fluidPortIn, boundaryVLE_pTxi1.steam_a) annotation (Line(
      points={{-10,-150},{-38,-150}},
      color={175,0,0},
      thickness=0.5));
  annotation (
    Icon(graphics={  Polygon(fillColor = {0, 85, 0}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, -100}, {-100, 100}, {-88, 94}, {-100, 100}})}, coordinateSystem(initialScale = 0.1, extent={{-160,-200},{140,100}})),
                                                                                                                                                                                                        experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-160,-200},{140,100}}), graphics={Text(
          extent={{-136,-94},{-16,-130}},
          textColor={28,108,200},
          textString="ClaRa model of a pump"), Text(
          extent={{-140,46},{-20,10}},
          textColor={28,108,200},
          textString="Test model of a pump")}),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model:</span></h4>
<p>Test model for the verification of the pump model.</p>
<h4><span style=\"color: #1c6cc8\">Compare this variables for the verification of the pump:</span></h4>
<p>pump.P_el</p>
<p>pumpVLE_L1_simple.P_el</p>
<p>pumpVLE_L1_simple.P_hyd</p>
<p>pump.P_hyd</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>The model was created by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end TestPump;
