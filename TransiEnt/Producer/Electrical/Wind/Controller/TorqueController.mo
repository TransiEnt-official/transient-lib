within TransiEnt.Producer.Electrical.Wind.Controller;
model TorqueController



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

  extends TransiEnt.Basics.Icons.Controller;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

//  parameter Modelica.Blocks.Types.SimpleController controllerType_T=.Modelica.Blocks.Types.SimpleController.PI
//    "Type of controller"                                                                                                     annotation (Dialog(tab="Controller", group="Torque"),choicesAllMatching=true);
//  parameter Real k_T=1e6 "Gain of controller" annotation (Dialog(tab="Controller", group="Torque"));
//  parameter Real Ti_T=1 "Time constant of controller" annotation (Dialog(tab="Controller", group="Torque"));
//  parameter Real yMax_T=2*T_nom "Upper limit of PI controlled beta setpoint" annotation (Dialog(tab="Controller", group="Torque"));
//  parameter Real yMin_T=-2*T_nom "Lower limit of output" annotation (Dialog(tab="Controller", group="Torque"));
//  parameter SI.Torque T_nom = 1.92 "Nominal torque of turbine";
  parameter Real k_turbine "Turbine control constant";
  parameter SI.Torque tau_n;
  parameter SI.Torque tau_start=K_start*tau_n "Start value of torque";
  parameter Real K_start=-0.05 "Factor of torque at startup in pu";
  parameter SI.Time T_torqueControl=1 "Time Constant";

  parameter Real J "Wind turbine moment of inertia";
  parameter Real lambdaOpt "Optimal tip speed ratio";
  parameter SI.Density rho "Density";
  parameter SI.Length radius "Rotor Radius";
  parameter Real cp_opt "Optimal capacity factor";
  parameter Boolean limitsAtInit = true "= false, if limits are ignored during initialization";
  parameter Boolean strict=false "= true, if strict limits with noEvent(..)";

  parameter SI.Velocity v_cutIn;
  parameter SI.Velocity v_cutOut = 25;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  input SI.Velocity v_wind "Wind velocity" annotation(Dialog);

  Modelica.Blocks.Logical.Hysteresis torqueControllerDisabled(uLow=0.98,
      uHigh=1.02)                                             annotation (Placement(transformation(extent={{-56,-8},
            {-42,6}})));
  Modelica.Blocks.Logical.Switch tau_set
    annotation (Placement(transformation(extent={{-26,-12},{-6,8}})));

  TransiEnt.Basics.Interfaces.General.AngularVelocityIn omega_is "Input for angular velocity" annotation (Placement(
        transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(rotation=0, extent={{192,-10},
            {212,10}})));
  Modelica.Blocks.Sources.RealExpression v_wind_is(y=v_wind/wind_fullload)
                                                             annotation (Placement(transformation(extent={{-140,
            -12},{-94,10}})));
  Modelica.Blocks.Sources.RealExpression tau_set_partload(y=omega_is^2*k_turbine)
    annotation (Placement(transformation(extent={{-142,-44},{-90,-12}})));

  TransiEnt.Basics.Interfaces.Ambient.VelocityIn wind_fullload "Input for wind velocity at full load" annotation (Placement(
        transformation(rotation=0, extent={{-110,50},{-90,70}}),
        iconTransformation(extent={{-110,50},{-90,70}})));
  Modelica.Blocks.Nonlinear.Limiter
                           limiter1(
    uMax=1e8,
    strict=true,
    uMin=0)
    annotation (Placement(transformation(extent={{28,-16},{48,4}},  rotation=
            0)));
  Modelica.Blocks.Logical.Switch tau_set1
    annotation (Placement(transformation(extent={{100,6},{112,-6}})));
  Modelica.Blocks.Sources.RealExpression v_wind_is1(y=v_wind/v_cutIn)
                                                             annotation (Placement(transformation(extent={{-10,8},
            {20,28}})));
  Modelica.Blocks.Logical.Hysteresis torqueControllerDisabled1(
                                                              uLow=0.98,
      uHigh=1.02)                                             annotation (Placement(transformation(extent={{30,10},{44,24}})));
  Modelica.Blocks.Math.Gain tau_friction(k=K_start*10)       annotation (Placement(transformation(extent={{38,34},{50,46}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1,
    T=T_torqueControl,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=tau_start) annotation (Placement(transformation(extent={{124,-7},{
            138,7}})));

  Modelica.Blocks.Sources.RealExpression tau_n_set(y=tau_n) annotation (Placement(transformation(extent={{-66,26},{-36,52}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{6,54},{20,68}})));
  Modelica.Blocks.Sources.RealExpression frictionPropFactor(y=omega_is^2/(tau_n
        /k_turbine))
    annotation (Placement(transformation(extent={{-84,74},{-28,94}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{70,-34},{84,-20}})));
  Modelica.Blocks.Sources.RealExpression tauWe_factor(y=omega_is/(1/radius*
        lambdaOpt*v_wind)) "torque weakaning"
    annotation (Placement(transformation(extent={{132,-86},{56,-62}})));
  Modelica.Blocks.Nonlinear.Limiter tauWe_limiter(uMax=1, uMin=0)
    annotation (Placement(transformation(extent={{34,-82},{18,-66}})));
  Modelica.Blocks.Logical.Hysteresis tauWe_hysteresis(uLow=0.3, uHigh=0.7)
    annotation (Placement(transformation(extent={{-2,-82},{-18,-66}})));
  Modelica.Blocks.Logical.Switch tauWe_switch
    annotation (Placement(transformation(extent={{-44,-84},{-64,-64}})));
  Modelica.Blocks.Sources.RealExpression tauWe_off(y=1)
    annotation (Placement(transformation(extent={{-4,-60},{-18,-38}})));
  Modelica.Blocks.Sources.RealExpression tauWe_on(y=0)
    annotation (Placement(transformation(extent={{34,-110},{20,-130}})));
  Modelica.Blocks.Logical.Switch tauWe_cutOut_switch
    annotation (Placement(transformation(extent={{2,-122},{-18,-102}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=v_wind >
        v_cutOut)
    annotation (Placement(transformation(extent={{82,-122},{44,-102}})));
  Modelica.Blocks.Nonlinear.Limiter
                           limiter2(
    uMax=1e8,
    strict=true,
    uMin=0)
    annotation (Placement(transformation(extent={{160,-10},{180,10}},
                                                                    rotation=
            0)));
equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________
  connect(torqueControllerDisabled.y, tau_set.u2) annotation (Line(points={{-41.3,
          -1},{-36,-1},{-36,-2},{-28,-2}},                                                                         color={255,0,255}));
  connect(v_wind_is.y, torqueControllerDisabled.u) annotation (Line(points={{-91.7,
          -1},{-57.4,-1}},                                                                                   color={0,0,127}));
  connect(v_wind_is1.y, torqueControllerDisabled1.u) annotation (Line(points={{21.5,18},
          {28.6,18},{28.6,17}},                                                                               color={0,0,127}));
  connect(torqueControllerDisabled1.y, tau_set1.u2) annotation (Line(points={{44.7,17},
          {54,17},{54,0},{98.8,0}},                                                                              color={255,0,255}));
  connect(tau_set1.u3, tau_friction.y) annotation (Line(points={{98.8,4.8},{58,4.8},
          {58,40},{50.6,40}},                                                                           color={0,0,127}));
  connect(tau_set.y, limiter1.u) annotation (Line(points={{-5,-2},{26,-2},{26,-6}}, color={0,0,127}));
  connect(tau_n_set.y, tau_set.u1) annotation (Line(points={{-34.5,39},{-32,39},{-32,6},{-28,6}}, color={0,0,127}));
  connect(tau_n_set.y, product1.u2) annotation (Line(points={{-34.5,39},{-20.25,
          39},{-20.25,56.8},{4.6,56.8}}, color={0,0,127}));
  connect(product1.y, tau_friction.u) annotation (Line(points={{20.7,61},{28,61},
          {28,40},{36.8,40}}, color={0,0,127}));
  connect(frictionPropFactor.y, product1.u1) annotation (Line(points={{-25.2,84},
          {-18,84},{-18,66},{-10,66},{-10,65.2},{4.6,65.2}}, color={0,0,127}));
  connect(tauWe_factor.y, tauWe_limiter.u)
    annotation (Line(points={{52.2,-74},{35.6,-74}}, color={0,0,127}));
  connect(tauWe_limiter.y, tauWe_hysteresis.u)
    annotation (Line(points={{17.2,-74},{-0.4,-74}}, color={0,0,127}));
  connect(tauWe_hysteresis.y, tauWe_switch.u2)
    annotation (Line(points={{-18.8,-74},{-42,-74}}, color={255,0,255}));
  connect(tauWe_off.y, tauWe_switch.u1) annotation (Line(points={{-18.7,-49},{
          -28,-49},{-28,-66},{-42,-66}}, color={0,0,127}));
  connect(product2.u2, tauWe_switch.y) annotation (Line(points={{68.6,-31.2},{-86,
          -31.2},{-86,-74},{-65,-74}},     color={0,0,127}));
  connect(tau_set_partload.y, tau_set.u3) annotation (Line(points={{-87.4,-28},
          {-58,-28},{-58,-10},{-28,-10}}, color={0,0,127}));
  connect(tau_set1.y, firstOrder.u)
    annotation (Line(points={{112.6,0},{118,0},{118,8.88178e-16},{122.6,
          8.88178e-16}},                           color={0,0,127}));
  connect(product2.u1, limiter1.y) annotation (Line(points={{68.6,-22.8},{59.3,-22.8},
          {59.3,-6},{49,-6}}, color={0,0,127}));
  connect(product2.y, tau_set1.u1) annotation (Line(points={{84.7,-27},{84.7,-15.5},
          {98.8,-15.5},{98.8,-4.8}}, color={0,0,127}));
  connect(booleanExpression.y, tauWe_cutOut_switch.u2)
    annotation (Line(points={{42.1,-112},{4,-112}}, color={255,0,255}));
  connect(tauWe_on.y, tauWe_cutOut_switch.u3)
    annotation (Line(points={{19.3,-120},{4,-120}}, color={0,0,127}));
  connect(tauWe_cutOut_switch.y, tauWe_switch.u3) annotation (Line(points={{-19,
          -112},{-30,-112},{-30,-82},{-42,-82}}, color={0,0,127}));
  connect(tauWe_cutOut_switch.u1, tauWe_switch.u1) annotation (Line(points={{4,
          -104},{12,-104},{12,-58},{-28,-58},{-28,-66},{-42,-66}}, color={0,0,
          127}));
  connect(firstOrder.y, limiter2.u) annotation (Line(points={{138.7,8.88178e-16},
          {152,8.88178e-16},{152,0},{158,0}}, color={0,0,127}));
  connect(limiter2.y, y)
    annotation (Line(points={{181,0},{202,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), experiment(StopTime=250000,
        __Dymola_NumberOfIntervals=100000),
                Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Full documentation is not available yet. Please see comments in code or contact author per mail.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tuhh.de) <span style=\"font-family: MS Shell Dlg 2;\">on 01.10.2014</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Quality check (Code conventions) by Rebekka Denninger on 01.10.2016</span></p>
</html>"),
    Icon(coordinateSystem(extent={{-100,-120},{100,100}})));
end TorqueController;
