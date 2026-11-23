within TransiEnt.Producer.Heat.Power2Heat.Heatpump;
model DHN_HeatGenerationUnit

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
// Gas- und Wärme-Institut Essen                                                  //
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
  //             Visible Parameters
  // _____________________________________________

  parameter SI.PressureDifference dp=1.2e5 "Min. pressure difference between supply and return at the network control point";
  parameter String relativepath_1 = "/ambient/T_outdoor_24h.txt" "Relative path to the outdoor temperature file";
  parameter String relativepath_2 = "/ambient/soil_temp_dym.txt" "Relative path to the soil temperature file";
  final parameter String path_1 = TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable("public-data") + relativepath_1);
  final parameter String path_2 = TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable("public-data") + relativepath_2);

  // _____________________________________________
  //
  //             Instances of other classes
  // _____________________________________________

  Modelica.Blocks.Sources.RealExpression ConstantPressure(y=1.5e5) annotation (Placement(transformation(extent={{244,-32},{224,-12}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink sink annotation (Placement(transformation(extent={{214,-32},{194,-12}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple
                         inlet annotation (Placement(
      visible=true,
      transformation(
        origin={160,100},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,-62},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple
                          outlet annotation (Placement(
      visible=true,
      transformation(
        origin={122,100},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={98,60},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.CombiTimeTable T_outdoor(
    tableOnFile=true,
    tableName="tab1",
    fileName=path_1,
    timeScale=3600,
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-58,-30})));
  Modelica.Blocks.Math.Gain gain(k=4183) annotation (Placement(transformation(extent={{-36,-40},{-16,-20}})));
  Modelica.Blocks.Sources.CombiTimeTable soilTemperature(
    tableOnFile=true,
    tableName="tab1",
    fileName=path_2,
    timeScale=3600,
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-62,88})));
  Modelica.Blocks.Interfaces.RealOutput soilTemp(final quantity="Temperature", final unit="K", displayUnit="degC")   annotation (Placement(transformation(extent={{-24,66},{-4,86}},  rotation=0)));
  Modelica.Blocks.Sources.RealExpression PressureDifference(y=dp)    annotation (Placement(transformation(extent={{-80,34},{-60,54}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10,
    Ti=1000,
    yMax=1000e5,
    yMin=0.0000001)
                 annotation (Placement(transformation(extent={{-48,34},{-28,54}})));
  Modelica.Blocks.Interfaces.RealInput dp1 "Pressure difference from the consumer at the network control point"
                                          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput h_in "Set value for the specific enthalpy of the supply (calculated from the supply temperature)"
    annotation (Placement(transformation(extent={{-120,-100},{-80,-60}})));
  TransiEnt.Components.Heat.SimplePump_dp simplePump_dp annotation (Placement(transformation(extent={{96,18},{116,38}})));
 Modelica.Blocks.Sources.RealExpression SetTemperature4(y=h_in/4183 + 273.15)
                                                                            annotation (
   Placement(visible = true, transformation(origin={34,6},     extent = {{10, -10}, {-10, 10}}, rotation=180)));
 Modelica.Blocks.Sources.RealExpression Q_flow_set(y=producer.inlet.m_flow*(h_in - inStream(producer.inlet.h_outflow))) annotation (Placement(visible=true, transformation(
        origin={34,-16},
        extent={{10,-10},{-10,10}},
        rotation=180)));
 Modelica.Blocks.Sources.RealExpression PressureDifference_Unused(y=0.0) annotation (Placement(visible=true, transformation(
        origin={110,2},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ElectricBoiler.ElectricBoiler_Simple electricBoiler                               annotation (Placement(transformation(extent={{68,12},{88,32}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.Heatpump_DHN_HeatLimited producer(COP_n=3.5, Q_flow_max_const(displayUnit="MW") = 20000000) annotation (Placement(transformation(extent={{68,-26},{88,-6}})));
equation
  // _____________________________________________
  //
  //         Characteristic Equations
  // _____________________________________________

  connect(sink.p_in, ConstantPressure.y) annotation (Line(points={{212,-22},{223,-22}}, color={0,0,127}));
  connect(inlet, inlet) annotation (Line(points={{160,100},{160,100}},
                                                                     color={0,0,0}));
  connect(sink.port_a, inlet) annotation (Line(points={{194,-22},{160,-22},{160,100}},color={0,0,0}));
  connect(outlet, outlet) annotation (Line(points={{122,100},{122,100}},
                                                                     color={0,0,0}));
  connect(PressureDifference.y, PID.u_s) annotation (Line(points={{-59,44},{-50,44}}, color={0,0,127}));
  connect(PID.u_m, dp1) annotation (Line(points={{-38,32},{-38,0},{-100,0}},        color={0,0,127}));
  connect(simplePump_dp.outlet, outlet) annotation (Line(points={{116.2,28},{122,28},{122,100}},        color={0,0,0}));
  connect(PID.y, simplePump_dp.delta_p) annotation (Line(points={{-27,44},{106,44},{106,38}},                                        color={0,0,127}));
  connect(electricBoiler.outlet, simplePump_dp.inlet) annotation (Line(points={{87.8,28},{95.8,28}}, color={0,0,0}));
  connect(h_in, electricBoiler.h_in) annotation (Line(points={{-100,-80},{54,-80},{54,22},{70,22}}, color={0,0,127}));
  connect(Q_flow_set.y, producer.Q_flow_set) annotation (Line(points={{45,-16},{70,-16}}, color={0,0,127}));
  connect(PressureDifference_Unused.y, producer.dp) annotation (Line(points={{99,2},{78,2},{78,-6}}, color={0,0,127}));
  connect(producer.inlet, sink.port_a) annotation (Line(points={{88,-22.2},{184,-22.2},{184,-22},{194,-22}}, color={0,0,0}));
  connect(producer.outlet, electricBoiler.inlet) annotation (Line(points={{87.8,-10},{92,-10},{92,15.8},{88,15.8}}, color={0,0,0}));
  connect(SetTemperature4.y, producer.T_set_variable) annotation (Line(points={{45,6},{74,6},{74,-6}},               color={0,0,127}));
  connect(T_outdoor.y[1], gain.u) annotation (Line(points={{-47,-30},{-38,-30}},
                                                                              color={0,0,127}));
  connect(soilTemperature.y[1], soilTemp) annotation (Line(points={{-51,88},{-26,88},{-26,76},{-14,76}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{280,100}}), graphics={
                     Rectangle(fillColor = {85, 85, 0}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-100}})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{280,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">Purpose of model</span></h4>
<p>A model of a heat generation unit, which contains a heat pump and an electric boiler, that are connected in series. Furthermore, it contains a circulation pump that sets the pressure difference between supply and return of the DHN. There are two inputs for this model: One is the specific enthalpy that is set in the supply pipes and the other one is the pressure difference at the network control point (a consumer far away from the heat generators). Moreover, it contains two combiTimeTables: One with the data of the soil temperature and one with the data of the outdoor temperature used for the simulation of the generated district heating network of a suburb of Hamburg. This model has been created for the simulation of the DHN_Rissen model and is used in that model: TransiEnt.Examples.Heat.DHN_Rissen</p>
<h4><span style=\"color: #008000\">Version History</span></h4>
<p>Model was created by Jan Westphal (j.westphal@tuhh.de) November 2026</p>
</html>"));
end DHN_HeatGenerationUnit;
