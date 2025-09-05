within TransiEnt.Examples.DistributionGrids.MediumVoltageGrids.Check;
model Check_MV_rural_2
  extends TransiEnt.Basics.Icons.Checkmodel;
  MV_rural_2_no_switch                            mV_rural_2_no_switch(
    development_scenario="Intermediate",
    weatherLocation="Hamelin",
    weatherYear="2019",
    photovoltaicControlType=TransiEnt.Basics.Types.ControlType.Limit_P,
    batteryControlType=TransiEnt.Basics.Types.ControlType.Limit_P,
    heatingControlType=TransiEnt.Basics.Types.ControlType.Limit_P,
    bevControlType=TransiEnt.Basics.Types.ControlType.Limit_P) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Components.Boundaries.Electrical.ComplexPower.SlackBoundary               vDelta1(v_gen=110e3, f_n=50)
                    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Basics.Interfaces.General.ControlBus            controlBus annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
equation
  connect(vDelta1.epp, mV_rural_2_no_switch.epp) annotation (Line(
      points={{20,0},{-40,0}},
      color={28,108,200},
      thickness=0.5));
  connect(mV_rural_2_no_switch.controlBus, controlBus) annotation (Line(
      points={{-50,0},{-90,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=17280000,
      StopTime=17884800,
      __Dymola_Algorithm="Dassl"));
end Check_MV_rural_2;
