within BuildingSystems.Buildings.Airvolumes.FlowConnections;
model FlowConnectionX
  "Flow connection from center of FV1 to center of FV2 in X-direction"
  extends BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnection;
  Modelica.SIunits.Length deltax=abs(port_1.pos[1] - port_2.pos[1])
    annotation (HideResult=true);
  // joint area between two zones, depends on the size (parameterization) of the FV
  Modelica.SIunits.Length dy= 0.5 * (port_1.dim[2] + port_2.dim[2])
    annotation (HideResult=true);
  Modelica.SIunits.Length dz= 0.5 * (port_1.dim[3] + port_2.dim[3])
    annotation (HideResult=true);
  final parameter Real LayFacBC = (if BCwall_floor or BCwall_roof then LayFac else 1)*(if BCwall_north or BCwall_south then LayFac else 1);
  Modelica.SIunits.Length dist=sqrt((port_2.pos[1] - port_1.pos[1])^2);
equation
  // Velocity ​​values: Pressure forces + Impulse forces + Viscose forces
  // Type momentum equation, without parameterization
  // deltax * der(v) = (-1/(0.5*(port_1.rho + port_2.rho)))*dP  - (port_2.vVec[1]^2 - port_1.vVec[1]^2) - 0.5*(port_1.ForceVF + port_2.ForceVF);
  // with parameterization:
  deltax * der(v) = (-1/(0.5*(port_1.rho + port_2.rho)))*dP  - (port_2.vVec[1]^2 - port_1.vVec[1]^2) - 0.5*(port_1.ForceVF + port_2.ForceVF) *0.5 - 0.5 * LosFac*sign(v)*v^2 * LayFacBC;

  port_1.m_flow = (0.5*(port_1.rho + port_2.rho))*(dy*dz)*v;
  port_1.m_flow + port_2.m_flow = 0;

  // Gradients for the viscous force
  port_1.visgr1 = (port_2.vVec[2] - port_1.vVec[2])/dist;//dvdx
  port_2.visgr1 = (port_2.vVec[2] - port_1.vVec[2])/dist;//dvdx
  port_1.visgr2 = (port_2.vVec[3] - port_1.vVec[3])/dist;//dwdx
  port_2.visgr2 = (port_2.vVec[3] - port_1.vVec[3])/dist;//dwdx

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Line(points={{-32,-2},{22,-2},{-42,72},{38,58}}, pattern=LinePattern.None),
    Line(points={{-56,78},{0,60},{10,64}}, pattern=LinePattern.None),
    Line(points={{-34,0},{32,0}},color={255,170,85},arrow={Arrow.Filled,Arrow.Filled},thickness=1)}),
    Documentation(info=""));
end FlowConnectionX;
