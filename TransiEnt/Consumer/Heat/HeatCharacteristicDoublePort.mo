within TransiEnt.Consumer.Heat;
model HeatCharacteristicDoublePort "Calculates house supply and return temperature based on outdoor temperature"

//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.3                             //
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

  // _____________________________________________
  //
  //          Import and Hierachy
  // _____________________________________________

  import         Modelica.Units.SI;

  // _____________________________________________
  //
  //          Visible Parameters
  // _____________________________________________
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

  // _____________________________________________
  //
  //          Variables
  // _____________________________________________


  SI.Temperature T_house;
  SI.Temperature T_supply;
  SI.Temperature T_return;

  // _____________________________________________
  //
  //          Interfaces
  // _____________________________________________

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
        origin={-99,21},
        extent={{-11,-11},{11,11}},
        rotation=0),
      iconTransformation(
        origin={-99,21},
        extent={{-11,-11},{11,11}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Toutdoor(unit="K") annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,106})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortDHN_R annotation (Placement(transformation(extent={{-110,-30},{-88,-8}}),iconTransformation(extent={{-110,-30},{-88,-8}})));
equation
  // _____________________________________________
  //
  //          Characteristic Equations
  // _____________________________________________


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

  annotation (Icon(graphics={
        Line(points={{-72,76},{-72,-70},{84,-70}}, color={28,108,200}),
        Line(points={{-80,64},{-72,78},{-64,64}}, color={28,108,200}),
        Line(points={{-60,10},{4,10},{56,52}}, color={28,108,200}),
        Line(points={{-58,-34},{24,-34},{58,-22}}, color={28,108,200}),
        Line(points={{74,-62},{84,-70},{74,-78}}, color={28,108,200})}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of heat characteristics of the dwelling system for a building. The supply and the return temperature is calculated in dependence of the ambient temperature. The heat flow rate is passed from one heat port to the other.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>No physical effects are considered. It is a purely technical component for setting the correct temperatures at the heat ports.</p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model was used in this model:</p>
<p>TransiEnt.Consumer.Heat.Consumer_LowTemperatureDHN</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end HeatCharacteristicDoublePort;
