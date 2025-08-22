within TransiEnt.Components.Heat;
model node

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

 // _____________________________________________
 //
 //                   Parameters
 // _____________________________________________


  parameter Integer n=5;
  parameter Integer n_junc=0;
  parameter Modelica.Units.SI.Time tau_delay=900;

 // _____________________________________________
 //
 //                   Interfaces
 // _____________________________________________


  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn waterPort_supply[n](each Medium=simCenter.fluid1) annotation (Placement(transformation(extent={{-104,35},{-94,45}}), iconTransformation(extent={{-16,34},{16,66}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut waterPort_return[n](each Medium=simCenter.fluid1) annotation (Placement(transformation(extent={{-104,-45},{-94,-35}}), iconTransformation(extent={{-16,-62},{18,-28}})));

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn waterPort_supply_junc[n_junc](each Medium=simCenter.fluid1) annotation (Placement(transformation(extent={{-6,93},{4,103}}), iconTransformation(extent={{32,-14},{64,18}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut waterPort_return_junc[n_junc](each Medium=simCenter.fluid1) annotation (Placement(transformation(extent={{-4,-105},{6,-95}}), iconTransformation(extent={{-64,-16},{-30,18}})));

  Modelica.Units.SI.MassFraction[simCenter.fluid1.nc - 1] xi_mix_supply;
  Modelica.Units.SI.MassFraction[simCenter.fluid1.nc - 1] xi_mix_return;

  Modelica.Units.SI.SpecificEnthalpy h_mix_supply;
  Modelica.Units.SI.SpecificEnthalpy h_mix_return;
  Modelica.Units.SI.SpecificEnthalpy h_mix_supply_delay(start=TILMedia.VLEFluidFunctions.specificEnthalpy_pTxi(
          simCenter.fluid1,
          6e5,
          simCenter.T_supply,
          simCenter.fluid1.xi_default), nominal=1e5);
  Modelica.Units.SI.SpecificEnthalpy h_mix_return_delay(start=TILMedia.VLEFluidFunctions.specificEnthalpy_pTxi(
          simCenter.fluid1,
          6e5,
          simCenter.T_return,
          simCenter.fluid1.xi_default), nominal=1e5);

  Modelica.Units.SI.MassFlowRate[n_junc] m_flow_junc_supply(each start=-3);
  Modelica.Units.SI.MassFlowRate[n_junc] m_flow_junc_return(each start=3);

equation

  // Steady state mass balance
  sum(waterPort_return.m_flow) + sum(waterPort_return_junc.m_flow) = 0;
  sum(waterPort_supply.m_flow) + sum(waterPort_supply_junc.m_flow) = 0;

  for i in 2:n loop
    waterPort_supply[i].p = waterPort_supply[1].p;
    waterPort_return[i].p = waterPort_return[1].p;
  end for;

  for i in 1:n_junc loop
    tau_delay*der(m_flow_junc_supply[i]) + m_flow_junc_supply[i] = waterPort_supply_junc[i].p - waterPort_supply[1].p;
    tau_delay*der(m_flow_junc_return[i]) + m_flow_junc_return[i] = waterPort_return_junc[i].p - waterPort_return[1].p;
    waterPort_supply_junc[i].m_flow = m_flow_junc_supply[i];
    waterPort_return_junc[i].m_flow = m_flow_junc_return[i];
  end for;

  // Steady component balance - ideal mixing
  for j in 1:simCenter.fluid1.nc - 1 loop
    xi_mix_supply[j] = (sum({max(waterPort_supply[i].m_flow, 1e-10)*inStream(waterPort_supply[i].xi_outflow[j]) for i in 1:n}) + sum({max(waterPort_supply_junc[i].m_flow, 1e-10)*inStream(waterPort_supply_junc[i].xi_outflow[j]) for i in 1:n_junc}))/(sum({max(waterPort_supply.m_flow[i], 1e-10) for i in 1:n}) + sum({max(waterPort_supply_junc.m_flow[i], 1e-10) for i in 1:n_junc}));
    xi_mix_return[j] = (sum({max(waterPort_return[i].m_flow, 1e-10)*inStream(waterPort_return[i].xi_outflow[j]) for i in 1:n}) + sum({max(waterPort_return_junc[i].m_flow, 1e-10)*inStream(waterPort_return_junc[i].xi_outflow[j]) for i in 1:n_junc}))/(sum({max(waterPort_return.m_flow[i], 1e-10) for i in 1:n}) + sum({max(waterPort_return_junc.m_flow[i], 1e-10) for i in 1:n_junc}));
  end for;
  for i in 1:n loop
    waterPort_supply[i].xi_outflow = xi_mix_supply;
    waterPort_return[i].xi_outflow = xi_mix_return;
  end for;
  for i in 1:n_junc loop
    for j in 1:simCenter.fluid1.nc - 1 loop
      waterPort_supply_junc[i].xi_outflow[j] = xi_mix_supply[j];
      waterPort_return_junc[i].xi_outflow[j] = xi_mix_return[j];
    end for;
  end for;

  // Energy balance
  h_mix_supply = (sum({max(waterPort_supply[i].m_flow, 1e-10)*inStream(waterPort_supply[i].h_outflow) for i in 1:n}) + sum({max(waterPort_supply_junc[i].m_flow, 1e-10)*inStream(waterPort_supply_junc[i].h_outflow) for i in 1:n_junc}))/(sum({max(waterPort_supply[i].m_flow, 1e-10) for i in 1:n}) + sum({max(waterPort_supply_junc[i].m_flow, 1e-10) for i in 1:n_junc}));
  h_mix_return = (sum({max(waterPort_return[i].m_flow, 1e-10)*inStream(waterPort_return[i].h_outflow) for i in 1:n}) + sum({max(waterPort_return_junc[i].m_flow, 1e-10)*inStream(waterPort_return_junc[i].h_outflow) for i in 1:n_junc}))/(sum({max(waterPort_return[i].m_flow, 1e-10) for i in 1:n}) + sum({max(waterPort_return_junc[i].m_flow, 1e-10) for i in 1:n_junc}));


  tau_delay*der(h_mix_supply_delay) = h_mix_supply - h_mix_supply_delay;
  tau_delay*der(h_mix_return_delay) = h_mix_return - h_mix_return_delay;


  waterPort_supply.h_outflow = fill(h_mix_supply_delay, n);
  waterPort_return.h_outflow = fill(h_mix_return_delay, n);
  waterPort_return_junc.h_outflow = fill(h_mix_supply_delay, n_junc);
  waterPort_supply_junc.h_outflow = fill(h_mix_return_delay, n_junc);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Ellipse(
          extent={{-42,-40},{42,44}},
          lineColor={28,108,200},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This model represents a district-heating node. It performs ideal mixing separately for the supply side and the return side. It applies a first-order dynamic on specific enthalpy and mass flows at the connection points to simulate transport delays.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Ideal mixing of mass fractions and enthalpy.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Mass conservation for supply and return.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">First-order delay (tau_delay) for enthalpy and junction mass flows.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">No pipe storage, pressure losses, or heat losses considered.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">n Supply and return ports, optional junction ports.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Mass balance: Total inflows equal zero.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Equal pressure: All supply ports share the same pressure and all return ports share the same pressure</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Ideal mixing (mass-flow-weighted).</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">First-order delay for enthalpy and mass flow.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b> </p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model is simplified; combine with detailed network components. </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Gas- und W&auml;rme-Institut Essen and XRG, 2022 </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Modified by Stefanie Ruppert, 2025</span></p>
</html>"));
end node;
