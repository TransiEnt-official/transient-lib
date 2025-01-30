within TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection;
model HeatTransferInsideReactor "Model calculating the heat transfered between fluid and vessel walls"





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
  //        Constants and Hidden Parameters
  // _____________________________________________

  final parameter Modelica.Units.SI.Area A=Modelica.Constants.pi*(D^2/4 + D*height) "Area through which heat is transported by Convection";

  // _____________________________________________
  //
  //              Visible Parameters
  // _____________________________________________

  parameter Modelica.Units.SI.Diameter D=1 "inner Diameter of reactor";
  parameter Modelica.Units.SI.Height height=1 "Height of fluid inside reactor";

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  outer TransiEnt.Producer.Gas.BiogasPlant.MaterialValues.SuspensionProperties_pT fluidProperties;
  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  ClaRa.Basics.Interfaces.HeatPort_a heat_solid "heat port for heat transfer between fluid and vessel walls" annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  ClaRa.Basics.Interfaces.HeatPort_b heat_fluid "heat port for heat transfer between fluid and vessel walls" annotation (Placement(transformation(extent={{-98,-10},{-78,10}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  TILMedia.Internals.VLEFluidConfigurations.FullyMixtureCompatible.VLEFluid_pT vleFluidWall(
    redeclare TILMedia.VLEFluidTypes.TILMedia_Water vleFluidType,
    T=heat_solid.T,
    computeTransportProperties=true,
    deactivateTwoPhaseRegion=true,
    p=101300) annotation (Placement(transformation(extent={{44,-10},{64,10}})));

  Modelica.Units.SI.NusseltNumber Nu=TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection.NusseltInsideCSTR(
      Re=Re,
      Pr=fluidProperties.Pr,
      eta=fluidProperties.eta,
      eta_w=eta_w,
      C1=C1) "Nusselt Number ";

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  input Modelica.Units.SI.ReynoldsNumber Re "Reynolds number" annotation (Dialog(group="Variables"));
  input Real C1 "geometrical Coefficient in Nusselt-Equation" annotation (Dialog(group="Variables"));

  Modelica.Units.SI.HeatFlowRate Q_flow "Heat flow rate from solid -> fluid";
  Modelica.Units.SI.TemperatureDifference dT "= solid.T - fluid.T";

  Modelica.Units.SI.CoefficientOfHeatTransfer alpha=Nu*fluidProperties.lambda/D "heat transfer coefficient of convection";

  Modelica.Units.SI.DynamicViscosity eta_w "Dynamic Viscosity of fluid at wall temperature";

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

equation
  dT = heat_solid.T - heat_fluid.T;
  heat_solid.Q_flow = Q_flow;
  heat_fluid.Q_flow = -Q_flow;
  Q_flow = A*alpha*dT;

  eta_w = fluidProperties.eta;
  //no temperature influence on viscosity implemented
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{80,80},{100,-80}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Backward),
        Line(points={{-76,20},{76,20}}, color={191,0,0}),
        Line(points={{-56,10},{-76,20}}, color={191,0,0}),
        Line(points={{-56,30},{-76,20}}, color={191,0,0}),
        Line(points={{-56,-10},{-76,-20}}, color={191,0,0}),
        Line(points={{-76,-20},{76,-20}}, color={191,0,0}),
        Line(points={{-56,-30},{-76,-20}}, color={191,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Model calculates Heat Transfer Rate due forced convection in liquid phase of reactor.</p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p>HeatPort_a: heat_solid</p>
<p>HeatPort_b: heat_fluid</p>
<h4><span style=\"color: #008000\">Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td><h4>Variable</h4></td>
<td><h4>Variable name</h4></td>
</tr>
<tr>
<td><p>Nu</p></td>
<td><p>Nusselt Number calculated in <a href=\"TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection.NusseltInsideCSTR\">NusseltInsideCSTR</a></p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-Y1ehLinm.png\" alt=\"A\"/></p></td>
<td><p>Area</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-wHToNPO9.png\" alt=\"alpha\"/></p></td>
<td><p>Heat transfer coefficient</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-ojPR5TkZ.png\" alt=\"T_s\"/></p></td>
<td><p>Temperature of solid</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-gXf2sZzK.png\" alt=\"T_l\"/></p></td>
<td><p>Temperature of liquid</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-0Af8BCJS.png\" alt=\"lambda\"/></p></td>
<td><p>Thermal conductivity</p></td>
</tr>
<tr>
<td><p><img src=\"modelica://TransiEnt/Resources/Images/equations/equation-QGVOhJZS.png\" alt=\"l\"/></p></td>
<td><p>Characteristic length (here: inner diameter of reactor)</p></td>
</tr>
</table>
<p><br><br><br><br><b><span style=\"color: #008000;\">Governing Equations</span></b></p>
<p><img src=\"modelica://TransiEnt/Images/equations/HeatTransferRate-Convection.png\"/></p>
<p><img src=\"modelica://TransiEnt/Images/equations/HeatTransferCoefficient_NusseltRelation.png\"/></p>
<p>Nusselt equation is calculated in function <a href=\"TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection.NusseltInsideCSTR\">NusseltInsideCSTR</a></p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>[1] Kim, Y., &amp; Parker, W. (2008). A technical and economic evaluation of the pyrolysis of sewage sludge for the production of bio-oil. Bioresource technology, 99(5), 1409-1416.</p>
<p>[2] Vesilind, P. A., &amp; Martel, C. J. (1989). Thermal conductivity of sludges. Water research, 23(2), 241-245.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model created by Philipp Jahneke (philipp.koziol@tuhh.de), August 2018</p>
<p>Changed documentation by Markus Gillner (markus.gillner@tuhh.de) in Jan 2025</p>
</html>"));
end HeatTransferInsideReactor;
