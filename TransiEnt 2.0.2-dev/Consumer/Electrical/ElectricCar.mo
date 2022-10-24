within TransiEnt.Consumer.Electrical;
model ElectricCar


//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.2                             //
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
// Gas- und Wärme-Institut Essen                                                  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//


  outer TransiEnt.SimCenter simCenter;
  // _____________________________________________
  //
  //              Parameters
  // _____________________________________________

  parameter Real carEfficiency = 18 "[kWh/100km] Average electricity use per kilometer" annotation (Dialog(group="Electric car"));

  parameter Modelica.Units.SI.Energy E_max_car = 252000000 "Battery capacity" annotation (Dialog(group="Electric car"));
  parameter Modelica.Units.SI.Power P_max_car_drive = 200000 "Maximum driving power" annotation (Dialog(group="Electric car"));
  parameter Modelica.Units.SI.Power P_max_car_charge = 22000 "Maximum charging power" annotation (Dialog(group="Electric car"));

  parameter String relativepath_carDistance="emobility/CarDistance.txt" "Path relative to source directory for car distance table" annotation (Dialog(group="Data"));
  parameter String relativepath_carLocation="emobility/CarLocation.txt" "Path relative to source directory for car location table" annotation (Dialog(group="Data"));
  parameter Real timeStepSize(unit="min")=1 "Time step size of distance travelled" annotation (Dialog(group="Data"));

  parameter Integer column_Location=1 "Table column for car location data" annotation (Dialog(group="Data"));
  parameter Integer column_Distance=1 "Table column for car distance data" annotation (Dialog(group="Data"));

  parameter Modelica.Units.SI.Power P_chargingStation = 11000 "Charging Power of the charging station" annotation (Dialog(group="Charging station"));
  parameter Boolean ChargeAtWork=true annotation (Dialog(group="Charging - Select if car ist charged at different locations than home. Charging power will not be accounted for but will reduce charging load at home. Locations need to be specified in Input table", joinNext=true),choices(checkBox=true));
  parameter Boolean ChargeAtSchool=false annotation (Dialog(group="Charging - Select if car ist charged at different locations than home. Charging power will not be accounted for but will reduce charging load at home. Locations need to be specified in Input table", joinNext=true),choices(checkBox=true));
  parameter Boolean ChargeAtShopping=false annotation (Dialog(group="Charging - Select if car ist charged at different locations than home. Charging power will not be accounted for but will reduce charging load at home. Locations need to be specified in Input table", joinNext=true),choices(checkBox=true));
  parameter Boolean ChargeAtOther=false annotation (Dialog(group="Charging - Select if car ist charged at different locations than home. Charging power will not be accounted for but will reduce charging load at home. Locations need to be specified in Input table"),choices(checkBox=true));

  parameter Boolean useExternalControl = simCenter.useExternalControl "Checkbox to enable external load control"  annotation (
      Evaluate=true,
      HideResult=true,
      choices(checkBox=true),
      Dialog(group="Load Management"));
  parameter String controlType = simCenter.controlType "Load control method" annotation (
       Dialog(enable=useExternalControl, group="Load Management"),
       choices(choice="limit",
               choice="proportional"));

  // _____________________________________________
  //
  //              Variables
  // _____________________________________________

   Real carLoc "Number representing car location (1=Home)";
   Real derLoc "Derivative of car location";
   Boolean carHome "True, if car is parked at home";
   Modelica.Units.SI.Power P_driving "Current consumption of driving car";


  // _____________________________________________
  //
  //              Complex Components
  // _____________________________________________

  TransiEnt.Components.Boundaries.Electrical.ApparentPower.ApparentPower powerToGrid(
    useInputConnectorQ=false,
    Q_el_set_const=0,
    useCosPhi=false)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={62,-78})));

  TransiEnt.Storage.Electrical.LithiumIonBattery carBattery(
    use_PowerRateLimiter=true,
    redeclare model StorageModel = TransiEnt.Storage.Base.GenericStorageHyst,
    StorageModelParams=TransiEnt.Storage.Electrical.Specifications.LithiumIon(
        E_start=E_max_car,
        E_max=E_max_car,
        E_min=0.3*E_max_car,
        P_max_unload=P_max_car_drive,
        P_max_load=P_max_car_charge,
        selfDischargeRate=0))
    annotation (Placement(transformation(extent={{80,-2},{44,34}})));
  Modelica.Blocks.Sources.RealExpression P_batteryToGrid(y=if noEvent(carHome)
         then -carPowerBoundary.epp.P else 0)  annotation (Placement(transformation(extent={{2,-68},{54,-44}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency carPowerBoundary(
      useInputConnector=false) annotation (Placement(transformation(extent={{34,24},{18,8}})));

  Modelica.Blocks.Math.Min min1 if   useExternalControl and controlType == "limit"  annotation (Placement(transformation(extent={{-44,4},{-24,24}})));
  Modelica.Blocks.Math.Product product1 if  useExternalControl and controlType == "proportional" annotation (Placement(transformation(extent={{-44,-30},{-24,-10}})));
  Modelica.Blocks.Sources.RealExpression chargingStationNormPower(y=P_chargingStation)  annotation (Placement(transformation(extent={{-94,-10},{-68,10}})));
  Modelica.Blocks.Logical.Switch P_set_battery  annotation (Placement(transformation(extent={{54,78},{74,58}})));
  Modelica.Blocks.Sources.RealExpression chargingStationPower(y=P_chargingStation) if not useExternalControl annotation (Placement(transformation(extent={{12,28},{38,46}})));
  Modelica.Blocks.Sources.RealExpression drivingPower(y=P_driving)  annotation (Placement(transformation(extent={{8,80},{42,100}})));


  Modelica.Blocks.MathBoolean.Or charging(nu=5) annotation (Placement(transformation(extent={{6,60},{24,78}})));
  Modelica.Blocks.Sources.BooleanExpression presence(y=carHome) annotation (Placement(transformation(extent={{-40,84},{-20,100}})));
  Modelica.Blocks.Sources.BooleanExpression school(y=if ChargeAtSchool then (abs(4 - carLoc) < 0.5 and (abs(derLoc) < 0.01)) else false) annotation (Placement(transformation(extent={{-40,48},{-20,64}})));
  Modelica.Blocks.Sources.BooleanExpression shopping(y=if ChargeAtShopping then (abs(2 - carLoc) < 0.5 and (abs(derLoc) < 0.01)) else false) annotation (Placement(transformation(extent={{-40,72},{-20,88}})));
  Modelica.Blocks.Sources.BooleanExpression event(y=if ChargeAtOther then (abs(3 - carLoc) < 0.5 and (abs(derLoc) < 0.01)) else false) annotation (Placement(transformation(extent={{-40,60},{-20,76}})));
  Modelica.Blocks.Sources.BooleanExpression work(y=if ChargeAtWork then (abs(5 - carLoc) < 0.5 and (abs(derLoc) < 0.01)) else false) annotation (Placement(transformation(extent={{-40,36},{-20,54}})));

   TransiEnt.Basics.Tables.ElectricGrid.Electromobility.CarDistanceTable carDistance(
    multiple_outputs=true,
    columns={column_Distance + 1}, relativepath=relativepath_carDistance) annotation (Placement(transformation(extent={{-94,64},{-74,84}})));

  TransiEnt.Basics.Tables.ElectricGrid.Electromobility.CarLocationTable carLocation(
    multiple_outputs=true,
    columns={column_Location + 1},  relativepath=relativepath_carLocation) annotation (Placement(transformation(extent={{-96,-80},{-76,-60}})));


  // _____________________________________________
  //
  //              Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.RealInput P_limit if  useExternalControl and controlType == "limit"  "Interface for Load Regulation" annotation (Placement(transformation(extent={{-128,10},
            {-88,50}})));
  Modelica.Blocks.Interfaces.RealInput p_control if useExternalControl and controlType == "proportional" "Interface for Load Regulation" annotation (Placement(transformation(extent={{-126,
            -52},{-86,-12}})));
  TransiEnt.Basics.Interfaces.Electrical.ApparentPowerPort epp annotation (Placement(transformation(extent={{90,-10},{110,10}})));

equation

  carLoc = carLocation.y[1];
  derLoc = if carLocation.smoothness == Modelica.Blocks.Types.Smoothness.ConstantSegments then 0 else der(carLoc);
  carHome = abs(1 - carLoc) < 0.5 and (abs(derLoc) < 0.01);
  P_driving = -carEfficiency/100 * carDistance.y[1] * 60 / timeStepSize;

  connect(carPowerBoundary.epp, carBattery.epp) annotation (Line(
      points={{34,16},{44,16}},
      color={0,135,135},
      thickness=0.5));
  connect(powerToGrid.epp, epp) annotation (Line(
      points={{72,-78},{86,-78},{86,0},{100,0}},
      color={0,127,0},
      thickness=0.5));
  connect(P_batteryToGrid.y, powerToGrid.P_el_set)
    annotation (Line(points={{56.6,-56},{68,-56},{68,-66}}, color={0,0,127}));
  connect(P_limit,min1. u1) annotation (Line(points={{-108,30},{-54,30},{-54,20},{-46,20}},       color={0,0,127}));
  connect(p_control, product1.u2) annotation (Line(points={{-106,-32},{-54,-32},{-54,-26},{-46,-26}},       color={0,0,127}));
  connect(chargingStationNormPower.y, product1.u1) annotation (Line(points={{-66.7,0},{-52,0},{-52,-14},{-46,-14}},                                     color={0,0,127}));
  connect(chargingStationNormPower.y,min1. u2) annotation (Line(points={{-66.7,0},{-52,0},{-52,8},{-46,8}},         color={0,0,127}));
  connect(P_set_battery.y, carBattery.P_set)
    annotation (Line(points={{75,68},{74,68},{74,38},{62,38},{62,32.92}},
                                                          color={0,0,127}));
  connect(min1.y, P_set_battery.u1) annotation (Line(points={{-23,14},{-16,14},{-16,26},{-2,26},{-2,50},{46,50},{46,60},{52,60}},
                           color={0,0,127}));
  connect(product1.y, P_set_battery.u1) annotation (Line(points={{-23,-20},{-16,-20},{-16,26},{-2,26},{-2,50},{46,50},{46,60},{52,60}},
                                 color={0,0,127}));
  connect(chargingStationPower.y, P_set_battery.u1) annotation (Line(points={{39.3,37},{46,37},{46,60},{52,60}},
                                             color={0,0,127}));
  connect(drivingPower.y, P_set_battery.u3) annotation (Line(points={{43.7,90},{50,90},{50,82},{52,82},{52,76}},
                                    color={0,0,127}));
  connect(presence.y, charging.u[1]) annotation (Line(points={{-19,92},{-2,92},{-2,74.04},{6,74.04}}, color={255,0,255}));
  connect(school.y, charging.u[2]) annotation (Line(points={{-19,56},{-8,56},{-8,66},{6,66},{6,71.52}}, color={255,0,255}));
  connect(event.y, charging.u[3]) annotation (Line(points={{-19,68},{6,68},{6,69}},    color={255,0,255}));
  connect(shopping.y, charging.u[4]) annotation (Line(points={{-19,80},{-4,80},{-4,70},{6,70},{6,66.48}}, color={255,0,255}));
  connect(work.y, charging.u[5]) annotation (Line(points={{-19,45},{-6,45},{-6,64},{6,64},{6,63.96}}, color={255,0,255}));
  connect(charging.y, P_set_battery.u2) annotation (Line(points={{25.35,69},{40,69},{40,68},{52,68}}, color={255,0,255}));
  annotation (
      Diagram(graphics={
        Line(
          points={{-58,-78}},
          color={28,108,200},
          pattern=LinePattern.Dot),
        Line(
          points={{26,4},{26,-4},{26,-8},{26,-16},{26,-40}},
          color={0,0,0},
          pattern=LinePattern.Dot,
          arrow={Arrow.None,Arrow.Filled})}),
    Icon(graphics={
        Line(points={{20,-28}}, color={0,0,0}),
        Polygon(
          points={{-70,-12},{42,-12},{52,-40},{-80,-40},{-70,-12}},
          lineColor={238,46,47},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{10,-26},{38,-54}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-66,-26},{-38,-54}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-44,16},{8,14},{28,-12},{-54,-12},{-44,16}},
          lineColor={238,46,47},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Line(points={{92,0},{72,-4},{66,-8},{64,-16},{60,-20},{52,-22},{46,-22},
              {38,-20}}, color={0,0,0}),
        Rectangle(
          extent={{34,-18},{38,-22}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0})}),
    experiment(StopTime=0, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>Simple model of an electric car battery. Table-based profiles of the car location and the kilometers driven determine the state-of-charge of the car. When the car ist home, it will charge from the grid. It can be selected wheather charging will occur only at home or also at other places, thus affecting the state-of-charge. </p>
<p>The wall box charging power can be externally controlled by reducing the charging power proportionally or by setting a fixed maximum charging power.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>epp: apparent power port</p>
<p>optional: RealInput P_limit or p_control for external load management.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Dorian H&ouml;ffner, Fraunhofer UMSICHT in December 2021</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model modified by Anne Hagemeier, Fraunhofer UMSICHT, in June 2022</span></p>
</html>"));
end ElectricCar;
