within TransiEnt.Basics.Blocks.Check;
model Check_OnOff

  extends TransiEnt.Basics.Icons.Checkmodel;

  OnOff                                           onOff
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
protected
  discrete Modelica.Blocks.Interfaces.BooleanInput state;

initial equation
  state = false;
equation
  when time > 5 then
    state = true;
  elsewhen time > 15 then
    state = false;
  elsewhen time > 90 then
    state = true;
  elsewhen time > 150 then
    state = false;
  elsewhen time > 210 then
    state = true;
  elsewhen time > 300 then
    state = false;
  elsewhen time > 301 then
    state = true;
  end when;

  connect(state, onOff.request);

  annotation (experiment(StopTime=420, __Dymola_Algorithm="Dassl"), Diagram(
        graphics={Text(
          extent={{-66,94},{70,50}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Check OnOff Block

Variable \"state\" (assigned in equation part) creates
a defined signal with on and off events. Dependent
on the switching frequency, the state is on hold."), Text(
          extent={{-66,54},{38,24}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="See \"state\" and \"onOff.signal\"")}));
end Check_OnOff;
