within TransiEnt.Basics.Types;
type ControlType = enumeration(
  Internal "No external control. All internal controllers are active.",
  Limit_P "Active power is limited from outside.",
  External_P "Internal controllers are disabled. External inputs will be used.",
  External_T "External temperature set-value will be used.",
  Priority "External priority is given, must be implemented by additional signals.")
  "Control modes for externally controlled models";
