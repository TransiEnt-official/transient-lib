within TransiEnt.Producer.Heat.Heat2Heat;
model IdealProducer_DHN "Simple model of a producer providing a constant specific enthalpy and a pressure difference and using simple fluid ports"

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
  //          Import and Hierachy
  // _____________________________________________

  import Modelica.Units.SI;
  extends TransiEnt.Basics.Icons.HeatSource;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.SpecificHeatCapacity cw=4186 "Specific heat capacity of the water";

  // _____________________________________________
  //
  //             Variables
  // _____________________________________________

  SI.Temperature T_r;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple inlet "Inlet for the fluid (return)" annotation (Placement(
      visible=true,
      transformation(
        origin={100,-40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,-62},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple outlet "Outlet for the fluid (supply)" annotation (Placement(
      visible=true,
      transformation(
        origin={100,40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={98,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput T_s(final quantity="Temperature", final unit="K", displayUnit="degC") "Input for the supply temperature" annotation (Placement(transformation(extent={{-120,50},{-80,90}}), iconTransformation(extent={{-120,50},{-80,90}})));
  Modelica.Blocks.Interfaces.RealInput Q_flow_in(final quantity= "HeatFlowRate", final unit="W", displayUnit="W") "Input for the heat flow rate" annotation (Placement(transformation(extent={{-120,18},{-80,58}})));



equation

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  //mass balance
  0 = inlet.m_flow + outlet.m_flow;
  //fluid ports
  outlet.h_outflow = (T_s-273.15)*cw;  //Outflowing specific enthalpy
  inlet.h_outflow = inStream(outlet.h_outflow); //Reverse flow not supported
  //Calculation of the return temperature
  T_r=inStream(inlet.h_outflow)/cw+273.15;
  //Calculation of the mass flow rate
  Q_flow_in=max((outlet.h_outflow - inStream(inlet.h_outflow)),10*cw)*inlet.m_flow;

  annotation (                                                                                                                   Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A simple model of a producer. It contains two fluid ports (inlet and outlet). Moreover, two inputs are implemented. One for the set heat flow rate and one for the setsupply temperature. A static mass balance is implemented and the mass flow rate flowing through the heat generator is calculated from the heat flow rate input. The model can be used in district heating network simulations. It is normally used as a secondary heat generator in a DHN with more than one heat generator. </p>
<h4><span style=\"color: #008c48\">Interfaces:</span></h4>
<p>T_s: RealInput for the specific enthalpy that is set at the outlet of the producer (the supply of the distritict heating network)</p>
<p>Q_flow_in: RealInput for the heat flow rate that is provided by the producer</p>
<h4><span style=\"color: #008c48\">Governing Equations:</span></h4>
<p>Q_flow: Q_flow=m_in*(h_in-h_out)</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"), experiment(
      StartTime=330000,
      StopTime=400000,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end IdealProducer_DHN;
