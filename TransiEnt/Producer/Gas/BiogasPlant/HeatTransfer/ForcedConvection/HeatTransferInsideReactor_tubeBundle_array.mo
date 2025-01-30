within TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection;
model HeatTransferInsideReactor_tubeBundle_array "Model calculating the heat transfered between fluid and heating system"





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

  final parameter Modelica.Units.SI.Area A=Modelica.Constants.pi*d*l "Area through which heat is transported by Convection";

  // _____________________________________________
  //
  //              Visible Parameters
  // _____________________________________________

  parameter Modelica.Units.SI.Diameter D=1 "inner Diameter of reactor";
  parameter Modelica.Units.SI.Diameter d=0.1 "tube diameter";
  parameter Modelica.Units.SI.Length l=Modelica.Constants.pi*(D - d);
  parameter Real n = 8 "number of turns of tube";
  parameter Integer N_cv = 8 "Number of control volumes";

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

  ClaRa.Basics.Interfaces.HeatPort_a heat_solid[N_cv] annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  ClaRa.Basics.Interfaces.HeatPort_b heat_fluid annotation (Placement(transformation(extent={{-98,-10},{-78,10}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  TILMedia.Internals.VLEFluidConfigurations.FullyMixtureCompatible.VLEFluid_pT vleFluidWall(
    T=sum(heat_solid.T)/N_cv,
    computeTransportProperties=true,
    deactivateTwoPhaseRegion=true,
    redeclare TILMedia.VLEFluidTypes.TILMedia_InterpolatedWater vleFluidType,
    p=101300) annotation (Placement(transformation(extent={{44,-10},{64,10}})));

  Modelica.Units.SI.NusseltNumber Nu=TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection.NusseltCSTR_Coil(
      Re=Re,
      Pr=fluidProperties.Pr,
      eta=fluidProperties.eta,
      eta_w=eta_w,
      C2=C2,
      D=D,
      d=d) "Nusselt Number ";

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  input Modelica.Units.SI.ReynoldsNumber Re annotation (Dialog(group="Variables"));
  input Real C2 annotation(Dialog(group="Variables"));

  Modelica.Units.SI.HeatFlowRate Q_flow[N_cv] "Heat flow rate from solid -> fluid";
  Modelica.Units.SI.TemperatureDifference dT[N_cv] "= solid.T - fluid.T";

  Modelica.Units.SI.CoefficientOfHeatTransfer alpha=Nu*fluidProperties.lambda/D "heat transfer coefficient of convection";

  Modelica.Units.SI.DynamicViscosity eta_w "Dynamic Viscosity of fluid at wall temperature";

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

equation
  dT =heat_solid.T .- heat_fluid.T;
  heat_solid.Q_flow = Q_flow;
  heat_fluid.Q_flow = -sum(Q_flow);
  Q_flow = A*alpha*dT;

  eta_w = fluidProperties.eta; // no temperature influence on viscosity implemented
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-76,20},{76,20}}, color={191,0,0}),
        Line(points={{-56,30},{-76,20}},
                                       color={191,0,0}),
        Line(points={{-56,10},{-76,20}},
                                       color={191,0,0}),
        Line(points={{-56,-10},{-76,-20}},
                                         color={191,0,0}),
        Line(points={{-76,-20},{76,-20}}, color={191,0,0}),
        Line(points={{-56,-30},{-76,-20}},
                                         color={191,0,0}),
        Rectangle(
          extent={{80,80},{100,-80}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Backward)}),                   Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>Model&nbsp;calculating&nbsp;the&nbsp;heat&nbsp;transfered&nbsp;between&nbsp;fluid&nbsp;and&nbsp;heating&nbsp;system (tube bundle).</p>
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
<td><p>Nusselt Number calculated in <a href=\"TransiEnt.Producer.Gas.BiogasPlant.HeatTransfer.ForcedConvection.NusseltCSTR_Coil\">NusseltCSTR_Coil</a></p></td>
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
<p><br><br>G<b><span style=\"color: #008000;\">overning Equations</span></b></p>
<p><img src=\"modelica://TransiEnt/Images/equations/HeatTransferRate-Convection.png\"/></p>
<p><img src=\"modelica://TransiEnt/Images/equations/HeatTransferCoefficient_NusseltRelation.png\"/></p>
<p>Nusselt equation is calculated in function NusseltCSTR_Coil</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>[1] Kim, Y., &amp; Parker, W. (2008). A technical and economic evaluation of the pyrolysis of sewage sludge for the production of bio-oil. Bioresource technology, 99(5), 1409-1416.</p>
<p>[2] Vesilind, P. A., &amp; Martel, C. J. (1989). Thermal conductivity of sludges. Water research, 23(2), 241-245.</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model created by Philipp Jahneke (philipp.koziol@tuhh.de), August 2018</p>
</html>"));
end HeatTransferInsideReactor_tubeBundle_array;
