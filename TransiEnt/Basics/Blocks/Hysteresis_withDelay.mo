within TransiEnt.Basics.Blocks;
block Hysteresis_withDelay "Transform Real to Boolean signal with Hysteresis"

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
  extends Modelica.Blocks.Icons.PartialBooleanBlock;

  parameter Boolean offsetInput=false;

  parameter Real uLow(start=0) "If y=true and u<uLow, switch to y=false";
  parameter Real uHigh(start=1) "If y=false and u>uHigh, switch to y=true";
  parameter Modelica.Units.SI.Time delay=1
    "Delay time of boolean output signal";
  parameter Real offsetValue annotation (Dialog(enable=not offsetInput));

  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput offset if offsetInput
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealOutput offsetInternal;

  Real uLow_offset = uLow + offsetInternal;
  Real uHigh_offset = uHigh + offsetInternal;

  Modelica.Blocks.Interfaces.BooleanOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  Modelica.Blocks.Logical.LogicalDelay logicalDelay(delayTime=delay)  annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=0,
        origin={80,0})));
equation
  assert(uHigh > uLow, "Hysteresis limits wrong (uHigh <= uLow)");
  logicalDelay.u = not pre(y) and u > uHigh_offset or pre(y) and u >= uLow_offset;

  if not offsetInput then
    offsetInternal = offsetValue;
  end if;

  connect(offsetInternal, offset);

  connect(logicalDelay.y2, y) annotation (Line(points={{86.05,-3.3},{94,-3.3},{94,0},{110,0}}, color={255,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={Polygon(
            points={{-65,89},{-73,67},{-57,67},{-65,89}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Line(points={{-65,67},{-65,-81}},
          color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
          Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),Text(
            extent={{70,-80},{94,-100}},
            textColor={160,160,164},
            textString="u"),Text(
            extent={{-65,93},{-12,75}},
            textColor={160,160,164},
            textString="y"),Line(
            points={{-80,-70},{30,-70}},
            thickness=0.5),Line(
            points={{-50,10},{80,10}},
            thickness=0.5),Line(
            points={{-50,10},{-50,-70}},
            thickness=0.5),Line(
            points={{30,10},{30,-70}},
            thickness=0.5),Line(
            points={{-10,-65},{0,-70},{-10,-75}},
            thickness=0.5),Line(
            points={{-10,15},{-20,10},{-10,5}},
            thickness=0.5),Line(
            points={{-55,-20},{-50,-30},{-44,-20}},
            thickness=0.5),Line(
            points={{25,-30},{30,-19},{35,-30}},
            thickness=0.5),Text(
            extent={{-99,2},{-70,18}},
            textColor={160,160,164},
            textString="true"),Text(
            extent={{-98,-87},{-66,-73}},
            textColor={160,160,164},
            textString="false"),Text(
            extent={{19,-87},{44,-70}},
            textString="uHigh"),Text(
            extent={{-63,-88},{-38,-71}},
            textString="uLow"),Line(points={{-69,10},{-60,10}}, color={160,
          160,164})}),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,68},{-80,-29}}, color={192,192,192}),
        Polygon(
          points={{92,-29},{70,-21},{70,-37},{92,-29}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-79,-29},{84,-29}}, color={192,192,192}),
        Line(points={{-79,-29},{41,-29}}),
        Line(points={{-15,-21},{1,-29},{-15,-36}}),
        Line(points={{41,51},{41,-29}}),
        Line(points={{33,3},{41,22},{50,3}}),
        Line(points={{-49,51},{81,51}}),
        Line(points={{-4,59},{-19,51},{-4,43}}),
        Line(points={{-59,29},{-49,11},{-39,29}}),
        Line(points={{-49,51},{-49,-29}}),
        Text(
          extent={{-92,-49},{-9,-92}},
          textColor={192,192,192},
          textString="%uLow"),
        Text(
          extent={{2,-49},{91,-92}},
          textColor={192,192,192},
          textString="%uHigh"),
        Rectangle(extent={{-91,-49},{-8,-92}}, lineColor={192,192,192}),
        Line(points={{-49,-29},{-49,-49}}, color={192,192,192}),
        Rectangle(extent={{2,-49},{91,-92}}, lineColor={192,192,192}),
        Line(points={{41,-29},{41,-49}}, color={192,192,192})}),
    Documentation(info="<html>
<p>
This block transforms a <strong>Real</strong> input signal <strong>u</strong> into a <strong>Boolean</strong>
output signal <strong>y</strong> considering also a <strong>dead time</strong>:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Logical/Hysteresis.png\"
     alt=\"Hysteresis.png\">
</p>

<ul>
<li> When the output was <strong>false</strong> and the input becomes
     <strong>greater</strong> than parameter <strong>uHigh</strong>, the output
     switches to <strong>true</strong>.</li>
<li> When the output was <strong>true</strong> and the input becomes
     <strong>less</strong> than parameter <strong>uLow</strong>, the output
     switches to <strong>false</strong>.</li>
</ul>
<p>
The start value of the output is defined via parameter
<strong>pre_y_start</strong> (= value of pre(y) at initial time).
The default value of this parameter is <strong>false</strong>.
</p>
</html>"));
end Hysteresis_withDelay;
