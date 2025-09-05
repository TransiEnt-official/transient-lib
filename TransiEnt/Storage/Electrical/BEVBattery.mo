within TransiEnt.Storage.Electrical;
model BEVBattery "Storage for BatteryElectricVehicle model"
  extends TransiEnt.Basics.Icons.Model;
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
//________________________________________________________________________________//  // _____________________________________________

  // ------------------------------------------------------------------------------------------
  //   Parameter
  // ------------------------------------------------------------------------------------------

  parameter Modelica.Units.SI.Energy Capacity(displayUnit="kWh") = 90e3*3600
    "Battery capacity in Joule" annotation (Dialog(group="Battery"));

  parameter Real SOC_initial(unit="1",displayUnit="%") = 0.5 "Battery Charge at start"
    annotation (Dialog(group="Battery"));

  parameter Modelica.Units.SI.Power P_nominal(displayUnit="kW") = 11000
    "Nominal charge and discharge power" annotation (Dialog(group="Battery"));

  parameter Modelica.Units.SI.Voltage V_nominal(displayUnit="V") = 400
    "Nominal voltage" annotation (Dialog(group="Battery"));

  parameter Real SOC_th(unit="1",displayUnit="%") = 0.95
    "If SOC > thr. reduce power linearly";

  parameter Real lambda_Pmin(unit="1",displayUnit="%") = 0.02
    "Minimum relative power at SOC limits (0 or 1)" annotation(Dialog(group = "Battery"));

  // ------------------------------------------------------------------------------------------
  //   Interfaces
  // ------------------------------------------------------------------------------------------

  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort  epp
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_set "Set power for charging and discharging"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-100,60}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,60})));

  // ------------------------------------------------------------------------------------------
  //   Other Classes
  // ------------------------------------------------------------------------------------------
  TransiEnt.Components.Boundaries.Electrical.ComplexPower.PQBoundary
                                                      pq_boundary(
    useInputConnectorP=true,
    useInputConnectorQ=false,
    v_n=V_nominal)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));

  Modelica.Blocks.Sources.RealExpression P_request_(y=P_request) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,20})));
  Modelica.Blocks.Math.Min min annotation (Placement(transformation(extent={{60,40},{80,60}})));
  // ------------------------------------------------------------------------------------------
  //   Variables
  // ------------------------------------------------------------------------------------------

  Modelica.Units.SI.Energy E(nominal=Capacity, start=Capacity*SOC_initial, fixed=true);
  Modelica.Units.SI.ReactivePower Q;
  Modelica.Units.SI.Power P_request;
  Real SOC;

  Modelica.Blocks.Sources.RealExpression SOC_(y=SOC) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,-60})));
  Modelica.Blocks.Interfaces.RealOutput SOC_out annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,-60}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,-60})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_request_out annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,-30}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-100,-30})));
equation
  // main equations
  der(E) = pq_boundary.epp.P;
  Q = 0;
  SOC = E/Capacity;

  // calculate request power for onboard charger
  if noEvent(SOC >= 1) then
    // if battery is full
    P_request = 0;
  elseif noEvent(SOC >= SOC_th) then
    // limit at high SOC
    P_request = P_nominal*max(0, 1 - (1 - lambda_Pmin)/(1 - SOC_th)*(SOC - SOC_th));
  elseif noEvent(SOC <= (1 - SOC_th)) then
    // limit at low SOC
    P_request = -P_nominal*max(0, (1 - lambda_Pmin)/(1 - SOC_th)*SOC * lambda_Pmin);
  else
    // if normal charging area
    P_request = P_nominal;
  end if;

  // ------------------------------------------------------------------------------------------
  //   Connect equations
  // ------------------------------------------------------------------------------------------

  connect(pq_boundary.epp, epp) annotation (Line(
      points={{80,0},{-100,0}},
      color={28,108,200},
      thickness=0.5));
  connect(P_request_.y, min.u2) annotation (Line(points={{41,20},{50,20},{50,44},{58,44}},                        color={0,0,127}));
  connect(SOC_.y, SOC_out) annotation (Line(points={{-11,-60},{-100,-60}}, color={0,0,127}));
  connect(P_request_.y, P_request_out) annotation (Line(points={{41,20},{46,20},{46,-30},{-100,-30}}, color={0,0,127}));
  connect(min.u1, P_set) annotation (Line(points={{58,56},{-76,56},{-76,60},{-100,60}}, color={0,0,127}));
  connect(min.y, pq_boundary.P_el_set) annotation (Line(points={{81,50},{86,50},
          {86,20},{84,20},{84,11}},                                                                       color={0,0,127}));
  annotation (Icon(graphics={
        Ellipse(
          extent={{-40,-46},{40,-72}},
          lineColor={28,108,200},
          fillColor={0,149,152},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(points={{-40,54},{-40,-60}}, color={28,108,200}),
        Line(points={{40,54},{40,-60}}, color={28,108,200}),
        Rectangle(
          extent={{-40,54},{40,-60}},
          lineColor={28,108,200},
          fillColor={0,149,152},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-40,68},{40,42}},
          lineColor={28,108,200},
          fillColor={94,215,217},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-10,68},{8,60}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={107,107,107},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-10,58},{8,50}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={107,107,107},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,64},{8,54}},
          lineColor={28,108,200},
          pattern=LinePattern.None,
          fillColor={107,107,107},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This model implements a simple electric storage for the integration in an Battery Electric Vehicle model.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model is based on the energy conservation equation for a storage device. </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p>No implementation of Battery Management System (BMS) included.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Input: </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">P_set</span></b> for the setpoint of the active power consumption/generation.</p>
<p>Output:</p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">SOC</span></b> for the state of charge.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">P_request</span> </b>for the nominal power consumption in this moment dependent on the SOC.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">epp </span></b>for the PQ boundary and connection to the complex root mean square simulation.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">See parameter and variable descriptions in the code.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The equations 6.3 - 6.6 are calculated first before 6.1 and 6.2 are calculated due to the sequential structure of the model.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.1. Energy conservation equation</span></b></p>
<p>dE/dt = P_set;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.2. State of Charge</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">SOC = E / Capacity;</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.3. Reactive Power </span></b></p>
<p>Q = 0;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6.4. Request Power</span></b></p>
<p><span style=\"font-family: (Default);\">if&nbsp;noEvent(SOC&nbsp;&gt;=&nbsp;1)&nbsp;then</span></p>
<p><span style=\"font-family: (Default);\">P_request&nbsp;=&nbsp;0;</span></p>
<p><span style=\"font-family: (Default);\">elseif&nbsp;noEvent(SOC&nbsp;&gt;=&nbsp;SOC_th)&nbsp;then</span></p>
<p><span style=\"font-family: (Default);\">P_request&nbsp;=&nbsp;P_nominal*max(0,&nbsp;1&nbsp;-&nbsp;(1&nbsp;-&nbsp;lambda_Pmin)/(1&nbsp;-&nbsp;SOC_th)*(SOC&nbsp;-&nbsp;SOC_th));</span></p>
<p><br><span style=\"font-family: (Default);\">elseif&nbsp;noEvent(SOC&nbsp;&lt;=&nbsp;(1&nbsp;-&nbsp;SOC_th))&nbsp;then</span></p>
<p><span style=\"font-family: (Default);\">P_request&nbsp;=&nbsp;-P_nominal*max(0,&nbsp;(1&nbsp;-&nbsp;lambda_Pmin)/(1&nbsp;-&nbsp;SOC_th)*SOC&nbsp;*&nbsp;lambda_Pmin);</span></p>
<p><br><span style=\"font-family: (Default);\">else</span></p>
<p><span style=\"font-family: (Default);\">P_request&nbsp;=&nbsp;P_nominal;</span></p>
<p><span style=\"font-family: (Default);\">&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: (Default);\">end&nbsp;if;</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: Courier New;\">(no remarks)</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: Courier New;\">BEVBattery by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</span></p>
</html>"));
end BEVBattery;
