within TransiEnt.Components.Sensors;
model SmartMeter "Smart Meter model for realistic mesaurements"
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
//________________________________________________________________________________//
  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Sensor;
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed;

  // _____________________________________________
  //
  //          Parameters
  // _____________________________________________

  parameter Boolean useStandardConfiguration = true "Enable standard configurations" annotation (Dialog(group="Configuration"));
  parameter String configuration = "Ideal" "choose the basic configuration" annotation (Dialog(group="Configuration", enable=useStandardConfiguration), choices(
      choice="Ideal" "Ideal measurements",
      choice="TAF10" "Tarifanwendungsfall 10 (German standard)",
      choice="TAF7" "Tarifanwendungsfall 7 (German standard)"));

  parameter Boolean useNoise=false annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Boolean useDelay=false annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Modelica.Units.SI.PerUnit sigma_I=0.01 "Standard Deviation of the Current Sensor" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Modelica.Units.SI.PerUnit sigma_V=0.01 "Standard Deviation of the Voltage Sensor" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Modelica.Units.SI.PerUnit sigma_Delay=10 "Standard Deviation of the Voltage Sensor" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Integer fixedLocalSeed_V=1 "LocalSeed for Normal Distribution of V" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Integer fixedLocalSeed_I=2 "LocalSeed for Normal Distribution of I" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Integer fixedLocalSeed_Delay = 3 "LocalSeed for Normal Distribution of Delaytime" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Integer samplePeriod=60 "Sample Period for the noise generator of the Smart Meter" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  parameter Integer maxDelay = 60 "Maximum Delay Time" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));
  final parameter Real sampleStartTime(fixed = false) "Cause at what time sampling from Noise Generators will start" annotation (Dialog(group="Manual parametrization", enable=not useStandardConfiguration));

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort  epp_a annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}),
                                                    iconTransformation(extent={{-102,-10},{-82,
            10}})));

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort  epp_b
    annotation (Placement(transformation(extent={{82,-10},{102,10}}), iconTransformation(extent={{82,-10},{102,10}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  // Use one normal distributed noise process for voltage and for current but different seeds. (Global seed = 67867967, fixedLocalSeed = 1)
  Modelica.Blocks.Noise.NormalNoise Noise_Voltage(
    samplePeriod=samplePeriod,
    fixedLocalSeed=fixedLocalSeed_V,
    startTime=0.0,
    mu=mu_V,
    sigma=sigma_V,
    useGlobalSeed=true,
    useAutomaticLocalSeed=false) if useNoise or (configuration == "TAF7") or (configuration == "TAF10")
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  Modelica.Blocks.Noise.NormalNoise Noise_Current(
    samplePeriod=samplePeriod,
    fixedLocalSeed=fixedLocalSeed_I,
    startTime=0.0,
    mu=mu_I,
    sigma=sigma_I,
    useGlobalSeed=false,
    useAutomaticLocalSeed=false) if useNoise or (configuration == "TAF7") or (configuration == "TAF10")
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  Modelica.Blocks.Noise.NormalNoise Noise_Delay(
    samplePeriod=samplePeriod,
    fixedLocalSeed=fixedLocalSeed_Delay,
    startTime=0.0,
    mu=mu_Delay,
    sigma=sigma_Delay,
    useGlobalSeed=true,
    useAutomaticLocalSeed=false) if useDelay
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));

  Basics.Interfaces.General.ControlBus                    controlBus annotation (Placement(transformation(extent={{-20,-88},{20,-48}}), iconTransformation(extent={{-20,-88},{20,-48}})));
  Modelica.Blocks.Discrete.Sampler V_sampler_TAF10(samplePeriod=60)                            if (configuration == "TAF10")
                                                                                                           annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={40,-40})));
  Modelica.Blocks.Discrete.Sampler f_sampler_TAF10(samplePeriod=60)                            if (configuration == "TAF10")
                                                                                                           annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={80,-40})));
  Modelica.Blocks.Discrete.Sampler I_sampler_TAF10(samplePeriod=60)                            if (configuration == "TAF10")
                                                                                                           annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={40,-60})));
  Modelica.Blocks.Discrete.Sampler P_sampler_TAF10(samplePeriod=60)                            if (configuration == "TAF10")
                                                                                                           annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={80,-60})));
  Modelica.Blocks.Discrete.Sampler delta_sampler_TAF10(samplePeriod=60)                            if (configuration == "TAF10")
                                                                                                               annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={40,-80})));
  Modelica.Blocks.Discrete.Sampler E_sampler_TAF7(samplePeriod=900)                            if (configuration == "TAF7")
                                                                                                           annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-40,-92})));
  Modelica.Blocks.Math.Gain gain(k=900) if (configuration == "TAF7")
                                        annotation (Placement(transformation(extent={{-58,-96},{-50,-88}})));
  Modelica.Blocks.Sources.RealExpression V_TAF_(y=V) if (configuration == "TAF7") or (configuration == "TAF10") annotation (Placement(transformation(extent={{-160,-40},{-140,-20}})));
  Modelica.Blocks.Sources.RealExpression I_TAF_(y=I) if (configuration == "TAF7") or (configuration == "TAF10") annotation (Placement(transformation(extent={{-160,-60},{-140,-40}})));
  Modelica.Blocks.Sources.RealExpression P_TAF_(y=P) if (configuration == "TAF7") or (configuration == "TAF10") annotation (Placement(transformation(extent={{-160,-80},{-140,-60}})));
  Modelica.Blocks.Sources.RealExpression f_TAF_(y=f) if (configuration == "TAF10") annotation (Placement(transformation(extent={{-160,-100},{-140,-80}})));
  Modelica.Blocks.Sources.RealExpression delta_TAF_(y=delta) if (configuration == "TAF10") annotation (Placement(transformation(extent={{-160,-120},{-140,-100}})));

  Modelica.Blocks.Sources.RealExpression V_(y=V) if not ((configuration == "TAF7") or (configuration == "TAF10")) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-30})));
  Modelica.Blocks.Sources.RealExpression I_(y=I) if not ((configuration == "TAF7") or (configuration == "TAF10")) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-50})));
  Modelica.Blocks.Sources.RealExpression P_(y=P) if not ((configuration == "TAF7") or (configuration == "TAF10")) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-70})));
  Modelica.Blocks.Sources.RealExpression f_(y=f) if not ((configuration == "TAF7") or (configuration == "TAF10")) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-90})));
  Modelica.Blocks.Sources.RealExpression delta_(y=delta) if not ((configuration == "TAF7") or (configuration == "TAF10")) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-110})));
  Modelica.Blocks.Sources.RealExpression Q_(y=Q) if not ((configuration == "TAF7") or (configuration == "TAF10")) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={130,-130})));

  Modelica.Blocks.Math.Abs abs_Delay if useDelay annotation (Placement(transformation(extent={{-40,30},{-20,50}})));

  Modelica.Blocks.Math.Mean V_mean(f=1/900) if (configuration == "TAF7")
                                                        annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-74,-40})));
  Modelica.Blocks.Math.Mean P_mean(f=1/900) if (configuration == "TAF7")
                                                        annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-74,-80})));
  Modelica.Blocks.Math.Mean I_mean(f=1/900) if (configuration == "TAF7")
                                                        annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-74,-60})));
  Modelica.Blocks.Discrete.Sampler V_sampler_TAF7(samplePeriod=900)                            if (configuration == "TAF7")
                                                                                                           annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-40,-32})));
  Modelica.Blocks.Discrete.Sampler I_sampler_TAF7(samplePeriod=900)                            if (configuration == "TAF7")
                                                                                                           annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-40,-52})));
  Modelica.Blocks.Discrete.Sampler P_sampler_TAF7(samplePeriod=900) if (configuration == "TAF7")           annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-40,-72})));
protected
  parameter Real mu_I=1 "Mean Value of the Currents Normal Distributed Noise";
  parameter Real mu_V=1 "Mean Value of the Voltages Normal Distributed Noise";
  parameter Real mu_Delay=0.1 "Mean Value of the Voltages Normal Distributed Noise";

  Modelica.Blocks.Interfaces.RealInput noiseCurrent_internal;
  Modelica.Blocks.Interfaces.RealInput noiseVoltage_internal;

  discrete Integer state128[4](   each start=0, each fixed = true);

  // _____________________________________________
  //
  //           Variables
  // _____________________________________________
public
  Modelica.Units.SI.Voltage V;
  Modelica.Units.SI.Current I;
  Modelica.Units.SI.Angle delta;
  Modelica.Units.SI.Power P;
  Modelica.Units.SI.ReactivePower Q;
  Modelica.Units.SI.Frequency f;
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  Modelica.Blocks.Nonlinear.VariableDelay variableDelay_V(delayMax=maxDelay) if useDelay annotation (Placement(transformation(extent={{10,60},{30,80}})));
  Modelica.Blocks.Nonlinear.VariableDelay variableDelay_P(delayMax=maxDelay) if useDelay annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Nonlinear.VariableDelay variableDelay_delta(delayMax=maxDelay) if useDelay annotation (Placement(transformation(extent={{70,60},{90,80}})));
  Modelica.Blocks.Nonlinear.VariableDelay variableDelay_I(delayMax=maxDelay) if useDelay annotation (Placement(transformation(extent={{10,30},{30,50}})));
  Modelica.Blocks.Nonlinear.VariableDelay variableDelay_Q(delayMax=maxDelay) if useDelay annotation (Placement(transformation(extent={{42,30},{62,50}})));
  Modelica.Blocks.Nonlinear.VariableDelay variableDelay_f(delayMax=maxDelay) if useDelay annotation (Placement(transformation(extent={{70,30},{90,50}})));
  Modelica.Blocks.Sources.RealExpression Q_TAF(y=Q) if (configuration == "TAF7") or (configuration == "TAF10") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-150,-130})));
  Modelica.Blocks.Math.Mean Q_mean(f=1/900) if (configuration == "TAF7") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-74,-100})));
  Modelica.Blocks.Discrete.Sampler Q_sampler_TAF(samplePeriod=900) if (configuration == "TAF7") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-40,-110})));
  Modelica.Blocks.Discrete.Sampler Q_sampler_TAF10(samplePeriod=60) if (configuration == "TAF10") annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={80,-80})));
algorithm
  when initial() then
    state128 := Modelica.Math.Random.Generators.Xorshift128plus.initialState(
      Modelica.Math.Random.Utilities.automaticLocalSeed(getInstanceName()), globalSeed.seed);
  end when;
initial algorithm
  sampleStartTime := Modelica.Math.Random.Generators.Xorshift128plus.random(
    state128) * 60;

equation

  if not (useNoise or (configuration == "TAF7") or (configuration == "TAF10")) then
    noiseCurrent_internal = 1;
    noiseVoltage_internal = 1;
  end if;

  // Add the normal distributed noise to the sensors
  V = abs(epp_b.v)*noiseVoltage_internal;
  delta = epp_b.delta*noiseVoltage_internal;
  f = epp_b.f;
  P = epp_b.P*noiseVoltage_internal*noiseCurrent_internal;
  Q = epp_b.Q*noiseVoltage_internal*noiseCurrent_internal;
  I = sqrt((P^2) + (Q^2))/V;

  // _____________________________________________
  //
  //           Connect Statements
  // _____________________________________________

  if useDelay then
    connect(variableDelay_V.y, controlBus.V) annotation();
    connect(variableDelay_I.y, controlBus.I) annotation();
    connect(variableDelay_P.y, controlBus.P) annotation();
    connect(variableDelay_Q.y, controlBus.Q) annotation();
    connect(variableDelay_delta.y, controlBus.delta) annotation();
    connect(variableDelay_f.y, controlBus.f) annotation();
  else
    connect(V_.y, controlBus.V) annotation();
    connect(I_.y, controlBus.I) annotation();
    connect(P_.y, controlBus.P) annotation();
    connect(f_.y, controlBus.f) annotation();
    connect(delta_.y, controlBus.delta) annotation();
    connect(Q_.y, controlBus.Q) annotation();
  end if;

  connect(noiseCurrent_internal, Noise_Current.y);
  connect(noiseVoltage_internal, Noise_Voltage.y);
  connect(Noise_Delay.y, abs_Delay.u) annotation (Line(points={{-69,40},{-42,40}}, color={0,0,127}));
  connect(epp_a, epp_b) annotation (Line(
      points={{-100,0},{92,0}},
      color={28,108,200},
      thickness=0.5));
  connect(gain.y, E_sampler_TAF7.u) annotation (Line(points={{-49.6,-92},{-47.2,-92}}, color={0,0,127}));
  connect(P_mean.y, gain.u) annotation (Line(points={{-67.4,-80},{-58.8,-80},{-58.8,-92}}, color={0,0,127}));
  connect(P_sampler_TAF7.u, P_mean.y) annotation (Line(points={{-47.2,-72},{-62,-72},{-62,-80},{-67.4,-80}}, color={0,0,127}));
  connect(I_sampler_TAF7.u, I_mean.y) annotation (Line(points={{-47.2,-52},{-62,-52},{-62,-60},{-67.4,-60}}, color={0,0,127}));
  connect(V_sampler_TAF7.u, V_mean.y) annotation (Line(points={{-47.2,-32},{-62,-32},{-62,-40},{-67.4,-40}}, color={0,0,127}));
  connect(V_TAF_.y, V_mean.u) annotation (Line(points={{-139,-30},{-86,-30},{-86,-40},{-81.2,-40}}, color={0,0,127}));
  connect(I_TAF_.y, I_mean.u) annotation (Line(points={{-139,-50},{-86,-50},{-86,-60},{-81.2,-60}}, color={0,0,127}));
  connect(P_TAF_.y, P_mean.u) annotation (Line(points={{-139,-70},{-86,-70},{-86,-80},{-81.2,-80}}, color={0,0,127}));
  connect(V_sampler_TAF10.u, V_TAF_.y) annotation (Line(points={{32.8,-40},{-28,-40},{-28,-22},{-130,-22},{-130,-30},{-139,-30}}, color={0,0,127}));
  connect(I_sampler_TAF10.u, I_TAF_.y) annotation (Line(points={{32.8,-60},{-28,-60},{-28,-42},{-62,-42},{-62,-50},{-139,-50}}, color={0,0,127}));
  connect(delta_sampler_TAF10.u, delta_TAF_.y) annotation (Line(points={{32.8,-80},{-30,-80},{-30,-118},{-84,-118},{-84,-110},{-139,-110}},
                                                                                                                      color={0,0,127}));
  connect(f_sampler_TAF10.u, f_TAF_.y) annotation (Line(points={{72.8,-40},{52,-40},{52,-94},{-28,-94},{-28,-102},{-134,-102},{-134,-90},{-139,-90}}, color={0,0,127}));
  connect(P_sampler_TAF10.u, P_TAF_.y) annotation (Line(points={{72.8,-60},{50,-60},{50,-70},{-30,-70},{-30,-62},{-62,-62},{-62,-70},{-139,-70}}, color={0,0,127}));
  connect(I_sampler_TAF7.y, controlBus.I) annotation (Line(points={{-33.4,-52},{-20,-52},{-20,-92},{2,-92},{2,-98},{0,-98},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(V_sampler_TAF7.y, controlBus.V) annotation (Line(points={{-33.4,-32},{-24,-32},{-24,-96},{0,-96},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_sampler_TAF7.y, controlBus.P) annotation (Line(points={{-33.4,-72},{-16,-72},{-16,-90},{0,-90},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(E_sampler_TAF7.y, controlBus.E) annotation (Line(points={{-33.4,-92},{-22,-92},{-22,-90},{-18,-90},{-18,-88},{2,-88},{2,-96},{0,-96},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(V_sampler_TAF10.y, controlBus.V) annotation (Line(points={{46.6,-40},{50,-40},{50,-50},{-24,-50},{-24,-96},{0,-96},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(I_sampler_TAF10.y, controlBus.I) annotation (Line(points={{46.6,-60},{50,-60},{50,-58},{54,-58},{54,-98},{24,-98},{24,-96},{2,-96},{2,-98},{0,-98},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(delta_sampler_TAF10.y, controlBus.delta) annotation (Line(points={{46.6,-80},{50,-80},{50,-92},{0,-92},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(f_sampler_TAF10.y, controlBus.f) annotation (Line(points={{86.6,-40},{88,-40},{88,-68},{0,-68}},   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(P_sampler_TAF10.y, controlBus.P) annotation (Line(points={{86.6,-60},{90,-60},{90,-124},{14,-124},{14,-128},{-16,-128},{-16,-90},{0,-90},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(abs_Delay.y, variableDelay_V.delayTime) annotation (Line(points={{-19,40},{-2,40},{-2,64},{8,64}}, color={0,0,127}));
  connect(abs_Delay.y, variableDelay_P.delayTime) annotation (Line(points={{-19,40},{-2,40},{-2,86},{38,86},{38,64}}, color={0,0,127}));
  connect(abs_Delay.y, variableDelay_delta.delayTime) annotation (Line(points={{-19,40},{-2,40},{-2,86},{68,86},{68,64}}, color={0,0,127}));
  connect(abs_Delay.y, variableDelay_I.delayTime) annotation (Line(points={{-19,40},{-2,40},{-2,34},{8,34}}, color={0,0,127}));
  connect(abs_Delay.y, variableDelay_Q.delayTime) annotation (Line(points={{-19,40},{-2,40},{-2,22},{40,22},{40,34}}, color={0,0,127}));
  connect(abs_Delay.y, variableDelay_f.delayTime) annotation (Line(points={{-19,40},{-2,40},{-2,22},{68,22},{68,34}}, color={0,0,127}));
  connect(V_.y, variableDelay_V.u) annotation (Line(points={{119,-30},{110,-30},{110,90},{4,90},{4,78},{0,78},{0,70},{8,70}}, color={0,0,127}));
  connect(I_.y, variableDelay_I.u) annotation (Line(points={{119,-50},{108,-50},{108,24},{0,24},{0,40},{8,40}}, color={0,0,127}));
  connect(P_.y, variableDelay_P.u) annotation (Line(points={{119,-70},{112,-70},{112,72},{96,72},{96,86},{70,86},{70,88},{38,88},{38,70}}, color={0,0,127}));
  connect(f_.y, variableDelay_f.u) annotation (Line(points={{119,-90},{92,-90},{92,-16},{72,-16},{72,22},{70,22},{70,26},{68,26},{68,40}}, color={0,0,127}));
  connect(delta_.y, variableDelay_delta.u) annotation (Line(points={{119,-110},{112,-110},{112,-72},{110,-72},{110,-68},{114,-68},{114,74},{98,74},{98,88},{70,88},{70,86},{68,86},{68,70}}, color={0,0,127}));
  connect(Q_.y, variableDelay_Q.u) annotation (Line(points={{119,-130},{108,-130},{108,-52},{90,-52},{90,-18},{68,-18},{68,20},{40,20},{40,40}}, color={0,0,127}));
  connect(Q_mean.u, Q_TAF.y) annotation (Line(points={{-81.2,-100},{-84,-100},{-84,-130},{-139,-130}}, color={0,0,127}));
  connect(Q_mean.y, Q_sampler_TAF.u) annotation (Line(points={{-67.4,-100},{-50,-100},{-50,-110},{-47.2,-110}}, color={0,0,127}));
  connect(Q_sampler_TAF.y, controlBus.Q) annotation (Line(points={{-33.4,-110},{0,-110},{0,-68}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_sampler_TAF10.y, controlBus.Q) annotation (Line(points={{86.6,-80},{94,-80},{94,-92},{56,-92},{56,-100},{0,-100},{0,-68}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(Q_sampler_TAF10.u, Q_TAF.y) annotation (Line(points={{72.8,-80},{68,-80},{68,-130},{-139,-130}}, color={0,0,127}));
   annotation (Line(points={{119,-130},{24,-130},{24,-144},{0,-144},{0,-68}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right),
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-102,24},{-80,12}},
          textColor={0,149,152},
          textString="In"), Text(
          extent={{80,24},{102,12}},
          textColor={0,149,152},
          textString="Out")}),                                   Diagram(coordinateSystem(
          preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{0,20}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{-60,30},{-2,20}},
          textColor={0,149,152},
          textString="Noise Generation"),
        Rectangle(
          extent={{4,100},{100,20}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{6,98},{36,90}},
          textColor={0,149,152},
          textString="Delays"),
        Rectangle(
          extent={{4,-20},{100,-100}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{6,-22},{30,-30}},
          textColor={0,149,152},
          textString="TAF 10"),
        Rectangle(
          extent={{-100,-20},{-12,-120}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{-98,-22},{-76,-30}},
          textColor={0,149,152},
          textString="TAF 7"),
        Rectangle(
          extent={{-170,0},{-114,-140}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{-166,0},{-132,-14}},
          textColor={0,149,152},
          textString="TAF Sources"),
        Text(
          extent={{120,-6},{164,-20}},
          textColor={0,149,152},
          textString="Standard Sources"),
        Rectangle(
          extent={{114,0},{168,-144}},
          lineColor={0,149,152},
          pattern=LinePattern.Dash,
          lineThickness=0.5)}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The purpose of this model is to extract realistic measurement values out of a complex root mean square simulation based on different configurations.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model is based on literature based standard deviation values for Smart Meter. Further details are given in [1]. The TAF7 and TAF10 configurations were added after [1].</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Input: </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">epp_a</span></b> for connection to a complex root mean square grid simulation </p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Output: </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">epp_b</span></b> for connection to a complex root mean square grid simulation </p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">controlBus</span></b> for output parameters P, Q, V, I, E, delta, f (depends on configuration case)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">See parameter and variable descriptions in the code.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.1. Noise calculation</span></b></p>
<p>Based on Modelica.Blocks.Noise.NormalNoise for Noise_Voltage, Noise_Current, Noise_Delay.</p>
<p>connect(Noise_Current.y, noiseCurrent_internal);</p>
<p>connect(Noise_Voltage.y, noiseVoltage_internal);</p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.2. Electric state calculation</span></b></p>
<p>P = abs(epp_b.P) * noiseCurrent_internal * noiseVoltage_internal;</p>
<p>V = epp_b.v *noiseVoltage_internal;</p>
<p>I = epp_b.PI * noiseCurrent_internal;</p>
<p><span style=\"font-family: Courier New;\">delta&nbsp;=&nbsp;epp_b.delta*noiseVoltage_internal;</span></p>
<p><span style=\"font-family: Courier New;\">f&nbsp;=&nbsp;epp_b.f;</span></p>
<p><span style=\"font-family: Courier New;\">Q&nbsp;=&nbsp;epp_b.Q*noiseVoltage_internal*noiseCurrent_internal;</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.3. Delay calculation (if active)</span></b></p>
<p>State = delay(State, abs_Delay.y, maxDelay);</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.4. Configurations</span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">Ideal:</b> Values for P, V, I, delta, f, Q are connected to controlBus without noise and without delay.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">Manual: </b>Values for P, V, I, delta, f, Q are connected to controlBus with configured noise and delay.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">TAF7: </b>Values for P, V, I and E are connected to controlBus with noise and without delay. All values are taken the mean value over 900s and then are sampled by a discrete sampler to get the regulatory required 900s mean values.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">TAF10: </b>Values for P, V, I, delta, f, Q are connected to controlBus without noise and without delay. All values are sampled every 60s to get the regulatory required 60s effective values.</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p>Choose the configuration for purpose. Default the measurements are ideal and not delayed.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: Courier New;\">[1] </span>T. Steffen, B. Wiegel, D. Babazadeh, A. Youssfi, C. Becker and V. Turau, &quot;Generation of realistic Smart Meter Data from Prosumers for future energy system scenarios,&quot; <i>NEIS 2022; Conference on Sustainable Energy Supply and Energy Storage Systems</i>, Hamburg, Germany, 2022, pp. 1-6. </p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: Courier New;\">Added by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</span></p>
</html>"));
end SmartMeter;
