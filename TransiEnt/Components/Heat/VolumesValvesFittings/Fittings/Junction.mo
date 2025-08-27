within TransiEnt.Components.Heat.VolumesValvesFittings.Fittings;
model Junction "Simple model of a junction with no pressure loss, static mass balance and dynamic energy balance"
  //import and hierachy
  import         Modelica.Units.SI;
  //parameter
  parameter Integer n_ports=3 "number of edges this junction is connected to";
  parameter Real L = l / A "Momentum factor (unused in this model)";
  parameter SI.Length l = 1 "Length of the pipe (unused in this model)";
  parameter SI.Length d = 0.1 "Unused";
  parameter SI.Area A = Modelica.Constants.pi * (d / 2) ^ 2 "Unused";
  parameter SI.MassFlowRate m_flow_nom = 1 "Nominal mass flow rate of the water";
  parameter SI.PressureDifference delta_p_nom = 0.1e1 "Nominal pressure drop in the junction";
  parameter SI.Volume V = 0.005 "Volume of the pipe";
  parameter SI.Density rho = 983 "Density of the water";
  //variables
  /*SI.MassFlowRate m_flow_1(start = 1, nominal=m_flow_nom);
  SI.MassFlowRate m_flow_2(start = 1, nominal=m_flow_nom);*/
  SI.SpecificEnthalpy h(start = 60*4200, nominal=4200*60);
  SI.Pressure p;
  //instances of other classes
  DistrictHeatingGridsNew.Interfaces.FluidPortIn fluidPort[n_ports] annotation (Placement(
      visible=true,
      transformation(extent={{-10,-10},{10,10}}, rotation=0),
      iconTransformation(
        origin={-2,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  V * rho * der(h) = sum(fluidPort[i].m_flow*actualStream(fluidPort[i].h_outflow) for i in 1:n_ports);
  0 = sum(fluidPort[i].m_flow for i in 1:n_ports);
  for i in 1:n_ports loop
    fluidPort[i].p = p;
    fluidPort[i].h_outflow = h;
  end for;
 /* m_flow_1 = -inlet1.m_flow;
  m_flow_2 = -inlet2.m_flow;*/

  /* // Code for stationary model
  inlet1.h=(inlet2.m_flow * actualStream(inlet2.h) + outlet.m_flow * actualStream(outlet.h))/inlet1.m_flow;
  inlet2.h=(inlet1.m_flow * actualStream(inlet1.h) + outlet.m_flow * actualStream(outlet.h))/inlet2.m_flow;
  outlet.h= (inlet1.m_flow * actualStream(inlet1.h) + inlet2.m_flow * actualStream(inlet2.h))/outlet.m_flow;*/

  annotation (
    Icon(graphics={  Rectangle(origin = {-1, 0}, fillColor = {85, 85, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-39, 100}, {41, -100}}), Rectangle(origin = {30, -10}, fillColor = {85, 85, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-70, 50}, {70, -30}})}, coordinateSystem(initialScale = 0.1)));
end Junction;
