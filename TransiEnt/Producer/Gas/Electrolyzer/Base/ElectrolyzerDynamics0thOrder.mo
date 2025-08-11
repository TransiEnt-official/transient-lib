within TransiEnt.Producer.Gas.Electrolyzer.Base;
model ElectrolyzerDynamics0thOrder "0th order electrolyzer dynamics"



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
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//





  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Producer.Gas.Electrolyzer.Base.PartialElectrolyzerDynamics;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  // _____________________________________________
  //
  //              Visible Parameters
  // _____________________________________________

  // _____________________________________________
  //
  //              Variables
  // _____________________________________________

  // _____________________________________________
  //
  //                Interfaces
  // _____________________________________________

equation

  H_flow_H2 = if useHomotopy then homotopy(P_el * eta, P_el_n * eta_n) else P_el * eta;

  annotation (
  defaultConnectionStructurallyInconsistent=true,Diagram(graphics,
                                                         coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-80,40},{80,-40}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Line(
          points={{-78,-42},{-78,48},{82,48}},
          color={255,0,0})}),
          Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>This is a model for electrolyzer dynamics with no time delay. </p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>Hydrogen enthalpy flow and electric power are directly connected by the efficiency. There is no time delay. </p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Created by Patrick G&ouml;ttsch (patrick.goettsch@tuhh.de) in April 2014</p>
<p>Edited by Tom Lindemann (tom.lindemann@tuhh.de) in Dec 2015</p>
<p>Edited by Lisa Andresen (andresen@tuhh.de) in May 2016</p>
<p>Edited by Carsten Bode (c.bode@tuhh.de) in March 2017</p>
</html>"));
end ElectrolyzerDynamics0thOrder;
