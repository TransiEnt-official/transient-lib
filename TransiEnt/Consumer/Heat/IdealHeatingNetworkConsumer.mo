within TransiEnt.Consumer.Heat;
model IdealHeatingNetworkConsumer "Heating network consumer, ideally hydraulic decoupled"




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
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends PartialHeatConsumer;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter ClaRa.Basics.Units.Temperature T_return_const=293.15 "Return temperature, if use_T_return_const";
  parameter SI.Pressure p_feed_const = 12e5 "Pressure at consumer station, feed water side";
  parameter SI.Pressure p_return_const = 10e5 "Pressure at consumer station, return water side";
  parameter SI.MassFlowRate m_flow_large=2000 "Limit of mass flow rate";
  parameter SI.MassFlowRate m_flow_small=Modelica.Constants.eps;//simCenter.m_flow_small "Lower limits of input signals";
  parameter Boolean use_T_return_const = true;
  parameter SI.Density rho=1000 "Density of the fluid";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateIn Q_flow_demand "Total heat flow rate demand" annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=270,
        origin={1,103}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-4,94})));

  TransiEnt.Basics.Interfaces.General.TemperatureIn T_return_set if not use_T_return_const "Return temperature set point"  annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=270,
        origin={67,103}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={74,92})));

protected
  TransiEnt.Basics.Interfaces.General.TemperatureIn T_return_internal annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=180,
        origin={15,34}),  iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-4,94})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

public
  Modelica.Blocks.Sources.RealExpression m_flow_unlimited(y=m_flow) annotation (Placement(transformation(extent={{46,-38},{26,-18}})));

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  SI.MassFlowRate m_flow "Mass flow is determined by heat balance";
  //SI.Density rho = TILMedia.Internals.VLEFluidConfigurations.FullyMixtureCompatible.VLEFluidFunctions.liquidDensity_phxi(medium, fluidPortIn.p, inStream(fluidPortIn.h_outflow), inStream(fluidPortIn.xi_outflow));

  Modelica.Blocks.Nonlinear.Limiter m_flow_set(uMax=m_flow_large, uMin=m_flow_small) annotation (Placement(transformation(extent={{6,-38},{-14,-18}})));

  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink2(h=95*4186) annotation (Placement(transformation(extent={{-68,70},{-48,90}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=p_feed_const)
                                                             annotation (Placement(transformation(extent={{-96,70},{-76,90}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(extent={{-36,-41},{-56,-21}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=T_return_internal*cf)
                                                             annotation (Placement(transformation(extent={{12,-80},{-8,-60}})));
equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  Q_flow_demand = m_flow*cf*(T_in.y - T_return_internal);

  if use_T_return_const then
    T_return_internal = T_return_const;
  end if;

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(T_return_internal, T_return_set);

  connect(T_in.y, m_flow_set.u) annotation (Line(points={{-73,26},{8,26},{8,-28}}, color={0,0,127}));
  connect(realExpression2.y,sink2. p_in) annotation (Line(points={{-75,80},{-66,80}},                       color={0,0,127}));
  connect(sink2.port_a, fluidPortIn) annotation (Line(points={{-48,80},{-30,80},{-30,20},{-98,20}}, color={0,0,0}));
  connect(fluidSource.port_a, fluidPortOut) annotation (Line(points={{-56,-31},{-82,-31},{-82,-20},{-98,-20}}, color={0,0,0}));
  connect(m_flow_set.y, fluidSource.m_flow_in) annotation (Line(points={{-15,-28},{-38,-28}}, color={0,0,127}));
  connect(realExpression1.y, fluidSource.h_in) annotation (Line(points={{-9,-70},{-32,-70},{-32,-33},{-38,-33}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model represents a district heating station consumer. The model calculates the mass flow according to the feed water temperature and the prescribed heat flow demand. It reacts to a change in feed water temperature by reducing mass flow in returning mass flow path. There is no mass flow balance active.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model makes sense only if it is used in a closed loop, meaning that the mass flow at outlet and inlet is the same by definition. Otherwise mass flow balance is not forfilled!</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>Q_demand - Total heat demand</p>
<p>T_return_set - Return temperature set point</p>
<p>fluidPortIn - Heat carrier inlet</p>
<p>fluidPortOut - Heat carrier outlet</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by pd (dubucq@tuhh.de) in April 2016.</span></p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                                   Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-75,-75},{75,75}}),
        Line(points={{46,60},{-60,-46}}, color={0,127,127}),
        Line(points={{60,46},{-46,-60}}, color={0,127,127})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end IdealHeatingNetworkConsumer;
