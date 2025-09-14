within TransiEnt.Components.Electrical.Grid;
model Node "Single bus node"

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
  final SI.PerUnit v_pu=v/v_n;
  final SI.Voltage v(
    displayUnit="kV") = epp.v;
  final SI.Angle delta(
    displayUnit="deg") = epp.delta;
  final SI.Frequency f=epp.f;

  parameter SI.Voltage v_n(displayUnit="kV")=400 "Nominal bus voltage";
  parameter SI.PerUnit v_pu_start=1 annotation (Dialog(group="Initialization"));
  parameter SI.Angle delta_start=0 annotation (Dialog(group="Initialization"));

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp(v(start=v_pu_start*v_n), delta(start=delta_start))
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}}), iconTransformation(extent={{-10,-110},{10,-90}})));

  TransiEnt.Basics.Interfaces.General.ControlBus controlBus
    annotation (Placement(transformation(extent={{-110,60},{-90,80}})));
  Modelica.Blocks.Sources.RealExpression V(y=v) annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Sources.RealExpression V_pu(y=v_pu) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.RealExpression F(y=f) annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Sources.RealExpression Delta(y=delta) annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.RealExpression V_n(y=v_n) annotation (Placement(transformation(extent={{-60,-38},{-40,-18}})));
equation
  epp.P = 0;
  epp.Q = 0;
  connect(V.y, controlBus.v) annotation (Line(points={{-39,50},{-36,50},{-36,70},{-100,70}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(V_pu.y, controlBus.v_pu) annotation (Line(points={{-39,30},{-32,30},{-32,72},{-88,72},{-88,70},{-100,70}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(F.y, controlBus.f) annotation (Line(points={{-39,10},{-36,10},{-36,48},{-34,48},{-34,68},{-86,68},{-86,70},{-100,70}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(Delta.y, controlBus.delta) annotation (Line(points={{-39,-10},{-28,-10},{-28,74},{-86,74},{-86,70},{-100,70}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(V_n.y, controlBus.v_n) annotation (Line(points={{-39,-28},{-36,-28},{-36,-42},{-86,-42},{-86,70},{-100,70}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(graphics={Ellipse(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<h4>Basic idea of the model</h4>
<p>The Node model is useful when start values for complex voltages (argument and phase) is calulcated externally for a defined operation port. The Newton or also called Newton-Raphson algorithm implemented in Dymola sometimes does not converge properly, so that an external load flow calculation for finding proer start values may be necessary.</p>
<p>In this case, put Node models at each node of the electrical grid model and set the start values in the Node model parameters.</p>
</html>"));
end Node;
