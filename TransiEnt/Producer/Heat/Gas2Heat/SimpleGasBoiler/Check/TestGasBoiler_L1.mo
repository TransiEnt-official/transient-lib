within TransiEnt.Producer.Heat.Gas2Heat.SimpleGasBoiler.Check;
model TestGasBoiler_L1
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
  extends Basics.Icons.Checkmodel;
  inner SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  SimpleBoiler gasBoiler(useGasPort=true) annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Modelica.Blocks.Sources.Ramp ramp(
    startTime=3600,
    duration=900,
    height=-40e6,
    offset=-50e6) annotation (Placement(transformation(extent={{-68,34},{-48,54}})));
  Components.Boundaries.Gas.BoundaryRealGas_pTxi gasSource annotation (Placement(transformation(extent={{-52,-60},{-32,-40}})));
  SimpleBoiler gasBoiler1(useGasPort=false) annotation (Placement(transformation(extent={{66,-10},{86,10}})));
  TwoFuelBoiler twoFuelBoiler annotation (Placement(transformation(extent={{124,-72},{144,-52}})));
  SimpleBoiler gasBoiler2(
    useFluidPorts=false,
    useHeatPort=false,
    useGasPort=false,
    change_sign=false) annotation (Placement(transformation(extent={{14,-70},{34,-50}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=100) annotation (Placement(transformation(extent={{-100,-7},{-80,13}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=60*4186) annotation (Placement(transformation(extent={{-98,-24},{-80,-6}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink(h=130*4200)
                                                                annotation (Placement(transformation(extent={{2,-10},{-18,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=17e5) annotation (Placement(transformation(extent={{18,-6},{8,6}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=100) annotation (Placement(transformation(extent={{20,2},{30,13}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=60*4186) annotation (Placement(transformation(extent={{20,-14},{30,-4}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource1
                                                                    annotation (Placement(transformation(extent={{36,-10},{56,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=17e5)
                                                                annotation (Placement(transformation(extent={{130,-6},{120,6}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink1(h=130*4200)
                                                                annotation (Placement(transformation(extent={{114,-10},{94,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=100) annotation (Placement(transformation(extent={{76,-60},{86,-49}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=60*4186) annotation (Placement(transformation(extent={{76,-76},{86,-66}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource2
                                                                    annotation (Placement(transformation(extent={{92,-72},{112,-52}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink2(h=130*4200)
                                                                annotation (Placement(transformation(extent={{170,-72},{150,-52}})));
  Modelica.Blocks.Sources.RealExpression realExpression8(y=17e5)
                                                                annotation (Placement(transformation(extent={{182,-68},{172,-56}})));
equation
  connect(ramp.y, gasBoiler.Q_flow_set) annotation (Line(
      points={{-47,44},{-32,44},{-32,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gasSource.gasPort, gasBoiler.gasIn) annotation (Line(
      points={{-32,-50},{-32,-10},{-31.8,-10}},
      color={255,255,0},
      thickness=0.75));
  connect(ramp.y, gasBoiler1.Q_flow_set) annotation (Line(points={{-47,44},{76,44},{76,10}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-47,44},{128.2,44},{128.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-47,44},{140,44},{140,-52.2}}, color={0,0,127}));
  connect(ramp.y, gasBoiler2.Q_flow_set) annotation (Line(points={{-47,44},{24,44},{24,-50}},
                                                                                            color={0,0,127}));
  connect(realExpression1.y,fluidSource. m_flow_in) annotation (Line(points={{-79,3},{-70,3}},                     color={0,0,127}));
  connect(realExpression.y,fluidSink. p_in) annotation (Line(points={{7.5,0},{0,0}},  color={0,0,127}));
  connect(fluidSource.port_a, gasBoiler.inlet) annotation (Line(points={{-52,0},{-41.8,0}}, color={0,0,0}));
  connect(realExpression2.y, fluidSource.h_in) annotation (Line(points={{-79.1,-15},{-74,-15},{-74,-2},{-70,-2}}, color={0,0,127}));
  connect(fluidSink.port_a, gasBoiler.outlet) annotation (Line(points={{-18,0},{-22,0}}, color={0,0,0}));
  connect(realExpression3.y, fluidSource1.m_flow_in) annotation (Line(points={{30.5,7.5},{30.5,3},{38,3}}, color={0,0,127}));
  connect(realExpression4.y, fluidSource1.h_in) annotation (Line(points={{30.5,-9},{34,-9},{34,-2},{38,-2}}, color={0,0,127}));
  connect(fluidSource1.port_a, gasBoiler1.inlet) annotation (Line(points={{56,0},{66.2,0}}, color={0,0,0}));
  connect(realExpression5.y, fluidSink1.p_in) annotation (Line(points={{119.5,0},{112,0}}, color={0,0,127}));
  connect(fluidSink1.port_a, gasBoiler1.outlet) annotation (Line(points={{94,0},{86,0}}, color={0,0,0}));
  connect(realExpression6.y, fluidSource2.m_flow_in) annotation (Line(points={{86.5,-54.5},{86,-54.5},{86,-54},{90,-54},{90,-59},{94,-59}}, color={0,0,127}));
  connect(realExpression7.y, fluidSource2.h_in) annotation (Line(points={{86.5,-71},{90,-71},{90,-64},{94,-64}}, color={0,0,127}));
  connect(fluidSource2.port_a, twoFuelBoiler.inlet) annotation (Line(points={{112,-62},{124.2,-62}}, color={0,0,0}));
  connect(realExpression8.y, fluidSink2.p_in) annotation (Line(points={{171.5,-62},{168,-62}}, color={0,0,127}));
  connect(fluidSink2.port_a, twoFuelBoiler.outlet) annotation (Line(points={{150,-62},{144,-62}}, color={0,0,0}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{180,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for GasBoiler_L1</p>
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
</html>"),
    experiment(StopTime=7200),
    Icon(coordinateSystem(extent={{-100,-100},{180,100}})));
end TestGasBoiler_L1;
