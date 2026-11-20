within TransiEnt.Producer.Heat.Power2Heat.ElectricBoiler;
model ElectricBoiler_Simple "Simple model of an electric boiler only considering a constant efficiency"

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
// Gas- und WÃ¤rme-Institut Essen                                                  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//


  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  import         Modelica.Units.SI;

  // _____________________________________________
  //
  //                Parameters
  // _____________________________________________

  parameter Real eta_EB=0.98 "Efficiency of the power to heat unit";

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  SI.HeatFlowRate Q_flow;
  SI.SpecificEnthalpy h_inlet;
  SI.Power P_el;


  // _____________________________________________
  //
  //                Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple inlet "Inlet for the fluid" annotation (Placement(
      visible=true,
      transformation(
        origin={100,-40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,-62},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple outlet "Outlet for the fluid" annotation (Placement(
      visible=true,
      transformation(
        origin={100,40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={98,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput h_in "Specific enthalpy of the fluid set by the heat generator" annotation (Placement(transformation(extent={{-100,-20},{-60,20}}), iconTransformation(extent={{-100,-20},{-60,20}})));
equation
  //Static mass balance
  0 = inlet.m_flow + outlet.m_flow;
  //Definition of the specific enthalpy
  h_inlet=inStream(inlet.h_outflow);
  //No pressure drop
  inlet.p = outlet.p;
  //Calculation of the heat flow rate, No cooling allowed
  Q_flow=max(0,inlet.m_flow*(h_in - inStream(inlet.h_outflow)));
  //Calculation of the outlet
  outlet.h_outflow=inStream(inlet.h_outflow)+Q_flow/inlet.m_flow;
  //Calculation of the specifici enthalpy of the inlet, reverse flow not supported
  inlet.h_outflow = inStream(outlet.h_outflow) "Dummy value (not needed in simulation)";
  //Calculation of the electric power
  P_el=Q_flow/eta_EB;

  annotation (
    Icon(graphics={  Rectangle(fillColor = {85, 85, 0}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}), Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Purpose of model</span></b></p>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">A simple model of an electric boiler. It sets a specific enthalpy for the outflowing fluid and calculates the generated heat flow. It contains two fluid ports for the heat carrier and the main input is the specific enthalpy that shall be set. The electric power is calculated from the heat flow with a constant efficiency factor. </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">h_in: Input for the specific enthalpy that is set at the outlet of this electric boiler</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model was created by Jan Westphal (j.westphal@tuhh.de) November 2026</span></p>
</html>"));
end ElectricBoiler_Simple;
