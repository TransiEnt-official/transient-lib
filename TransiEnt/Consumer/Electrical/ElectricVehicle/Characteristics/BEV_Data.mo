within TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics;
record BEV_Data

  parameter Boolean useBEV=true
    annotation (choices(__Dymola_checkBox=true), Dialog(group="Electric Vehicle"));
  parameter Integer id=0;
  parameter Modelica.Units.SI.Energy Bat_Capacity(displayUnit="kWh") = 90e3*3600 "Battery capacity in Joule"
    annotation (Dialog(group="Battery"));
  parameter Real Bat_SOCStart(unit="1",displayUnit="%") = 0.5 "Battery Charge at start"
    annotation (Dialog(group="Battery"));
  parameter Modelica.Units.SI.Power Bat_PowerLimit(displayUnit="kW") = 15000
    "Charge and discharge power" annotation (Dialog(group="Battery"));

  replaceable parameter TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110 Bev_type=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110()
      constrainedby TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.BEV_measurements
      annotation (Dialog(group="Overall"), choices(
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R110() "Renault Zoe R110",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Renault_Zoe_R90() "Renault Zoe R90",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID3() "Volkswagen ID3",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Volkswagen_ID4() "Volkswagen ID4",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Nissan_Leaf() "Nissan Leaf",
      choice=TransiEnt.Consumer.Electrical.ElectricVehicle.Characteristics.Peugeot_ION() "Peugeot ION"));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end BEV_Data;
