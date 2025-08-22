within TransiEnt.Consumer.Heat;
model HeatConsumerSubstation

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
// Gas- und WÃ¤rme-Institut Essen                                                  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//

 // _____________________________________________
 //
 //          Imports and Class Hierarchy
 // _____________________________________________

  outer TransiEnt.SimCenter simCenter;
  outer TransiEnt.ModelStatistics modelStatistics;
  extends TransiEnt.Basics.Icons.Household;

 // _____________________________________________
 //
 //                   Parameters
 // _____________________________________________

  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_ground annotation (Placement(transformation(extent={{-64,-78},{-42,-57}})));
  parameter String path_to_loadprofile = "combined/Typology_Cologne/2015/T_6/heat/GC_1.csv";
  parameter Integer column = 2;
  parameter String path_to_loadprofile_dhw = "combined/Typology_Cologne/2015/T_6/dhw/GC_1.csv";
  parameter Integer column_dhw=2;

  parameter Modelica.Units.SI.HeatFlowRate Q_max=90*1000;
  parameter Real imperfection_rate = 0.1;
  parameter Modelica.Units.SI.Length l_supply_pipes=20;
  parameter Integer useNode = 1;
  final parameter Modelica.Units.SI.SpecificHeatCapacity cp_w=TILMedia.VLEFluidFunctions.specificIsobaricHeatCapacity_pTxi(
      simCenter.fluid1,
      simCenter.p_nom[2],
      simCenter.T_supply,
      {1,0,0});
  final parameter Modelica.Units.SI.Density rho=TILMedia.VLEFluidFunctions.density_pTxi(
      simCenter.fluid1,
      simCenter.p_nom[2],
      simCenter.T_supply,
      {1,0,0}) "Constant Water Density";

  parameter Modelica.Units.SI.Length d_i=sqrt((4*Q_max)/(Modelica.Constants.pi*simCenter.v_nom*rho*cp_w*(simCenter.T_supply - simCenter.T_return)));
  parameter Integer rowIdx = TransiEnt.Basics.Functions.getClosest(     d_i * 1000,
                                                                   simCenter.DNmat);
  parameter Integer DN = integer(simCenter.DNmat[rowIdx, 1]);

  parameter Integer activate_ha = simCenter.activate_consumer_pipes;

 // _____________________________________________
 //
 //                   Interfaces
 // _____________________________________________

  Basics.Tables.GenericDataTable Q_demand_RH(
    multiple_outputs=true,
    columns={column},
    relativepath=path_to_loadprofile,
    use_absolute_path=false,
    absolute_path=path_to_loadprofile,
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    offset={0},
    startTime=0,
    tableName="default",
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(extent={{-94,70},{-70,94}})));
  Producer.Heat.Heat2Heat.Substation_indirect_noStorage_L1 substation(T_start=simCenter.T_supply, m_flow_min=simCenter.m_flow_min) annotation (Placement(transformation(extent={{-44,-16},{44,48}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn waterPortIn(Medium=simCenter.fluid1) annotation (Placement(transformation(extent={{-84,-105},{-74,-95}}), iconTransformation(extent={{-76,-116},{-44,-84}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut waterPortOut(Medium=simCenter.fluid1) annotation (Placement(transformation(extent={{74,-105},{84,-95}}), iconTransformation(extent={{44,-118},{78,-84}})));
  Basics.Tables.GenericDataTable Q_demand_DHW(
    multiple_outputs=true,
    columns={column_dhw},
    relativepath=path_to_loadprofile_dhw,
    use_absolute_path=false,
    absolute_path=path_to_loadprofile_dhw) annotation (Placement(transformation(extent={{0,74},{20,94}})));
  Modelica.Blocks.Interfaces.RealOutput Q_demand
                                                annotation (Placement(transformation(extent={{98,38},{138,78}})));
  ClaRa.Components.Sensors.SensorVLE_L1_T T_in_sub(unitOption=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-52,0})));
  ClaRa.Components.Sensors.SensorVLE_L1_T T_out_sub(unitOption=1)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,0})));

 TransiEnt.Components.Heat.VolumesValvesFittings.Pipes.DoublePipePair_L2 pipe_ha(length=max(l_supply_pipes, 5), DN=DN) if activate_ha == 1 annotation (Placement(transformation(
        extent={{18.1277,17.8723},{-18.1277,-17.8723}},
        rotation=270,
        origin={-0.1277,-68.1277})));
  TransiEnt.Components.Heat.node node(n=2) if activate_ha == 1 and useNode == 1 annotation (Placement(transformation(
        extent={{-15.188,16.0099},{15.188,-16.0099}},
        rotation=180,
        origin={2.812,-35.9901})));
 Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{76,52},{88,64}})));

 //Statistics
  Components.Statistics.Collectors.LocalCollectors.CollectHeatingPower collectHeatingPower(typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Consumer)
                                                                                                                                                         annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Sources.RealExpression T_amb(y=simCenter.Variable_Ground_Temperature.value) annotation (Placement(transformation(extent={{-98,-76},{-84,-60}})));
equation
 //Demand Statistics
  collectHeatingPower.heatFlowCollector.Q_flow=Q_demand;

 // _____________________________________________
 //
 //            Connect statements
 // _____________________________________________

  connect(pipe_ha.waterPortOut_return, waterPortOut) annotation (Line(
      points={{7.02122,-86.2554},{7.02122,-92},{79,-92},{79,-100}},
      color={175,0,0},
      thickness=0.5));
  connect(waterPortIn, pipe_ha.waterPortIn_supply) annotation (Line(
      points={{-79,-100},{-79,-92},{-7.27662,-92},{-7.27662,-86.2554}},
      color={175,0,0},
      thickness=0.5));

  connect(T_in_sub.port, substation.waterPortIn) annotation (Line(
      points={{-52,-10},{-52,-16},{-18.8571,-16}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(T_out_sub.port, substation.waterPortOut) annotation (Line(
      points={{50,-10},{50,-16.32},{19.1714,-16.32}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));

  if activate_ha == 0 then

    connect(substation.waterPortOut, waterPortOut) annotation (Line(
        points={{19.1714,-16.32},{80,-16.32},{80,-100},{79,-100}},
        color={175,0,0},
        thickness=0.5));
    connect(waterPortIn, substation.waterPortIn) annotation (Line(
        points={{-79,-100},{-79,-16},{-18.8571,-16}},
        color={175,0,0},
        thickness=0.5));

  elseif activate_ha == 1 and useNode == 0 then
    connect(pipe_ha.waterPortOut_supply, substation.waterPortIn);
    connect(substation.waterPortOut, pipe_ha.waterPortIn_return);
     connect(T_ground.port, pipe_ha.heat_supply) annotation (Line(points={{-42,-67.5},{-24,-67.5},{-24,-68.1277},{-18,-68.1277}}, color={191,0,0}));
    connect(T_ground.port, pipe_ha.heat_return) annotation (Line(points={{-42,-67.5},{-24,-67.5},{-24,-94},{20,-94},{20,-90},{22,-90},{22,-68.1277},{17.7446,-68.1277}}, color={191,0,0}));
   connect(pipe_ha.waterPortOut_return, waterPortOut) annotation (Line(
        points={{7.02122,-86.2554},{7.02122,-92},{79,-92},{79,-100}},
        color={175,0,0},
        thickness=0.5));
    connect(waterPortIn, pipe_ha.waterPortIn_supply) annotation (Line(
        points={{-79,-100},{-79,-92},{-7.27662,-92},{-7.27662,-86.2554}},
        color={175,0,0},
        thickness=0.5));
    connect(T_ground.port, pipe_ha.heat_supply) annotation (Line(points={{-42,-67.5},{-24,-67.5},{-24,-68.1277},{-18,-68.1277}}, color={191,0,0}));
    connect(T_ground.port, pipe_ha.heat_return) annotation (Line(points={{-42,-67.5},{-24,-67.5},{-24,-94},{20,-94},{20,-90},{22,-90},{22,-68.1277},{17.7446,-68.1277}}, color={191,0,0}));

  else
    connect(T_ground.port, pipe_ha.heat_supply) annotation (Line(points={{-42,-67.5},{-24,-67.5},{-24,-68.1277},{-18,-68.1277}}, color={191,0,0}));
    connect(T_ground.port, pipe_ha.heat_return) annotation (Line(points={{-42,-67.5},{-24,-67.5},{-24,-94},{20,-94},{20,-90},{22,-90},{22,-68.1277},{17.7446,-68.1277}}, color={191,0,0}));

    connect(pipe_ha.waterPortIn_return, node.waterPort_return[2]) annotation (Line(
        points={{7.02122,-49.6374},{2.66012,-49.6374},{2.66012,-42.5141}},
        color={175,0,0},
        thickness=0.5));
    connect(pipe_ha.waterPortOut_supply, node.waterPort_supply[2]) annotation (Line(
        points={{-7.27662,-50},{-18,-50},{-18,-27.3448},{2.812,-27.3448}},
        color={175,0,0},
        thickness=0.5));
    connect(substation.waterPortIn, node.waterPort_supply[1]) annotation (Line(
        points={{-18.8571,-16},{-18,-16},{-18,-28.6255},{2.812,-28.6255}},
        color={175,0,0},
        thickness=0.5));
    connect(substation.waterPortOut, node.waterPort_return[1]) annotation (Line(
        points={{19.1714,-16.32},{19.1714,-44},{6,-44},{6,-42},{4,-42},{4,-43.875},{2.66012,-43.875}},
        color={175,0,0},
        thickness=0.5));
    connect(pipe_ha.waterPortOut_return, waterPortOut) annotation (Line(
        points={{7.02122,-86.2554},{7.02122,-92},{79,-92},{79,-100}},
        color={175,0,0},
        thickness=0.5));
    connect(waterPortIn, pipe_ha.waterPortIn_supply) annotation (Line(
        points={{-79,-100},{-79,-92},{-7.27662,-92},{-7.27662,-86.2554}},
        color={175,0,0},
        thickness=0.5));
    connect(T_ground.port, pipe_ha.heat_supply) annotation (Line(points={{-42,-67.5},{-24,-67.5},{-24,-68.1277},{-18,-68.1277}}, color={191,0,0}));
    connect(T_ground.port, pipe_ha.heat_return) annotation (Line(points={{-42,-67.5},{-24,-67.5},{-24,-94},{20,-94},{20,-90},{22,-90},{22,-68.1277},{17.7446,-68.1277}}, color={191,0,0}));
  end if;

  connect(Q_demand_RH.y[1], substation.Q_demand_RH) annotation (Line(points={{-68.8,82},{-34.5714,82},{-34.5714,44.8}}, color={0,0,127}));
  connect(Q_demand_RH.y[1], add.u2) annotation (Line(points={{-68.8,82},{-30,82},{-30,54.4},{74.8,54.4}}, color={0,0,127}));
  connect(add.y, Q_demand) annotation (Line(points={{88.6,58},{118,58}},             color={0,0,127}));
  connect(modelStatistics.heatFlowCollector[TransiEnt.Basics.Types.TypeOfResource.Consumer],collectHeatingPower.heatFlowCollector);
  connect(Q_demand_DHW.y[1], substation.Q_demand_DHW) annotation (Line(points={{21,84},{34.5714,84},{34.5714,44.8}}, color={0,0,127}));
  connect(Q_demand_DHW.y[1], add.u1) annotation (Line(points={{21,84},{38,84},{38,61.6},{74.8,61.6}}, color={0,0,127}));
  connect(T_amb.y, T_ground.T) annotation (Line(points={{-83.3,-68},{-83.3,-67.5},{-66.2,-67.5}},
                                                                                              color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                            Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">District-heating consumer with indirect substation. Takes space-heating and DHW demand profiles as input and links the consumer hydraulically to the district heating grid, optional with house-connection pipes.</span></p>
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
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b> </p>
<p><span style=\"font-family: MS Shell Dlg 2;\">provide file paths for profiles; set activate_ha/useNode according to the desired network configuration; ensure realistic simCenter temperature and pressure levels. </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Gas- und W&auml;rme-Institut Essen and XRG, 2022 </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Modified by Stefanie Ruppert, 2025</span></p>
</html>"));
end HeatConsumerSubstation;
