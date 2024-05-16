within TransiEnt.Consumer.Electrical.Check;
model CheckBatteryElectricVehicleWithControl

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

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Checkmodel;

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  inner TransiEnt.SimCenter simCenter(tableInterpolationSmoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments)
                                      annotation (Placement(transformation(extent={{-88,76},{-68,96}})));



  TransiEnt.Basics.Blocks.Sources.PowerExpression
                               ReducedPower(y=4200)
               annotation (Placement(transformation(
        extent={{-9,-7},{9,7}},
        rotation=0,
        origin={-15,21})));
  BatteryElectricVehicle batteryElectricVehicle(
    inputDataType="SoC",                        useExternalControl=true,
    controlType="Power limit")                                                                        annotation (Placement(transformation(extent={{36,30},{58,52}})));
  TransiEnt.Components.Boundaries.Electrical.ComplexPower.SlackBoundary slackBoundary annotation (Placement(transformation(extent={{66,30},{86,52}})));
  Modelica.Blocks.Sources.Sine ApparentPower(
    amplitude=200,
    f=1/10000,
    offset=250) "Apparent power at transformer" annotation (Placement(transformation(extent={{-92,16},{-76,32}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{8,32},{22,46}})));
  TransiEnt.Basics.Blocks.Sources.PowerExpression MaxPower(y=batteryElectricVehicle.P_max_BEV_charge)
    annotation (Placement(transformation(
        extent={{-10,-7},{10,7}},
        rotation=0,
        origin={-16,55})));
  Modelica.Blocks.Logical.LessEqual lessEqual annotation (Placement(transformation(extent={{-58,-10},{-46,2}})));
  Modelica.Blocks.Sources.RealExpression Threshold(y=400) annotation (Placement(transformation(
        extent={{-9,-7},{9,7}},
        rotation=0,
        origin={-79,-21})));
  Modelica.Blocks.Sources.RealExpression
                               ReducedPower1(y=0.8)
               annotation (Placement(transformation(
        extent={{-9,-7},{9,7}},
        rotation=0,
        origin={-15,-63})));
  BatteryElectricVehicle batteryElectricVehicle1(
    inputDataType="Distance",                    useExternalControl=true,
    controlType="Proportional")                                                                       annotation (Placement(transformation(extent={{46,-50},{68,-28}})));
  TransiEnt.Components.Boundaries.Electrical.ComplexPower.SlackBoundary slackBoundary1
                                                                                      annotation (Placement(transformation(extent={{78,-52},{98,-30}})));
  Modelica.Blocks.Logical.Switch switch2 annotation (Placement(transformation(extent={{14,-50},{28,-36}})));
  Modelica.Blocks.Sources.RealExpression One(y=1) annotation (Placement(transformation(
        extent={{-10,-7},{10,7}},
        rotation=0,
        origin={-16,-31})));
equation

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(batteryElectricVehicle.epp, slackBoundary.epp) annotation (Line(
      points={{57.78,40.78},{66,41}},
      color={28,108,200},
      thickness=0.5));
  connect(switch1.u3, ReducedPower.y) annotation (Line(points={{6.6,33.4},{6.6,21},{-5.1,21}}, color={0,0,127}));
  connect(MaxPower.y, switch1.u1) annotation (Line(points={{-5,55},{6.6,55},{6.6,44.6}}, color={0,0,127}));
  connect(ApparentPower.y, lessEqual.u1) annotation (Line(points={{-75.2,24},{-64,24},{-64,-4},{-59.2,-4}}, color={0,0,127}));
  connect(lessEqual.y, switch1.u2) annotation (Line(points={{-45.4,-4},{-40,-4},{-40,39},{6.6,39}}, color={255,0,255}));
  connect(Threshold.y, lessEqual.u2) annotation (Line(points={{-69.1,-21},{-58,-21},{-58,-12},{-59.2,-12},{-59.2,-8.8}}, color={0,0,127}));
  connect(batteryElectricVehicle1.epp, slackBoundary1.epp) annotation (Line(
      points={{67.78,-39.22},{67.78,-41},{78,-41}},
      color={28,108,200},
      thickness=0.5));
  connect(switch2.u3, ReducedPower1.y) annotation (Line(points={{12.6,-48.6},{12.6,-63},{-5.1,-63}}, color={0,0,127}));
  connect(One.y, switch2.u1) annotation (Line(points={{-5,-31},{12.6,-31},{12.6,-37.4}}, color={0,0,127}));
  connect(lessEqual.y, switch2.u2) annotation (Line(points={{-45.4,-4},{-30,-4},{-30,-43},{12.6,-43}}, color={255,0,255}));
  connect(switch1.y, batteryElectricVehicle.P_limit) annotation (Line(points={{22.7,39},{28,39},{28,40.45},{35.01,40.45}}, color={0,0,127}));
  connect(switch2.y, batteryElectricVehicle1.p_control) annotation (Line(points={{28.7,-43},{37.35,-43},{37.35,-43.29},{45.01,-43.29}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
  Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>Test environment for the electric car model.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
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
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Dorian Hoeffner, TUHH in November 2021</span></p>
</html>"),
    experiment(
      StopTime=86400,
      Interval=60,
      __Dymola_Algorithm="Dassl"));
end CheckBatteryElectricVehicleWithControl;
