within TransiEnt.Consumer.Heat;
model HeatCharacteristicDoublePort "Calculates house supply and return temperature based on outdoor temperature"
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

  //SI.HeatFlowRate Q_flow;
  SI.Temperature T_house;
  SI.Temperature T_supply;
  SI.Temperature T_return;

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortHouse annotation (Placement(
      visible=true,
      transformation(
        origin={100,2},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,2},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortDHN_S annotation (Placement(
      visible=true,
      transformation(
        origin={-100,20},
        extent={{-12,-12},{12,12}},
        rotation=0),
      iconTransformation(
        origin={-100,20},
        extent={{-12,-12},{12,12}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Toutdoor(unit="K") annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,106})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortDHN_R annotation (Placement(transformation(extent={{-110,-30},{-88,-8}}),iconTransformation(extent={{-110,-30},{-88,-8}})));
equation
  if Toutdoor < 5+273.15 then
    T_supply = aS1 * (Toutdoor-273.15) + bS1 + 273.15;
    T_return = aR1 * (Toutdoor-273.15) + bR1 + 273.15;
  elseif Toutdoor < 15+273.15 then
    T_supply = aS2 * (Toutdoor-273.15) + bS2 + 273.15;
    T_return = aR2 * (Toutdoor-273.15) + bR2 + 273.15;
  else
    T_supply = TS_15;
    T_return = TR_15;
  end if;
  //
  heatPortDHN_S.Q_flow = -heatPortHouse.Q_flow;
  //-heatPortHouse.Q_flow = Q_flow;
  //heatPortDHN_R.Q_flow = 0;
  heatPortDHN_S.T = T_supply;
  heatPortDHN_R.T = T_return;
  T_house = heatPortHouse.T;

end HeatCharacteristicDoublePort;
