within TransiEnt.Basics.Adapters;
model FluidPortAdapter "An adapter to connect the two kind of fluid ports of the TransiEnt to each other"
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
  //          Visible Parameters
  // _____________________________________________

    parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium=simCenter.fluid1 "Medium to be used";

  // _____________________________________________
  //
  //          Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple fluidPortIn annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut fluidPortOut(Medium=medium) annotation (Placement(transformation(extent={{90,-10},{110,10}})));

  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{64,64},{84,84}})));
equation
  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________

  fluidPortIn.p=fluidPortOut.p;
  fluidPortIn.h_outflow=inStream(fluidPortOut.h_outflow);
  fluidPortOut.h_outflow=inStream(fluidPortIn.h_outflow);
  fluidPortIn.m_flow+fluidPortOut.m_flow=0;
  fluidPortOut.xi_outflow=medium.xi_default;

  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{0,-100}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid), Rectangle(
          extent={{0,100},{100,-100}},
          lineColor={238,46,47},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A fluid adapter that is used to connect the two kinds of fluid ports used in the TransiEnt Library. It is a purely technical component without physical modeling. A fluid parameter is defined to define the mass fraction for the fluid outlet.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>fluidPortIn: fluid port without mass fraction</p>
<p>fluidPortOut: fluid port with mass fraction</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end FluidPortAdapter;
