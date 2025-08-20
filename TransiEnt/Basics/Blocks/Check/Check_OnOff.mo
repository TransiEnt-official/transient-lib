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

  annotation (experiment(StopTime=420, __Dymola_Algorithm="Dassl"));
end Check_OnOff;
