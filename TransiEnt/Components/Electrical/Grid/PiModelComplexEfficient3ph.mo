within TransiEnt.Components.Electrical.Grid;
model PiModelComplexEfficient3ph "3ph power cable model with efficient implementation dependent on r, x, b"
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
  extends TransiEnt.Basics.Icons.Model;

  // _____________________________________________
  //
  //          Visible Parameters
  // _____________________________________________
  parameter Boolean simplified_Pi_Model=false "Choose if Susceptance is used for calculation" annotation(Dialog(group="Electric parameters"));
  parameter SI.Length length "Line length" annotation(Dialog(group="Overall parameters"));
  parameter Integer parallel=1 "Number of parallel lines" annotation(Dialog(group="Overall parameters"));

  parameter TransiEnt.Basics.Units.SpecificResistance r(displayUnit="Ohm/km") "Resistance load per unit length" annotation(Dialog(group="Electric parameters"));
  parameter TransiEnt.Basics.Units.SpecificReactance x(displayUnit="Ohm/km") "Reactance load per unit length" annotation(Dialog(group="Electric parameters"));
  parameter TransiEnt.Basics.Units.SpecificConductance b(displayUnit="uS/km") "Susceptance load per unit length" annotation(Dialog(group="Electric parameters", enable=not simplified_Pi_Model));
  parameter Modelica.Units.SI.Current i_n(displayUnit="kA") "Nominal/Thermal limiting current" annotation(Dialog(group="Electric parameters"));

  // _____________________________________________
  //
  //          Constants and Hidden Parameters
  // _____________________________________________
  final parameter Modelica.Units.SI.Impedance R=r*length/parallel;
  final parameter Modelica.Units.SI.Impedance X=x*length/parallel;
  final parameter Modelica.Units.SI.Conductance B=if not simplified_Pi_Model then b*length*parallel else 0;

  // _____________________________________________
  //
  //          Interfaces
  // _____________________________________________
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp_p annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,0}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,0})));
  TransiEnt.Basics.Interfaces.Electrical.ComplexPowerPort epp_n annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,0}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,0})));

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________
  Modelica.Units.SI.ActivePower P_loss(displayUnit="MW") = epp_p.P + epp_n.P;
  Modelica.Units.SI.ReactivePower Q_loss(displayUnit="Mvar") = epp_p.Q + epp_n.Q;
  Modelica.Units.SI.Current i_loading "Overall current flow";

  Modelica.Units.SI.PerUnit loading(displayUnit="%") "Line current [pu]";

  Complex Y_11=1/Complex(R, X) + Complex(0, B)/2;
  Complex Y_12=-1/Complex(R, X);
  Complex Y_21=Y_12;
  Complex Y_22=Y_11;

  Complex V_1=Modelica.ComplexMath.fromPolar(epp_p.v, epp_p.delta);
  Complex V_2=Modelica.ComplexMath.fromPolar(epp_n.v, epp_n.delta);

  Basics.Interfaces.General.ControlBus controlBus annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  Modelica.Blocks.Sources.RealExpression    Current(y=i_loading)
                                                             annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Sources.RealExpression Nominal_current(y=i_n) annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Sources.RealExpression Loading(y=loading) annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
  Modelica.Blocks.Sources.RealExpression ActivePowerLoss(y=P_loss) annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Blocks.Sources.RealExpression ReactivePowerLoss(y=Q_loss) annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
  Modelica.Blocks.Sources.RealExpression VoltageDrop(y=abs(epp_p.v - epp_n.v)) annotation (Placement(transformation(extent={{-100,-140},{-80,-120}})));
equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  epp_p.f = epp_n.f;
  Connections.branch(epp_p.f, epp_n.f);

  Complex(epp_p.P, epp_p.Q) = Modelica.ComplexMath.fromPolar(epp_p.v, epp_p.delta)*Modelica.ComplexMath.conj(Y_11*Modelica.ComplexMath.fromPolar(epp_p.v, epp_p.delta) + Y_12*Modelica.ComplexMath.fromPolar(epp_n.v, epp_n.delta));
  Complex(epp_n.P, epp_n.Q) = Modelica.ComplexMath.fromPolar(epp_n.v, epp_n.delta)*Modelica.ComplexMath.conj(Y_12*Modelica.ComplexMath.fromPolar(epp_p.v, epp_p.delta) + Y_22*Modelica.ComplexMath.fromPolar(epp_n.v, epp_n.delta));

  i_loading = sqrt(max((epp_p.P^2 + epp_p.Q^2)/epp_p.v^2, (epp_n.P^2 + epp_n.Q^2)/epp_n.v^2)/3);
  loading = i_loading/(i_n*parallel);

  // _____________________________________________
  //
  //           Connect Statements
  // _____________________________________________
  connect(Current.y, controlBus.i_loading) annotation (Line(points={{-79,-30},{-50,-30},{-50,-90}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Nominal_current.y, controlBus.i_n) annotation (Line(points={{-79,-50},{-64,-50},{-64,-90},{-50,-90}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(Loading.y, controlBus.loading) annotation (Line(points={{-79,-70},{-66,-70},{-66,-104},{-50,-104},{-50,-90}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(ActivePowerLoss.y, controlBus.P_loss) annotation (Line(points={{-79,-90},{-68,-90},{-68,-106},{-36,-106},{-36,-90},{-50,-90}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(ReactivePowerLoss.y, controlBus.Q_loss) annotation (Line(points={{-79,-110},{-48,-110},{-48,-102},{-50,-102},{-50,-90}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(VoltageDrop.y, controlBus.v_drop) annotation (Line(points={{-79,-130},{-34,-130},{-34,-90},{-50,-90}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(graphics={
        Line(
          points={{-100,0},{102,0}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-100,-40},{100,-60}},
          textColor={28,108,200},
          textString="L = %length"),
        Text(
          extent={{-100,60},{100,40}},
          textColor={28,108,200},
          textString="%name"),
        Rectangle(
          extent={{-80,8},{80,-8}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The purpose of this model is to efficiently simulate 3-phase power cables for the distribution grid within complex RMS simulations. Compared to TransiEnt.Components.Electrical.Grid.PiModelComplex the formulation is simplified and therefore applies less numerical effort.</span></p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">L3E (defined in the CodingConventions), Quasi-Stationary model of symmetically loaded power cable with concentrated elements. Active- and reactive power (losses) are regarded. Electrical Pi-network.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Quasi-stationary model, model of line with concentrated elements, limited by the wavelength of the 50 Hz oscillation </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><b>Two ComplexPowerPort</b> for each terminal of the power cable.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">controlBus</span></b> for output parameters regarding current, loading, voltage drop, active and reactive losses.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">See parameter and variable descriptions in the code.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p><p>See also the Two Port equations in TransiEnt.Components.Electrical.Grid.PiModelComplex.</p><p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p>Choose the configuration of the subcomponents for your purpose. Model only valid for 3-phase lines/power cables.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p>[1] M. Schaefer, KIT, URL: https://www.zml.kit.edu/downloads/Elektrische_Energieuebertragung_Leseprobe_Kapitel_2.pdf, 2018</p>
<p><br><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<pre>Added by Tom Steffen, Techische Universit&auml;t Hamburg, Institut f&uuml;r Elektrische Energietechnik, 2025</pre>
</html>"));
end PiModelComplexEfficient3ph;
