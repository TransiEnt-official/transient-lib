within TransiEnt.Consumer.Heat.Check;
model TestTableBased




//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 3.0.0                             //
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
// Gas- und WÃ¤rme-Institut Essen						  //
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

  TableBasedHeatConsumer tableBasedHeatConsumer_L1(redeclare TransiEnt.Basics.Tables.HeatGrid.HeatDemand.HeatDemand_SLPGas_MFH_2012_3600s consumerDataTable, change_of_sign=true,
    integrateHeatFlow=false)
    annotation (Placement(transformation(extent={{-60,-28},{6,34}})));

  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(extent={{54,14},{34,34}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=0.1) annotation (Placement(transformation(extent={{84,17},{64,37}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=400e3)   annotation (Placement(transformation(extent={{86,-3},{66,17}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink fluidSink annotation (Placement(transformation(extent={{58,-32},{38,-12}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=10e5) annotation (Placement(transformation(extent={{90,-32},{70,-12}})));
equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(realExpression.y,fluidSource. m_flow_in) annotation (Line(points={{63,27},{52,27}},     color={0,0,127}));
  connect(realExpression1.y,fluidSource. h_in) annotation (Line(points={{65,7},{60,7},{60,22},{52,22}},           color={0,0,127}));
  connect(realExpression2.y,fluidSink. p_in) annotation (Line(points={{69,-22},{56,-22}}, color={0,0,127}));
  connect(fluidSink.port_a, tableBasedHeatConsumer_L1.fluidPortOut) annotation (Line(points={{38,-22},{36,-22},{36,-21.8},{6,-21.8}}, color={0,0,0}));
  connect(fluidSource.port_a, tableBasedHeatConsumer_L1.fluidPortIn) annotation (Line(points={{34,24},{28,24},{28,-9.4},{6,-9.4}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-80,-80},
            {100,80}})),                Icon(graphics,
                                             coordinateSystem(extent={{-80,-80},
            {100,80}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>Test environment for a table based heat consumer</p>
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
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end TestTableBased;
