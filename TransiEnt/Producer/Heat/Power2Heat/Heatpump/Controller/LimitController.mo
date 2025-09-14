within TransiEnt.Producer.Heat.Power2Heat.Heatpump.Controller;
model LimitController "Limits electrical power consumption"

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
  parameter Modelica.Units.SI.HeatFlowRate Q_limit_not_active
    "Maximum thermal heat flow rate if limiter is not active";

  parameter Modelica.Units.SI.HeatFlowRate Q_nom
    "Nominal heat flow rate of heating system";

  Modelica.Blocks.Interfaces.RealOutput PID_limit
    "Connector of actuator output signal" annotation (Placement(transformation(
          extent={{98,-10},{118,10}}), iconTransformation(extent={{98,-10},{118,
            10}})));
  Modelica.Blocks.Interfaces.RealInput P_limit
    annotation (Placement(transformation(extent={{-130,40},{-90,80}})));
  Modelica.Blocks.Interfaces.BooleanInput P_limit_active annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-108,-60})));
  Modelica.Blocks.Continuous.FirstOrder breakAlgebraicLoop(T=1, initType=
        Modelica.Blocks.Types.Init.InitialState) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-22,-88})));
  Modelica.Blocks.Math.Feedback controlError_P_Limit
    annotation (Placement(transformation(extent={{6,-70},{26,-50}})));
  Basics.Blocks.PID_reset_lim controller_P_Limit(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=1,
    Ti=30,
    yMax=Q_limit_not_active,
    yMin=0,
    initType=Modelica.Blocks.Types.Init.InitialState,
    xi_start=Q_nom,
    reinitMethod=TransiEnt.Basics.Blocks.PID_reset_lim.Types.reinitMethods.limitMean,
    useVariableLimits=true)
    annotation (Placement(transformation(extent={{22,34},{42,54}})));
  Modelica.Blocks.Logical.Switch P_limit_active_switch
    annotation (Placement(transformation(extent={{-32,-70},{-12,-50}})));
  Modelica.Blocks.Sources.RealExpression Q_varLimiter_max(y=Q_limit_not_active)
                                                                    annotation (
     HideResult=true, Placement(transformation(extent={{-96,-88},{-56,-68}})));
  Modelica.Blocks.Logical.Not not2 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-28,32})));
  Modelica.Blocks.Interfaces.RealInput P_Heating annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-60,-108})));
  Modelica.Blocks.Sources.RealExpression Q_varLimiter_min(y=0) annotation (
      HideResult=true, Placement(transformation(extent={{-42,8},{-16,26}})));
  Basics.Blocks.Hysteresis_inputVariable active
    annotation (Placement(transformation(extent={{-32,50},{-12,70}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-68,68},{-58,78}})));
  Modelica.Blocks.Sources.RealExpression deactivationOffset(y=-50)
    annotation (Placement(transformation(extent={{-104,28},{-84,48}})));
  Modelica.Blocks.Sources.RealExpression activationOffset(y=10)
    annotation (Placement(transformation(extent={{-102,76},{-82,96}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-74,36},{-64,46}})));
  Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(extent={{-8,30},{2,40}})));
  Modelica.Blocks.Logical.Change change1
    annotation (Placement(transformation(extent={{-4,56},{4,64}})));
  Modelica.Blocks.Math.Gain COP_best(k=5)
    annotation (Placement(transformation(extent={{-14,80},{2,96}})));
  Modelica.Blocks.Logical.Switch P_limit_active_switch1
    annotation (Placement(transformation(extent={{-32,-38},{-12,-18}})));
equation
  connect(P_limit_active,P_limit_active_switch. u2) annotation (Line(points={{-108,
          -60},{-34,-60}},            color={255,0,255}));
  connect(not2.u, P_limit_active) annotation (Line(points={{-35.2,32},{-50,32},
          {-50,-60},{-108,-60}},             color={255,0,255}));
  connect(P_limit,P_limit_active_switch. u1) annotation (Line(points={{-110,60},
          {-62,60},{-62,-52},{-34,-52}},  color={0,0,127}));
  connect(P_limit_active_switch.y,controlError_P_Limit. u1) annotation (Line(
        points={{-11,-60},{8,-60}},                                 color={0,0,
          127}));
  connect(controlError_P_Limit.y,controller_P_Limit. u_s) annotation (Line(points={{25,-60},
          {44,-60},{44,12},{10,12},{10,44},{20,44}},                                                                         color={0,0,127}));
  connect(controller_P_Limit.y, PID_limit) annotation (Line(points={{43,44},{94,
          44},{94,0},{108,0}}, color={0,0,127}));
  connect(Q_varLimiter_max.y, P_limit_active_switch.u3) annotation (Line(points={{-54,-78},
          {-42,-78},{-42,-68},{-34,-68}},          color={0,0,127}));
  connect(P_Heating, breakAlgebraicLoop.u) annotation (Line(points={{-60,-108},
          {-60,-88},{-29.2,-88}},color={0,0,127}));
  connect(breakAlgebraicLoop.y, controlError_P_Limit.u2) annotation (Line(
        points={{-15.4,-88},{16,-88},{16,-68}},                  color={0,0,127}));
  connect(Q_varLimiter_min.y, controller_P_Limit.u_m) annotation (Line(points={{-14.7,
          17},{32,17},{32,32}},                      color={0,0,127}));
  connect(P_Heating, active.u)
    annotation (Line(points={{-60,-108},{-60,60},{-33,60}}, color={0,0,127}));
  connect(P_limit, add.u2) annotation (Line(points={{-110,60},{-74,60},{-74,70},
          {-69,70}}, color={0,0,127}));
  connect(add.y, active.uHigh) annotation (Line(points={{-57.5,73},{-40,73},{
          -40,72},{-32.6,72},{-32.6,68}}, color={0,0,127}));
  connect(activationOffset.y, add.u1) annotation (Line(points={{-81,86},{-74,86},
          {-74,76},{-69,76}}, color={0,0,127}));
  connect(add1.u1, P_limit)
    annotation (Line(points={{-75,44},{-75,60},{-110,60}}, color={0,0,127}));
  connect(deactivationOffset.y, add1.u2)
    annotation (Line(points={{-83,38},{-75,38}}, color={0,0,127}));
  connect(add1.y, active.uLow) annotation (Line(points={{-63.5,41},{-34,41},{
          -34,52},{-33,52}}, color={0,0,127}));
  connect(not2.y, or1.u2)
    annotation (Line(points={{-21.4,32},{-18,31},{-9,31}}, color={255,0,255}));
  connect(or1.y, controller_P_Limit.reset) annotation (Line(points={{2.5,35},{
          16,35},{16,24},{26,24},{26,32}}, color={255,0,255}));
  connect(active.y, change1.u)
    annotation (Line(points={{-11,60},{-4.8,60}}, color={255,0,255}));
  connect(change1.y, or1.u1) annotation (Line(points={{4.4,60},{8,60},{8,44},{
          -16,44},{-16,35},{-9,35}}, color={255,0,255}));
  connect(Q_varLimiter_min.y, controller_P_Limit.limit2) annotation (Line(
        points={{-14.7,17},{8,17},{8,38},{14,38},{14,36},{20,36}}, color={0,0,
          127}));
  connect(P_limit, COP_best.u) annotation (Line(points={{-110,60},{-74,60},{-74,
          74},{-76,74},{-76,88},{-15.6,88}}, color={0,0,127}));
  connect(P_limit_active, P_limit_active_switch1.u2) annotation (Line(points={{
          -108,-60},{-50,-60},{-50,-28},{-34,-28}}, color={255,0,255}));
  connect(Q_varLimiter_max.y, P_limit_active_switch1.u3) annotation (Line(
        points={{-54,-78},{-42,-78},{-42,-36},{-34,-36}}, color={0,0,127}));
  connect(COP_best.y, P_limit_active_switch1.u1) annotation (Line(points={{2.8,
          88},{6,88},{6,76},{-42,76},{-42,30},{-46,30},{-46,-20},{-34,-20}},
        color={0,0,127}));
  connect(P_limit_active_switch1.y, controller_P_Limit.limit1) annotation (Line(
        points={{-11,-28},{-4,-28},{-4,26},{6,26},{6,52},{20,52}}, color={0,0,
          127}));
  annotation (Icon(graphics={   Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        textColor={0,0,255}),
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(
          points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-80}}, color={28,108,200}),
        Line(
          points={{-80,-6},{-40,4},{2,44},{44,38},{64,64}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{-24,20},{-8,34},{10,42},{44,38},{64,64}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Polygon(
          points={{18,26},{18,26}},
          lineColor={28,108,200},
          smooth=Smooth.Bezier,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-24,20},{-8,34},{10,42},{44,38},{64,64},{64,64},{64,20},{64,20},
              {-23.5703,20},{-24,20}},
          smooth=Smooth.Bezier,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(
          visible=strict,
          points={{-24,20},{65,20}},
          color={255,0,0})}), Documentation(info="<html>
<p>
The <b>LimitController</b> restricts the heating system’s thermal output based on a power limit signal. 
When <code>P_limit_active</code> is true, a PI controller (<code>PID_reset_lim</code>) regulates output so the measured heating power <code>P_Heating</code> tracks <code>P_limit</code>. 
When inactive, the output is set to <code>Q_limit_not_active</code>.
</p>

<h4>Key features</h4>
<ul>
<li>PI control with reset when limiter is inactive (<code>xi_start = Q_nom</code>).</li>
<li>Variable maximum output: <code>P_limit</code> when active, <code>Q_limit_not_active</code> when inactive.</li>
<li>Minimum output fixed at zero.</li>
<li>First-order lag (<code>breakAlgebraicLoop</code>) to avoid algebraic loops in feedback.</li>
</ul>

<h4>Logic</h4>
<ol>
<li>Switch selects setpoint from <code>P_limit</code> or <code>Q_limit_not_active</code> based on <code>P_limit_active</code>.</li>
<li>PI controller regulates within [0, <code>Q_limit_not_active</code>].</li>
<li>Reset triggered when limiter turns off.</li>
<li>Output <code>PID_limit</code> sent to actuator/supervisory control.</li>
</ol>
</html>"));
end LimitController;
