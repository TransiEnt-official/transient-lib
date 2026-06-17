within TransiEnt.Storage.Heat.ATES_L4.Base.Function;
function DynamicViscosityWater "calculation of dyn. viscosity of pure water according to IAPWS-R12-08 but not near critical point"

  //near critical point 645.91 K < T < 650.77K and 245.8kg/m³ < rho < 405.3 kg/m³ according to IAPWS-R12-08 [1]
  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Function;
  import Modelica.Units.SI;


  //
  //_____________________________________________
  //
  //                  Interfaces
  //_____________________________________________
  input SI.Temperature T "Temperature of water";
  input SI.Density rho "Density of water";

  output SI.DynamicViscosity eta "Dynamic Viscosity of water";

protected
  constant SI.Temperature T_ref = 647.096 "reference temperature in K";
  constant SI.Density rho_ref = 322.0 "reference density in kg/m³";
  constant SI.DynamicViscosity eta_ref = 1e-06 "reference dynamic viscosity in Pa s";

  constant Real H_0 = 1.67752 "coefficent for zero-density part";
  constant Real H_1 = 2.20462 "coefficent for zero-density part";
  constant Real H_2 = 0.6366564 "coefficent for zero-density part";
  constant Real H_3 = -0.241605 "coefficent for zero-density part";

  constant Real C_00 = 5.20094e-01 "coefficient for density-driven part";
  constant Real C_10 = 8.50895e-02 "coefficient for density-driven part";
  constant Real C_20 = -1.08374 "coefficient for density-driven part";
  constant Real C_30 = -2.89555e-01 "coefficient for density-driven part";
  constant Real C_01 = 2.22531e-01 "coefficient for density-driven part";
  constant Real C_11 = 9.99115e-01 "coefficient for density-driven part";
  constant Real C_21 = 1.88797 "coefficient for density-driven part";
  constant Real C_31 = 1.26613 "coefficient for density-driven part";
  constant Real C_51 = 1.20573e-01 "coefficient for density-driven part";
  constant Real C_02 = -2.81378e-01 "coefficient for density-driven part";
  constant Real C_12 = -9.06851e-01 "coefficient for density-driven part";
  constant Real C_22 = -7.72479e-01 "coefficient for density-driven part";
  constant Real C_32 = -4.89837e-01 "coefficient for density-driven part";
  constant Real C_42 = -2.57040e-01 "coefficient for density-driven part";
  constant Real C_03 = 1.61913e-01 "coefficient for density-driven part";
  constant Real C_13 = 2.57399e-01 "coefficient for density-driven part";
  constant Real C_04 = -3.25372e-02 "coefficient for density-driven part";
  constant Real C_34 = 6.98452e-02 "coefficient for density-driven part";
  constant Real C_45 = 8.72102e-03 "coefficient for density-driven part";
  constant Real C_36 = -4.35673e-03 "coefficient for density-driven part";
  constant Real C_56 = -5.93264e-04 "coefficient for density-driven part";

  SI.DimensionlessRatio T_d;
  SI.DimensionlessRatio rho_d;
  SI.DimensionlessRatio eta_0 "viscosity in zero density limit";
  SI.DimensionlessRatio eta_1 "viscosity due increasing density";

  SI.DimensionlessRatio j0 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j1 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j2 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j3 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j4 "auxiliary variable for better clarity";
  SI.DimensionlessRatio j5 "auxiliary variable for better clarity";


algorithm

  T_d:=T/T_ref;
  rho_d:=rho/rho_ref;

  eta_0:=100*sqrt(T_d)/(H_0/T_d^0 + H_1/T_d + H_2/T_d^2 + H_3/T_d^3);

  j0:= (1/T_d - 1)^0*(C_00*(rho_d-1)^0 + C_01*(rho_d-1) + C_02*(rho_d-1)^2 + C_03*(rho_d-1)^3 + C_04*(rho_d-1)^4);
  j1:= (1/T_d - 1)*(C_10*(rho_d-1)^0 + C_11*(rho_d-1) + C_12*(rho_d-1)^2 + C_13*(rho_d-1)^3);
  j2:= (1/T_d - 1)^2*(C_20*(rho_d-1)^0 + C_21*(rho_d-1) + C_22*(rho_d-1)^2);
  j3:= (1/T_d - 1)^3*(C_30*(rho_d-1)^0 + C_31*(rho_d-1) + C_32*(rho_d-1)^2 + C_34*(rho_d-1)^4 + C_36*(rho_d-1)^6);
  j4:= (1/T_d - 1)^4*(C_42*(rho_d-1)^2 + C_45*(rho_d-1)^5);
  j5:= (1/T_d - 1)^5*(C_51*(rho_d-1) + C_56*(rho_d-1)^6);

  eta_1:=exp(rho_d*(j0+j1+j2+j3+j4+j5));

  eta:=(eta_0 * eta_1) * eta_ref;

end DynamicViscosityWater;
