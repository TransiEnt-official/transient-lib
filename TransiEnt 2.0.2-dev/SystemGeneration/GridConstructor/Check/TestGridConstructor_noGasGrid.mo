﻿within TransiEnt.SystemGeneration.GridConstructor.Check;
model TestGridConstructor_noGasGrid



//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.2                             //
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
// Gas- und Wärme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//





  extends TransiEnt.Basics.Icons.Checkmodel;

  Components.Boundaries.Electrical.ApparentPower.FrequencyVoltage ElectricGrid(
    Use_input_connector_f=false,
    Use_input_connector_v=false,
    v_boundary=400) annotation (Placement(transformation(
        extent={{-12,-13},{12,13}},
        rotation=180,
        origin={-62,25})));
  TransiEnt.SystemGeneration.GridConstructor.GridConstructor grid_Constructor(
    gas_in=false,
    gas_out=false,
    el_in=true,
    el_out=false,
    dhn_in_s=false,
    dhn_out_s=false,
    dhn_in_r=false,
    dhn_out_r=false,
    redeclare model Demand_Consumer_1 = TransiEnt.Basics.Tables.Combined.CombinedTables.Demand_3Tables (relativepath_dhw="heat/Household/HotWater_20Households_VEDIS_1.5MWh_60s.txt"),
    redeclare model Demand_Consumer_2 = TransiEnt.Basics.Tables.Combined.CombinedTables.Demand_3Tables (relativepath_dhw="heat/Household/HotWater_20Households_VEDIS_1.5MWh_60s.txt"),
    n_elements=5,
    second_row=true,
    Technologies_1={TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(Boiler=1),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(CHP=1, Wallbox=1),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(heatPump=1, PV=1),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(ST=1),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(NSH=1),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix()},
    Technologies_2={TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(Oil=1, Wallbox=1),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(Biomass=1),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.TechnologyMatrix()},
    BoilerParameters_1={TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(eta=0.95),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(eta=0.95),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(eta=0.9),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(eta=0.9),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(eta=0.9),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters()},
    BoilerParameters_2={TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(eta=0.9),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.BoilerParameters()},
    PVParameters_1={TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(P_inst=3000),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.PVParameters()},
    HeatPumpParameters_1={TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(Q_flow_n=5000, T_source="T_ambient"),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters()},
    HeatPumpParameters_2={TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(P_el_backup=0, V_storage=0.5),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.HeatPumpParameters()},
    CHPParameters_1={TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(Q_CHP=5000, P_CHP=6000),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters()},
    CHPParameters_2={TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(Q_CHP=3000, P_CHP=3000),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.CHPParameters()},
    SolarHeatingParameters_1={TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(SpaceHeating=false, area=4),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),
        TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters(),TransiEnt.SystemGeneration.GridConstructor.DataRecords.SolarHeatingParameters()},
    second_Consumer={true,false,false,false,true,false,false,false},
    redeclare model Systems_Consumer_1 = TransiEnt.SystemGeneration.GridConstructor.IndependentTechnologies,
    redeclare model Systems_Consumer_2 = TransiEnt.SystemGeneration.GridConstructor.IndependentTechnologies) annotation (Placement(transformation(extent={{-30,16},{14,52}})));
public
  inner SimCenter simCenter(
    ambientConditions(
      redeclare TransiEnt.Basics.Tables.Ambient.GHI_Hamburg_3600s_2012_TMY globalSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.DNI_Hamburg_3600s_2012_TMY directSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.DHI_Hamburg_3600s_2012_TMY diffuseSolarRadiation,
      redeclare TransiEnt.Basics.Tables.Ambient.Temperature_Hamburg_3600s_TMY temperature),
    T_ground=278.15,
    p_eff_1=5000) annotation (Placement(transformation(extent={{-84,74},{-56,100}})));
equation
  connect(ElectricGrid.epp, grid_Constructor.epp_p) annotation (Line(
      points={{-50,25},{-30,25}},
      color={0,127,0},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Line(points={{12,16},{12,-26},{96,-26}}, color={28,108,200}),Text(
          extent={{16,-10},{96,-32}},
          lineColor={28,108,200},
          textString="Total Number of Consumers"),Line(points={{-24,14},{-24,-52},{64,-52}}, color={28,108,200}),Text(
          extent={{-18,-36},{62,-58}},
          lineColor={28,108,200},
          textString="Number of grid elements"),
        Text(
          extent={{-34,128},{92,52}},
          textColor={0,0,0},
          horizontalAlignment=TextAlignment.Left,
          textStyle={TextStyle.Bold},
          textString="Look at:
- grid.epp_p.P (Electrical demand of GridConstructor)")}),
    experiment(
      StopTime=36000,
      Interval=60,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>Test environment for the usage of the GridConstructor model with activated electric port without gas grid.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b> </p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p>(no remarks)</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created during the project IntegraNet</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Modified by Annika Heyer, 2021</span></p>
</html>"));
end TestGridConstructor_noGasGrid;
