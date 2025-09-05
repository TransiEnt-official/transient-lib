within TransiEnt.Consumer.Heat.SpaceHeating;
model RoomHeating

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
//________________________________________________________________________________//  "Room Heating model according to DIN 12831 Part 1 with simplified building envelope model"

  import Modelica.Blocks.Types.Init;
  import TransiEnt.Basics.Types.ControlType;

  // ----------------------------------------------------------------------------------------
  //   Parameter
  // ----------------------------------------------------------------------------------------

  parameter Modelica.Units.SI.HeatCapacity C=30e6 "Heat capacity of consumer (= cp * m)";

  parameter Modelica.Units.SI.ThermalConductance G_conductance=200
    "Constant thermal conductance of consumer";

  parameter Modelica.Units.SI.ThermalConductance G_ventilation=100
    "Heat dissipation due to ventilation (calculated as thermal conductance)";

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer U_total
    "total heat transfer coefficient of building";

  parameter Modelica.Units.SI.Area A_living=100 "Living area";

  parameter Modelica.Units.SI.HeatFlowRate NHL=10e3 "Nominal heating load"
    annotation (Dialog(group="Nominal values"));

  parameter Real T_supply_per_year[2,2]=[1995,45; 2015,36];
  parameter Real U_per_year[2,2]=[1995,0.51; 2015,0.35];

  parameter Modelica.Units.SI.Temperature T_stor_nom=273.15 + 45
    "Nominal supply temperature at nominal conditions"
    annotation (Dialog(group="Nominal values"));

  parameter Modelica.Units.SI.Temperature T_room_nom=273.15 + 21 "Nominal room temperature"
    annotation (Dialog(group="Nominal values"));

  parameter Modelica.Units.SI.Temperature T_amb_nom=273.15 - 10 "Nominal ambient temperature"
    annotation (Dialog(group="Nominal values"));

  parameter Modelica.Units.SI.Temperature T_room_start=273.15 + 21 "Initial room temperature"
    annotation (Dialog(group="Initialization"));

  parameter Real k_P=10000 "Gain of PI controller"
    annotation (Dialog(group="Controller"));

  parameter Real k_Ti=60 "Integrator time constant of PI controller"
    annotation (Dialog(group="Controller"));

  // --- External control ---

  parameter ControlType controlType=TransiEnt.Basics.Types.ControlType.Internal
    "Type of control (see enumeration)"
    annotation (Evaluate=true, Dialog(group="External Control"));

  // --- Initialization ---

  parameter Init initType = Init.NoInit
    "Type of initialization (1: no init, 2: steady state, others do not apply)"
    annotation(Evaluate=true, Dialog(group="Initialization"));

  // ----------------------------------------------------------------------------------------
  //   Interfaces
  // ----------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.General.TemperatureIn T_amb
    annotation (Placement(transformation(extent={{-128,-100},{-88,-60}})));

  TransiEnt.Basics.Interfaces.General.TemperatureIn T_room_set
    annotation (Placement(transformation(extent={{-126,60},{-86,100}})));

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort_supply
    annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));

  TransiEnt.Basics.Interfaces.General.TemperatureIn T_room_offset
    if controlType == ControlType.External_T
    annotation (Placement(transformation(extent={{-126,20},{-86,60}})));

  Modelica.Blocks.Interfaces.RealOutput T_bt_min(displayUnit="degC")
    "Minimal buffer tank storage temperature needed for keeping nominal room temperature"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-106})));

  // ----------------------------------------------------------------------------------------
  //   Components (instances of other classes)
  // ----------------------------------------------------------------------------------------

  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor thermalMass(
    T(start=T_room_start, fixed=true),
    C=C,
    der_T(fixed=initType == Init.SteadyState))
    annotation (Placement(transformation(extent={{-10,8},{10,-12}})));

  Modelica.Thermal.HeatTransfer.Components.ThermalConductor heatLossConductance(G=
        G_conductance)
    annotation (Placement(transformation(extent={{10,40},{26,56}}, rotation=0)));

  Modelica.Thermal.HeatTransfer.Components.ThermalConductor heatLossVentilation(G=
        G_ventilation) annotation (Placement(transformation(extent={{10,16},{26,32}})));

  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature ambientTemperature
    annotation (Placement(transformation(extent={{72,14},{52,34}})));

  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin toDeg
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow
    prescribedHeatFlow_source annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,-60})));

  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor T_room
    annotation (Placement(transformation(extent={{-32,28},{-12,48}})));

  TransiEnt.Basics.Blocks.PID_reset_lim PI(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=NHL,
    Ti=3000,
    wp=1,
    Ni=0.2,
    withFeedForward=false,
    initType=if initType == Init.NoInit then Init.InitialState else Init.NoInit,
    strict=true,
    useReset=false,
    useVariableLimits=true,
    useDeadZone=false,
    gainPID(y(start=NHL)),
    y(start=NHL))
    annotation (Placement(transformation(extent={{-18,70},{2,90}})));

  Modelica.Blocks.Sources.RealExpression Q_min_
    annotation (Placement(transformation(extent={{-60,64},{-42,80}})));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_sink
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,-20})));

  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={72,-60})));

  Modelica.Blocks.Continuous.FirstOrder inertia_roomHeating(T=600, initType=if
        initType == Init.NoInit then Init.InitialState else Init.SteadyState)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={52,80})));

  Modelica.Blocks.Math.Add add if controlType == ControlType.External_T
    annotation (Placement(transformation(extent={{-92,54},{-80,66}})));

  Modelica.Blocks.Sources.RealExpression Q_max_(y=Q_max)
    annotation (Placement(transformation(extent={{-60,80},{-42,96}})));

  // ----------------------------------------------------------------------------------------
  //   Variables
  // ----------------------------------------------------------------------------------------

  final parameter Modelica.Units.SI.HeatFlowRate NHL_calc=NHL*1.3;

//   final parameter Modelica.Units.SI.ThermalConductance kA_floor=NHL_calc/(T_stor_nom - T_room_nom)
//     "kA value of floor heating";

  // calculate construction based on a simplified rule
  final parameter Integer construction_year=integer(floor(
      Modelica.Math.Vectors.interpolate(Modelica.Math.Vectors.reverse(
        U_per_year[:, 2]), Modelica.Math.Vectors.reverse(U_per_year[:, 1]),
        U_total)));

  final parameter Modelica.Units.SI.ThermalConductance kA_floor=NHL/(
      Modelica.Math.Vectors.interpolate(
      T_supply_per_year[:, 1],
      T_supply_per_year[:, 2],
      construction_year) - 21);

  Modelica.Units.SI.HeatFlowRate Q_max=kA_floor*(min(T_stor_nom,
      heatPort_supply.T) - T_room.T);

  Modelica.Units.SI.HeatFlowRate Q_required
    "Required heat flow rate to keep room temperature";

  // ----------------------------------------------------------------------------------------
  //   Equation part
  // ----------------------------------------------------------------------------------------

equation

  // assert statements
  assert(initType == Init.NoInit or initType == Init.SteadyState, "Init type not supported.");
  assert(controlType == ControlType.Internal or controlType == ControlType.External_T,
    "Control Type not supported.");

  // required heat flow rate to keep room temperature
  // PI.u_s is the room temperature set point
  Q_required = (G_conductance + G_ventilation) * (PI.u_s - T_amb);

  // calculate minimal buffer tank temperature that is needed to keep the nominal room temperature
  T_bt_min = PI.u_s + Q_required / kA_floor;

  // ----------------------------------------------------------------------------------------
  //   Connections
  // ----------------------------------------------------------------------------------------

  if controlType == ControlType.Internal then
    connect(T_room_set, PI.u_s)
      annotation (Line(points={{-106,80},{-20,80}}, color={0,0,127}));
  end if;

  connect(thermalMass.port, heatLossConductance.port_a)
    annotation (Line(points={{0,8},{0,48},{10,48}}, color={191,0,0}));
  connect(heatLossVentilation.port_a, thermalMass.port)
    annotation (Line(points={{10,24},{0,24},{0,8}}, color={191,0,0}));
  connect(heatLossConductance.port_b, ambientTemperature.port) annotation (Line(
        points={{26,48},{42,48},{42,24},{52,24}}, color={191,0,0}));
  connect(heatLossVentilation.port_b, ambientTemperature.port)
    annotation (Line(points={{26,24},{52,24}}, color={191,0,0}));
  connect(T_amb, toDeg.Kelvin) annotation (Line(points={{-108,-80},{-16,-80},{-16,
          -40},{-12,-40}}, color={0,0,127}));
  connect(toDeg.Celsius, ambientTemperature.T) annotation (Line(points={{11,-40},
          {80,-40},{80,24},{74,24}}, color={0,0,127}));
  connect(prescribedHeatFlow_source.port, heatPort_supply)
    annotation (Line(points={{32,-60},{0,-60},{0,-98}}, color={191,0,0}));
  connect(PI.u_m, T_room.T) annotation (Line(points={{-8,68},{-8,38},{-11,38}},
                            color={0,0,127}));
  connect(thermalMass.port, T_room.port) annotation (Line(points={{0,8},{0,24},{
          -36,24},{-36,38},{-32,38}}, color={191,0,0}));
  connect(prescribedHeatFlow_sink.port, T_room.port) annotation (Line(points={{32,
          -20},{-36,-20},{-36,38},{-32,38}}, color={191,0,0}));
  connect(gain.y, prescribedHeatFlow_source.Q_flow)
    annotation (Line(points={{65.4,-60},{52,-60}}, color={0,0,127}));
  connect(inertia_roomHeating.y, prescribedHeatFlow_sink.Q_flow) annotation (
      Line(points={{63,80},{90,80},{90,-20},{52,-20}}, color={0,0,127}));
  connect(gain.u, inertia_roomHeating.y) annotation (Line(points={{79.2,-60},{90,
          -60},{90,80},{63,80}}, color={0,0,127}));
  connect(T_room_offset, add.u2) annotation (Line(points={{-106,40},{-94,40},{-94,
          56.4},{-93.2,56.4}}, color={0,0,127}));
  connect(T_room_set, add.u1) annotation (Line(points={{-106,80},{-93.2,80},{-93.2,
          63.6}}, color={0,0,127}));
  connect(add.y, PI.u_s) annotation (Line(points={{-79.4,60},{-74,60},{-74,80},
          {-20,80}},                  color={0,0,127}));
  connect(PI.y, inertia_roomHeating.u)
    annotation (Line(points={{3,80},{40,80}}, color={0,0,127}));
  connect(Q_min_.y, PI.limit2)
    annotation (Line(points={{-41.1,72},{-20,72}}, color={0,0,127}));
  connect(Q_max_.y, PI.limit1)
    annotation (Line(points={{-41.1,88},{-20,88}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-60,40},{-30,-80}},
          lineColor={0,0,0},
          lineThickness=1),
        Rectangle(
          extent={{-30,40},{0,-80}},
          lineColor={0,0,0},
          lineThickness=1),
        Rectangle(
          extent={{0,40},{30,-80}},
          lineColor={0,0,0},
          lineThickness=1),
        Rectangle(
          extent={{30,40},{60,-80}},
          lineColor={0,0,0},
          lineThickness=1),
        Line(
          points={{-50,44},{-38,60},{-58,72},{-46,86}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Line(
          points={{-20,44},{-8,60},{-28,72},{-16,86}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Line(
          points={{10,44},{22,60},{2,72},{14,86}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Line(
          points={{40,44},{52,60},{32,72},{44,86}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Rectangle(
          extent={{-80,30},{80,24}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{74,24},{80,66}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,-12},{-74,30}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4>Model equations</h4>
<p>The RoomHeating model describes basic building heating thermodynamics. A PI controller with anti-windup controls the building temperature by calculating the heat flow. A limiter with variable upper limit restricts the maximal possible heat flow between the heat exchanger (floor heating) and the room itself. The heat transfer is simplified by calculating:</p>
<p><span style=\"font-family: Courier New;\">Q = kA * (theta_supply - theta_room)</span></p>
<ul>
<li><span style=\"font-family: Courier New;\">kA</span>: Heat transfer coefficient between floor heating and room</li>
<li><span style=\"font-family: Courier New;\">theta_supply</span>: Supply temperature</li>
<li><span style=\"font-family: Courier New;\">theta_room</span>: Room temperature</li>
</ul>
<p>The <span style=\"font-family: Courier New;\">kA</span> Value is calculated by the nominal heating load (NHL) at nominal temperature difference. It is assumed, that the floor heating is designed for this case:</p>
<h5>Option 1</h5>
<p>The kA value is calculated by NHL and a fixed assumed temperature difference at nominal operating conditions.</p>
<p><span style=\"font-family: Courier New;\">kA = NHL / (theta_supply_nom - theta_room)</span></p>
<ul>
<li><span style=\"font-family: Courier New;\">NHL</span>: Nominal Heating Load</li>
<li><span style=\"font-family: Courier New;\">theta_supply_nom</span>: Nominal room temperature (usually 21 deg C)</li>
</ul>
<h5>Option 2 (default)</h5>
<p>Calculation based on nominal k Values for different buildings. From a given U_total value, the construction year of the building is derived. Based on this number, the corresponding kA-value is calculated by a construction year specific nominal supply temperature for the heating system. The numbers are derived from the DIN EN 12831 Part 1.</p>
<h4>Further informations</h4>
<p>Between building and environment, the heat flow is calculated by conduction (thermal transmittance) and convection (ventilation). The coefficiencts should be calculated externally and are affected by many assumptions. The same applies to the calculation of the NHL.</p>
<p>In order to consider the inertia of the floor heating, a first order block introduces a delay between the controller output and the heat flow rate. Otherwise, incidetally, there is no delay in the controller loop making the PI controller obslote. Neglecting the intertia, a simple P controller with infinite gain would be sufficient, but is physically not meaningful.</p>
<h4>Initialization</h4>
<p>There are two possible initalization methods for this block, as defined in <a href=\"modelica://Modelica.Blocks.Types.Init\">Modelica.Blocks.Types.Init</a></p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><h4>initType</h4></td>
<td></td>
</tr>
<tr>
<td><p><br><h4>NoInit</h4></p></td>
<td><p>No initialization. States are zero</p></td>
</tr>
<tr>
<td><h4>SteadyState</h4></td>
<td><p>Initialization in steady state</p></td>
</tr>
<tr>
<td><h4>InitialState</h4></td>
<td><p><i><span style=\"color: #7c7c7c;\">Not applicable</span></i></p></td>
</tr>
<tr>
<td><h4>InitialOutput</h4></td>
<td><p><i><span style=\"color: #7c7c7c;\">Not applicable</span></i></p></td>
</tr>
</table>
<ul>
<li><b>NoInit</b>: The system is initialized with <i>states equal to zero</i>. This is equivalent to a switched off system for simulation start. It can be useful to if the start of all components and controllers should be simulated.</li>
<li><b>SteadyState</b>: The system is initialized in steady state. All <i>derivatives are zero</i>, and the states are calculated accordingly.</li>
</ul>
</html>"));
end RoomHeating;
