within TransiEnt.Components.Heat;
model Pump_Dp
  //import and hierachy
  import   Modelica.Units.SI;
  //parameter
  parameter SI.Density rho = 1000 "Density of the fluid";
  parameter Real eta_mech=0.98;
  parameter Real eta_el=0.97;
  parameter Real delta_p_eps=100 "small pressure difference for linearization around zero";

  //variables
  SI.MassFlowRate m_flow;
  SI.VolumeFlowRate V_flow;
  SI.Power P_hyd;
  SI.Power P_el;

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn_simple inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-98,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-102,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut_simple outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={102,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput delta_p annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));
equation

inlet.m_flow+outlet.m_flow=0;
inlet.p-outlet.p=delta_p;
V_flow= P_hyd/(delta_p+delta_p_eps);
inlet.m_flow=m_flow;
m_flow=V_flow*rho;
P_el=P_hyd/eta_mech/eta_el;
  inlet.h_outflow = inStream(outlet.h_outflow);
  outlet.h_outflow = inStream(inlet.h_outflow);

  annotation (Icon(graphics={Ellipse(
          extent={{100,-100},{-100,100}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}));
end Pump_Dp;
