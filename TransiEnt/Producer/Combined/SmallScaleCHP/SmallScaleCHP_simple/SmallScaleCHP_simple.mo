within TransiEnt.Producer.Combined.SmallScaleCHP.SmallScaleCHP_simple;
model SmallScaleCHP_simple "Small scale CHP model using a constant efficiency and fluid ports"




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
// Gas- und WÃ¤rme-Institut Essen                                                  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//




  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Producer.Electrical.Base.PartialNaturalGasUnit(final useSecondGasPort=false);
  extends TransiEnt.Basics.Icons.CHP;

  import Modelica.Units.SI;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  final parameter SI.HeatFlowRate Q_flow_n=P_el_n/eta_el*eta_th "Nominal heat flow rate";

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter Boolean usePowerPort=true "True if power port shall be used" annotation (Dialog(group="Configuration"), choices(checkBox=true));
  parameter Boolean useFluidPorts=true "True if fluid ports shall be used" annotation (Dialog(group="Configuration"), choices(checkBox=true));
  parameter Boolean useHeatPort=true "True if heat port shall be used" annotation (Dialog(group="Configuration", enable=not useFluidPorts), choices(checkBox=true));
  parameter Boolean change_sign=false "If false, setpoint value needs to be negative" annotation (Dialog(group="Configuration"), choices(checkBox=true));

  parameter TILMedia.VLEFluidTypes.BaseVLEFluid mediumWater=simCenter.fluid1 "Medium to be used" annotation (choicesAllMatching, Dialog(group="Fundamental Definitions", enable=useFluidPorts));
  parameter SI.Pressure p_drop=10 "Pressure drop" annotation (Dialog(group="Fundamental Definitions", enable=useFluidPorts));
  parameter SI.SpecificHeatCapacity cf=4200 "Specific heat capacity of the heat carrier";
  parameter SI.Power P_el_n=3.5e3 "Nominal electric power" annotation (Dialog(group="Fundamental Definitions"));
  parameter SI.Efficiency eta_el=0.3 "Constant electric efficiency" annotation (Dialog(group="Fundamental Definitions"));
  parameter SI.Efficiency eta_th=0.6 "Constant thermal efficiency" annotation (Dialog(group="Fundamental Definitions"));

  parameter SI.SpecificEnthalpy HoC_fuel=40e6 "Heat of combustion of fuel, will be used if gasport is deactivated in model" annotation (Dialog(group="Fundamental Definitions", enable=not useGasPort), choices(
      choice=simCenter.HeatingValue_natGas "Natural gas",
      choice=simCenter.HeatingValue_LightOil "Oil",
      choice=simCenter.HeatingValue_Wood "Wood pellets"));
  parameter Boolean integrateElPower=simCenter.integrateElPower "true if electric powers shall be integrated" annotation (Dialog(group="Statistics"));
  parameter Boolean integrateHeatFlow=simCenter.integrateHeatFlow "true if heat flows shall be integrated" annotation (Dialog(group="Statistics"));
  parameter Boolean calculateCost=simCenter.calculateCost "true if cost shall be calculated" annotation (Dialog(group="Statistics"));

  replaceable model ProducerCosts = TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.Empty constrainedby TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.PartialPowerPlantCostSpecs annotation (Dialog(group="Statistics"), __Dymola_choicesAllMatching=true);

  replaceable model PowerBoundaryModel =  Components.Boundaries.Electrical.ActivePower.Power  constrainedby TransiEnt.Components.Boundaries.Electrical.Base.PartialModelPowerBoundary "Choice of power boundary model. The power boundary model must match the power port." annotation (
    choicesAllMatching=true,
    Dialog(group="Replaceable Components"));

  replaceable connector PowerPortModel=Basics.Interfaces.Electrical.ActivePowerPort constrainedby TransiEnt.Basics.Interfaces.Electrical.PartialPowerPort "Choice of power port" annotation (
    choicesAllMatching=true,
    Dialog(group="Replaceable Components"));

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  outer TransiEnt.SimCenter simCenter;


  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple waterPortIn if useFluidPorts annotation (Placement(transformation(extent={{90,-30},{110,-10}}), iconTransformation(extent={{90,-30},{110,-10}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple waterPortOut if useFluidPorts annotation (Placement(transformation(extent={{90,30},{110,50}}), iconTransformation(extent={{90,30},{110,50}})));
  Modelica.Blocks.Interfaces.RealInput Q_flow_set "Setpoint value of the heat flow rate, should be negative" annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealOutput H_flow "Consumed gas enthalpy flow" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-110}), iconTransformation(extent={{96,72},{116,92}}, rotation=0)));


    PowerPortModel epp if usePowerPort annotation (
      Placement(transformation(extent={{88,-88},{108,-68}})));

   PowerBoundaryModel Power if usePowerPort annotation (
     Placement(transformation(extent={{60,-88},{40,-68}})));



  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b heatPort if useHeatPort and not
                                                                                     (useFluidPorts) annotation (Placement(transformation(extent={{90,52},{110,72}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  replaceable TransiEnt.Components.Boundaries.Heat.Heatflow_L1 heatFlowBoundary(
    p_drop=p_drop,
    use_Q_flow_in=true,
    change_sign=true)  if useFluidPorts constrainedby TransiEnt.Components.Boundaries.Heat.Heatflow_L1 annotation (
    Dialog(group="Replaceable Components"),
    choicesAllMatching=true,
    Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,6})));

  Modelica.Blocks.Sources.RealExpression P_el_set(y=P_el) if usePowerPort annotation (Placement(transformation(extent={{4,-64},{24,-44}})));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow if not (useFluidPorts) and useHeatPort annotation (Placement(transformation(extent={{-28,52},{-8,72}})));
  Modelica.Blocks.Math.Gain sign(k=if change_sign then 1 else -1) annotation (Placement(transformation(extent={{-68,-9},{-50,9}})));

  Modelica.Blocks.Math.Division division annotation (Placement(transformation(extent={{-68,78},{-48,98}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=H_flow) annotation (Placement(transformation(extent={{-96,84},{-76,104}})));
  Basics.Interfaces.Thermal.HeatFlowRateOut Q_flow_gen annotation (Placement(transformation(extent={{96,2},{120,26}}), iconTransformation(extent={{96,2},{120,26}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=sign.y) annotation (Placement(transformation(extent={{44,-8},{64,12}})));
  Modelica.Blocks.Sources.RealExpression HoC_constant(y=HoC_fuel) if not useGasPort annotation (Placement(transformation(extent={{-100,56},{-80,76}})));

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  SI.Power P_el "Electric power";


  Modelica.Blocks.Sources.RealExpression T_in(y=noEvent(actualStream(waterPortIn.h_outflow))/cf) if useFluidPorts annotation (Placement(transformation(extent={{-76,-58},{-56,-38}})));
  Modelica.Blocks.Sources.RealExpression T_out(y=noEvent(actualStream(waterPortOut.h_outflow))/cf) if useFluidPorts
                                                                             annotation (Placement(transformation(extent={{-76,-82},{-56,-62}})));
equation

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  //heatFlowBoundary.Q_flow_prescribed=Q_flow_set;
  P_el = -Q_flow_set*sign.k*eta_el/eta_th;
  H_flow = -(P_el - Q_flow_set*sign.k)/(eta_el + eta_th);
  //m_flow_gas=H_flow/vleNCVSensor.NCV;



  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  if usePowerPort then
     connect(Power.epp, epp) annotation (Line(
         points={{60,-78},{98,-78}},
         color={0,135,135},
         thickness=0.5));
    connect(P_el_set.y, Power.P_el_set) annotation (Line(points={{25,-54},{56,-54},{56,-66}}, color={0,0,127}));
  end if;
  if useFluidPorts then
  end if;
  if not (useFluidPorts) then
    connect(prescribedHeatFlow.port, heatPort) annotation (Line(points={{-8,62},{100,62}}, color={191,0,0}));
  end if;

  if useGasPort then
    connect(m_flow_gas, division.y) annotation (Line(points={{8,88},{-47,88}}, color={0,0,127}));

    if useGasPort then
      connect(vleNCVSensor.NCV, division.u2) annotation (Line(points={{53,92},{44,92},{44,110},{-100,110},{-100,82},{-70,82}}, color={0,0,127}));
    end if;

  end if;
  connect(division.u1, realExpression1.y) annotation (Line(points={{-70,94},{-75,94}}, color={0,0,127}));
  connect(Q_flow_set, sign.u) annotation (Line(points={{-100,0},{-69.8,0}}, color={0,0,127}));
  connect(sign.y, heatFlowBoundary.Q_flow_prescribed) annotation (Line(points={{-49.1,0},{-8,2.22045e-16}}, color={0,0,127}));
  connect(sign.y, prescribedHeatFlow.Q_flow) annotation (Line(points={{-49.1,0},{-34,0},{-34,62},{-28,62}}, color={0,0,127}));
  connect(realExpression3.y, Q_flow_gen) annotation (Line(points={{65,2},{90,2},{90,14},{108,14}}, color={0,0,127}));
  connect(HoC_constant.y, division.u2) annotation (Line(points={{-79,66},{-70,66},{-70,82}}, color={0,0,127}));

  connect(heatFlowBoundary.fluidPortOut, waterPortOut) annotation (Line(points={{10,12},{10,40},{100,40}}, color={0,0,0}));
  connect(heatFlowBoundary.fluidPortIn, waterPortIn) annotation (Line(points={{10,-8.88178e-16},{12,-8.88178e-16},{12,-20},{100,-20}}, color={0,0,0}));
  annotation (Documentation(info="<html>
<p><b><span style=\"color: #008000;\">1. Purpose of model</span></b></p>
<p>Simple small scale CHP model with constant efficiencies.</p>
<p><b><span style=\"color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p>(none)</p>
<p><b><span style=\"color: #008000;\">3. Limits of validity </span></b></p>
<p>(Purely technical component without physical modeling.)</p>
<p><b><span style=\"color: #008000;\">4. Interfaces</span></b></p>
<p>Q_flow_set: set value for the heat flow</p>
<p>T_source_input_K: source temperature (ambient temperature) in K</p>
<p>waterPortIn: inlet port for heating water</p>
<p>waterPortOut: outlet port for heating water</p>
<p>P_el: needed electric power</p>
<p>epp: electric power port</p>
<p>heatFlowRateOut Q_flow_gen</p>
<p><b><span style=\"color: #008000;\">5. Nomenclature</span></b></p>
<p>(no elements)</p>
<p><b><span style=\"color: #008000;\">6. Governing Equations</span></b></p>
<p>(none)</p>
<p><b><span style=\"color: #008000;\">7. Remarks for Usage</span></b></p>
<p>(none)</p>
<p><b><span style=\"color: #008000;\">8. Validation</span></b></p>
<p>(no validation or testing necessary)</p>
<p><b><span style=\"color: #008000;\">9. References</span></b></p>
<p>(none)</p>
<p><b><span style=\"color: #008000;\">10. Version History</span></b></p>
<p>Model created by Carsten Bode (c.bode@tuhh.de), Aug 2018</p>
<p>Model modified by Jan Westphal (j.westphal@tuhh.de), Jul 2019 (added boolean for power port, added boolean for using gas port)</p>
<p>Model modified by Emil Dierkes (emil.dierkes@umsicht.fraunhofer.de) and Anne Hagemeier (anne.hagemeier@umsicht.fraunhofer.de), July 2021 (added boolean for using fluid ports, change_sign and output Q_flow_gen).</p>
</html>"));
end SmallScaleCHP_simple;
