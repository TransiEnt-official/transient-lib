within TransiEnt.Producer.Heat.Heat2Heat;
model IdealProducer_DHN "Simple model of a producer providing a constant specific enthalpy and a pressure difference and using simple fluid ports"

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
  extends TransiEnt.Basics.Icons.HeatSource;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.SpecificEnthalpy h_soll = 60 * 4200 "Outgoing specific enthalpy (unused)";
  parameter SI.PressureDifference dp = 0.2e5 "Pressure difference provided by producer";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________
  SI.HeatFlowRate Q_flow;
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
  Modelica.Blocks.Interfaces.RealInput h_in annotation (Placement(transformation(extent={{-100,38},{-60,78}}),  iconTransformation(extent={{-100,38},{-60,78}})));
equation

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  0 = inlet.m_flow + outlet.m_flow;
  outlet.h_outflow = h_in;
  inlet.p + dp = outlet.p;
  Q_flow=(outlet.h_outflow - inStream(inlet.h_outflow))*inlet.m_flow;
  inlet.h_outflow = -1 "Reverse flow not supported";
  annotation (                                                                                                                   Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A simple model of a producer. It contains two fluid ports (inlet and outlet). A static mass balance is implemented and a constant pressure difference is set. The model can be used in district heating network simulations.</p>
<h4><span style=\"color: #008c48\">Interfaces:</span></h4>
<p>h_in: RealInput for the specific enthalpy that is set at the outlet of the producer (the supply of the distritict heating network)</p>
<h4><span style=\"color: #008c48\">Governing Equations:</span></h4>
<p>Q_flow: Q_flow=m_in*(h_in-h_out)</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end IdealProducer_DHN;
