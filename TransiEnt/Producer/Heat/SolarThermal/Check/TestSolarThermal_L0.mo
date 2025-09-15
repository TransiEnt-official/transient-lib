within TransiEnt.Producer.Heat.SolarThermal.Check;
model TestSolarThermal_L0 "Tester for a solar collector using fluid boundaries"




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
  SolarThermal.SolarThermal_L0 solarThermal annotation (Placement(transformation(extent={{8,-10},{-12,10}})));
  inner SimCenter simCenter(redeclare TransiEnt.Basics.Tables.HeatGrid.HeatingCurves.HeatingCurveEONHanse heatingCurve) annotation (Placement(transformation(extent={{-90,80},{-70,100}})));

  Components.Boundaries.FluidFlow.FluidSource           fluidSource annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=400e3)
                                                                 annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.1)  annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Components.Boundaries.FluidFlow.FluidSink           fluidSink(h=400e3)
                                                                annotation (Placement(transformation(extent={{42,-10},{22,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=10e5) annotation (Placement(transformation(extent={{66,-10},{46,10}})));
equation
  connect(realExpression3.y,fluidSource. h_in) annotation (Line(points={{-59,-10},{-52,-10},{-52,-2},{-46,-2}},
                                                                                          color={0,0,127}));
  connect(realExpression1.y,fluidSource. m_flow_in) annotation (Line(points={{-59,10},{-54,10},{-54,3},{-46,3}},
                                                                                                               color={0,0,127}));
  connect(realExpression2.y, fluidSink.p_in) annotation (Line(points={{45,0},{40,0}}, color={0,0,127}));
  connect(solarThermal.waterPortIn, fluidSource.port_a) annotation (Line(points={{-12,0},{-28,0}}, color={0,0,0}));
  connect(solarThermal.waterPortOut, fluidSink.port_a) annotation (Line(points={{8,0},{22,0}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-26,90},{86,70}},
          textColor={28,108,200},
          fontSize=8,
          horizontalAlignment=TextAlignment.Left,
          textString="Look at:
- solarThermal.heatFlowRateOut")}),                                                                           Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for SolarThermal_L0</p>
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
    experiment(
      StopTime=31621500,
      Interval=311040000,
      __Dymola_fixedstepsize=1000,
      __Dymola_Algorithm="Rkfix2"));
end TestSolarThermal_L0;
