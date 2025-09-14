within TransiEnt.Producer.Heat.Power2Heat.Heatpump.Check;
model CheckHeatpump
  import TransiEnt;

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
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//
  extends TransiEnt.Basics.Icons.Checkmodel;
  inner SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));

  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump                 heatpump(
    use_T_supply_input=false,
    usePowerPort=true,
    useFluidPorts=true,
    p_drop=0,
    useHeatPort=false,
    T_set=323.15)                                                                             annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency electricGrid1(useInputConnector=false)
                                                                                                         annotation (Placement(transformation(extent={{20,-46},{40,-26}})));
  Modelica.Blocks.Sources.Sine Q_flow_set(
    amplitude=500,
    offset=1000,
    phase=3.1415926535898,
    f=1/4000) annotation (Placement(transformation(extent={{-56,-14},{-39,4}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink fluidSink annotation (Placement(transformation(extent={{4,20},{24,40}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(extent={{52,-36},{72,-16}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=17e5) annotation (Placement(transformation(extent={{-26,20},{-6,40}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=0.1) annotation (Placement(transformation(extent={{18,-26},{38,-6}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=30*4186) annotation (Placement(transformation(extent={{14,-74},{34,-54}})));
equation

  connect(heatpump.epp, electricGrid1.epp) annotation (Line(
      points={{3.6,-10},{3.6,-36},{20,-36}},
      color={0,135,135},
      thickness=0.5));
  connect(Q_flow_set.y, heatpump.Q_flow_set) annotation (Line(points={{-38.15,-5},{-38.15,-5.4},{-14.6,-5.4}}, color={0,0,127}));
  connect(fluidSink.port_a, heatpump.outlet) annotation (Line(points={{24,30},{44,30},{44,3},{6.2,3}}, color={0,0,0}));
  connect(fluidSource.port_a, heatpump.inlet) annotation (Line(points={{72,-26},{84,-26},{84,-3.8},{6,-3.8}}, color={0,0,0}));
  connect(realExpression.y, fluidSink.p_in) annotation (Line(points={{-5,30},{6,30}}, color={0,0,127}));
  connect(realExpression1.y, fluidSource.m_flow_in) annotation (Line(points={{39,-16},{48,-16},{48,-23},{54,-23}}, color={0,0,127}));
  connect(realExpression2.y, fluidSource.h_in) annotation (Line(points={{35,-64},{46,-64},{46,-28},{54,-28}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-82,76},{84,52}},
          textColor={28,108,200},
          textString="Look at: heatPump.Q_flow and heatPump.epp.P")}),
                             experiment(StopTime=7200),
    Documentation(info="<html>
<p><b><span style=\"color: #008000;\">1. Purpose of model</span></b></p>
<p>Test environment for Heatpump</p>
<p><b><span style=\"color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p>(Purely technical component without physical modeling.)</p>
<p><b><span style=\"color: #008000;\">3. Limits of validity </span></b></p>
<p>(Purely technical component without physical modeling.)</p>
<p><b><span style=\"color: #008000;\">4.Interfaces</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">5. Nomenclature</span></b></p>
<p>(no elements)</p>
<p><b><span style=\"color: #008000;\">6. Governing Equations</span></b></p>
<p>(no equations)</p>
<p><b><span style=\"color: #008000;\">7. Remarks for Usage</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">8. Validation</span></b></p>
<p>(no validation or testing necessary)</p>
<p><b><span style=\"color: #008000;\">9. References</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">10. Version History</span></b></p>
</html>"));
end CheckHeatpump;
