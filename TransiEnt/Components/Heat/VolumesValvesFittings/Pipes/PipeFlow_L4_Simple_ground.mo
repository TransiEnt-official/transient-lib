within TransiEnt.Components.Heat.VolumesValvesFittings.Pipes;
model PipeFlow_L4_Simple_ground "Model of underground pipe"




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
  extends ClaRa.Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L4_Simple(
    redeclare model HeatTransfer =
    ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L4(alpha_nom=alpha), final Delta_p_nom= Delta_p);

  import      Modelica.Units.SI;
  constant Real Pi = Modelica.Constants.pi;
  extends TransiEnt.Basics.Icons.PipeFlow_L4_Simple;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________
  final parameter SI.Length diameter_o = diameter_i +2*thickness_pipe "Outer diameter of pipe";
  final parameter SI.Length diameter_insulation = diameter_o + 2*thickness_insulation "Diameter with insulation";
  final parameter SI.Length depth_average= abs(z_in+z_out)/2;
  final parameter SI.CoefficientOfHeatTransfer alpha=2*lambda_ground/diameter_i/((lambda_ground/lambda_insulation)*Modelica.Math.log10(diameter_insulation/diameter_o)+Modelica.Math.acosh(2*depth_average/diameter_insulation));

  final parameter SI.Velocity v_nom= m_flow_nom/(N_tubes*rho_nom1*Pi*(diameter_i/2)^2) "Nominal fluid velocity";
  final parameter SI.PressureDifference Delta_p= length*(rho_nom1/2)*((4*m_flow_nom/N_tubes)/(rho_nom1*Pi*diameter_i^2))^2*0.11*((roughness*1000/diameter_i)+(68*v_nom*Pi*diameter_i*rho_nom1)/(4*m_flow_nom/N_tubes))^0.25;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________
  // the length now means the length of every pipe

  // Heat losses
  parameter SI.ThermalConductivity lambda_ground=0.5 "Thermal conductivity of ground" annotation(Dialog(tab="Additional Parameters",group="Heat Transfer"));
  parameter SI.ThermalConductivity lambda_insulation=0.04 "Thermal conductivity of insulation" annotation(Dialog(tab="Additional Parameters",group="Heat Transfer"));
  parameter SI.Length thickness_pipe= 0.002 "Thickness of pipe wall" annotation(Dialog(tab="Additional Parameters",group="Heat Transfer"));
  parameter SI.Length thickness_insulation= 0.037 "Thickness of insulation" annotation(Dialog(tab="Additional Parameters",group="Heat Transfer"));

  // Pressure losses
  // already inside the model:
  // m_flow_nom, diameter_i,length
  // m_flow_nom, diameter_i,length

  parameter SI.Density rho_nom1= 990 "Nominal Density" annotation(Dialog(tab="Additional Parameters",group="Pressure Loss"));
  parameter SI.Length roughness= 0.045e-3 "Roughness" annotation(Dialog(tab="Additional Parameters",group="Pressure Loss"));

   annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A simple model of a pipe flow with a VLE-fluid (Vapor liquid equilibrium) based on the three balance equations of energy, momentum and mass. The mass and the energy balance are dynamic, while the momentum balance is considered static. The balance equations are discretized with a finite volume method. The model uses n+2 fluid models from the TIL media to compute the fluid states at the inlet, outlet, and inside the control volumes of the pipe. Moreover, it uses a replaceable pressure loss model and a replaceable heat transfer model. The main difference compared to the PipeFlow_L4_Simple model is that it calculates parameters like alpha or delta_p for the calculation of the heat and pressure losses. Therefore, heat and pressure losses are considered. Heat losses are transferred through a heat port if the heat port is connected. However, the heat port doesn&rsquo;t have to be connected for the model to function. The pipe model can be connected to other models via two fluid ports, which pass the pressure, the specific enthalpy, the mass fraction and the mass flow rate as variables. The model allows reverse flow. In the model are instances of iCom and summary, which are not relevant for the physical understanding of the model. The model was extended from the ClaRa library.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>The general physics of the model are described in ClaRa.Components.VolumesValvesFittings.Pipes.PipeFlow_L4_Simple. </p>
<p>The heat model is defined with constant heat transfer coefficent. The coefficient is calculated considering just heat conduction. The influence of the pipe wall on the heat conduction is assumed to be small. Just the insulation of the pipe and the underground are considered.</p>
<p>The nominal pressure loss is calculated using the method shown in [Krimmling,2011].</p>
<h4><span style=\"color: #008000\">Limits of validity </span></h4>
<p>The accuracy of the dynamic effects of the model depends on the number of control volumes. The thermal inertia of the pipe wall is neglected. </p>
<h4><span style=\"color: #008000\">Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Images/Schemes/PipeL4.jpg\"/></p>
<h4><span style=\"color: #008000\">Governing Equations</span></h4>
<p>The equations have been simplified for an easier description. </p>
<p>V*rho*dh/dt=m_in*h_in+m_out*h_out+Q_flow_out</p>
<p>drho/dt=m_in+m_out</p>
<p>p_in-p_out=delta_p</p>
<p>T and rho are determined with the fluid models</p>
<h4><span style=\"color: #008000\">Validation</span></h4>
<p>see ClaRa pipe for validation</p>
<h4><span style=\"color: #008000\">References</span></h4>
<p>The model was extended from the ClaRa library</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Tobias Ramm (tobias.ramm@tuhh.de) November 2015</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model modified by Lisa Andresen (andresen@tuhh.de) December 2015</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model documented by Jan Westphal (j.westphal@tuhh.de) January 2025</span></p>
</html>"), Icon(graphics={
        Polygon(
          points={{88,58},{88,58}},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end PipeFlow_L4_Simple_ground;
