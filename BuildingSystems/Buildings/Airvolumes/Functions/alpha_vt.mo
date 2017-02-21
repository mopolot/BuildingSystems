within BuildingSystems.Buildings.Airvolumes.Functions;
function alpha_vt
  "Velocity (and potential temperature) dependent coefficient of heat-transfer"
  input Modelica.SIunits.ThermalConductivity lamAir= 0.0242;
  input Modelica.SIunits.Length cL = 1;
  input Modelica.SIunits.Velocity Vel = 0.1;
  output Modelica.SIunits.CoefficientOfHeatTransfer alpha;
protected
  constant Modelica.SIunits.DynamicViscosity Nue = 18.232*10^(-6);
  constant Modelica.SIunits.SpecificHeatCapacity cp = 1005.00;
  Modelica.SIunits.ReynoldsNumber Re;        // Re = Re (V,L,nu)
  Modelica.SIunits.PrandtlNumber Pr;         // Pr = Pr (nu,cp,lamAir)
  Modelica.SIunits.NusseltNumber Nu_lam;     // Nu = Nu (Re, Pr)
  Modelica.SIunits.NusseltNumber Nu_turb;    // Nu = Nu (Re, Pr)
  Modelica.SIunits.CoefficientOfHeatTransfer alpha_lam; //alpha = alpha(Nu)
  Modelica.SIunits.CoefficientOfHeatTransfer alpha_turb;//alpha = alpha(Nu)
algorithm
  Re :=max(0.01,Vel)*cL/Nue;
  Pr :=Nue*cp/lamAir;
  Nu_lam :=0.664*Re^(1/3)*Pr^(1/3);
  Nu_turb :=(0.037*Re^(0.8)*Pr)/(1 + 2.443*Re^(-0.1)*(Pr^(2/3) - 1));
  alpha_lam :=(lamAir*Nu_lam)/cL;
  alpha_turb :=(lamAir*Nu_turb)/cL;
  if Re > 2000 then
    alpha :=alpha_turb;
  else
    alpha :=alpha_lam;
  end if;
end alpha_vt;
