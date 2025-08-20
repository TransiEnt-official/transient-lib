within TransiEnt.Consumer.Electrical.ElectricVehicle;
model BEVOnboardCharger
  extends Models_CyEntEE.CellModels.Controller.Base.Partial_ControlledModel;
  import Models_CyEntEE.CellModels.Controller.Base.ControlType;
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
  //                                                                                //
  // Last Author: Tom Steffen, Last Update: 11.08.2025, Email: tom.steffen@tuhh.de  //
  //________________________________________________________________________________//
  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter Modelica.Units.SI.Power P_nominal(displayUnit="kW")=11000
    "Nominal charge and discharge power" annotation (Dialog(group="Electric"));

  parameter Modelica.Units.SI.Voltage V_nominal(displayUnit="V")=400
    "Nominal voltage" annotation (Dialog(group="Electric"));

  parameter Real SOC_stop(
    max=1.0,
    min=0.0)=1.0
    "General state of charge for stop of the charging process" annotation (Dialog(group="Electric"));

  parameter Real t_deadTime(unit="s",displayUnit="s") = 2
    "Battery reaction dead time on set value" annotation(Dialog(group = "Dynamic"));

  parameter Real tau_dynamics(unit="s",displayUnit="s") = 3
    "Battery dynamic reaction on set value" annotation(Dialog(group = "Dynamic"));

  replaceable parameter TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110 Charger_Params=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()
      constrainedby TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_measurements
      annotation (Dialog(group="Overall"), choices(
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110() "Renault Zoe R110",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90() "Renault Zoe R90",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3() "Volkswagen ID3",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4() "Volkswagen ID4",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf() "Nissan Leaf",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Peugeot_ION() "Peugeot ION"));

  // _____________________________________________
  //
  //             Interfaces
  // _____________________________________________
  TransiEnt.Basics.Interfaces.General.ControlBus          controlBus annotation (Placement(transformation(extent={{-20,-120},{20,-80}}), iconTransformation(extent={{-20,-120},{20,-80}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_set annotation (Placement(transformation(extent={{92,50},{112,70}}), iconTransformation(extent={{92,50},{112,70}})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp_grid annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,0}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,0})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp_battery annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,0}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,0})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________
  Modelica.Blocks.Tables.CombiTable2Ds eta_over_P_grid(table=Charger_Params.eta_mean_over_P_grid_and_V_grid, extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) "Inverter setpoint efficiency" annotation (Placement(transformation(extent={{0,80},{20,100}})));
  Modelica.Blocks.Tables.CombiTable2Ds Q_grid_over_P_bat_and_V_grid(table=Charger_Params.Q_grid_over_P_bat_and_V_grid, extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) "Reactive power of the inverter setpoint" annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Blocks.Sources.RealExpression V_grid_(y=epp_grid.v)
    annotation (Placement(transformation(extent={{-140,40},{-120,60}})));
  TransiEnt.Components.Boundaries.Electrical.ComplexPower.PQBoundary_new
    pq_charger(
    v_n=V_nominal,
    useInputConnectorP=true,
    useInputConnectorQ=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,30})));
  Modelica.Blocks.Logical.Switch Switch_Limiter if controlType == ControlType.Limit_P
                                          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,-30})));
  Modelica.Blocks.Logical.Switch Switch_externalInput
    if controlType == ControlType.External_P annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-30})));
  Modelica.Blocks.Math.Min min_Limit if controlType == ControlType.Limit_P annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
   Modelica.Blocks.Interfaces.RealInput SOC annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,-60}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,-60})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_bat_request annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,-40}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,-30})));
  Modelica.Blocks.Sources.RealExpression P_limit_(y=P) if controlType == ControlType.Limit_P annotation (Placement(transformation(extent={{-80,-66},{-60,-46}})));
  Modelica.Blocks.Sources.RealExpression P_external_(y=P) if controlType == ControlType.External_P annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,-56})));
  Modelica.Blocks.Sources.RealExpression P_internal_(y=P) if not ((controlType == ControlType.External_P) or (controlType == ControlType.Limit_P)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-130,90})));
  Modelica.Blocks.Math.Add P_loss_(k1=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,60})));
  Modelica.Blocks.Math.Product P_set_ annotation (Placement(transformation(extent={{60,82},{80,102}})));
  Modelica.Blocks.Interfaces.BooleanInput isConnected
    "Boolean Input considering wether the EV is connected to the grid when not driving"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,-80}),
                         iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,-90})));
  Modelica.Blocks.Logical.Switch Switch_Connected annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,80})));
  Modelica.Blocks.Sources.RealExpression Zero(y=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-130,70})));
  Modelica.Blocks.Logical.And and_ annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Sources.BooleanExpression SOC_turnoff(y=SOC < 1.0) annotation (Placement(transformation(extent={{-140,20},{-120,40}})));
  // _____________________________________________
  //
  //                  Variables
  // _____________________________________________
  Modelica.Units.SI.Power P;

  Modelica.Blocks.Math.Min min_external if controlType == ControlType.External_P annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=t_deadTime)
    annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1,
    T=tau_dynamics,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0)
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
equation
  if SOC >= SOC_stop then
    P = 0;
  else
    P = P_bat_request;
  end if;
  // connect statements
  connect(epp_battery, epp_grid) annotation (Line(
      points={{100,0},{-100,0}},
      color={28,108,200},
      thickness=0.5));
  connect(pq_charger.epp, epp_grid) annotation (Line(
      points={{80,30},{88,30},{88,0},{-100,0}},
      color={28,108,200},
      thickness=0.5));
  connect(Switch_Limiter.u2, controlBus.SignalActive) annotation (Line(points={{-42,-30},{-50,-30},{-50,-70},{0,-70},{0,-100}},                     color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(min_Limit.u1, controlBus.P_limit) annotation (Line(points={{-82,-24},{-90,-24},{-90,-74},{0,-74},{0,-100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_loss_.y, controlBus.P_loss);
  connect(Q_grid_over_P_bat_and_V_grid.y, controlBus.Q_inverter);
  connect(V_grid_.y, Q_grid_over_P_bat_and_V_grid.u2) annotation (Line(points={{-119,50},{-8,50},{-8,44},{-2,44}},   color={0,0,127}));
  connect(min_Limit.y, Switch_Limiter.u1) annotation (Line(points={{-59,-30},{-54,-30},{-54,-22},{-42,-22}}, color={0,0,127}));
  connect(V_grid_.y, eta_over_P_grid.u2) annotation (Line(points={{-119,50},{-8,50},{-8,84},{-2,84}},   color={0,0,127}));
  connect(Switch_externalInput.u1, controlBus.P_input) annotation (Line(points={{18,-22},{2,-22},{2,-78},{0,-78},{0,-100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(Switch_externalInput.u2, controlBus.SignalActive) annotation (Line(points={{18,-30},{0,-30},{0,-100}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(P_limit_.y, min_Limit.u2) annotation (Line(points={{-59,-56},{-56,-56},{-56,-70},{-86,-70},{-86,-36},{-82,-36}}, color={0,0,127}));
  connect(P_limit_.y, Switch_Limiter.u3) annotation (Line(points={{-59,-56},{-42,-56},{-42,-38}}, color={0,0,127}));
  connect(P_external_.y, Switch_externalInput.u3) annotation (Line(points={{19,-56},{8,-56},{8,-38},{18,-38}},   color={0,0,127}));
  connect(P_set_.y, P_set) annotation (Line(points={{81,92},{90,92},{90,60},{102,60}}, color={0,0,127}));
  connect(Zero.y, Switch_Connected.u3) annotation (Line(points={{-119,70},{-110,70},{-110,72},{-102,72}},
                                                                                                   color={0,0,127}));
  connect(P_internal_.y, Switch_Connected.u1) annotation (Line(points={{-119,90},{-112,90},{-112,88},{-102,88}},   color={0,0,127}));
  connect(Switch_Connected.u1, Switch_Limiter.y) annotation (Line(points={{-102,88},{-112,88},{-112,14},{-114,14},{-114,-14},{-12,-14},{-12,-30},{-19,-30}},
                                                                                                                                            color={0,0,127}));
  connect(and_.y, Switch_Connected.u2) annotation (Line(points={{-79,30},{-76,30},{-76,54},{-114,54},{-114,80},{-102,80}},  color={255,0,255}));
  connect(and_.u2, isConnected) annotation (Line(points={{-102,22},{-102,10},{86,10},{86,-80},{100,-80}},        color={255,0,255}));
  connect(SOC_turnoff.y, and_.u1) annotation (Line(points={{-119,30},{-102,30}},                 color={255,0,255}));
  connect(P_set_.y, Q_grid_over_P_bat_and_V_grid.u1) annotation (Line(points={{81,92},{86,92},{86,108},{-14,108},{-14,56},{-2,56}},                  color={0,0,127}));
  connect(Switch_externalInput.y, min_external.u1) annotation (Line(points={{41,-30},{48,-30},{48,-24},{58,-24}}, color={0,0,127}));
  connect(P_bat_request, min_external.u2) annotation (Line(points={{100,-40},{84,-40},{84,-44},{58,-44},{58,-36}}, color={0,127,127}));
  connect(min_external.y, Switch_Connected.u1) annotation (Line(points={{81,-30},{84,-30},{84,-14},{-114,-14},{-114,14},{-112,14},{-112,88},{-102,88}}, color={0,0,127}));
  connect(fixedDelay.y,firstOrder. u) annotation (Line(points={{-49,80},{-42,80}},
                                                                                color={0,0,127}));
  connect(Switch_Connected.y, fixedDelay.u) annotation (Line(points={{-79,80},{-72,80}}, color={0,0,127}));
  connect(firstOrder.y, eta_over_P_grid.u1) annotation (Line(points={{-19,80},{-10,80},{-10,96},{-2,96}}, color={0,0,127}));
  connect(eta_over_P_grid.y, P_set_.u2) annotation (Line(points={{21,90},{48,90},{48,86},{58,86}}, color={0,0,127}));
  connect(P_set_.u1, firstOrder.y) annotation (Line(points={{58,98},{50,98},{50,106},{-10,106},{-10,80},{-19,80}}, color={0,0,127}));
  connect(P_loss_.u2, firstOrder.y) annotation (Line(points={{58,54},{50,54},{50,106},{-10,106},{-10,80},{-19,80}}, color={0,0,127}));
  connect(P_set_.y, P_loss_.u1) annotation (Line(points={{81,92},{86,92},{86,74},{58,74},{58,66}}, color={0,0,127}));
  connect(pq_charger.Q_el_set, Q_grid_over_P_bat_and_V_grid.y) annotation (Line(points={{64,19},
          {28,19},{28,50},{21,50}},                                                                                       color={0,127,127}));
  connect(P_loss_.y, pq_charger.P_el_set) annotation (Line(points={{81,60},{86,
          60},{86,19},{76,19}},                                                                      color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(
          extent={{-100,102},{100,-98}},
          lineColor={0,149,152},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255},
          lineThickness=0.5),
        Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={0,149,152},
          lineThickness=1,
          radius=40),
        Line(
          points={{70,68},{-68,-68}},
          color={0,149,152},
          thickness=1),
        Text(
          extent={{-80,80},{0,0}},
          textColor={0,149,152},
          textString="~"),
        Text(
          extent={{0,0},{80,-80}},
          textColor={0,149,152},
          textString="=")}),                                     Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,-10},{88,-86}},
          lineColor={0,149,152},
          lineThickness=1,
          pattern=LinePattern.Dash),
        Text(
          extent={{-98,-76},{-24,-84}},
          textColor={0,149,152},
          textString="Limitation or External Setpoint"),
        Rectangle(
          extent={{-12,120},{100,14}},
          lineColor={0,149,152},
          lineThickness=1,
          pattern=LinePattern.Dash),
        Text(
          extent={{-10,118},{98,108}},
          textColor={0,149,152},
          textString="Loss und Reactive Power calculation"),
        Rectangle(
          extent={{-76,120},{-16,58}},
          lineColor={0,149,152},
          lineThickness=1,
          pattern=LinePattern.Dash),
        Text(
          extent={{-76,118},{-18,108}},
          textColor={0,149,152},
          textString="Dynamics")}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This model calculates the has the purpose of empiricially modeling an onboard charger of electric vehicles charging in non-public charging infrastructures (wallboxes). The model calculates for the setpoint of the battery active power consumption, the conversion losses and the reactive power profile based on empirical measurement profiles. An additional use case is the limitation or external setting of an active power consumption, which is implemented over an expandable connector (controlBus).</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model is based on empiric equations for loss and reactive profile calculation and measurement data. The exact conversion behavior of the onboard charger (switching, frequency, etc.) are not included.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p>The calculation of the loss and reactive power is </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Input: </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">P_request</span></b> for direct normal irradiation </p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">SOC</span></b> for diffuse horizontal irradiation</p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">isConnected</span></b> for ambient temperature</p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">controlBus</span> </b>for P_limit, SignalActive and P_input (conditional parametrization based on the parameter controlType)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">epp_battery </span></b>for the PQ boundary of the electric vehicle battery and its active power consumption</p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Output: </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">epp_grid</span></b> for connection to a complex root mean square grid simulation </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">See parameter and variable descriptions in the code.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The equations 6.3 - 6.6 are calculated first before 6.1 and 6.2 are calculated due to the sequential structure of the model.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.1. Consumption efficiency</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The consumption efficiency is calculated for the requested power. eta_over_P_grid_and_V_grid is a two-dimensional look-up table with P and epp_grid.v as input.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">P_grid * eta_over_P_grid_and_V_grid.y = P_set;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">P_loss = P_grid * (1-eta_over_P_grid_and_V_grid.y);</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.2. Reactive power profile</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The reactive power is calculated for the requested power. Q_grid_over_P_grid_and_V_grid is a two-dimensional look-up table with P and epp_grid.v as input.</span></p>
<p>Q = Q_grid_over_P_grid_and_V_grid.y = f(P, epp_grid.v);</p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.3. Power setpoint </span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">P</span></b> is calculated by:</p>
<p>if SOC &gt; SOC_stop:</p>
<p>P = 0;</p>
<p>else</p>
<p>P = P_request;</p>
<p>end if;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.4. Active Power Limitation</span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">P</span></b> is altered by:</p>
<p>if controlType == controlType.Limit_P and SignalActive then</p>
<p>P = min(P, controlBus.P_limit);</p>
<p>end if;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.5. Active Power Setting </span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">P</span></b> is altered by:</p>
<p>if controlType == controlType.External_P and SignalActive then</p>
<p>P = controlBus.P_input;</p>
<p>P = min(P_request, controlBus.P_input);</p>
<p>end if;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.6. Connection checking </span></b></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">P</span></b> is altered by:</p>
<p>if isConnected then</p>
<p>P = P;</p>
<p>else</p>
<p>P = 0;</p>
<p>end if;</p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p>Choose the type of empirical charger data but altering the parameter Charger_params. This changes the look-up tables in <b>eta_over_P_grid_and_V_grid</b> and <b>Q_grid_over_P_grid_and_V_grid</b>.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The model has been validated against the measurement data which were the bases for the empirical approach. Additionally a comparison with literature information about efficiency and reactive power was performed. The quality of the efficiency measurements was confirmed. After revalidating the data, the reactive power still differed from the data in the literature source. [1]</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: Courier New;\">[1] K. Sevdari, L. Calearo, B. H. Bakken, P. B. Andersen, und M. Marinelli, &ldquo;Experimental Validation of Onboard Electric Vehicle Chargers to Improve the Efficiency of Smart Charging Operation,&rdquo; Sustainable Energy Technologies and Assessments, Bd. 60, S. 103512, Dec. 2023.</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: Courier New;\">BEVOnboardCharger by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</span></p>
</html>"));
end BEVOnboardCharger;
