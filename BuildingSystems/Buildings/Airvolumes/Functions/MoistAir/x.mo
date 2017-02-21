within BuildingSystems.Buildings.Airvolumes.Functions.MoistAir;
function x
/* absolute Feuchte x
     Luftdruck in Pa, Saettdruck in Pa, RelativeFeuchte in /,
     AbsoluteFeuchte_max in kg H2O/kg tr. Luft */
  input Modelica.SIunits.Pressure p;
  input Modelica.SIunits.Pressure p_sat;
  input BuildingSystems.Buildings.Airvolumes.Types.RelativeHumidity phi;
  output BuildingSystems.Buildings.Airvolumes.Types.AbsoluteMoisture value;
algorithm
    value := 0.622 * phi * p_sat / (p - phi * p_sat);
end x;
