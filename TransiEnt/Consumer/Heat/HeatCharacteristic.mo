within TransiEnt.Consumer.Heat;
model HeatCharacteristic "Calculates house return temperature based on outdoor temperature"
  import         Modelica.Units.SI;
  parameter Real aS1 = -0.8 "first coefficient of supply temperature for outdoor temperatures lower 5°C";
  parameter Real bS1 = 50 "second coefficient of supply temperature for outdoor temperatures lower 5°C";
  parameter Real aS2 = -0.1 "first coefficient of supply temperature for outdoor temperatures lower 15°C";
  parameter Real bS2 = 46.5 "second coefficient of supply temperature for outdoor temperatures lower 15°C";
  parameter Real aR1 = -0.6 "first coefficient of supply temperature for outdoor temperatures lower 5°C";
  parameter Real bR1 = 35 "second coefficient of supply temperature for outdoor temperatures lower 5°C";
  parameter Real aR2 = -0.2 "first coefficient of supply temperature for outdoor temperatures lower 15°C";
  parameter Real bR2 = 33 "second coefficient of supply temperature for outdoor temperatures lower 15°C";
  parameter SI.Temperature TS_15 = 45 + 273.15 "supply temperature at 15 °C outdoor temperature";
  parameter SI.Temperature TR_15 = 30 + 273.15 "return temperature at 15 °C outdoor temperature";

  SI.HeatFlowRate Q_flow;
  SI.Temperature T_house;

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortHouse annotation (
    Placement(visible = true, transformation(origin={100,2},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={100,2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortDHN_R annotation (
  Placement(visible = true, transformation(origin={-100,-22}, extent={{-14,-14},{14,14}},      rotation = 0), iconTransformation(origin={-100,-22}, extent={{-14,-14},{14,14}},      rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Toutdoor(unit="K") annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,106})));
equation
  if Toutdoor < 5+273.15 then
    heatPortDHN_R.T = aR1 * (Toutdoor-273.15) + bR1 + 273.15;
  elseif Toutdoor < 15+273.15 then
    heatPortDHN_R.T = aR2 * (Toutdoor-273.15) + bR2 + 273.15;
  else
    heatPortDHN_R.T = TR_15;
  end if;
  //
  Q_flow = -heatPortHouse.Q_flow;
  Q_flow = heatPortDHN_R.Q_flow;
  T_house = heatPortHouse.T;
end HeatCharacteristic;
