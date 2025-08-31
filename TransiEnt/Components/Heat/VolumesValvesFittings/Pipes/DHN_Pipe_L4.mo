within TransiEnt.Components.Heat.VolumesValvesFittings.Pipes;
model DHN_Pipe_L4 "Model of a DHN pipe for efficient largescale simulations"

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

  parameter SI.Length d = 0.1 "Inner diameter of the pipe";
  parameter SI.Density rho = 983 "Density of the fluid";
  parameter Real k = 1e-3 "Surface factor of the pipe";
  parameter SI.MassFlowRate m_flow_nom = 15 "Nominal mass flow rate";
  parameter Real delta_p_nom=150 "Nominal pressure drop over the pipe";
  parameter SI.SpecificHeatCapacity cp = 4183 "Specific heat capacity of water";
  parameter SI.Length l = 10 "Length of the pipe";
  parameter Real L=100;
  parameter Boolean MassFlowState=false;
  parameter Integer N_cv=10;
  parameter Real u=0.3;//0.15
  parameter SI.MassFlowRate m_flow_start=1;
  parameter SI.Density rho_pipe=960;
  parameter SI.SpecificHeatCapacity c_pipe=1900;
  parameter SI.Length wall_thickness=0.0026;
  parameter SI.Volume V_pipe_wall=Modelica.Constants.pi*(((d+2*wall_thickness)/2)^2-(d/2)^2)*l;
  parameter Boolean useInput=false;

  // _____________________________________________
  //
  //             Variables
  // _____________________________________________

  SI.HeatFlowRate Q_flow_loss;
  SI.PressureDifference delta_p_fric;

  // _____________________________________________
  //
  //             Instances of other classes
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple inlet annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple outlet annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature UndergroundTemperature[N_cv] annotation (Placement(transformation(extent={{-68,46},{-48,66}})));
  Modelica.Blocks.Sources.RealExpression Temperature(y=10)  annotation (Placement(transformation(extent={{-102,46},{-82,66}})));

  TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.ControlVolumeL4_HeatLoss controlVolumeL4_HeatLoss(
    L=L,
    l=l,
    d=d,
    rho=rho,
    delta_p_nom=delta_p_nom,
    m_flow_nom=m_flow_nom,
    k=k,
    cp=cp,
    MassFlowState=MassFlowState,
    N_cv=N_cv,
    u=u,
    m_flow_start=m_flow_start,
    rho_pipe=rho_pipe,
    c_pipe=c_pipe,
    wall_thickness=wall_thickness) annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  Modelica.Blocks.Interfaces.RealInput soilTemp if useInput annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
equation

  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

  connect(controlVolumeL4_HeatLoss.outlet, outlet) annotation (Line(points={{12,0},{100,0}}, color={0,0,0}));
  connect(controlVolumeL4_HeatLoss.inlet, inlet) annotation (Line(points={{-8,0},{-100,0}}, color={0,0,0}));
  if useInput==false then
    for i in 1:N_cv loop
    connect(Temperature.y,UndergroundTemperature[i].T);
  end for;
  else
  for i in 1:N_cv loop
    connect(soilTemp,UndergroundTemperature[i].T);
  end for;
  end if;
  for i in 1:N_cv loop
    connect(UndergroundTemperature[i].port,controlVolumeL4_HeatLoss.heatPort[i]);
  end for;

  //Calculation of the heat losses and the pressure loss over the pipe
  Q_flow_loss=sum(UndergroundTemperature[i].port.Q_flow for i in 1:N_cv);
  delta_p_fric=inlet.p-outlet.p;//controlVolumeL4_HeatLoss.m_flow^2*controlVolumeL4_HeatLoss.delta_p_nom/controlVolumeL4_HeatLoss.m_flow_nom^2;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(origin = {0, 9}, fillColor = {85, 85, 127}, fillPattern = FillPattern.Solid, extent = {{-100, 31}, {100, -49}}), Text(
          extent={{-74,132},{68,8}},
          textColor={0,0,0},
          textString="dm_flow/dt")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info="<html>
<h4><span style=\"color: #008c48\">Purpose of model</span></h4>
<p>A simple model of a discretized pipe for district heating networks. The number of control volumes can be set with a parameter. It consists of two fluid ports and one heat port per control volume. It is based on the three balance equations of energy, mass and momentum. There is one dynamic energy balance per control volume. The heat capacity of the pipe wall is considered. The mass balance is static. The momentum balance is static, but mass flow states can be activated to improve the numerics of large-scale simulations. Further explanations can be found in Westphal et. al. Constant fluid properties are assumed for this control volume. Pressure losses due to friction are considered and calculated with a model of the fluid dissipation library (Darcy-Weisbach equation). Pressure changes due to gravity are not considered. Heat losses are considered with a heat loss per meter depending on the temperature difference. A temperature source is implemented in this model and connected to the heat ports of the control volume. The control volume is connected to two fluid ports. </p>
<p>The control volume is discretized with an upwind scheme. For the implementation of the occuring case distinction the semiLinear operator is used. A number between 100 and 1000 control volumes per kilo meter is suitable for a district heating network simulation. If a large number of states appear in the DHN simulations due to a large number of control volumes the sparse solver should be activated. In Dymola this can be for example done with the command: Advanced.Translation.SparseActivate=true. This will improve the simulation speed significantly. Also the appearance of implicit non-linear systems of equations should be avoided. </p>
<p>The physical effects described are implemented in the control volume model used in this component.</p>
<h4><span style=\"color: #008c48\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>L2 (defined in the CodingConventions)</p>
<ul>
<li>static mass balance</li>
<li>constant fluid properties</li>
<li>dynamic and discretized energy balances</li>
<li>consideration of pressure losses due to friction but not pressure differences due to gravity</li>
<li>consideration of heat losses</li>
<li>reverse flow is supported</li>
</ul>
<h4><span style=\"color: #008c48\">Interfaces</span></h4>
<h4><span style=\"color: #008c48\">Governing Equations</span></h4>
<p>Mass balance: m_in+m_out=0</p>
<p>Energy balance: (V_pipe+V_pipe_w)/N_cv*rho*der(u) =m_flow*(h_in-h_out) + Q_flow_loss (for N_cv control volumes)</p>
<p>Heat transport: <span style=\"font-family: Courier New;\">&nbsp;</span>Q_flow=-u*l/N_cv*(T[i]-heatPort[i].T) for N_cv control volumes</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was used in several publications:</p>
<p>[1] Westphal, J.; Brunnemann, J.; Speerforck, A.; Enabling the dynamic simulation of an unaggregated, meshed district heating network with several thousand substations;Energy; 2025</p>
<p>[2]Vieth, J.; Westphal, J.; Speerforck, A.; District heating network topology optimization and optimal co-planning using dynamic simulations; Advances in Applied Energy; 2025</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end DHN_Pipe_L4;
