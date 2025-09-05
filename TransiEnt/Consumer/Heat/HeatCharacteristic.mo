within TransiEnt.Consumer.Heat;
model HeatCharacteristic "Calculates house return temperature based on outdoor temperature"

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

  SI.HeatFlowRate Q_flow;
  SI.Temperature T_house;

  // _____________________________________________
  //
  //          Interfaces
  // _____________________________________________

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortHouse annotation (
    Placement(visible = true, transformation(origin={100,2},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={100,2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortDHN_R annotation (
  Placement(visible = true, transformation(origin={-97,1},    extent={{-11,-11},{11,11}},      rotation = 0), iconTransformation(origin={-97,1},    extent={{-11,-11},{11,11}},      rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Toutdoor(unit="K") annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,106})));
equation

  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

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
  annotation (Icon(graphics={
        Line(points={{-68,74},{-68,-72},{88,-72}}, color={28,108,200}),
        Line(points={{-76,62},{-68,76},{-60,62}}, color={28,108,200}),
        Line(points={{-56,8},{8,8},{60,50}}, color={28,108,200}),
        Line(points={{-54,-36},{28,-36},{62,-24}}, color={28,108,200}),
        Line(points={{78,-64},{88,-72},{78,-80}}, color={28,108,200})}), Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of heat characteristics of the dwelling system for a building. The supply and the return temperature is calculated in dependence of the ambient temperature. The heat flow rate is passed from one heat port to the other.</p>
<h4><span style=\"color: #008000\">Level of detail, physical effects considered, and physical insight</span></h4>
<p>No physical effects are considered. It is a purely technical component for setting the correct temperatures at the heat ports.</p>
<h4><span style=\"color: #008c48\">References</span></h4>
<p>The model was used in the following publication:</p>
<p>[1]Vieth, J.; Westphal, J.; Speerforck, A.; District heating network topology optimization and optimal co-planning using dynamic simulations; Advances in Applied Energy; 2025</p>
<h4><span style=\"color: #008c48\">Version History</span></h4>
<p>Model was inserted by Jan Westphal (j.westphal@tuhh.de) August 2025</p>
</html>"));
end HeatCharacteristic;
