within TransiEnt.Components.Heat;
model SteamGenerator_L0 "A steam generation unit following VDI3508"



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





  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

extends TransiEnt.Basics.Icons.Block;

  // _____________________________________________
  //
  //              Visible Parameters
  // _____________________________________________

  parameter SI.Time T_u=60;
  parameter SI.Time T_g=1800 "Time constant of heat release";
  parameter Real y_start=0 "Initial or guess value of output (= state)";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateIn Q_flow_set "Fuel energy flow setpoint" annotation (Placement(transformation(extent={{-124,-20},{-84,20}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput
             y "Connector of Real output signal" annotation (Placement(
        transformation(extent={{98,-10},{118,10}},  rotation=0)));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Nonlinear.FixedDelay delay(delayTime=T_u) annotation (Placement(transformation(extent={{-52,-16},{-20,16}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(k=1, T=T_g,
    y_start=y_start)                               annotation (Placement(transformation(extent={{20,-16},{52,16}})));

equation

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(Q_flow_set, delay.u) annotation (Line(points={{-104,0},{-55.2,0}}, color={0,0,127}));
  connect(delay.y, firstOrder.u) annotation (Line(points={{-18.4,0},{-2,0},{16.8,0}}, color={0,0,127}));
  connect(firstOrder.y, y) annotation (Line(points={{53.6,0},{108,0}}, color={0,0,127}));
  annotation (defaultComponentName="SteamGenerator", Diagram(graphics,
                                                             coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A generic model of a steam generator. It calculates the heat flow output of a basic steam generator from a set heat flow rate. The thermal inertia of the steam generator is considered with the combination of a first-order and a delay model from the Modelica Standard Library. The time constant T_G of the first-order block and the delay time T_u can be set by the user. </p>
<p>The model is used to create the model of a power plant, that can be found here:</p>
<p>TransiEnt.Producer.Electrical.Conventional.Components.VDI3508Plant</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L0 (defined in the CodingConventions)</p>
<ul>
<li>the thermal inertia of the generator is modelled</li>
<li>no efficiencies have been considered</li>
</ul>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>The time constant and the delay time of the steam generator have to be known to use this model. Efficiencies are not considered.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>RealInput: Q_flow_set (Fuel Energy setpoint) </p>
<p>RealOutput: y (Real Output signal)</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<p>T_u is the delay time</p>
<p>T_g is the first order time constant of heat release</p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-7U5VDHXv.png\" alt=\"Q_flow_out=Q_flow(t+T_u)
\"/> (for the time delay)</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-MzhvkYle.png\" alt=\"d*Q_flow_out/dt=(k*Q_flow_set-Q_flow_out)/T\"/> (for the first order block)</p>
<h4><span style=\"color: #008000\">Validation</span></h4>
<p>The concept of the model was verified with the test model TransiEnt.Components.Heat.Check.TestSteamGenerator.</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>VDI 3508</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model documented by Jan Westphal (j.westphal@tuhh.de) in January 2025</p>
</html>"),
    Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-92,92},{92,-92}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-54,54},{54,-54}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-46,46},{48,-46}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-36,30},{-30,36},{38,-32},{32,-38},{-36,30}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-36,-30},{-30,-36},{38,32},{32,38},{-36,-30}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-4,108},{4,100}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{56,104},{64,100}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end SteamGenerator_L0;
