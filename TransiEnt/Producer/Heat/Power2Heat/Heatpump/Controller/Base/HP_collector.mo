within TransiEnt.Producer.Heat.Power2Heat.Heatpump.Controller.Base;
block HP_collector "Collects inputs and outputs from heating bus"

  Models_CyEntEE.CellModels.Heat.Controller.HPBus hpBus;

  Modelica.Blocks.Interfaces.RealOutput SOC;
  Modelica.Blocks.Interfaces.BooleanInput signal;
  Modelica.Blocks.Interfaces.RealInput P_external(unit="W");
  Modelica.Blocks.Interfaces.RealOutput P(unit="W");
  Modelica.Blocks.Interfaces.RealOutput P_min(unit="W");
  Modelica.Blocks.Interfaces.RealOutput P_max(unit="W");
  Modelica.Blocks.Interfaces.BooleanOutput HP_blocked;
  Modelica.Blocks.Interfaces.BooleanOutput HP_state;

equation
  connect(hpBus.SOC_dyn, SOC);
  connect(hpBus.SignalActive, signal);
  connect(hpBus.P_external, P_external);
  connect(hpBus.P, P);
  connect(hpBus.P_min, P_min);
  connect(hpBus.P_HP_max, P_max);
  connect(hpBus.HP_blocked, HP_blocked);
  connect(hpBus.HP_state, HP_state);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HP_collector;
