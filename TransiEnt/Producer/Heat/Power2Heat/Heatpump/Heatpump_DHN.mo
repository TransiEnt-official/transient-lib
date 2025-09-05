within TransiEnt.Producer.Heat.Power2Heat.Heatpump;
model Heatpump_DHN "Simple model of a heat pump for a district heating network with simple fluid ports"

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

  //parameter SI.Temperature T_set=273.15+60;
  parameter SI.Temperature Delta_T_internal=5;
  parameter SI.Temperature T_source_internal=273.15+20;
  parameter Real COP_n=3;
  final parameter Real eta_HP=COP_n/((273.15 + 40)/(40 - 2));
  parameter SI.ActivePower P_el_max=3.3e3;
  parameter SI.ActivePower P_el_min=1e3;
  parameter Real eta_hydraulic_pump=0.9;
  parameter SI.Density rho=981;

  // _____________________________________________
  //
  //             Variables
  // _____________________________________________

  SI.ActivePower P_el;
  SI.ActivePower P_pump;
  Real W;
  Real COP_Carnot;
  Real COP;
  Real COP_Real;
  SI.HeatFlowRate Q_flow;

  // _____________________________________________
  //
  //           Instances of other classes
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple inlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,-40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,-62},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={98,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Q_flow_set annotation (Placement(transformation(extent={{-100,-20},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
  Modelica.Blocks.Interfaces.RealInput dp annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=P_el) annotation (Placement(transformation(extent={{-32,-2},{-12,18}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=P_el_max, uMin=P_el_min) annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
  Modelica.Blocks.Interfaces.RealInput T_set_variable annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-40,100})));
equation

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  der(W)=P_el;
  P_el=Q_flow_set/COP;
  P_pump=((inlet.m_flow/rho)*dp)/eta_hydraulic_pump;
  limiter.y*COP=Q_flow;
  COP_Real=inlet.m_flow*(inStream(inlet.h_outflow) - outlet.h_outflow)/limiter.y;
  COP=eta_HP*COP_Carnot;
  COP_Carnot=(T_set_variable +273.15+ Delta_T_internal)/max(2*Delta_T_internal, T_set_variable +273.15+ 2*Delta_T_internal - T_source_internal);
  0 = inlet.m_flow + outlet.m_flow;
  outlet.h_outflow = inStream(inlet.h_outflow) + Q_flow/inlet.m_flow;
  inlet.p + dp = outlet.p;
  inlet.h_outflow = -1 "Reverse flow not supported";
  connect(limiter.u, realExpression1.y) annotation (Line(points={{-6,8},{-11,8}}, color={0,0,127}));
  annotation (                                                                                                                   Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A simple model of a heat pump. A pump for the circulation of the district heating network heat carrier is included. The model calculates the electric power of the heat pump from a given heat flow rate and a coefficient of performance. The COP is calculated based on the Carnot COP and a constant efficiency factor (parameter). The Carnot COP depends on the supply temperature, that is given by an input and the temperature of the heat source. The pressure difference set by the circulation pump of the hydraulic grid is set with an input. An electric power consumed by the circulation pump is calculated. </p>
<h4><span style=\"color: #008c48\">Level of detail, physical effects considered, and physical insight</span></h4>
<ul>
<li>variable COP dependent on the supply temperature of the DHN and the source temperature</li>
<li>constant efficiency factor for the COP calculation from the Carnot COP</li>
<li>the electric power and therefore, the heat flow that can be produced is limited by a parameter</li>
<li>a static mass balance is assumed</li>
</ul>
<h4><span style=\"color: #008c48\">Interfaces:</span></h4>
<p>Q_flow_set: the heat flow that needs to be provided by the heat pump</p>
<p>T_set_variable: The temperature of the heat source</p>
<p>dp: The pressure difference that has to be provided by the pump inside the producer</p>
<h4><span style=\"color: #008c48\">Governing Equations:</span></h4>
<p>COP_Carnot=(T_set_variable +273.15+ Delta_T_internal)/(T_set_variable +273.15+ 2*Delta_T_internal - T_source_internal)</p>
<p>COP=eta_HP*COP_Carnot</p>
<p>P_el=Q_flow_set/COP;</p>
<p>Mass balance: m_in+m_out=0</p>
<h4><span style=\"color: #008c48\">Remarks for usage:</span></h4>
<p>Reverse flow is not supported</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"), Icon(graphics={         Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Rectangle(
          extent={{-38,40},{42,-48}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-48,8},{-44,8},{-30,8},{-38,-4},{-30,-14},{-48,-14},{-38,-4},{-48,8}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-18,48},{20,32}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-16,-40},{22,-56}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{30,10},{56,-14}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{34,-10},{42,10},{52,-10}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-20,22},{-20,-24},{28,-24}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-20,-22},{-16,-14},{-4,4},{-2,6},{6,12},{16,16},{24,16}},
          color={0,0,255},
          smooth=Smooth.None)}));
end Heatpump_DHN;
