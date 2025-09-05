within TransiEnt.Examples.DistributionGrids.LowVoltageGrids;
model LV_urban_6 "Contains choices of scenarios Today / Intermediate / Future"

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
//________________________________________________________________________________//  import TransiEnt.Basics.Types.ControlType;
  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------
  parameter String development_scenario="Future" annotation (choices(
      choice="Today" "Today",
      choice="Intermediate" "Intermediate",
      choice="Future" "Future"), Dialog(group="Scenario choice"));

  parameter ControlType photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for photovoltaic system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType batteryControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for battery system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType heatingControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for heating system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter ControlType bevControlType=TransiEnt.Basics.Types.ControlType.Internal "Type of control for vehicle system" annotation (Evaluate=true, Dialog(group="External Control"));

  parameter String weatherLocation="Hamelin" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter String weatherYear="2019" "Choose a weather location to simulate the grid" annotation (Evaluate=true, Dialog(group="Weather"));

  parameter String smartMeterConfiguration="Ideal" "choose the basic configuration" annotation (Dialog(group="Metering"), choices(
      choice="Ideal" "Ideal measurements",
      choice="TAF10" "Tarifanwendungsfall 10 (German standard)",
      choice="TAF7" "Tarifanwendungsfall 7 (German standard)"));


  // ------------------------------------------------------------------------------------------
  //   Components
  // ------------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));

  // ---- LV Grids -------------------------------------------------------------------------------

  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.BaseScenarios.LV_urban_6_Today lV_urban_6_T(
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) if (development_scenario == "Today") annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.BaseScenarios.LV_urban_6_Intermediate lV_urban_6_I(
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) if (development_scenario == "Intermediate") annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  TransiEnt.Examples.DistributionGrids.LowVoltageGrids.BaseScenarios.LV_urban_6_Future lV_urban_6_A(
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) if (development_scenario == "Future") annotation (Placement(transformation(extent={{50,-10},{70,10}})));

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-110,62},{-90,82}})));

  // ------------------------------------------------------------------------------------------
  //   Equations
  // ------------------------------------------------------------------------------------------
equation
  connect(lV_urban_6_T.epp, epp) annotation (Line(
      points={{-60,10.8},{-60,94},{0,94},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_I.epp, epp) annotation (Line(
      points={{0,10.8},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_A.epp, epp) annotation (Line(
      points={{60,10.8},{60,94},{0,94},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_urban_6_T.controlBus, controlBus) annotation();
  connect(lV_urban_6_I.controlBus, controlBus) annotation();
  connect(lV_urban_6_A.controlBus, controlBus) annotation();
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Icon(graphics={
        Ellipse(
          lineColor={28,108,200},
          fillColor=DynamicSelect({255,255,255}, {min(1, max(0, (2 - ((-epp.P - localRenewableProduction.epp.P)/localDemand.epp.P))))*255,min(1, max(0, ((-epp.P - localRenewableProduction.epp.P)/localDemand.epp.P)))*255,0}),
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}},
          lineThickness=0.5),
        Text(
          extent={{-250,-93},{250,-133}},
          lineColor={28,108,200},
          textString="%LV_urban_6"),
        Ellipse(
          extent={{-10,92},{10,72}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-10,82},{10,62}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-4,112},{4,104}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,104},{0,92}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{0,62},{0,52}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,52},{60,52},{60,32}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-28},{36,-48}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{74,36},{82,28}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{72,34},{78,42},{84,34}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-44},{58,-52}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-46},{54,-38},{60,-46}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-26},{58,-34}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-28},{54,-20},{60,-28}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{66,-44},{74,-52}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{64,-46},{70,-38},{76,-46}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{36,36},{44,28}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{34,34},{40,42},{46,34}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-8,-64},{0,-72}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-10,-66},{-4,-58},{2,-66}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-84,16},{-76,8}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-86,14},{-80,22},{-74,14}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-84,-6},{-76,-14}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-86,-8},{-80,0},{-74,-8}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-44,-64},{-36,-72}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-46,-66},{-40,-58},{-34,-66}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,12},{-60,-48}},
          color={28,108,200},
          thickness=0.5,
          pattern=LinePattern.Dot),
        Line(
          points={{-60,-48},{-60,-68},{-44,-68}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-48},{50,-48}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{58,-48},{66,-48}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{60,32},{74,32}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-30},{50,-30}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{44,32},{60,32}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-66},{58,-74}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-68},{54,-60},{60,-68}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-48},{16,-48},{16,-68},{0,-68}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-48},{36,-70},{50,-70}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,12},{-76,12}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-68,12},{-68,-10},{-76,-10}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,52},{-60,12}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{60,32},{60,28},{60,-8},{36,-8},{36,-28}},
          color={28,108,200},
          thickness=0.5,
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>Mit dem Parameter <span style=\"color: #0000ff;\">development_scenario</span> k&ouml;nnen folgende Szenarien f&uuml;r Entwicklungen gew&auml;hlt werden:</p>
<p><span style=\"color: #0000ff;\">Today</span>: heutige Stand der Verteilung von PVs, Batteriespeichern, W&auml;rmepumpen und BEVs in den Netzen (In der Datenbank als Szenario T)</p>
<p><span style=\"color: #0000ff;\">Intermediate</span>: Stand der Verteilung von PVs, Batteriespeichern, W&auml;rmepumpen und BEVs in den Netzen zwischen Today und Future (In der Datenbank als Szenario I)</p>
<p><span style=\"color: #0000ff;\">Future</span>: Stand der Verteilung von PVs, Batteriespeichern, W&auml;rmepumpen und BEVs bei vollst&auml;ndig erreichter Energiewende (In der Datenbank als Szenario A)</p>
<p>Durch die Auswahl des <span style=\"color: #0000ff;\">development_scenario</span> wird in dem LV Netz eines der entsprechend definierten LV_..._T/I/A ausgew&auml;hlt. Die anderen beiden werden unwirksam.</p>
<p><br>Mit dem Parameter <span style=\"color: #00aa00;\">condition_scenario</span> k&ouml;nnen folgende Szenarien f&uuml;r Bedingungen gew&auml;hlt werden:</p>
<p><span style=\"color: #00aa00;\">Normale Bedingungen</span>: Originale Daten </p>
<p><span style=\"color: #00aa00;\">High Simultaneity</span>: Temperatur f&uuml;r das gesamte Jahr um 10K gesenkt. Zudem gibt es eine hohe Gleichzeitigkeit in den BEV Profilen. LV_urban_6 hat in diesem Szenario 10 unterschiedliche BEV Profile. Es sind die ersten 10 originale BEV Profile. Die h&ouml;her nummerierten BEV Profile sind Kopien dieser 10 Originale. Das ist in jeder Datei in der 3.Zeile an der ID zu erkennen.</p>
<p><span style=\"color: #00aa00;\">Kalte Dunkelflaute</span>: Temperatur f&uuml;r das gesamte Jahr um 10K gesenkt. Strahlungsintensit&auml;t(direkt und diffus) mit 0.3 skaliert. Windst&auml;rke mit 0.3 skaliert.</p>
</html>"));
end LV_urban_6;
