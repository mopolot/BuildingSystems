within BuildingSystems.Buildings.Airvolumes.Functions.MoistAir;
function p
  /* Dampfdruck
     Gueltigkeitsbereich phi < 1.0, Dampfdruck in Pa,
     absoluteFeuchte x in kg/kg, Luftdruck p in Pa */
  input Real x;
  input Real p_air;
  output Real value;
algorithm
  value := p_air / (0.622 / x + 1.0);
end p;
