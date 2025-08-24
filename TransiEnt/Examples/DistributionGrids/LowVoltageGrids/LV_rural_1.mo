within TransiEnt.Examples.DistributionGrids.LowVoltageGrids;
model LV_rural_1 "Contains choices of scenarios Today / Intermediate / Future and Normale Bedingungen / High Simultaneity / Kalte Dunkelflaute"
  import TransiEnt.Basics.Types.ControlType;
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
  //   Interface part
  // ------------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp annotation (Placement(transformation(extent={{-10,98},{10,118}})));
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-110,40},{-90,60}})));
  // ------------------------------------------------------------------------------------------
  //   Component part
  // ------------------------------------------------------------------------------------------

  BaseScenarios.LV_rural_1_Today lV_rural_1_Today(
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) if (development_scenario == "Today") annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  BaseScenarios.LV_rural_1_Intermediate lV_rural_1_Intermediate(
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) if (development_scenario == "Intermediate") annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BaseScenarios.LV_rural_1_Future lV_rural_1_Future(
    photovoltaicControlType=photovoltaicControlType,
    batteryControlType=batteryControlType,
    heatingControlType=heatingControlType,
    bevControlType=bevControlType,
    weatherLocation=weatherLocation,
    weatherYear=weatherYear,
    smartMeterConfiguration=smartMeterConfiguration) if (development_scenario == "Future") annotation (Placement(transformation(extent={{50,-10},{70,10}})));

equation
  connect(lV_rural_1_Today.epp, epp) annotation (Line(
      points={{-60,10.8},{-60,94},{0,94},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_Intermediate.epp, epp) annotation (Line(
      points={{0,10.8},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_Future.epp, epp) annotation (Line(
      points={{60,10.8},{60,94},{0,94},{0,108}},
      color={28,108,200},
      thickness=0.5));
  connect(lV_rural_1_Today.controlBus, controlBus) annotation();
  connect(lV_rural_1_Intermediate.controlBus, controlBus) annotation();
  connect(lV_rural_1_Future.controlBus, controlBus) annotation();
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
          textString="%LV_rural_1"),
        Ellipse(
          extent={{-10,88},{10,68}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-10,78},{10,58}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-4,108},{4,100}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,100},{0,88}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{0,58},{0,48}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,48},{60,48},{60,28}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-32},{36,-52}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{74,32},{82,24}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{72,30},{78,38},{84,30}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-48},{58,-56}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-50},{54,-42},{60,-50}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-30},{58,-38}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-32},{54,-24},{60,-32}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{66,-48},{74,-56}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{64,-50},{70,-42},{76,-50}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{36,32},{44,24}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{34,30},{40,38},{46,30}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-8,-68},{0,-76}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-10,-70},{-4,-62},{2,-70}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-84,12},{-76,4}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-86,10},{-80,18},{-74,10}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-84,-10},{-76,-18}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-86,-12},{-80,-4},{-74,-12}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-44,-68},{-36,-76}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-46,-70},{-40,-62},{-34,-70}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,8},{-60,-52}},
          color={28,108,200},
          thickness=0.5,
          pattern=LinePattern.Dot),
        Line(
          points={{-60,-52},{-60,-72},{-44,-72}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-52},{50,-52}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{58,-52},{66,-52}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{60,28},{74,28}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-34},{50,-34}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{44,28},{60,28}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{50,-70},{58,-78}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{48,-72},{54,-64},{60,-72}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-52},{16,-52},{16,-72},{0,-72}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{36,-52},{36,-74},{50,-74}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,8},{-76,8}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-68,8},{-68,-14},{-76,-14}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-60,48},{-60,8}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{60,28},{60,24},{60,-12},{36,-12},{36,-32}},
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
<p><span style=\"color: #00aa00;\">High Simultaneity</span>: Temperatur f&uuml;r das gesamte Jahr um 10K gesenkt.  Zudem gibt es eine hohe Gleichzeitigkeit in den BEV Profilen. LV_rural_1 hat in diesem Szenario 5 unterschiedliche BEV Profile. Es sind die ersten 5 originale BEV Profile. Die h&ouml;her nummerierten BEV Profile sind Kopien dieser 5 Originale. Das ist in jeder Datei in der 3.Zeile an der ID zu erkennen.</p>
<p><span style=\"color: #00aa00;\">Kalte Dunkelflaute</span>: Temperatur f&uuml;r das gesamte Jahr um 10K gesenkt. Strahlungsintensit&auml;t(direkt und diffus) mit 0.3 skaliert. Windst&auml;rke mit 0.3 skaliert.</p>
</html>"));
end LV_rural_1;
