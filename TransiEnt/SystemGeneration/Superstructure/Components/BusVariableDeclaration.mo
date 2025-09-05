within TransiEnt.SystemGeneration.Superstructure.Components;
record BusVariableDeclaration
  extends TransiEnt.Basics.Icons.RecordModel;

  parameter Integer nRegions;
  parameter Integer MaximalDifferentTypesOfPowerPlants;
  parameter Integer MaximalDifferentTypesOfElectricalStorages;
  parameter Integer nFracH2;
  parameter Integer n_gasPortOut_powerPlants;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));

end BusVariableDeclaration;
