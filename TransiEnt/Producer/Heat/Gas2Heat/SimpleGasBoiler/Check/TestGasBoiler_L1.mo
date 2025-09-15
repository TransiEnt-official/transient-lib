within TransiEnt.Producer.Heat.Gas2Heat.SimpleGasBoiler.Check;
model TestGasBoiler_L1



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



  extends Basics.Icons.Checkmodel;
  inner SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  SimpleBoiler gasBoiler(useGasPort=true) annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
  Modelica.Blocks.Sources.Ramp ramp(
    startTime=3600,
    duration=900,
    height=-40e6,
    offset=-50e6) annotation (Placement(transformation(extent={{-92,34},{-72,54}})));
  Components.Boundaries.Gas.BoundaryRealGas_pTxi gasSource annotation (Placement(transformation(extent={{-76,-60},{-56,-40}})));
  SimpleBoiler gasBoiler1(useGasPort=false) annotation (Placement(transformation(extent={{46,-10},{66,10}})));
  TwoFuelBoiler twoFuelBoiler annotation (Placement(transformation(extent={{100,-72},{120,-52}})));
  SimpleBoiler gasBoiler2(
    useFluidPorts=false,
    useHeatPort=false,
    useGasPort=false,
    change_sign=false) annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink(h=130*4200)
                                                                annotation (Placement(transformation(extent={{-18,-10},{-38,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=17e5) annotation (Placement(transformation(extent={{0,-7},{-14,7}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=100) annotation (Placement(transformation(extent={{-118,-7},{-98,13}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=60*4200) annotation (Placement(transformation(extent={{-118,-21},{-98,-1}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource1
                                                                    annotation (Placement(transformation(extent={{22,-10},{42,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=100)
                                                               annotation (Placement(transformation(extent={{4,-4},{16,11}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=60*4200) annotation (Placement(transformation(extent={{4,-16},{16,-1}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink1(h=130*4200)
                                                                annotation (Placement(transformation(extent={{92,-10},{72,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=17e5) annotation (Placement(transformation(extent={{114,-7},{100,7}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink2(h=130*4200)
                                                                annotation (Placement(transformation(extent={{308,-140},{288,-120}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=17e5) annotation (Placement(transformation(extent={{328,-137},{314,-123}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink3(h=130*4200)
                                                                annotation (Placement(transformation(extent={{308,-122},{288,-102}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=17e5) annotation (Placement(transformation(extent={{328,-119},{314,-105}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink4(h=130*4200)
                                                                annotation (Placement(transformation(extent={{248,-80},{228,-60}})));
  Modelica.Blocks.Sources.RealExpression realExpression8(y=17e5) annotation (Placement(transformation(extent={{270,-77},{256,-63}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink5(h=130*4200)
                                                                annotation (Placement(transformation(extent={{304,-78},{284,-58}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=17e5) annotation (Placement(transformation(extent={{326,-75},{312,-61}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink6(h=130*4200)
                                                                annotation (Placement(transformation(extent={{148,-72},{128,-52}})));
  Modelica.Blocks.Sources.RealExpression realExpression10(y=17e5)
                                                                 annotation (Placement(transformation(extent={{168,-69},{154,-55}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource2
                                                                    annotation (Placement(transformation(extent={{64,-72},{84,-52}})));
  Modelica.Blocks.Sources.RealExpression realExpression11(y=100)
                                                               annotation (Placement(transformation(extent={{46,-66},{58,-51}})));
  Modelica.Blocks.Sources.RealExpression realExpression12(y=60*4200)
                                                                    annotation (Placement(transformation(extent={{46,-78},{58,-63}})));
equation
  connect(ramp.y, gasBoiler.Q_flow_set) annotation (Line(
      points={{-71,44},{-56,44},{-56,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gasSource.gasPort, gasBoiler.gasIn) annotation (Line(
      points={{-56,-50},{-56,-10},{-55.8,-10}},
      color={255,255,0},
      thickness=0.75));
  connect(ramp.y, gasBoiler1.Q_flow_set) annotation (Line(points={{-71,44},{56,44},{56,10}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-71,44},{104.2,44},{104.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-71,44},{116,44},{116,-52.2}}, color={0,0,127}));
  connect(ramp.y, gasBoiler2.Q_flow_set) annotation (Line(points={{-71,44},{0,44},{0,-50}}, color={0,0,127}));
  connect(realExpression2.y,fluidSink. p_in) annotation (Line(points={{-14.7,8.88178e-16},{-16,8.88178e-16},{-16,0},{-20,0}},
                                                                                          color={0,0,127}));
  connect(fluidSink.port_a, gasBoiler.outlet) annotation (Line(points={{-38,0},{-46,0}}, color={0,0,0}));
  connect(realExpression.y,fluidSource. m_flow_in) annotation (Line(points={{-97,3},{-90,3}},     color={0,0,127}));
  connect(realExpression1.y,fluidSource. h_in) annotation (Line(points={{-97,-11},{-90,-11},{-90,-2}},            color={0,0,127}));
  connect(fluidSource.port_a, gasBoiler.inlet) annotation (Line(points={{-72,0},{-65.8,0}}, color={0,0,0}));
  connect(realExpression3.y, fluidSource1.m_flow_in) annotation (Line(points={{16.6,3.5},{16.6,3},{24,3}}, color={0,0,127}));
  connect(realExpression4.y, fluidSource1.h_in) annotation (Line(points={{16.6,-8.5},{18,-8.5},{18,-2},{24,-2}}, color={0,0,127}));
  connect(fluidSource1.port_a, gasBoiler1.inlet) annotation (Line(points={{42,0},{46.2,0}}, color={0,0,0}));
  connect(fluidSink1.port_a, gasBoiler1.outlet) annotation (Line(points={{72,0},{66,0}}, color={0,0,0}));
  connect(realExpression5.y, fluidSink1.p_in) annotation (Line(points={{99.3,8.88178e-16},{95.65,8.88178e-16},{95.65,0},{90,0}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-71,44},{104.2,44},{104.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-71,44},{116,44},{116,-52.2}}, color={0,0,127}));
  connect(realExpression6.y, fluidSink2.p_in) annotation (Line(points={{313.3,-130},{309.65,-130},{309.65,-130},{306,-130}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-71,44},{104.2,44},{104.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-71,44},{116,44},{116,-52.2}}, color={0,0,127}));
  connect(realExpression7.y, fluidSink3.p_in) annotation (Line(points={{313.3,-112},{309.65,-112},{309.65,-112},{306,-112}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-71,44},{104.2,44},{104.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-71,44},{116,44},{116,-52.2}}, color={0,0,127}));
  connect(realExpression8.y, fluidSink4.p_in) annotation (Line(points={{255.3,-70},{251.65,-70},{251.65,-70},{246,-70}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-71,44},{104.2,44},{104.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-71,44},{116,44},{116,-52.2}}, color={0,0,127}));
  connect(realExpression9.y, fluidSink5.p_in) annotation (Line(points={{311.3,-68},{307.65,-68},{307.65,-68},{302,-68}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-71,44},{104.2,44},{104.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-71,44},{116,44},{116,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-71,44},{104.2,44},{104.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-71,44},{116,44},{116,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B1) annotation (Line(points={{-71,44},{104.2,44},{104.2,-52.2}}, color={0,0,127}));
  connect(ramp.y, twoFuelBoiler.Q_flow_set_B2) annotation (Line(points={{-71,44},{116,44},{116,-52.2}}, color={0,0,127}));
  connect(fluidSink6.port_a, twoFuelBoiler.outlet) annotation (Line(points={{128,-62},{120,-62}}, color={0,0,0}));
  connect(realExpression10.y, fluidSink6.p_in) annotation (Line(points={{153.3,-62},{146,-62}}, color={0,0,127}));
  connect(realExpression11.y, fluidSource2.m_flow_in) annotation (Line(points={{58.6,-58.5},{58.6,-59},{66,-59}}, color={0,0,127}));
  connect(realExpression12.y, fluidSource2.h_in) annotation (Line(points={{58.6,-70.5},{60,-70.5},{60,-64},{66,-64}}, color={0,0,127}));
  connect(fluidSource2.port_a, twoFuelBoiler.inlet) annotation (Line(points={{84,-62},{100.2,-62}}, color={0,0,0}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{160,100}})),
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
    Icon(coordinateSystem(extent={{-100,-100},{160,100}})));
end TestGasBoiler_L1;
