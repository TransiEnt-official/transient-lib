within TransiEnt.Producer.Heat.Gas2Heat.SimpleGasBoiler.Check;
model TestGasBoilerGasAdaptive_L1
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
  SimpleBoiler gasBoilerGasAdaptive(integrateHeatFlow=false) annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-50e6,
    offset=-100e6,
    duration=0.6,
    startTime=0.2)
    annotation (Placement(transformation(extent={{-100,16},{-80,36}})));
  Components.Boundaries.Gas.BoundaryRealGas_pTxi gasSource(variable_xi=true) annotation (Placement(transformation(extent={{-56,-60},{-36,-40}})));
  Modelica.Blocks.Sources.Constant
                               ramp1(k=-100e6)
    annotation (Placement(transformation(extent={{-100,48},{-80,68}})));
  Components.Boundaries.Gas.RealGasCompositionByWtFractions_stepVariation composition_linearVariation(stepsize=0.1, period=0.2) annotation (Placement(transformation(extent={{-92,-66},{-72,-46}})));
  SimpleBoiler gasBoilerGasAdaptive1(useFluidPorts=false, integrateHeatFlow=false) annotation (Placement(transformation(extent={{46,-12},{66,8}})));
  Components.Boundaries.Gas.BoundaryRealGas_pTxi gasSource1(variable_xi=true)
                                                                             annotation (Placement(transformation(extent={{36,-62},{56,-42}})));
  Modelica.Blocks.Sources.Constant
                               ramp3(k=-100e6)
    annotation (Placement(transformation(extent={{-8,46},{12,66}})));
  Components.Boundaries.Gas.RealGasCompositionByWtFractions_stepVariation composition_linearVariation1(stepsize=0.1, period=0.2)
                                                                                                                                annotation (Placement(transformation(extent={{0,-68},{20,-48}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T=308.15)
                                                                                    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={66,35})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink(h=130*4200)
                                                                annotation (Placement(transformation(extent={{2,-10},{-18,10}})));
  Components.Boundaries.FluidFlow.FluidSource           fluidSource annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=17e5) annotation (Placement(transformation(extent={{28,-10},{8,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=100) annotation (Placement(transformation(extent={{-98,-7},{-78,13}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=60*4186) annotation (Placement(transformation(extent={{-96,-24},{-78,-6}})));
equation
  connect(composition_linearVariation.xi, gasSource.xi) annotation (Line(points={{-72,-56},{-58,-56}}, color={0,0,127}));
  connect(gasSource.gasPort, gasBoilerGasAdaptive.gasIn) annotation (Line(
      points={{-36,-50},{-36,-10},{-35.8,-10}},
      color={255,255,0},
      thickness=1.5));
  connect(ramp1.y, gasBoilerGasAdaptive.Q_flow_set) annotation (Line(points={{-79,58},{-36,58},{-36,10}},        color={0,0,127}));
  connect(composition_linearVariation1.xi, gasSource1.xi) annotation (Line(points={{20,-58},{34,-58}}, color={0,0,127}));
  connect(gasSource1.gasPort, gasBoilerGasAdaptive1.gasIn) annotation (Line(
      points={{56,-52},{56,-12},{56.2,-12}},
      color={255,255,0},
      thickness=1.5));
  connect(ramp3.y, gasBoilerGasAdaptive1.Q_flow_set) annotation (Line(points={{13,56},{26,56},{26,16},{56,16},{56,8}}, color={0,0,127}));
  connect(gasBoilerGasAdaptive1.heatPort, fixedTemperature1.port) annotation (Line(points={{66,6.6},{66,25}}, color={191,0,0}));
  connect(realExpression.y,fluidSink. p_in) annotation (Line(points={{7,0},{0,0}},    color={0,0,127}));
  connect(realExpression1.y,fluidSource. m_flow_in) annotation (Line(points={{-77,3},{-68,3}},                     color={0,0,127}));
  connect(fluidSink.port_a, gasBoilerGasAdaptive.outlet) annotation (Line(points={{-18,0},{-26,0}}, color={0,0,0}));
  connect(realExpression2.y, fluidSource.h_in) annotation (Line(points={{-77.1,-15},{-77.1,-16},{-72,-16},{-72,-2},{-68,-2}}, color={0,0,127}));
  connect(fluidSource.port_a, gasBoilerGasAdaptive.inlet) annotation (Line(points={{-50,0},{-45.8,0}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for GasBoilerGasAdaptive_L1</p>
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
    experiment(StopTime=300));
end TestGasBoilerGasAdaptive_L1;
