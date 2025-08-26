within TransiEnt.Components.Heat;
model SteamTurbine_L0 "A steam generation unit following VDI3508"



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

  parameter Real x_highPressureStage=0.2 "Fraction of power provided by high pressure turbine stage (fast response)";
  parameter SI.Time T_lowPressure=60;
  parameter Real y_start_lowPressure=0 "Initial or guess value of output (= state)";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateIn Q_flow_in "Steam energy at input" annotation (Placement(transformation(extent={{-124,-20},{-84,20}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput
             y "Connector of Real output signal" annotation (Placement(
        transformation(extent={{98,-10},{118,10}},  rotation=0)));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1 - x_highPressureStage,
    T=T_lowPressure,
    y_start=y_start_lowPressure)                   annotation (Placement(transformation(extent={{-34,-16},{-2,16}})));

  Modelica.Blocks.Math.MultiSum energyBalance(nu=2) annotation (Placement(transformation(extent={{26,-16},{58,16}})));
  Modelica.Blocks.Math.Gain highPressureStage(k=x_highPressureStage) annotation (Placement(transformation(extent={{-34,38},{-2,70}})));

equation

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(energyBalance.y, y) annotation (Line(points={{60.72,0},{108,0}}, color={0,0,127}));
  connect(firstOrder.y, energyBalance.u[1]) annotation (Line(points={{-0.4,0},{12,0},{12,-2.8},{26,-2.8}},
                                                                                                         color={0,0,127}));
  connect(Q_flow_in, firstOrder.u) annotation (Line(points={{-104,0},{-37.2,0}}, color={0,0,127}));
  connect(Q_flow_in, highPressureStage.u) annotation (Line(points={{-104,0},{-84,0},{-58,0},{-58,54},{-37.2,54}}, color={0,0,127}));
  connect(highPressureStage.y, energyBalance.u[2]) annotation (Line(points={{-0.4,54},{10,54},{10,2.8},{26,2.8}},   color={0,0,127}));
  annotation (defaultComponentName="SteamTurbine", Diagram(graphics,
                                                           coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model</span></h4>
<p>Basic model for a steam turbine unit that represents the dynamics of a turbine with a given Input. It consists of a first-order block and a gain block. The gain block represents the fast response of the turbine (the high-pressure part), while the first-order block represents the delayed response of the turbine. No efficiencies are considered in this model. </p>
<p>The model is used to create the model of a power plant, that can be found here:</p>
<p>TransiEnt.Producer.Electrical.Conventional.Components.VDI3508Plant</p>
<h4><span style=\"color: #008c48\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L0 (defined in the CodingConventions)</p>
<ul>
<li>the thermal inertia of the generator is modelled</li>
<li>no efficiencies have been considered</li>
</ul>
<h4><span style=\"color: #008c48\">Limits of validity </span></h4>
<p>A basic model that only considers dynamics. </p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>RealInput: Q_flow_in (Steam Energy at input) in W</p>
<p>RealOutput: y (Real Output signal)</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<p>T_lowPressure is the time not a temperature</p>
<h4><span style=\"color: #008000\">Validation</span></h4>
<p>The model was tested in the test model:</p>
<p>TransiEnt.Components.Heat.Check.TestSteamTurbine</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>VDI 3508, &quot;Verein Deutscher Ingenieure&quot; </p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>The model was documented by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"),
    Icon(graphics={
        Polygon(
          points={{-60,62},{-52,58},{34,90},{40,100},{-60,62}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-60,62},{-52,58},{-52,-64},{-60,-62},{-60,62}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{32,90},{32,-96},{40,-100},{40,100},{32,90}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-60,-62},{40,-100},{38,-92},{-60,-54},{-60,-62}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-52,58},{32,90},{32,-90},{-52,-58},{-52,58}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}));
end SteamTurbine_L0;
