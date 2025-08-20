within TransiEnt.Storage.Electrical.Controller;
model BES_Controller
  "BES controller with different control types according to ControlTypes"

  import Models_CyEntEE.CellModels.Controller.Base.ControlType;

  extends TransiEnt.Basics.Icons.Controller;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------

  parameter Modelica.Units.SI.Power Bat_PowerLimit "Maximum battery power";

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_smartMeter
    "Active power consumption measured by Smart Meter" annotation (Placement(
        transformation(extent={{-120,60},{-80,100}}), iconTransformation(extent
          ={{-120,60},{-80,100}})));

  Modelica.Blocks.Interfaces.BooleanInput Signal_P_external
    if (controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.External_P) or (controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Limit_P)
    "If Control_Signal = true, then the Output P_bat_out externally controlled over P_bat"
    annotation (Placement(transformation(extent={{-120,0},{-80,40}}),
        iconTransformation(extent={{-120,0},{-80,40}})));

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_BES
    if (controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.External_P) or (controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Limit_P)
    "Externally set battery power"
    annotation (Placement(transformation(extent={{-120,-24},{-80,16}}),
        iconTransformation(extent={{-120,-24},{-80,16}})));

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_BES_out
    "Set-point battery power output" annotation (Placement(transformation(
          extent={{100,-20},{140,20}}),iconTransformation(extent={{100,-20},{140,20}})));

  // ----------------------------------------------------------------------------------------
  //   Components
  // ----------------------------------------------------------------------------------------

  Modelica.Blocks.Continuous.LimPID PI(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=30,
    yMin=-Bat_PowerLimit,
    yMax=Bat_PowerLimit)
    annotation (Placement(transformation(extent={{-12,70},{8,90}})));

  Modelica.Blocks.Sources.RealExpression controlTarget
    annotation (Placement(transformation(extent={{-54,42},{-34,62}})));

  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{22,74},{34,86}})));

  Modelica.Blocks.Continuous.FirstOrder breakAlgebraicLoop(T=1, initType=
        Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{46,72},{62,88}})));

  Modelica.Blocks.Logical.Switch Switch_External_P
    if controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.External_P
    annotation (Placement(transformation(extent={{-10,22},{10,42}})));

  Modelica.Blocks.Interfaces.BooleanInput Signal_Priority_Charge
    if controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Priority
    "If Control_Signal = true, then the Output P_bat_out externally controlled over P_bat"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-40,-100}), iconTransformation(extent={{-120,-54},{-80,-14}})));

  Modelica.Blocks.Interfaces.BooleanInput Signal_Priority_Discharge
    if controlType ==ControlType.Priority
    "If Control_Signal = true, then the Output P_bat_out externally controlled over P_bat"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-100}), iconTransformation(extent={{-120,-100},{-80,-60}})));

  Modelica.Blocks.Sources.RealExpression priority_power_(y=priority_power) if controlType ==
    ControlType.Priority
    annotation (Placement(transformation(extent={{-44,-52},{-10,-32}})));

  Modelica.Blocks.Logical.Switch Switch_Priority if controlType ==ControlType.Priority
    annotation (Placement(transformation(extent={{34,-34},{54,-14}})));

  Modelica.Blocks.Sources.BooleanExpression has_priority_(y=has_priority) if controlType ==
    Models_CyEntEE.CellModels.Controller.Base.ControlType.Priority
    annotation (Placement(transformation(extent={{-44,-34},{-10,-14}})));

  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{84,-4},{92,4}})));

  Modelica.Blocks.Logical.Switch Switch_Limit_P
  if controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Limit_P
    annotation (Placement(transformation(extent={{-10,-12},{10,8}})));

  Modelica.Blocks.Sources.RealExpression UpperBatteryPowerLimitSwitch(y=Bat_PowerLimit)
  if controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Limit_P
    annotation (Placement(transformation(extent={{-48,-20},{-28,0}})));

  Modelica.Blocks.Sources.RealExpression UpperBatteryPowerLimit(y=Bat_PowerLimit)
  if not controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Limit_P
    annotation (Placement(transformation(extent={{58,-2},{72,12}})));

  Modelica.Blocks.Sources.RealExpression LowerBatteryPowerLimit(y=-Bat_PowerLimit)
    annotation (Placement(transformation(extent={{58,-14},{72,0}})));

  // --- External control ---

  parameter ControlType controlType=Models_CyEntEE.CellModels.Controller.Base.ControlType.Internal
    "Type of control (see enumeration)"
    annotation (Evaluate=true, Dialog(group="External Control"));

  // ----------------------------------------------------------------------------------------
  //   Variables
  // ----------------------------------------------------------------------------------------

  // internal interfaces
  Modelica.Blocks.Interfaces.BooleanOutput Signal_Priority_Charge_internal annotation (HideResult=true);
  Modelica.Blocks.Interfaces.BooleanOutput Signal_Priority_Discharge_internal annotation (HideResult=true);

  // Variables
  Boolean has_priority;
  Modelica.Units.SI.Power priority_power;

  // ----------------------------------------------------------------------------------------
  //   Equation part
  // ----------------------------------------------------------------------------------------

equation

  // connect internal interfaces (conditional connection)
  connect(Signal_Priority_Charge, Signal_Priority_Charge_internal);
  connect(Signal_Priority_Discharge, Signal_Priority_Discharge_internal);

  if not controlType ==Models_CyEntEE.CellModels.Controller.Base.ControlType.Priority then
    Signal_Priority_Charge_internal = false;
    Signal_Priority_Discharge_internal = false;
  end if;

  if Signal_Priority_Charge_internal and not Signal_Priority_Discharge_internal then
    priority_power = Bat_PowerLimit;
    has_priority = true;
  elseif not Signal_Priority_Charge_internal and Signal_Priority_Discharge_internal then
    priority_power = -Bat_PowerLimit;
    has_priority = true;
  else
    priority_power = 0;
    has_priority = false;
  end if;

  if controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Internal or controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Limit_P then
    connect(breakAlgebraicLoop.y, variableLimiter.u) annotation (Line(points={{62.8,80},{66,80},{66,32},{78,32},{78,0},{83.2,0}},
                                     color={0,0,127}));
  end if;

  // check if control type is allowed
  //assert(controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Internal  or controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.External_P
  //   or controlType == Models_CyEntEE.CellModels.Controller.Base.ControlType.Priority,  "Control Type is not allowed.");

  // --- connect statements -----------------------------------------------------------------

  connect(P_smartMeter, PI.u_s)
    annotation (Line(points={{-100,80},{-14,80}}, color={0,127,127}));
  connect(controlTarget.y, PI.u_m)
    annotation (Line(points={{-33,52},{-2,52},{-2,68}}, color={0,0,127}));
  connect(PI.y, gain.u)
    annotation (Line(points={{9,80},{20.8,80}}, color={0,0,127}));
  connect(Switch_External_P.u2, Signal_P_external) annotation (Line(points={{-12,
          32},{-74,32},{-74,20},{-100,20}}, color={255,0,255}));
  connect(Switch_External_P.u1, P_BES) annotation (Line(points={{-12,40},{-60,40},{-60,-4},{-100,-4}},
                                 color={0,0,127}));
  connect(gain.y, breakAlgebraicLoop.u)
    annotation (Line(points={{34.6,80},{44.4,80}}, color={0,0,127}));
  connect(breakAlgebraicLoop.y, Switch_External_P.u3) annotation (Line(points={{
          62.8,80},{66,80},{66,16},{-12,16},{-12,24}}, color={0,0,127}));
  connect(Switch_External_P.y, variableLimiter.u) annotation (Line(points={{11,32},{78,32},{78,0},{83.2,0}},
                           color={0,0,127}));
  connect(Switch_Priority.u1, breakAlgebraicLoop.y) annotation (Line(points={{32,
          -16},{32,16},{66,16},{66,80},{62.8,80}}, color={0,0,127}));
  connect(Switch_Priority.y, variableLimiter.u) annotation (Line(points={{55,-24},{78,-24},{78,0},{83.2,0}},
                           color={0,0,127}));
  connect(has_priority_.y, Switch_Priority.u2)
    annotation (Line(points={{-8.3,-24},{32,-24}}, color={255,0,255}));
  connect(priority_power_.y, Switch_Priority.u3) annotation (Line(points={{-8.3,
          -42},{24,-42},{24,-32},{32,-32}}, color={0,0,127}));
  connect(Signal_P_external, Switch_Limit_P.u2) annotation (Line(points={{-100,20},{-74,20},{-74,32},{-20,32},{-20,-2},{-12,-2}}, color={255,0,255}));
  connect(variableLimiter.y, P_BES_out) annotation (Line(points={{92.4,0},{120,0}},                                      color={0,0,127}));
  connect(LowerBatteryPowerLimit.y, variableLimiter.limit2) annotation (Line(points={{72.7,-7},{72.7,-6},{78,-6},{78,-3.2},{83.2,-3.2}}, color={0,0,127}));
  connect(UpperBatteryPowerLimit.y, variableLimiter.limit1) annotation (Line(points={{72.7,5},{83.2,5},{83.2,3.2}}, color={0,0,127}));
  connect(Switch_Limit_P.y, variableLimiter.limit1) annotation (Line(points={{11,-2},{48,-2},{48,0},{74,0},{74,3.2},{83.2,3.2}}, color={0,0,127}));
  connect(Switch_Limit_P.u1, P_BES) annotation (Line(points={{-12,6},{-60,6},{-60,-4},{-100,-4}}, color={0,0,127}));
  connect(Switch_Limit_P.u3, UpperBatteryPowerLimitSwitch.y) annotation (Line(points={{-12,-10},{-27,-10}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>Logic of this controller</p>
<ul>
<li>Self-sufficiency (simple): charge battery if generated surplus power is available, otherwise discharge until it is empty.</li>
</ul>
</html>"), Diagram(graphics={
        Rectangle(
          extent={{-54,-56},{10,-74}},
          lineColor={157,157,157},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{-44,-62},{2,-68}},
          textColor={157,157,157},
          textString="See equation part"),
        Line(
          points={{-54,-54},{-54,-24},{-46,-24}},
          color={157,157,157},
          pattern=LinePattern.Dash,
          arrow={Arrow.None,Arrow.Filled})}));
end BES_Controller;
