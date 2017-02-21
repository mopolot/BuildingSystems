within BuildingSystems.Buildings.Airvolumes.Functions.MoistAir;
function x_sat
/* absolute Feuchte bei Saettigung
     Gueltigkeitsbereich phi = 1.0
     Luftdruck in [Pa], Saettdruck in [Pa], AbsoluteFeuchte_max in [kg H2O/kg tr. Luft] */
  input Modelica.SIunits.Pressure p;
  input Modelica.SIunits.Pressure p_sat;
  output BuildingSystems.Buildings.Airvolumes.Types.AbsoluteMoisture  value;
algorithm
    value := 0.622 * 1.0 / (p / p_sat - 1.0);
end x_sat;
