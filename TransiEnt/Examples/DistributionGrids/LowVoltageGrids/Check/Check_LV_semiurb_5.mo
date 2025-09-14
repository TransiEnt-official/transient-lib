within TransiEnt.Examples.DistributionGrids.LowVoltageGrids.Check;
model Check_LV_semiurb_5

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

  extends TransiEnt.Basics.Icons.Checkmodel;
  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter String development_scenario="Intermediate"
                                                 "Choose technolgy penetration"  annotation (choices(
      choice="Today" "Today",
      choice="Intermediate" "Intermediate",
      choice="Future" "Future"), Dialog(group="Scenario choice"));

  parameter String weatherLocation="Hamelin"
                                            "Choose location of the applied weather data"   annotation (Dialog(group="Scenario choice"));

  parameter String weatherYear="2019" "Choose year of the applied weather data" annotation (Dialog(group="Scenario choice"));

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

  Components.Boundaries.Electrical.ComplexPower.SlackBoundary
                                                          electricGrid_1(v_gen=10e3, f_n=50)
                          annotation (Placement(transformation(extent={{32.07,31.9},{47.07,46.9}})));

  // ---- LV Grids -------------------------------------------------------------------------------

  LV_semiurb_5 lV_semiurb_5_1(
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    development_scenario=development_scenario,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration)            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

  // ------------------------------------------------------------------------------------------
  //   Equations
  // ------------------------------------------------------------------------------------------
equation
  connect(lV_semiurb_5_1.epp, electricGrid_1.epp) annotation (Line(
      points={{0,10.8},{0,39.4},{32.07,39.4}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_semiurb_5_1.controlBus, controlBus) annotation();
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-100,100},{100,80}},
          textColor={0,0,0},
          textString="Select Parameters for Weather Boundaries,Technologie Mix and Control Properties
of the unterlying grids"),
        Rectangle(
          extent={{-46,16},{20,-18}},
          lineColor={28,108,200},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{-44,-6},{-16,-18}},
          textColor={28,108,200},
          textString="LV Grid"),
        Text(
          extent={{-80,20},{-60,0}},
          textColor={244,125,35},
          textString="Control Bus 
Interface
look at Text
for Definition"),
        Rectangle(
          extent={{-80,40},{-60,0}},
          lineColor={255,204,51},
          pattern=LinePattern.Dash,
          lineThickness=0.5)}),
    experiment(
      StopTime=86400,
      Tolerance=0.001,
      __Dymola_Algorithm="Cvode"));
end Check_LV_semiurb_5;
