within TransiEnt.Components.Heat;
model HeatExchanger_simple "Simple heat exchanger model"

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
  //          Import and Hierachy
  // _____________________________________________

  import         Modelica.Units.SI;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.MassFlowRate m_flow_nom = 1 "Nominal mass flow rate of the water";
  parameter SI.PressureDifference delta_p_nom = 0.02e3 "Pressure drop in the heat exchanger";
  parameter SI.Volume V = 0.01 "Volume of the heat exchanger";
  parameter SI.Density rho = 1000 "Density of the water";
  parameter SI.TemperatureDifference delta_T_nom = 35 "Nominal temperature difference between supply and return temperature";
  parameter SI.HeatFlowRate Q_flow_nom = 5e3*100 "Nominal heat flow rate at a given temperature difference";
  parameter Real n = 1.333 "Exponent for radiators";
  parameter SI.SpecificHeatCapacity cp = 4200 "Specific heat capacity";
  parameter Real alpha=5.4e-7 "Factor for density change due to pressure change (unused)";
  parameter Real beta=1.2e-4 "Factor for density change due to enthalpy change (unused)";
  parameter Real kA=104;

  // _____________________________________________
  //
  //             Variables
  // _____________________________________________

  SI.MassFlowRate m_flow(start = 1, nominal=m_flow_nom);
  SI.Temperature T_s;
  SI.Temperature T_r;
  SI.SpecificEnthalpy h;

  // _____________________________________________
  //
  //            Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.inlet inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.outlet outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Q_flow annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));
equation

  // _____________________________________________
  //
  //            Characteristic Equations
  // _____________________________________________

  //No pressure losses considered
  inlet.p- outlet.p=0;
  //Energy balance
  V*rho*der(h) = inlet.m_flow * inStream(inlet.h_outflow) + outlet.m_flow * outlet.h_outflow - Q_flow;
  //Connectors
  h = inlet.h_outflow;
  h=outlet.h_outflow;
  //Mass balance
  0 = inlet.m_flow + outlet.m_flow;
  inlet.m_flow = m_flow;
  //Supply and return temperature
  T_s=inStream(inlet.h_outflow)/cp+273.15;
  T_r=outlet.h_outflow/cp+273.15;
  //heatPort.T=outlet.h/cp;
  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {-60, 0}, extent = {{-40, 100}, {160, -100}}), Rectangle(extent = {{-58, 50}, {-58, 50}}), Rectangle(extent = {{-92, 64}, {-92, 64}}), Line(origin = {-10, 10}, points = {{-90, -90}, {90, 90}}), Line(origin = {10, -10}, points = {{-90, -90}, {90, 90}})}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a heat exchanger. It consists of two fluid ports and a heat port. The model is based on the three balance equations of mass, energy and momentum. A dynamic energy balance is assumed. The mass and momentum balance are assumed to be static. No pressure losses are considered.It is used for the modeling of radiators and the modeling of substations in district heating networks.</p>
<h4><span style=\"color: #008c48\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in the CodingConventions)</p>
<ul>
<li>no pressure losses considered</li>
<li>static mass balance</li>
<li>constant fluid properties</li>
<li>dynamic energy balance</li>
<li>heat transport according to EN442</li>
</ul>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>inlet: A fluid inlet for the inflowing heat carrier medium</p>
<p>outlet: A fluid outlet for the outflowing heat carrier medium</p>
<p>heatPort: A heat port for transporting the heat from the heat carrier</p>
<h4><span style=\"color: #008c48\">Governing Equations</span></h4>
<p>Mass balance: m_in+m_out=0</p>
<p>Energy balance: V*rho*dh/dt=m_in*h_in+m_out*h_in-Q_flow</p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model is an adapted version of: Components.HeatExchanger</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) January 2025</p>
</html>"));
end HeatExchanger_simple;
