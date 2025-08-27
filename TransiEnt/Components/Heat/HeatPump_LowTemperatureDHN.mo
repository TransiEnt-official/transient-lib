within TransiEnt.Components.Heat;
model HeatPump_LowTemperatureDHN "Heat Pump model in low temperature DHN"
  //import and hierachy
  import Modelica.Units.SI;

  //parameter

  //parameter Real COP = 3.5;
  parameter Real cp = 4186;
  parameter SI.HeatFlowRate Q_flow_nom_house = 8e3;
  parameter Real eta_carnot = 0.6;
  parameter SI.TemperatureDifference delta_T_HP = 10;
  parameter Real psi = 0.13;
  //parameter SI.TemperatureDifference delta_T_house = 18;
  parameter SI.Volume V = 0.05 "Volume of the heat exchanger";
  parameter SI.Density rho = 983 "Density of the water";
  parameter Real alpha = 0.6;
  parameter SI.TemperatureDifference delta_T_house_nom = 20;

  //variables

  SI.HeatFlowRate Q_flow_DHN;
  SI.HeatFlowRate Q_flow_house;
  SI.ActivePower P_el;
  SI.Temperature T_house_supply;
  SI.SpecificEnthalpy h( start = 4200*30);
  Real COP;
  Real eta_pl;
  SI.Temperature T_DHN_in;
  SI.Temperature T_DHN_out;
  SI.Temperature T_house_return;
  SI.Temperature T_m_house;
  SI.Temperature T_m_DHN;
  //SI.MassFlowRate m_flow_house;

  //instances of other classes
  DistrictHeatingGridsNew.Interfaces.FluidPortIn inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DistrictHeatingGridsNew.Interfaces.FluidPortOut outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortS annotation (Placement(
      visible=true,
      transformation(
        origin={-20,100},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-20,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortR annotation (Placement(transformation(extent={{10,90},{30,110}})));
equation

  // Energieerhaltung Netz
  inlet.p - outlet.p = 0;
  inlet.m_flow + outlet.m_flow = 0;

  Q_flow_DHN = inlet.m_flow * (inStream(inlet.h_outflow) - actualStream(outlet.h_outflow)) - V *rho * der(h);
  Q_flow_house = Q_flow_DHN + P_el;
  P_el = Q_flow_house / COP;
  COP = max(eta_carnot * eta_pl * (T_m_house + delta_T_HP) / (T_m_house - T_m_DHN + 2 * delta_T_HP), 1);
  eta_pl = min(1 - psi * (1 - Q_flow_house / Q_flow_nom_house), 1);
  inlet.h_outflow = h;
  outlet.h_outflow = h;

  T_DHN_in = inStream(inlet.h_outflow) / cp +273.15;
  T_DHN_out = h / cp + 273.15;

  T_m_house = 0.5 * (T_house_supply + T_house_return);
  T_m_DHN = 0.5 * (T_DHN_in+T_DHN_out);

  //Wärmeport
  heatPortS.Q_flow = -Q_flow_house;
  heatPortR.Q_flow = 0;
  heatPortS.T = T_house_supply;
  heatPortR.T = T_house_return;
  //delta_T_house = T_house_supply - T_house_return;
  //Q_flow_house = (T_house_supply - T_house_return) * cp * m_flow_house;
  //m_flow_house = alpha * inlet.m_flow;
  Q_flow_house = Q_flow_nom_house *(T_house_supply - T_house_return) / delta_T_house_nom;

  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {-60, 0}, extent = {{-40, 100}, {160, -100}}), Rectangle(extent = {{-58, 50}, {-58, 50}}), Rectangle(extent = {{-92, 64}, {-92, 64}}), Line(origin = {-10, 10}, points = {{-90, -90}, {90, 90}}), Line(origin = {10, -10}, points = {{-90, -90}, {90, 90}})}));
end HeatPump_LowTemperatureDHN;
