within TransiEnt.Components.Electrical.Grid.Base;
model AdmittanceTwoPort "2-Port from admittance matrix"

  SI.ActivePower P_loss(displayUnit="MW") =epp_p.P  +epp_n.P;
  SI.ReactivePower Q_loss(displayUnit="Mvar") =epp_p.Q  +epp_n.Q;

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

  Complex Y_11=Complex(0);
  Complex Y_12=Complex(0);
  Complex Y_21=Y_12;
  Complex Y_22=Y_11;

  Complex V_1=Modelica.ComplexMath.fromPolar(
                                    epp_p.v,epp_p.delta);
  Complex V_2=Modelica.ComplexMath.fromPolar(
                                    epp_n.v,epp_n.delta);

equation

  epp_p.f =epp_n.f;
  Connections.branch(epp_p.f,epp_n.f);

  Complex(epp_p.P, epp_p.Q) = Modelica.ComplexMath.fromPolar(epp_p.v, epp_p.delta)
    *Modelica.ComplexMath.conj(Y_11*Modelica.ComplexMath.fromPolar(epp_p.v,
    epp_p.delta) + Y_12*Modelica.ComplexMath.fromPolar(epp_n.v, epp_n.delta));
  Complex(epp_n.P, epp_n.Q) = Modelica.ComplexMath.fromPolar(epp_n.v, epp_n.delta)
    *Modelica.ComplexMath.conj(Y_12*Modelica.ComplexMath.fromPolar(epp_p.v,
    epp_p.delta) + Y_22*Modelica.ComplexMath.fromPolar(epp_n.v, epp_n.delta));
  annotation (Icon(graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,128,255},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255})}));
end AdmittanceTwoPort;
