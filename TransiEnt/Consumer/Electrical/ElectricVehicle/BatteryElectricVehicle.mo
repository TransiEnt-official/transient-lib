within TransiEnt.Consumer.Electrical.ElectricVehicle;
model BatteryElectricVehicle
  extends TransiEnt.Basics.Icons.Model;
  extends Models_CyEntEE.CellModels.Controller.Base.Partial_ControlledModel
                                                 (controlType=Models_CyEntEE.CellModels.Controller.Base.ControlType.Limit_P);
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
    "Nominal charge and discharge power" annotation (Dialog(group="Battery"));

  parameter Modelica.Units.SI.Voltage V_nominal(displayUnit="V")=400
    "Nominal voltage" annotation (Dialog(group="Battery"));

  parameter Modelica.Units.SI.Energy Capacity(displayUnit="kWh")=90e3*3600
    "Battery capacity in Joule" annotation (Dialog(group="Battery"));

  parameter Real SOC_initial(
    unit="1",
    displayUnit="%")=0.5                                     "Battery Charge at start"
    annotation (Dialog(group="Battery"));

  parameter Real SOC_th(
    unit="1",
    displayUnit="%")=0.95
    "If SOC > thr. reduce power linearly" annotation (Dialog(group="Battery"));

  parameter Real SOC_stop(
    unit="1",
    displayUnit="%")=0.8
    "If SOC > thr. reduce power linearly" annotation (Dialog(group="Battery"));

  parameter Real lambda_Pmin(
    unit="1",
    displayUnit="%")=0.02
    "Minimum relative power at SOC limits (0 or 1)" annotation(Dialog(group = "Battery"));

  parameter Real t_deadTime(
    unit="s",
    displayUnit="s")=2
    "Battery reaction dead time on set value" annotation(Dialog(group = "Control"));

  parameter Real tau_dynamics(
    unit="s",
    displayUnit="s")=3
    "Battery dynamic reaction on set value" annotation(Dialog(group = "Control"));

  replaceable parameter TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110 Charger_Params=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()
      constrainedby TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_measurements
      annotation (Dialog(group="Charger"), choices(
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
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp
    annotation (Placement(transformation(extent={{-108,-10},{-88,10}}), iconTransformation(extent={{-108,-10},{-88,10}})));
  TransiEnt.Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-20,-120},{20,-80}}), iconTransformation(extent={{-20,-120},{20,-80}})));
  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________
  BEVOnboardCharger bEVOnboardCharger(
    controlType=controlType,
    P_nominal=P_nominal,
    V_nominal=V_nominal,
    SOC_stop=SOC_stop,
    t_deadTime=t_deadTime,
    tau_dynamics=tau_dynamics,
    Charger_Params=Charger_Params) annotation (Placement(transformation(extent={{-20,-40},{20,0}})));
  TransiEnt.Storage.Electrical.BEVBattery bEVBattery(
    Capacity=Capacity,
    SOC_initial=SOC_initial,
    P_nominal=P_nominal,
    V_nominal=V_nominal,
    SOC_th=SOC_th,
    lambda_Pmin=lambda_Pmin) annotation (Placement(transformation(extent={{60,-40},{100,0}})));
  Modelica.Blocks.Interfaces.RealInput SOC_consumption
    annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={100,70}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,60})));
  Modelica.Blocks.Interfaces.BooleanInput isConnected
    "Boolean Input considering wether the EV is connected to the grid when not driving"
    annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=180,
        origin={97,27}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,20})));
  // _____________________________________________
  //
  //           Variables
  // _____________________________________________

  Modelica.Blocks.Sources.RealExpression P_(y=epp.P) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,-50})));
  Modelica.Blocks.Sources.RealExpression P_max_(y=P_nominal) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,-70})));
  Modelica.Blocks.Sources.RealExpression Q_(y=epp.Q) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,-90})));
equation
  // reduce SOC value by externally calculated Delta SOC (SOC_consumption)
  when isConnected then
    reinit(bEVBattery.E, max(bEVBattery.SOC - SOC_consumption, 0)* Capacity);
  end when;
  // connect statements
  connect(bEVOnboardCharger.epp_battery, bEVBattery.epp) annotation (Line(
      points={{20,-20},{60,-20}},
      color={28,108,200},
      thickness=0.5));
  connect(bEVOnboardCharger.epp_grid, epp) annotation (Line(
      points={{-20,-20},{-62,-20},{-62,0},{-98,0}},
      color={28,108,200},
      thickness=0.5));
  connect(bEVOnboardCharger.controlBus, controlBus) annotation (Line(
      points={{0,-40},{0,-100}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(bEVBattery.SOC_out, bEVOnboardCharger.SOC) annotation (Line(points={{60,-32},{20,-32}}, color={0,0,127}));
  connect(P_.y, controlBus.P) annotation (Line(points={{-49,-50},{-26,-50},{-26,-100},{0,-100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P_max_.y, controlBus.P_max) annotation (Line(points={{-49,-70},{-26,-70},{-26,-100},{0,-100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_.y, controlBus.Q) annotation (Line(points={{-49,-90},{-26,-90},{-26,-100},{0,-100}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(bEVOnboardCharger.P_set, bEVBattery.P_set) annotation (Line(
      points={{20.4,-8},{60,-8}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(bEVBattery.P_request_out, bEVOnboardCharger.P_bat_request) annotation (Line(
      points={{60,-26},{20,-26}},
      color={0,135,135},
      pattern=LinePattern.Dash));
  connect(isConnected, bEVOnboardCharger.isConnected) annotation (Line(points={{97,27},{112,27},{112,-38},{20,-38}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          visible=DynamicSelect(false, not isConnected),
          points={{-30,0},{-30,0}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={163,163,163},
          fillPattern=FillPattern.None),
        Polygon(
          points={{-106,6},{-106,6}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.None),
        Polygon(
          points={{-48,-16},{-58,-16},{-68,-10},{-72,-2},{-66,4},{-50,8},{-36,10},{-12,26},{6,28},{30,26},{38,22},{42,20},{48,14},{52,12},{60,10},{66,0},{66,-8},{64,-14},{60,-16},{6,-16},{-48,-16}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{-48,-2},{-28,-22}},
          lineColor={0,0,0},
          fillColor={43,43,43},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-44,-6},{-32,-18}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{36,-2},{56,-22}},
          lineColor={0,0,0},
          fillColor={43,43,43},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{40,-6},{52,-18}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-26,8},{-16,8},{12,8},{46,8},{38,16},{28,20},{10,22},{-2,22},{-10,20},{-18,16},{-24,12},{-26,8}},
          lineColor={0,0,0},
          smooth=Smooth.Bezier,
          fillColor={206,206,206},
          fillPattern=FillPattern.Solid),
        Line(
          points={{16,20},{16,12},{18,-10}},
          color={0,0,0},
          smooth=Smooth.Bezier)}),                               Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-90,-28},{-30,-100}},
          lineColor={0,149,152},
          lineThickness=1,
          pattern=LinePattern.Dash),
        Text(
          extent={{-88,-30},{-32,-40}},
          textColor={0,149,152},
          textString="Outputs")}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This model calculates the empiric electrical behavior of an electric vehicle in combination with non-public charging infrastructure (wallbox in low voltage grids) in combination with stochastic driving profiles.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model is build upon an Onboard Charger model and an Battery model. Please have a look at the Onboard Charger and the Battery documentation</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p>Only valid for low voltage AC grid integration. No DC or high charging power is implemented.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Input: </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">isConnected</span></b> for the electric connection dependent on the stochastic drivign profile.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">controlBus</span> </b>for P_limit, SignalActive and P_input which are further connected to the Onboard Charger.</p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Output: </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">epp</span></b> for connection to a complex root mean square grid simulation </p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">See parameter and variable descriptions in the code.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The equations 6.3 - 6.6 are calculated first before 6.1 and 6.2 are calculated due to the sequential structure of the model.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.1. State of Charge Alteration</span></b></p>
<p><span style=\"font-family: Courier New;\">when&nbsp;isConnected&nbsp;then</span></p>
<p><span style=\"font-family: Courier New;\">reinit(bEVBattery.E,&nbsp;max(bEVBattery.SOC&nbsp;-&nbsp;SOC_consumption,&nbsp;0)*&nbsp;Capacity);</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">end&nbsp;when;</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p>Choose the type of empirical charger data but altering the parameter Charger_params. This changes the Onboard Charger Efficiency and Reactive Power Profile.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The model has been validated against the measurement data which were the bases for the empirical approach. Additionally a comparison with literature information about efficiency and reactive power was performed. The quality of the efficiency measurements was confirmed. After revalidating the data, the reactive power still differed from the data in the literature source. [1]</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: Courier New;\">[1] K. Sevdari, L. Calearo, B. H. Bakken, P. B. Andersen, und M. Marinelli, &ldquo;Experimental Validation of Onboard Electric Vehicle Chargers to Improve the Efficiency of Smart Charging Operation,&rdquo; Sustainable Energy Technologies and Assessments, Bd. 60, S. 103512, Dec. 2023.</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: Courier New;\">ElectricVehicle by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</span></p>
</html>"));
end BatteryElectricVehicle;
