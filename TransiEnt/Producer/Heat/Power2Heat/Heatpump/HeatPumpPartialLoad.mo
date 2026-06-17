within TransiEnt.Producer.Heat.Power2Heat.Heatpump;
model HeatPumpPartialLoad  "Heat pump with partial load behaviour"

  extends TransiEnt.Basics.Icons.HeatPump;
  import Modelica.Units.SI;
  outer TransiEnt.SimCenter simCenter "Global simulation settings (provides the default heat sink medium)";

  //_____/Parameters\_____
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid mediumHeatSink=simCenter.fluid1 "Fluid of heat sink" annotation (choicesAllMatching, Dialog(group="Secondary fluids"));
  parameter String heatSinkType = "Liquid" "Type of heat sink fluid; sets the temperature difference between refrigerant and heat sink (Liquid: 3 K, Gas: 8 K)" annotation(choices(choice="Liquid", choice="Gas"), Dialog(group="Secondary fluids"));
  parameter String heatSourceType = "Liquid" "Type of heat source fluid; sets the temperature difference between heat source and refrigerant (Liquid: 3 K, Gas: 8 K)" annotation(choices(choice="Liquid", choice="Gas"), Dialog(group="Secondary fluids"));

  //Definition of Coefficients for COP correlation
  parameter Boolean useCustomizedParameter=false "true: b1 and b2 are set by user" annotation(choices(checkBox=true), Dialog(group="Heat pump design"));
  //Columns b1 in W/K, b2 in 1/W; one row per heat pump
  protected
  constant Real hpCoeffs[:, 2] =
    [21.24, 3.74e-5;
    4.9,   1.6e-4;
    5496,  5.07e-8];  // 1: 60 kW brine to water
                      // 2: 15 kW air to water
                      // 3: 20 MW water to water

  public
  parameter Integer selectHP(min=1, max=size(hpCoeffs, 1)) = 1 "Predefined heat pump"
    annotation(choices(choice=1 "60 kW brine to water heat pump",
                       choice=2 "15 kW air to water heat pump",
                       choice=3 "20 MW water to water heat pump"),
               Dialog(enable=not useCustomizedParameter, group="Heat pump design"));
  parameter Real b1_custom(min=1e-10, unit="W/K")=5 "User-defined b1" annotation(Dialog(enable=useCustomizedParameter, group="Heat pump design"));
  parameter Real b2_custom(min=1e-20, unit="1/W")=5e-5 "User-defined b2" annotation(Dialog(enable=useCustomizedParameter, group="Heat pump design"));

  final parameter Real b1(unit="W/K") = if useCustomizedParameter then b1_custom else hpCoeffs[selectHP, 1] "b1 used in model";
  final parameter Real b2(unit="1/W") = if useCustomizedParameter then b2_custom else hpCoeffs[selectHP, 2] "b2 used in model";

  //_____/Variables\_____
  Real COP "Coefficient of performance (heat flow rate to the heat sink / electric power)";
  Real COP_c_inner "Carnot efficiency for inner temperatures";
  SI.TemperatureDifference deltaT_source "Temperature difference between refrigerant and heat source";
  SI.TemperatureDifference deltaT_sink "Temperature difference between refrigerant and heat sink";
  SI.Temperature T_hot "Condensing temperature";
  SI.Temperature T_cold "Evaporating temperature";
  SI.Temperature sinkTemperature "Heat sink outlet (supply) temperature";
  SI.HeatFlowRate Qflow "Heat flow rate to the heat sink fluid (negative: heat supplied; 0 if off)";

  SI.SpecificEnthalpy hIn "Specific enthalpy of the inflowing heat sink fluid";
  SI.SpecificEnthalpy hOut "Specific enthalpy of the heat sink fluid at the outlet";

  Boolean on "true: heat pump is on (heatFlowSet < -1 W)";

  //_____/Instances of other classes\_____
  Modelica.Blocks.Interfaces.RealInput sourceTemperature(unit="K") "Inlet temperature of the heat source" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-108,-40})));
  Modelica.Blocks.Interfaces.RealOutput electricConsumption(unit="W") "Electric power consumption of the heat pump (positive)" annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  Modelica.Blocks.Interfaces.RealInput heatFlowSet(unit="W") "Set point of the heat flow rate to the heat sink (negative: heat supplied)" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-108,40})));

  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn portA(Medium=mediumHeatSink) "Heat sink fluid inlet (return)" annotation (Placement(transformation(extent={{-80,-110},{-60,-90}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut portB(Medium=mediumHeatSink) "Heat sink fluid outlet (supply)" annotation (Placement(transformation(extent={{60,-110},{80,-90}})));
  TILMedia.VLEFluid_ph vleFluidOut(vleFluidType=mediumHeatSink, p=portA.p, h=hOut) "Fluid properties of the heat sink fluid at the outlet" annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));

equation
  on = heatFlowSet < -1; // W, below this the heat pump counts as off
  Qflow = if on then heatFlowSet else 0;

  assert(not on or T_hot>T_cold, "Temperature lift T_hot - T_cold <= 0 while heat pump is running", level=AssertionLevel.error);

  //Temperatures: refrigerant temperatures from constant temperature differences to the secondary fluids
  deltaT_source = if heatSourceType == "Liquid" then 3 else 8;
  deltaT_sink = if heatSinkType == "Liquid" then 3 else 8;
  sinkTemperature=vleFluidOut.T;
  T_hot = sinkTemperature + deltaT_sink;
  T_cold = sourceTemperature - deltaT_source;

  //Fluid ports: mass balance, no pressure loss and steady-state energy balance of the heat sink fluid
  portA.m_flow + portB.m_flow = 0;
  portA.p = portB.p;
  hIn = if portA.m_flow > 0 then inStream(portA.h_outflow) else inStream(portB.h_outflow);
  max(1e-5,abs(portA.m_flow))*(hIn-hOut) = Qflow; // minimum mass flow rate of 1e-5 kg/s catches a zero mass flow rate (division by zero)
  portA.h_outflow = hOut;
  portB.h_outflow = hOut;

  //COP calculation: Carnot COP of the refrigerant temperatures; partial load via the internal entropy generation (b1, b2)
  COP_c_inner = if on then T_hot / (T_hot - T_cold) else 0;
  electricConsumption = if on then -(Qflow - b1*exp(-b2*Qflow)*T_hot) / COP_c_inner else 0; //=Q_flow/COP; exponent is negative, because the heatflow is negative
  COP = if on then -Qflow / electricConsumption else 0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                                           Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Semi-empirical heat pump model whose coefficient of performance (COP) depends on both the temperature lift and the partial load. The model requires only two fitting parameters (b<sub>1</sub>, b<sub>2</sub>) and is intended for energy system simulations where a low parametrization effort and a high computational efficiency are required. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>L1: Explicit algebraic COP correlation without states, derived from the entropy and energy balance of the inner (refrigerant) cycle. Physical effects considered:</p>
<ul>
<li>Temperature lift via the Carnot COP of the refrigerant temperatures T<sub>hot</sub> (condensing) and T<sub>cold</sub> (evaporating)</li>
<li>Partial load via an empirical correlation for the internal entropy generation rate (exponential in the heat flow rate, linear in T<sub>hot</sub>/T<sub>cold</sub> &minus; 1)</li>
<li>Heat transfer between refrigerant and secondary fluids via constant temperature differences (3 K for liquids, 8 K for gases)</li>
<li>Steady-state energy balance of the heat sink fluid with real fluid properties (TILMedia)</li>
</ul>
<p>Physical insight: The COP approaches the Carnot COP for a vanishing internal entropy generation rate and never exceeds it. For a positive temperature lift the COP is positive. The COP tends to zero for very small and for very large heat flow rates, so that the second-law efficiency COP/COP<sub>Carnot</sub> has its maximum at partial load. </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>- Only for subcritical cycles with pure or nearly azeotropic refrigerants (e.g. R410A, R134a).</p>
<p>- The correlation for the internal entropy generation rate was established from measurements of a single heat pump (Abid et al. 2021b). It may deviate for other designs, e.g. two-stage cycles or cycles with economiser.</p>
<p>- Heat transfer is modelled with constant temperature differences only. They are fixed (3 K for liquids, 8 K for gases) and cannot be parametrized.</p>
<p>- Steady state: no thermal inertia, no on/off cycling, no minimum partial load, no capacity limit (the heat flow set point is always met) and no defrosting.</p>
<p>- No pressure loss on the heat sink side. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p><img src=\"modelica://TransiEnt/Images/HeatPumpPartialLoad_interfaces.svg\" alt=\"Interface diagram: signal inputs heatFlowSet and sourceTemperature (left), signal output electricConsumption (right), heat sink fluid ports portA and portB (bottom)\"/></p>
<p>heatFlowSet: set point of the heat flow rate to the heat sink in W; negative values mean heat supplied to the heat sink (Signal, input)</p>
<p>sourceTemperature: inlet temperature of the heat source in K (Signal, input)</p>
<p>electricConsumption: electric power consumption of the heat pump in W, positive (Signal, output)</p>
<p>portA: heat sink fluid inlet, e.g. return of a heating network (Fluid, inlet)</p>
<p>portB: heat sink fluid outlet, e.g. supply of a heating network (Fluid, outlet) </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"0\"><tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-qdot_set.png\" alt=\"\\dot{Q}_\\mathrm{set}\"/></p></td>
<td valign=\"middle\"><pre>heatFlowSet</pre></td>
<td valign=\"middle\"><p>set point of the heat flow rate to the heat sink (negative: heat supplied) [W]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><br><br><br><br><br><br><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-p_el.png\" alt=\"P_\\mathrm{el}\"/></p></td>
<td valign=\"middle\"><pre>electricConsumption</pre></td>
<td valign=\"middle\"><p>electric power consumption [W]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-cop.png\" alt=\"\\mathrm{COP}\"/></p></td>
<td valign=\"middle\"><pre>COP</pre></td>
<td valign=\"middle\"><p>coefficient of performance [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-cop_carnot.png\" alt=\"\\mathrm{COP}_\\mathrm{Carnot}\"/></p></td>
<td valign=\"middle\"><pre>COP_c_inner</pre></td>
<td valign=\"middle\"><p>Carnot COP of the refrigerant temperatures [-]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-t_hot.png\" alt=\"T_\\mathrm{hot}\"/></p></td>
<td valign=\"middle\"><pre>T_hot</pre></td>
<td valign=\"middle\"><p>condensing temperature of the refrigerant [K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-t_cold.png\" alt=\"T_\\mathrm{cold}\"/></p></td>
<td valign=\"middle\"><pre>T_cold</pre></td>
<td valign=\"middle\"><p>evaporating temperature of the refrigerant [K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-t_supply.png\" alt=\"T_\\mathrm{supply}\"/></p></td>
<td valign=\"middle\"><pre>sinkTemperature</pre></td>
<td valign=\"middle\"><p>heat sink outlet (supply) temperature [K]</p></td>
</tr>
<tr>
<td valign=\"middle\"></td>
<td valign=\"middle\"></td>
<td valign=\"middle\"></td>
</tr>
<tr>
<td valign=\"middle\"><p><br><br><br><br><br><br><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-dt_hot.png\" alt=\"\\Delta T_\\mathrm{hot}\"/></p></td>
<td valign=\"middle\"><pre>deltaT_sink</pre></td>
<td valign=\"middle\"><p>temperature difference between refrigerant and heat sink [K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-dt_cold.png\" alt=\"\\Delta T_\\mathrm{cold}\"/></p></td>
<td valign=\"middle\"><pre>deltaT_source</pre></td>
<td valign=\"middle\"><p>temperature difference between heat source and refrigerant [K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-sdot_int.png\" alt=\"\\dot{S}_\\mathrm{int}\"/></p></td>
<td valign=\"middle\"><p>&mdash;</p></td>
<td valign=\"middle\"><p>internal entropy generation rate of the refrigerant cycle; not a model variable [W/K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-a_i.png\" alt=\"a_\\mathrm{i}\"/></p></td>
<td valign=\"middle\"><p>&mdash;</p></td>
<td valign=\"middle\"><p>loss coefficient; not a model variable [W/K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-b_1.png\" alt=\"b_1\"/></p></td>
<td valign=\"middle\"><pre>b1</pre></td>
<td valign=\"middle\"><p>fitting parameter, pre-factor of the loss coefficient [W/K]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-b_2.png\" alt=\"b_2\"/></p></td>
<td valign=\"middle\"><pre>b2</pre></td>
<td valign=\"middle\"><p>fitting parameter, exponent coefficient of the loss coefficient [1/W]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-mdot_a.png\" alt=\"\\dot{m}_\\mathrm{A}\"/></p></td>
<td valign=\"middle\"><pre>portA.m_flow</pre></td>
<td valign=\"middle\"><p>mass flow rate at portA [kg/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-mdot_b.png\" alt=\"\\dot{m}_\\mathrm{B}\"/></p></td>
<td valign=\"middle\"><pre>portB.m_flow</pre></td>
<td valign=\"middle\"><p>mass flow rate at portB [kg/s]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-h_in.png\" alt=\"h_\\mathrm{in}\"/></p></td>
<td valign=\"middle\"><pre>hIn</pre></td>
<td valign=\"middle\"><p>specific enthalpy of the inflowing heat sink fluid [J/kg]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-h_out.png\" alt=\"h_\\mathrm{out}\"/></p></td>
<td valign=\"middle\"><pre>hOut</pre></td>
<td valign=\"middle\"><p>specific enthalpy of the heat sink fluid at the outlet [J/kg]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-p_a.png\" alt=\"p_\\mathrm{A}\"/></p></td>
<td valign=\"middle\"><pre>portA.p</pre></td>
<td valign=\"middle\"><p>pressure at portA [Pa]</p></td>
</tr>
<tr>
<td valign=\"middle\"><p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sym-p_b.png\" alt=\"p_\\mathrm{B}\"/></p></td>
<td valign=\"middle\"><pre>portB.p</pre></td>
<td valign=\"middle\"><p>pressure at portB [Pa]</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>Refrigerant temperatures from constant temperature differences to the secondary fluids (3 K for liquids, 8 K for gases):</p>
<p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-dt.png\" alt=\"T_hot = T_supply + DeltaT_hot,  T_cold = T_source,in - DeltaT_cold\"/></p>
<p>Empirical correlation for the internal entropy generation rate, linear in the temperature ratio and exponential in the heat flow rate:</p>
<p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sint.png\" alt=\"S_dot_int = a_i*(T_hot/T_cold - 1),  a_i = b_1*exp(b_2*Q_dot_hot)\"/></p>
<p>Inserting the correlation into the balances and solving for COP = Q̇<sub>hot</sub>/P<sub>el</sub> gives the explicit COP correlation with the Carnot COP of the refrigerant temperatures:</p>
<p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-cop.png\" alt=\"COP = COP_Carnot*Q_dot_hot/(Q_dot_hot + T_hot*b_1*exp(b_2*Q_dot_hot)),  COP_Carnot = T_hot/(T_hot - T_cold)\"/></p>
<p>Electric power consumption:</p>
<p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-pel.png\" alt=\"P_el = Q_dot_hot/COP\"/></p>
<p>Steady-state energy balance of the heat sink fluid; the heat flow rate follows the set point:</p>
<p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-sink.png\" alt=\"|m_dot_A|*(h_out - h_in) = Q_dot_hot = -Q_dot_set\"/></p>
<p>Mass balance and pressure of the heat sink fluid (no pressure loss):</p>
<p><img src=\"modelica://TransiEnt/Images/equations/equation-hp-mass.png\" alt=\"m_dot_A + m_dot_B = 0,  p_A = p_B\"/> </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>- Sign convention: heatFlowSet &lt; 0 means heat supplied to the heat sink. For heatFlowSet &ge; -1 W the heat pump is off; then COP = 0, electricConsumption = 0 and the heat sink fluid leaves with unchanged specific enthalpy.</p>
<p>- The mass flow rate of the heat sink fluid has to be imposed externally, e.g. by a pump or a mass flow boundary. A zero mass flow rate (division by zero) is caught by a minimum mass flow rate of 1e-5 kg/s.</p>
<p>- The supply temperature is not controlled; it results from the energy balance of the heat sink fluid.</p>
<p>- Requires an inner <code>simCenter</code> (TransiEnt.SimCenter); the heat sink medium defaults to <code>simCenter.fluid1</code>.</p>
<p>- The model terminates the simulation if T<sub>hot</sub> &le; T<sub>cold</sub> while the heat pump is on.</p>
<p>- <code>heatSinkType</code> and <code>heatSourceType</code> select the temperature difference between refrigerant and secondary fluid (Liquid: 3 K, Gas: 8 K).</p>
<p>- Parametrization: choose a predefined heat pump with <code>selectHP</code> or set <code>useCustomizedParameter = true</code> and define <code>b1_custom</code> and <code>b2_custom</code>. The fit requires at least two operating points with different heat flow rates, which should cover a range of heat flow rates as wide as possible. For the fit, T<sub>hot</sub> and T<sub>cold</sub> are calculated with the same constant temperature differences as in the model.</p>
<p>Predefined parameter sets:</p>
<table cellspacing=\"0\" cellpadding=\"4\" border=\"1\"><tr>
<td><p align=\"center\"><h4>selectHP</h4></p></td>
<td><p align=\"center\"><h4>Heat pump</h4></p></td>
<td><p align=\"center\"><b>b<sub>1</sub> [W/K]</b></p></td>
<td><p align=\"center\"><b>b<sub>2</sub> [1/W]</b></p></td>
<td><p align=\"center\"><h4>Source</h4></p></td>
</tr>
<tr>
<td><p>1</p></td>
<td><p>60 kW brine to water</p></td>
<td><p>21.24</p></td>
<td><p>3.74e-5</p></td>
<td><p>[source to be added]</p></td>
</tr>
<tr>
<td><p>2</p></td>
<td><p>15 kW air to water</p></td>
<td><p>4.9</p></td>
<td><p>1.6e-4</p></td>
<td><p>[source to be added]</p></td>
</tr>
<tr>
<td><p>3</p></td>
<td><p>20 MW water to water</p></td>
<td><p>5496</p></td>
<td><p>5.07e-8</p></td>
<td><p>[source to be added]</p></td>
</tr>
</table>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>The COP correlation was validated against measurement data of four heat pumps: an air-to-water heat pump with R410A (Abid et al. 2021a), a water-to-water heat pump with R134a (Skye 2022) and the brine-to-water heat pumps ecoGEO+ 45 kW and 60 kW with R410A (ECOFOREST 2025). The mean absolute percentage error (MAPE) of the COP lies between 1.8 &percnt; and 7.4 &percnt;.</p>
<p>Tested in check model &quot;HeatPump_PartialLoad.TestHeatPumpPartialLoad&quot; </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>Abid, M.; Hewitt, N.; Huang, M.-J.; Wilson, C.; Cotter, D., 2021a: Performance Analysis of the Developed Air Source Heat Pump System at Low-to-Medium and High Supply Temperatures for Irish Housing Stock Heat Load Applications. Sustainability 13(21), 11753, doi:10.3390/su132111753.</p>
<p>Abid, M.; Hewitt, N.; Huang, M. J.; Wilson, C.; Cotter, D., 2021b: Experimental Study of the Heat Pump with Variable Speed Compressor for Domestic Heat Load Applications.</p>
<p>Skye, H. M., 2022: Data for NIST Technical Note: Validation and Optimization with a Vapor Compression Cycle Model Accounting for Refrigerant Thermodynamic and Transport Properties. National Institute of Standards and Technology (NIST), https://data.nist.gov/od/ds/ark:/88434/mds2-2613/Experiment&percnt;20-&percnt;20All&percnt;20-&percnt;20Rev_1_5.zip.</p>
<p>ECOFOREST, 2025: Technical Datasheets Heat pumps (ecoGEO+ series), DS_HP_EN_v2025_01. </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Michael Vieth (michael.vieth@tuhh.de) on 02.10.2026</p>
</html>"));
end HeatPumpPartialLoad;
