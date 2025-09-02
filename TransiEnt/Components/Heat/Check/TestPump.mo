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
  //          Import and Class Hierachy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Checkmodel;


  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{-104,-78},{-84,-58}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=1e5)
                                                             annotation (Placement(transformation(extent={{-132,-78},{-112,-58}})));
  TransiEnt.Components.Heat.SimplePump_mflow pump(rho=998.207) annotation (Placement(transformation(extent={{-16,-78},{4,-58}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.1)
                                                             annotation (Placement(transformation(extent={{-62,-72},{-42,-52}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=1.2e5)
                                                             annotation (Placement(transformation(extent={{10,-58},{30,-38}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink1 annotation (Placement(transformation(extent={{44,-78},{24,-58}})));
  TransiEnt.Components.Heat.PumpVLE_L1_simple pumpVLE_L1_simple(presetVariableType="m_flow", m_flow_fixed=0.1) annotation (Placement(transformation(extent={{-10,-160},{10,-140}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi(p_const=1.2e5) annotation (Placement(transformation(extent={{54,-160},{34,-140}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_pTxi1(p_const=1e5) annotation (Placement(transformation(extent={{-58,-160},{-38,-140}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{92,60},{112,80}})));
  SimplePump_dp pump_Dp(rho=998.207) annotation (Placement(transformation(extent={{-14,34},{6,54}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1.0e5)
                                                             annotation (Placement(transformation(extent={{-84,34},{-64,54}})));
  Boundaries.FluidFlow.FluidSink                      sink2 annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=0.2e5)
                                                             annotation (Placement(transformation(extent={{-40,64},{-20,84}})));
  Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(extent={{48,34},{28,54}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=-0.1)
                                                             annotation (Placement(transformation(extent={{86,41},{66,61}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=60*4200)
                                                             annotation (Placement(transformation(extent={{88,22},{68,42}})));
equation

  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  connect(realExpression4.y, sink.p_in) annotation (Line(points={{-111,-68},{-111,-68},{-102,-68}},        color={0,0,127}));
  connect(sink.port_a, pump.inlet) annotation (Line(points={{-84,-68},{-66,-68},{-66,-76},{-22,-76},{-22,-68},{-16.2,-68}},
                                                                                                                    color={0,0,0}));
  connect(realExpression1.y, pump.m_flow) annotation (Line(points={{-41,-62},{-15.4,-62}}, color={0,0,127}));
  connect(sink1.port_a, pump.outlet) annotation (Line(points={{24,-68},{4.2,-68}},                     color={0,0,0}));
  connect(realExpression2.y, sink1.p_in) annotation (Line(points={{31,-48},{46,-48},{46,-46},{56,-46},{56,-68},{42,-68}},     color={0,0,127}));
  connect(pumpVLE_L1_simple.fluidPortOut, boundaryVLE_pTxi.steam_a) annotation (Line(
      points={{10,-150},{34,-150}},
      color={175,0,0},
      thickness=0.5));
  connect(pumpVLE_L1_simple.fluidPortIn, boundaryVLE_pTxi1.steam_a) annotation (Line(
      points={{-10,-150},{-38,-150}},
      color={175,0,0},
      thickness=0.5));
  connect(realExpression3.y,sink2. p_in) annotation (Line(points={{-63,44},{-58.5,44},{-58.5,44},{-54,44}},                   color={0,0,127}));
  connect(realExpression5.y, pump_Dp.delta_p) annotation (Line(points={{-19,74},{-4,74},{-4,54}}, color={0,0,127}));
  connect(realExpression6.y, fluidSource.m_flow_in) annotation (Line(points={{65,51},{52,51},{52,47},{46,47}}, color={0,0,127}));
  connect(realExpression7.y, fluidSource.h_in) annotation (Line(points={{67,32},{54,32},{54,42},{46,42}}, color={0,0,127}));
  connect(pump_Dp.outlet, fluidSource.port_a) annotation (Line(points={{6.2,44},{28,44}}, color={0,0,0}));
  connect(sink2.port_a, pump_Dp.inlet) annotation (Line(points={{-36,44},{-14.2,44}}, color={0,0,0}));
  annotation (
    Icon(                                                                                                                                                                                  coordinateSystem(initialScale = 0.1, extent={{-160,-200},{140,100}})),
                                                                                                                                                                                                        experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-160,-200},{140,100}}), graphics={
                                               Text(
          extent={{-142,-4},{-22,-40}},
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
