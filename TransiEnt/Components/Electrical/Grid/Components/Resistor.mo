within TransiEnt.Components.Electrical.Grid.Components;
model Resistor "Modell for a specific Resistor. Resistance will be calculated from length and specific resistance"




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
// Gas- und Wärme-Institut Essen                                                  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//





  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends Base.PartialSpecificElement2Pin;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

protected
  final parameter SI.Resistance R = r * l "Restistance of SpecificResistor";

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

public
  parameter TransiEnt.Basics.Units.SpecificResistance r=1 "specific Resistance";
  parameter Boolean electricOutput=false "Creates Outputs for loss active power and phase current" annotation (choices(__Dymola_checkBox=true));

  // Thermal
  parameter Boolean thermalEffect=false "if thermal effects shall be taken into consideration by means of linear resistance expansion" annotation (Dialog(group="Thermal Properties"), choices(__Dymola_checkBox=true));
  parameter Boolean useHeatPort = false "if heatport should be used" annotation (Dialog(enable=thermalEffect, group="Thermal Properties"), choices(__Dymola_checkBox=true));
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha = 0 "linear specific Resistance" annotation (Dialog(enable=thermalEffect, group="Thermal Properties"));
  parameter Modelica.Units.SI.Temperature T_ref=293.15 "linear specific Resistance" annotation (Dialog(enable=thermalEffect, group="Thermal Properties"));
  parameter Modelica.Units.SI.Temperature T = T_ref "Actual Temperature" annotation (Dialog(enable=thermalEffect and not useHeatPort, group="Thermal Properties"));

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________
  Modelica.Blocks.Interfaces.RealInput T_in if useHeatPort annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90,      origin={0,-104}), iconTransformation(      extent={{-10,-10},{10,10}},       rotation=90,       origin={0,-30})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_loss  if electricOutput "Power Lost" annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=90, origin={0,104})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricCurrentOut I_str if electricOutput "1-Phase Current or one of the three phase currents in 3-Phase" annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={40,104})));
  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  //public
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_loss_internal;
  TransiEnt.Basics.Interfaces.Electrical.ElectricCurrentOut I_str_internal;
  Modelica.Blocks.Interfaces.RealOutput T_internal(start=0) "Temperature";
  Modelica.Units.SI.Resistance R_actual;

  //protected

  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

equation

    if not useHeatPort then
      T_internal = T;
    end if;

    //assert((1 + alpha*(T_internal - T_ref)) >= Modelica.Constants.eps, "Temperature outside scope of model!");
    R_actual = R * (1 + alpha * (T_internal - T_ref));
    Z.re = R_actual;
    Z.im = 0;
    P_loss_internal = S_lost.re;
    I_str_internal = Modelica.ComplexMath.abs(I);
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(P_loss, P_loss_internal);
  connect(I_str, I_str_internal);
  connect(T_in, T_internal);

  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100,-100},{100,100}}), graphics={  Line(points = {{-100,0},{100,0}}, color = {0,0,0}, smooth = Smooth.None),Rectangle(extent = {{-60,32},{60,-30}}, lineColor = {0,0,255}, fillColor = {255,255,255},
            fillPattern =                                                                                                   FillPattern.Solid),Text(extent = {{-62,88},{58,50}}, lineColor = {0,0,0}, fillColor = {255,255,255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "r=%r
l=%l"),Text(extent = {{-62,-36},{56,-74}}, lineColor = {0,0,0}, fillColor = {255,255,255},
            fillPattern =                                                                                FillPattern.Solid)}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Partial model of a specific resistor using TransiEnt complex single phase interface (L2). Two pin version.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">apparent power port epp_p</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">apparent power port epp_n</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pattrick Göttsch and revised by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Adjusted from three phase to single phase by Rebekka Denninger (rebekka.denninger@tuhh.de) on 01.03.2016</span></p>
</html>"));
end Resistor;
