within TransiEnt.Components.Heat;
model SteamVolumeWithValve_L0 "A steam volume unit following VDI3508"



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

  parameter SI.Time T=100 "Integrator time constant";
  parameter Real y_start=0 "Initial or guess value of output (= state)";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.General.MassFlowRateIn m_flow_steam_in "Inflowing steam with setpoint enthalpy" annotation (Placement(transformation(extent={{-124,-20},{-84,20}}, rotation=0)));
  TransiEnt.Basics.Interfaces.General.MassFlowRateOut m_flow_steam_out "Connector of Real output signal" annotation (Placement(transformation(extent={{98,-10},{118,10}}, rotation=0)));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Continuous.Integrator SteamStorage(k=1/T, y_start=y_start) annotation (Placement(transformation(extent={{-22,-22},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput opening "Valve opening" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,84})));
  Modelica.Blocks.Math.Product Valve annotation (Placement(transformation(extent={{38,-12},{70,20}})));
  Modelica.Blocks.Math.MultiSum massBalance(nu=2, k={1,-1})
                                                  annotation (Placement(transformation(extent={{-74,-22},{-42,10}})));

equation

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(massBalance.u[1], m_flow_steam_in) annotation (Line(points={{-74,-8.8},{-90,-8.8},{-90,0},{-104,0}}, color={0,0,127}));
  connect(massBalance.y, SteamStorage.u) annotation (Line(points={{-39.28,-6},{-32,-6},{-25.2,-6}}, color={0,0,127}));
  connect(SteamStorage.y, Valve.u2) annotation (Line(points={{11.6,-6},{34.8,-6},{34.8,-5.6}}, color={0,0,127}));
  connect(Valve.y, m_flow_steam_out) annotation (Line(points={{71.6,4},{84,4},{84,0},{108,0}}, color={0,0,127}));
  connect(Valve.y, massBalance.u[2]) annotation (Line(points={{71.6,4},{84,4},{84,-74},{-88,-74},{-88,-3.2},{-74,-3.2}},   color={0,0,127}));
  connect(opening, Valve.u1) annotation (Line(points={{0,100},{0,56},{20,56},{20,13.6},{34.8,13.6}}, color={0,0,127}));
  annotation (defaultComponentName="SteamVolume", Diagram(graphics,
                                                          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
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
        Polygon(
          points={{-70,64},{-56,64},{8,0},{0,-6},{-70,64}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-70,-64},{-56,-64},{8,0},{0,6},{-70,-64}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,64},{96,56}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-58,-56},{94,-64}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>Model for a steam volume unit with valve. The model is based on VDI 3508. It was used to create a power plant model that can be found here:</p>
<p>TransiEnt.Producer.Electrical.Conventional.Components.VDI3508Plant</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L0 (defined in the CodingConventions)</p>
<ul>
<li>the thermal inertia of the generator is modelled</li>
<li>no efficiencies have been considered</li>
</ul>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>RealInput: m_flow_steam_in (inflowing steam with enthalpy setpoint)</p>
<p>RealOutput: m_flow_steam_out (Real Output signal)</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<p>T is the time constant of the integrator not the temperature</p>
<h4><span style=\"color: #008000\">Validation</span></h4>
<p>The model was tested in the test model:</p>
<p>TransiEnt.Components.Heat.Check.TestTurbineValveController</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>VDI 3508</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>The model was documented by Jan Westphal (j.westphal@tuhh.de) in August 2025</p>
</html>"));
end SteamVolumeWithValve_L0;
