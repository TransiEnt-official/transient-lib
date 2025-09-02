within TransiEnt.Producer.Heat.Power2Heat.Heatpump;
model HeatPump_LowTemperatureDHN "Heat Pump model in low temperature DHN"

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

  import Modelica.Units.SI;

  // _____________________________________________
  //
  //          Visible Parameters
  // _____________________________________________

  //parameter Real COP = 3.5;
  parameter Real cp = 4186;
  parameter SI.HeatFlowRate Q_flow_nom_house = 8e3;
  parameter Real eta_carnot = 0.6;
  parameter SI.TemperatureDifference delta_T_HP = 10;
  parameter Real psi = 0.13;
  //parameter SI.TemperatureDifference delta_T_house = 18;
  parameter SI.Volume V = 0.05 "Volume of the heat exchanger";
  parameter SI.Density rho = 983 "Density of the water";
  parameter Real alpha = 0.6;
  parameter SI.TemperatureDifference delta_T_house_nom = 20;

  // _____________________________________________
  //
  //          Variables
  // _____________________________________________

  SI.HeatFlowRate Q_flow_DHN;
  SI.HeatFlowRate Q_flow_house;
  SI.ActivePower P_el;
  SI.Temperature T_house_supply;
  SI.SpecificEnthalpy h( start = 4200*30);
  Real COP;
  Real eta_pl;
  SI.Temperature T_DHN_in;
  SI.Temperature T_DHN_out;
  SI.Temperature T_house_return;
  SI.Temperature T_m_house;
  SI.Temperature T_m_DHN;
  //SI.MassFlowRate m_flow_house;

  // _____________________________________________
  //
  //          Instances of other classes
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortS annotation (Placement(
      visible=true,
      transformation(
        origin={-20,100},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-20,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortR annotation (Placement(transformation(extent={{10,90},{30,110}})));

equation
  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

  //No pressure loss
  inlet.p - outlet.p = 0;
  //Static mass balance
  inlet.m_flow + outlet.m_flow = 0;

  Q_flow_DHN = inlet.m_flow * (inStream(inlet.h_outflow) - actualStream(outlet.h_outflow)) - V *rho * der(h);
  Q_flow_house = Q_flow_DHN + P_el;
  P_el = Q_flow_house / COP;
  COP = max(eta_carnot * eta_pl * (T_m_house + delta_T_HP) / (T_m_house - T_m_DHN + 2 * delta_T_HP), 1);
  eta_pl = min(1 - psi * (1 - Q_flow_house / Q_flow_nom_house), 1);
  inlet.h_outflow = h;
  outlet.h_outflow = h;

  T_DHN_in = inStream(inlet.h_outflow) / cp +273.15;
  T_DHN_out = h / cp + 273.15;

  T_m_house = 0.5 * (T_house_supply + T_house_return);
  T_m_DHN = 0.5 * (T_DHN_in+T_DHN_out);

  //Heat ports
  heatPortS.Q_flow = -Q_flow_house;
  heatPortR.Q_flow = 0;
  heatPortS.T = T_house_supply;
  heatPortR.T = T_house_return;
  //delta_T_house = T_house_supply - T_house_return;
  //Q_flow_house = (T_house_supply - T_house_return) * cp * m_flow_house;
  //m_flow_house = alpha * inlet.m_flow;
  Q_flow_house = Q_flow_nom_house *(T_house_supply - T_house_return) / delta_T_house_nom;

  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {-60, 0}, extent = {{-40, 100}, {160, -100}}), Rectangle(extent = {{-58, 50}, {-58, 50}}), Rectangle(extent = {{-92, 64}, {-92, 64}}), Line(origin = {-10, 10}, points = {{-90, -90}, {90, 90}}), Line(origin = {10, -10}, points = {{-90, -90}, {90, 90}})}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a heat exchanger that is combined with a heat pump. It is used in substation models of cold district heating networks where heat pumps are used to increase the temperatuer of the heat carrier. </p>
<h4><span style=\"color: #008c48\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in the CodingConventions)</p>
<ul>
<li>no pressure losses considered</li>
<li>static mass balance</li>
<li>constant fluid properties</li>
<li>dynamic energy balance</li>
<li>heat transport based on Q_flow_nom and a delta_T_nom</li>
</ul>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>inlet: A fluid inlet for the inflowing heat carrier medium</p>
<p>outlet: A fluid outlet for the outflowing heat carrier medium</p>
<p>heatPortS: A heat port for transporting the heat from the heat carrier to the building</p>
<p>heatPortR: A heat port for transfering the return temperature of the dwelling heat system to the heat exchanger, no heat is transfered</p>
<h4><span style=\"color: #008c48\">Governing Equations</span></h4>
<p>Mass balance: m_in+m_out=0</p>
<p>Energy balance: V*rho*dh/dt=m_in*h_in+m_out*h_in-Q_flow_DHN</p>
<p>P_el=Q_flow_House/COP</p>
<p>COP&nbsp;=&nbsp;eta_carnot&nbsp;*&nbsp;eta_pl&nbsp;*&nbsp;(T_m_house&nbsp;+&nbsp;delta_T_HP)&nbsp;/&nbsp;(T_m_house&nbsp;-&nbsp;T_m_DHN&nbsp;+&nbsp;2&nbsp;*&nbsp;delta_T_HP)</p>
<p>Q_flow_House=Q_flow_DHN+P_el</p>
<p>Heat transport: Q_flow_house&nbsp;=&nbsp;Q_flow_nom_house&nbsp;*(T_house_supply&nbsp;-&nbsp;T_house_return)&nbsp;/&nbsp;delta_T_house_nom</p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model was used to create a substation for cold district heating networks</p>
<p>TransiEnt.Consumer.Heat.Consumer_LowTemperatureDHN</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) January 2025</p>
</html>"));
end HeatPump_LowTemperatureDHN;
