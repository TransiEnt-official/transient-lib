within TransiEnt.Consumer.Heat.SpaceHeating.Check;
model Check_Heating

  extends TransiEnt.Basics.Icons.Checkmodel;

  TransiEnt.Components.Boundaries.Electrical.ComplexPower.SlackBoundary
                                                          electricGrid_1(v_gen=400, f_n=50)
                            annotation (Placement(transformation(extent={{74.2,
            -49.73},{89.2,-34.73}})));
  inner TransiEnt.SimCenter simCenter
    annotation (Placement(transformation(extent={{-86,78},{-66,98}})));
  Modelica.Blocks.Sources.RealExpression T_start(y=273.15 + 15)
    annotation (Placement(transformation(extent={{-92,44},{-68,64}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=-6,
    duration=1800,
    startTime=20000)
    annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  Modelica.Blocks.Sources.Ramp ramp2(
    height=-10,
    duration=ramp1.duration,
    startTime=ramp1.startTime + 20000)
    annotation (Placement(transformation(extent={{-90,-12},{-70,8}})));
  Modelica.Blocks.Sources.Ramp ramp3(
    height=-5,
    duration=ramp2.duration,
    startTime=ramp2.startTime + 20000)
    annotation (Placement(transformation(extent={{-90,-46},{-70,-26}})));
  Modelica.Blocks.Sources.Ramp ramp4(
    height=-7,
    duration=ramp3.duration,
    startTime=ramp3.startTime + 20000)
    annotation (Placement(transformation(extent={{-90,-80},{-70,-60}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-54,-46},{-34,-26}})));
  Modelica.Blocks.Math.Add3 T_amb
    annotation (Placement(transformation(extent={{-20,-6},{0,14}})));
  Modelica.Blocks.Sources.RealExpression P_limit(y=1500)
    annotation (Placement(transformation(extent={{-14,-48},{10,-28}})));
  Heating heating_External_P(
    Q_HP(displayUnit="kW") = 8000,
    A_living=200,
    A_wall=300,
    A_window=50,
    A_roof=200,
    A_ground=200,
    V_air=600,
    U_wall=0.3,
    U_window=1,
    U_roof=0.2,
    U_ground=0.3,
    thermalMass=30e6,
    T_buffer_set=333.15,
    controlType=TransiEnt.Basics.Types.ControlType.External_P,

    busActive=true,
    initType=Modelica.Blocks.Types.Init.NoInit,
    useTappingCycles=false)
    annotation (Placement(transformation(extent={{42,46},{62,66}})));

  Modelica.Blocks.Sources.BooleanStep SignalActive1(startTime=3600)
    annotation (Placement(transformation(extent={{-20,44},{-6,58}})));
  Modelica.Blocks.Sources.Ramp           P_external(
    height=0,
    duration=3000,
    offset=2e3,
    startTime=3600)
    annotation (Placement(transformation(extent={{-26,76},{-2,96}})));

  Modelica.Blocks.Sources.Step step_T_room(
    height=2,
    offset=0,
    startTime=3600*12)
    annotation (Placement(transformation(extent={{-22,-64},{-8,-50}})));
  Modelica.Blocks.Sources.Step step_T_buffer(
    height=10,
    offset=0,
    startTime=3600*6)
    annotation (Placement(transformation(extent={{-22,-90},{-8,-76}})));

  Heating heating_Internal(
    Q_HP(displayUnit="kW") = 8000,
    A_living=200,
    A_wall=300,
    A_window=50,
    A_roof=200,
    A_ground=200,
    V_air=600,
    U_wall=0.3,
    U_window=1,
    U_roof=0.2,
    U_ground=0.3,
    thermalMass=30e6,
    T_buffer_set=333.15,
    controlType=TransiEnt.Basics.Types.ControlType.Internal,

    busActive=false,
    initType=Modelica.Blocks.Types.Init.NoInit,
    useTappingCycles=false)
    annotation (Placement(transformation(extent={{42,6},{62,26}})));

  Heating heating_Limit_P(
    Q_HP(displayUnit="kW") = 8000,
    A_living=200,
    A_wall=300,
    A_window=50,
    A_roof=200,
    A_ground=200,
    V_air=600,
    U_wall=0.3,
    U_window=1,
    U_roof=0.2,
    U_ground=0.3,
    thermalMass=30e6,
    T_buffer_set=333.15,
    controlType=TransiEnt.Basics.Types.ControlType.Limit_P,
    busActive=true,
    initType=Modelica.Blocks.Types.Init.NoInit,
    useTappingCycles=false)
    annotation (Placement(transformation(extent={{42,-78},{62,-58}})));
protected
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (
      Placement(transformation(extent={{24,46},{32,54}}), iconTransformation(
          extent={{24,46},{32,54}})));
protected
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus1 annotation (
      Placement(transformation(extent={{26,-80},{34,-72}}), iconTransformation(
          extent={{24,46},{32,54}})));
equation
  connect(ramp4.y, add3_1.u3) annotation (Line(points={{-69,-70},{-60,-70},{-60,
          -44},{-56,-44}}, color={0,0,127}));
  connect(ramp3.y, add3_1.u2)
    annotation (Line(points={{-69,-36},{-56,-36}}, color={0,0,127}));
  connect(ramp2.y, add3_1.u1) annotation (Line(points={{-69,-2},{-60,-2},{-60,
          -28},{-56,-28}}, color={0,0,127}));
  connect(T_start.y, T_amb.u1) annotation (Line(points={{-66.8,54},{-30,54},{-30,
          12},{-22,12}}, color={0,0,127}));
  connect(ramp1.y, T_amb.u2) annotation (Line(points={{-69,30},{-32,30},{-32,4},
          {-22,4}}, color={0,0,127}));
  connect(add3_1.y, T_amb.u3) annotation (Line(points={{-33,-36},{-30,-36},{-30,
          -4},{-22,-4}}, color={0,0,127}));
  connect(heating_External_P.T_amb, T_amb.y) annotation (Line(points={{42.8571,
          61.7143},{12,61.7143},{12,4},{1,4}}, color={0,0,127}));
  connect(heating_External_P.epp, electricGrid_1.epp) annotation (Line(
      points={{60.5714,48.8571},{60.5714,48},{74,48},{74,-42},{72,-42},{72,
          -42.23},{74.2,-42.23}},
      color={28,108,200},
      thickness=0.5));
  connect(controlBus.SignalActive, SignalActive1.y) annotation (Line(points={{
          28,50},{-4,50},{-4,51},{-5.3,51}}, color={0,0,0}), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(heating_External_P.controlBus, controlBus) annotation (Line(points={{
          44.1429,48.1429},{36,48.1429},{36,50},{28,50}}, color={0,0,0}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(P_external.y, controlBus.P_external) annotation (Line(points={{-0.8,
          86},{14,86},{14,50},{28,50}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(heating_Internal.epp, electricGrid_1.epp) annotation (Line(
      points={{60.5714,8.85714},{60.5714,-42.23},{74.2,-42.23}},
      color={28,108,200},
      thickness=0.5));
  connect(heating_Internal.T_amb, T_amb.y) annotation (Line(points={{42.8571,
          21.7143},{12,21.7143},{12,4},{1,4}}, color={0,0,127}));
  connect(heating_Limit_P.controlBus, controlBus1) annotation (Line(points={{
          44.1429,-75.8571},{44,-76},{30,-76}}, color={0,0,0}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(P_limit.y, controlBus1.P_limit) annotation (Line(points={{11.2,-38},{
          30,-38},{30,-76}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlBus1.SignalActive, SignalActive1.y) annotation (Line(points={{
          30,-76},{30,36},{-4,36},{-4,51},{-5.3,51}}, color={0,0,0}), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(heating_Limit_P.epp, electricGrid_1.epp) annotation (Line(
      points={{60.5714,-75.1429},{60.5714,-42},{72,-42},{72,-42.23},{74.2,
          -42.23}},
      color={28,108,200},
      thickness=0.5));
  connect(heating_Limit_P.T_amb, T_amb.y) annotation (Line(points={{42.8571,
          -62.2857},{36,-62.2857},{36,4},{1,4}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end Check_Heating;
