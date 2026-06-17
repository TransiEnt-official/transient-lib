within TransiEnt.Storage.Heat.ATES_L4.Base;
package ThermalResistors
  extends TransiEnt.Basics.Icons.BasesPackage;

  annotation (Icon(graphics={
        Text(
          extent={{-146,-102},{154,-132}},
          textString="R=%R"),
        Rectangle(
          extent={{-88,80},{92,-60}},
          pattern=LinePattern.None,
          fillColor={192,192,192},
          fillPattern=FillPattern.Forward),
        Text(
          extent={{-148,134},{152,92}},
          textString="%name",
          textColor={0,0,255})}));
end ThermalResistors;
