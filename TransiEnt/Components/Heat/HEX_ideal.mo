within TransiEnt.Components.Heat;
model HEX_ideal "Ideal static heat exchanger model"




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
  //          Imports and Class Hierarchy
  // _____________________________________________

  outer TransiEnt.SimCenter simCenter;
  extends TransiEnt.Basics.Icons.Heat_Exchanger;


  // _____________________________________________
  //
  //                   Parameters
  // _____________________________________________

  parameter TILMedia.VLEFluidTypes.BaseVLEFluid water=simCenter.fluid1 "Heat carrier"
                   annotation (Dialog(group="Medium Definitions"));
  parameter Modelica.Units.SI.PressureDifference Delta_p=1e4 "Constant Pressure loss (positive value means loss)";

  // _____________________________________________
  //
  //                   Variables
  // _____________________________________________

  Modelica.Units.SI.TemperatureDifference dT "Temperature difference of heating carrier";
  Modelica.Units.SI.SpecificEnthalpy h_inflow=inStream(waterPortIn.h_outflow);
  Modelica.Units.SI.EnthalpyFlowRate dH_flow_carrier "Enthalpy change of heat carrier";

  // _____________________________________________
  //
  //                   Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut waterPortOut(Medium=water) annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn waterPortIn(Medium=water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,0})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatport annotation (Placement(transformation(extent={{-10,88},{10,108}}), iconTransformation(extent={{-10,88},{10,108}})));

  // _____________________________________________
  //
  //                   Complex Components
  // _____________________________________________

  TILMedia.Internals.VLEFluidConfigurations.FullyMixtureCompatible.VLEFluid_ph fluidIn(
    p=waterPortIn.p,
    h=inStream(waterPortIn.h_outflow),
    xi=inStream(waterPortIn.xi_outflow),
    vleFluidType=water) annotation (Placement(transformation(extent={{-84,8},{-64,-12}})));
  TILMedia.Internals.VLEFluidConfigurations.FullyMixtureCompatible.VLEFluid_ph fluidOut(
    p=waterPortIn.p,
    h=waterPortOut.h_outflow,
    xi=waterPortOut.xi_outflow,
    vleFluidType=water) annotation (Placement(transformation(extent={{66,8},{86,-12}})));

equation
  // _____________________________________________
  //
  //            Characteristic equations
  // _____________________________________________

  //Mass balance
  waterPortIn.m_flow + waterPortOut.m_flow = 0;
  inStream(waterPortIn.xi_outflow) = waterPortOut.xi_outflow;
  inStream(waterPortOut.xi_outflow) = waterPortIn.xi_outflow;

  //Momentum balance
  waterPortIn.p = waterPortOut.p+Delta_p;

  //Energy balance
  heatport.Q_flow + waterPortIn.m_flow*inStream(waterPortIn.h_outflow) + waterPortOut.m_flow*waterPortOut.h_outflow = 0;
  heatport.Q_flow + waterPortOut.m_flow*inStream(waterPortOut.h_outflow) + waterPortIn.m_flow*waterPortIn.h_outflow = 0;
  heatport.T = 273.15 "Dummy! No heat capacity!";

  dH_flow_carrier = waterPortIn.m_flow*(waterPortOut.h_outflow - inStream(waterPortIn.h_outflow));
  dT = fluidOut.T - fluidIn.T;

  // _____________________________________________
  //
  //            Connect statements
  // _____________________________________________


  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}), graphics={
        Polygon(
          points={{110,102},{110,102}},
          lineColor={0,134,171},
          pattern=LinePattern.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p><b><span style=\"color: #008000;\">Purpose of model</span></b> </p>
<p><span style=\"font-family: Calibri; font-size: 11pt;\">An ideal heat exchanger with two fluid ports and a heat port. The fluid ports can be connected with a hydraulic circuit to simulate a heat carrier medium. The transferred heat is transported through the heat port. For correct use of the model the heat port needs to be connected with another heat port that sets a heat flow rate. A static mass balance is assumed. A static energy balance is assumed taking the enthalpy flows of the heat carrier medium and the transported heat flow rate into account. The temperatures at the inlet and the outlet of the heat exchanger are calculated with fluid models of the TIL media that need the specific enthalpy and the pressure. A constant pressure loss is assumed in the model.</span></p>
<p><b><span style=\"color: #008000;\">Level of detail, physical effects considered, and physical insight</span></b> </p>
<p>A given heat <i>Q</i><sub>flow,in</sub> is ideally transferred to a medium (water) flow. </p>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>Only applicable for heat transfer from heatport to medium. </p>
<p><b><span style=\"color: #008000;\">Interfaces</span></b> </p>
<p>waterPortIn/Out - ports for heat carrier (water) </p>
<p>heatport - heat inpout port </p>
<p><b><span style=\"color: #008000;\">Governing Equations</span></b> </p>
<p>The heat is balanced by a static equation: </p>
<p><i>Q</i><sub>flow,in</sub> + <i>m</i><sub>flow</sub>(<i>h</i><sub>water,in</sub> - <i>h</i><sub>water,out</sub>) = 0</p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-bSeFHWCT.png\" alt=\"0=m_in+m_out\"/></p>
<p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-Fg00ORk5.png\" alt=\"p_in-p_out=delta_p\"/></p>
<p>delta_p is a constant parameter </p>
<p><b><span style=\"color: #008000;\">Remarks for Usage</span></b> </p>
<p><b><span style=\"color: #008000;\">Validation</span></b> </p>
<p>Tested and verified in check model &quot;TestHEX_ideal&quot;</p>
<p><b><span style=\"color: #008000;\">Version History</span></b> </p>
<p>Created by Paul Kernstock (paul.kernstock@tuhh.de), Jun 2015 </p>
<p>Revised by Lisa Andresen (andresen@tuhh.de), Jul 2015</p>
<p>Model documented by Jan Westphal (j.westphal@tuhh.de) in January 2025</p>
</html>"));
end HEX_ideal;
