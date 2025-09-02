within TransiEnt.Components.Heat.VolumesValvesFittings.Pipes;
model ControlVolumeL4_HeatLoss "Discretized control volume of a district heating network pipe"

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

  import      Modelica.Units.SI;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter Real L = l/A "Momentum factor for a straight pipe";
  parameter SI.Length l = 10 "Length of the pipe";
  parameter SI.Length d = 0.3 "Inner diameter of the pipe";
  final parameter SI.Area A = Modelica.Constants.pi*(d/2)^2 "Cross sectional area of the pipe";
  final parameter SI.Area A_s=2*Modelica.Constants.pi*(d/2)*l;
  final parameter SI.Volume V_pipe = l*A "Volume of the pipe";
  parameter SI.Density rho = 1000 "Density of the water";
  parameter Real delta_p_nom=100 "Nominal pressure drop at a nominal mass flow rate";
  parameter SI.MassFlowRate m_flow_nom=100 "Nominal mass flow rate";
  parameter Real k = 0.02 "Rouhgness factor for the surface";
  parameter SI.SpecificHeatCapacity cp=4200 "Specific heat capacity of the water";
  parameter Boolean MassFlowState=true;
  parameter Integer N_cv=30;
  parameter Real u=0.15 "heat loss factor in watt per meter kelvin";
  parameter SI.MassFlowRate m_flow_start=1;
  parameter SI.DynamicViscosity eta=4.66e-4;
  parameter SI.Density rho_pipe=960;
  parameter SI.SpecificHeatCapacity c_pipe=1900;
  parameter SI.Length wall_thickness=0.0026;
  parameter SI.Volume V_pipe_wall=Modelica.Constants.pi*(((d+2*wall_thickness)/2)^2-(d/2)^2)*l;
  parameter SI.Volume V_pipe_w=(V_pipe_wall*c_pipe)/cp;

  // _____________________________________________
  //
  //             Variables
  // _____________________________________________

  SI.MassFlowRate m_flow(start = m_flow_start);
  SI.Temperature T_in;
  SI.Velocity v;
  SI.Temperature T_out;
  SI.SpecificEnthalpy h[N_cv](each start = 4200*60);
  SI.Temperature T[N_cv];

  // _____________________________________________
  //
  //         Interfaces
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
  Modelica.Fluid.Dissipation.PressureLoss.StraightPipe.dp_overall_IN_con inCon(d_hyd = d, L = l, roughness = Modelica.Fluid.Dissipation.Utilities.Types.Roughness.Considered, K = k) annotation (
    Placement(transformation(extent = {{-30, -66}, {-10, -46}})));
  Modelica.Fluid.Dissipation.PressureLoss.StraightPipe.dp_overall_IN_var inVar(rho = rho, eta=eta)    annotation (
    Placement(transformation(extent = {{10, -66}, {30, -46}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{-10,-10},{10,10}},
      rotation=90,
      origin={0,100})));

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort[N_cv] annotation (Placement(transformation(extent={{30,90},{50,110}})));
equation

  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

  //Momentum balance, a mass flow state can be activated to improve the numerics of large models
    if MassFlowState then
  inlet.p - outlet.p =L*der(m_flow)+Modelica.Fluid.Dissipation.PressureLoss.StraightPipe.dp_overall_DP(inCon, inVar, m_flow);//m_flow* delta_p_nom*l / m_flow_nom;// Modelica.Fluid.Dissipation.PressureLoss.StraightPipe.dp_overall_DP(inCon, inVar, m_flow);////
  else
    inlet.p - outlet.p =Modelica.Fluid.Dissipation.PressureLoss.StraightPipe.dp_overall_DP(inCon, inVar, m_flow);//m_flow * delta_p_nom*l / m_flow_nom;// Modelica.Fluid.Dissipation.PressureLoss.StraightPipe.dp_overall_DP(inCon, inVar, m_flow);//
  end if;
  //Energy balance for N_cv control volumes
  (V_pipe+V_pipe_w)/N_cv*rho*der(h[1]) =abs(semiLinear(
    inlet.m_flow,
    inStream(inlet.h_outflow),
    h[2])) - abs(outlet.m_flow*h[1]) + heatPort[1].Q_flow;                                                                                 //inlet.m_flow*actualStream(inlet.h) + outlet.m_flow*h[1]+heatPort[1].Q_flow;
  for i in 2:N_cv-1 loop
  (V_pipe+V_pipe_w)/N_cv*rho*der(h[i]) = abs(semiLinear(inlet.m_flow,h[i-1],h[i+1]))-abs(outlet.m_flow*h[i])+heatPort[i].Q_flow;// inlet.m_flow*h[i-1] + outlet.m_flow*h[i]+heatPort[i].Q_flow;//
  end for;
  (V_pipe+V_pipe_w)/N_cv*rho*der(h[N_cv]) =abs(semiLinear(
    inlet.m_flow,
    h[N_cv - 1],
    inStream(outlet.h_outflow))) - abs(outlet.m_flow*h[N_cv]) + heatPort[N_cv].Q_flow;                                                                  //inlet.m_flow*h[N_cv-1] + outlet.m_flow*actualStream(outlet.h)+heatPort[N_cv].Q_flow;

  //Connectors
  h[1] =inlet.h_outflow;
  h[N_cv] =outlet.h_outflow;

  //Mass balance
  0 = inlet.m_flow + outlet.m_flow;
  inlet.m_flow = m_flow;
  inStream(inlet.h_outflow)/cp + 273.15 = T_in;
  outlet.h_outflow/cp + 273.15 = T_out;
  y=m_flow;
  v=inlet.m_flow/(Modelica.Constants.pi*(d/2)^2*rho);

 //Calculation of temperatures
 for i in 1:N_cv loop
 T[i]=h[i]/cp+273.15;
 end for;

 //HeatPorts for every control volume
 for i in 1:N_cv loop
 heatPort[i].Q_flow=-u*l/N_cv*(T[i]-heatPort[i].T);
 end for;
  annotation (
    Icon(graphics={  Rectangle(origin = {0, 9}, fillColor = {85, 85, 127}, fillPattern = FillPattern.Solid, extent = {{-100, 31}, {100, -49}})}, coordinateSystem(initialScale = 0.1)), Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model</span></h4>
<p>A simple model of a discretized control volume. The number of control volumes can be set with a parameter. It consists of two fluid ports and one heat port per control volume. It is based on the three balance equations of energy, mass and momentum. There is one dynamic energy balance per control volume. The heat capacity of the pipe wall is considered. The mass balance is static. The momentum balance is static, but mass flow states can be activated to improve the numerics of large-scale simulations. Further explanations can be found in Westphal et. al. Constant fluid properties are assumed for this control volume. Pressure losses due to friction are considered and calculated with a model of the fluid dissipation library (Darcy-Weisbach equation). Heat losses are considered with a heat loss per meter depending on the temperature difference. </p>
<p>The control volume is discretized with an upwind scheme. For the implementation of the occuring case distinction the semiLinear operator is used. </p>
<p>This control volume is used in pipe models for district heating networks. It considers the thermal inertia of the pipe as well as heat and pressure losses.</p>
<h4><span style=\"color: #008c48\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L4 (defined in the CodingConventions)</p>
<ul>
<li>static mass balance</li>
<li>constant fluid properties</li>
<li>dynamic and discretized energy balances</li>
<li>consideration of pressure losses due to friction</li>
<li>consideration of heat losses</li>
<li>reverse flow is supported</li>
</ul>
<h4><span style=\"color: #008c48\">Interfaces</span></h4>
<h4><span style=\"color: #008c48\">Governing Equations</span></h4>
<p>Mass balance: m_in+m_out=0</p>
<p>Energy balance: (V_pipe+V_pipe_w)/N_cv*rho*der(u)&nbsp;=m_flow*(h_in-h_out)&nbsp;+&nbsp;Q_flow_loss (for N_cv control volumes)</p>
<p>Heat transport: <span style=\"font-family: Courier New;\">&nbsp;</span>Q_flow=-u*l/N_cv*(T[i]-heatPort[i].T) for N_cv control volumes</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was used in several publications:</p>
<p>[1] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<p>[2]Vieth, J.; Westphal, J.; Speerforck, A.; District heating network topology optimization and optimal co-planning using dynamic simulations; Advances in Applied Energy; 2025</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end ControlVolumeL4_HeatLoss;
