within TransiEnt.Producer.Heat.Power2Heat.Heatpump.Check;
model TestHeatpumpWithControl_bivalent_fluidports_ramp "Model for testing HeatpumpWithControl with fluid ports, bivalent operation and T taken from fluid ports"
  import TransiEnt;



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
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//




  extends TransiEnt.Basics.Icons.Checkmodel;
  inner SimCenter simCenter(ambientConditions(redeclare TransiEnt.Basics.Tables.Ambient.Temperature_Hamburg_900s_2012 temperature))
                            annotation (Placement(transformation(extent={{-98,80},{-78,100}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency electricGrid(useInputConnector=false) annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
  TransiEnt.Producer.Heat.Power2Heat.Heatpump.BivalentHeatPumpWithControl hps(
    T_External=false,
    Delta_T_db=5,
    t_min_on=300,
    t_min_off=300,
    controller(T_bivalent(displayUnit="K") = 265.15)) annotation (Placement(transformation(extent={{-12,-6},{8,14}})));
  Modelica.Blocks.Sources.Ramp T_feed_set(
    offset=35 + 273.15,
    startTime=0,
    duration=80000,
    height=5) annotation (Placement(transformation(extent={{-62,-6},{-42,14}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSink fluidSink(h=45*4186) annotation (Placement(transformation(extent={{-8,46},{12,66}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1.2e5) annotation (Placement(transformation(extent={{-38,46},{-18,66}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=hps.Q_flow_n/(4.2e3*20)) annotation (Placement(transformation(extent={{-114,-62},{-94,-42}})));
  TransiEnt.Components.Boundaries.FluidFlow.FluidSource fluidSource annotation (Placement(transformation(extent={{-80,-72},{-60,-52}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=35*4186) annotation (Placement(transformation(extent={{-118,-110},{-98,-90}})));
equation
  connect(electricGrid.epp, hps.epp) annotation (Line(
      points={{12,-30},{4,-30},{4,-5.8},{3.8,-5.8}},
      color={0,0,0},
      smooth=Smooth.None));

public
function plotResult

  constant String resultFileName = "TestBivalentHeatpumpSystem_L2.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

  createPlot(id=1, position={0, 0, 1541, 851}, y={"hps.Heatpump.feedback.y", "hps.Heatpump.Controller.uLow", "hps.Heatpump.Controller.uHigh"}, range={0.0, 50000.0, -20.0, 5.0}, grid=true, colors={{28,108,200}, {238,46,47}, {0,140,72}},filename=resultFileName);
  createPlot(id=1, position={0, 0, 1541, 209}, y={"hps.Heatpump.Q_flow.y"}, range={0.0, 50000.0, -2000.0, 6000.0}, grid=true, subPlot=2, colors={{28,108,200}},filename=resultFileName);
  createPlot(id=1, position={0, 0, 1541, 209}, y={"T_feed_set.y", "hps.T_out.T"}, range={0.0, 50000.0, 305.0, 330.0}, grid=true, subPlot=3, colors={{28,108,200}, {238,46,47}},filename=resultFileName);
  createPlot(id=1, position={0, 0, 1541, 209}, y={"hps.COP"}, range={0.0, 50000.0, 1.5, 1.6}, grid=true, subPlot=4, colors={{28,108,200}},filename=resultFileName);

   resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
equation
  connect(T_feed_set.y, hps.T_set) annotation (Line(points={{-41,4},{-18,4},{-18,-3.3},{-12.3,-3.3}}, color={0,0,127}));
  connect(realExpression.y, fluidSink.p_in) annotation (Line(points={{-17,56},{-6,56}}, color={0,0,127}));
  connect(realExpression1.y, fluidSource.m_flow_in) annotation (Line(points={{-93,-52},{-84,-52},{-84,-59},{-78,-59}}, color={0,0,127}));
  connect(realExpression2.y, fluidSource.h_in) annotation (Line(points={{-97,-100},{-86,-100},{-86,-64},{-78,-64}}, color={0,0,127}));
  connect(fluidSource.port_a, hps.inlet) annotation (Line(points={{-60,-62},{80,-62},{80,0.2},{8,0.2}}, color={0,0,0}));
  connect(fluidSink.port_a, hps.outlet) annotation (Line(points={{12,56},{34,56},{34,50},{36,50},{36,7},{8.2,7}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-48,92},{66,66}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Look at: T_feed_set.y, heatPump.Q_flow and
 electricGrid.epp.P")}),        experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p><b><span style=\"color: #008000;\">1. Purpose of model</span></b></p>
<p>Test environment for BivalentHeatpumpWithControl</p>
<p><b><span style=\"color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p>(Purely technical component without physical modeling.)</p>
<p><b><span style=\"color: #008000;\">3. Limits of validity </span></b></p>
<p>(Purely technical component without physical modeling.)</p>
<p><b><span style=\"color: #008000;\">4.Interfaces</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">5. Nomenclature</span></b></p>
<p>(no elements)</p>
<p><b><span style=\"color: #008000;\">6. Governing Equations</span></b></p>
<p>(no equations)</p>
<p><b><span style=\"color: #008000;\">7. Remarks for Usage</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">8. Validation</span></b></p>
<p>(no validation or testing necessary)</p>
<p><b><span style=\"color: #008000;\">9. References</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">10. Version History</span></b></p>
</html>"));
end TestHeatpumpWithControl_bivalent_fluidports_ramp;
