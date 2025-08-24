within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.Check;
model Check_LV_rural_1
  extends TransiEnt.Basics.Icons.Checkmodel;
  import TransiEnt.Basics.Types.ControlType;

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String development_scenario="Future" annotation (choices(
      choice="Today" "Today",
      choice="Intermediate" "Intermediate",
      choice="Future" "Future"), Dialog(group="Scenario choice"));

  parameter String weatherLocation="Hamelin"   annotation (Dialog(group="Scenario choice"));

  parameter String weatherYear="2019"   annotation (Dialog(group="Scenario choice"));

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Limit_P  "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Limit_P  "Type of control for battery system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Limit_P  "Type of control for heating system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Limit_P  "Type of control for vehicle system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter String smartMeterConfiguration="Ideal" "choose the basic configuration" annotation (Dialog(group="Metering"), choices(
      choice="Ideal" "Ideal measurements",
      choice="TAF10" "Tarifanwendungsfall 10 (German standard)",
      choice="TAF7" "Tarifanwendungsfall 7 (German standard)"));

  // ------------------------------------------------------------------------------------------
  //   Components
  // ------------------------------------------------------------------------------------------
  Components.Boundaries.Electrical.ComplexPower.SlackBoundary_new
                                                          electricGrid_1(
    useInputV=false,
    v_n=20000,
    useInputDelta=false,
    isFrequencyRoot=true) annotation (Placement(transformation(extent={{32.07,31.9},{47.07,46.9}})));

  // ---- LV Grids -------------------------------------------------------------------------------

  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.LV_rural_1 lV_rural_1_3(
    development_scenario=development_scenario,
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) annotation (Placement(transformation(extent={{10,-12},{30,8}})));

  TransiEnt.Basics.Interfaces.General.ControlBus controlBus if (photovoltaicControlType == TransiEnt.Basics.Types.ControlType.Limit_P) or (batteryControlType == TransiEnt.Basics.Types.ControlType.Limit_P) or (heatingControlType == TransiEnt.Basics.Types.ControlType.Limit_P) or (bevControlType == TransiEnt.Basics.Types.ControlType.Limit_P) annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  // ------------------------------------------------------------------------------------------
  //   Equation
  // ------------------------------------------------------------------------------------------

equation
  connect(lV_rural_1_3.epp, electricGrid_1.epp) annotation (Line(
      points={{20,8.8},{20,39.4},{32.07,39.4}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_3.controlBus, controlBus) annotation();
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{0,14},{40,-26}},
          lineColor={28,108,200},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{2,-18},{20,-26}},
          textColor={28,108,200},
          textString="LV Grids"),
        Rectangle(
          extent={{-80,60},{-60,20}},
          lineColor={255,204,51},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{-80,60},{-60,40}},
          textColor={244,125,35},
          textString="Control Bus 
Interface
look at Text
for Definition"),
        Text(
          extent={{-100,100},{100,80}},
          textColor={0,0,0},
          textString="Select Parameters for Weather Boundaries,Technologie Mix and Control Properties
of the unterlying grids")}),
    experiment(
      StopTime=172800,
      Tolerance=0.001,
      __Dymola_Algorithm="Cvode"));
end Check_LV_rural_1;
