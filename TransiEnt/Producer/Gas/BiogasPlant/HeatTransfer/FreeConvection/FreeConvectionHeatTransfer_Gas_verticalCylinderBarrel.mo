within TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.FreeConvection;
model FreeConvectionHeatTransfer_Gas_verticalCylinderBarrel "Heat transfer due to natural convection for a vertical cylinder barrel"





//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.2                             //
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
// Gas- und Wärme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//






  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends FreeConvectionHeatTransfer_Gas(L=Height, A=Modelica.Constants.pi*d*Height);

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter Modelica.Units.SI.Height Height;
  parameter Modelica.Units.SI.Diameter d;

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

equation
  Nu = TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.FreeConvection.NusseltFreeConvection_verticalSurface(Ra=abs(Ra), Pr=Pr) + 0.435*Height/d;
  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>This model contains the equation for calculating the nusselt number of a vertical area of a cylinder barrel. It extends from FreeConvectionHeatTransfer_Gas.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>Look at function <a href=\"TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.FreeConvection.FreeConvectionHeatTransfer_Gas_verticalCylinderBarrel\">NusseltFreeConvection_verticalSurface</a></p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model created by Philipp Jahneke (philipp.koziol@tuhh.de), August 2018</p>
</html>"));
end FreeConvectionHeatTransfer_Gas_verticalCylinderBarrel;
