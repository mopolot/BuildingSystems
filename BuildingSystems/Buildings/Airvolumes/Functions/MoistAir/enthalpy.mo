within BuildingSystems.Buildings.Airvolumes.Functions.MoistAir;
function enthalpy
/* Enthalpie der feuchten Luft h1+x bestehend aus 1 kg trock. Luft und x kg Wasserdampf
     Nullpunkt bei 0 C > Verwendung der Temperatur in C in der Berechnung > - 273.15
     Enthalpie in [kJ/kg trockene Luft], Temperatur in [K], x in [kg/kg]
     x_satt in [kg/kg] fuer phi = 1.0 */
  input Modelica.SIunits.Temp_K T;
  input Real x;
  input Real x_sat;
  output Modelica.SIunits.SpecificEnthalpy value;
protected
            Real theta, y1, y2, y3, y4;
algorithm
    theta := T - 273.15;
    /* ungesaettigte Luft */
    y1 := 1.006 * theta + x * (2500.0 + 1.86 * theta);
    /* Nebelgebiet */
    y2 := 1.006 * theta + x_sat * (2500. + 1.86 * theta) + 4.187 * theta * (x - x_sat);
    /* Eisnebelgebiet */
    y3 := 1.006 * theta + x_sat * (2500. + 1.86 * theta) + (2.05 * theta - 333.5) * (x - x_sat);
    /* Gesamtfunktion */
    y4 := BuildingSystems.Buildings.Airvolumes.Functions.softswitch(theta, 0.0, y3, y2, 0.1);
    value := BuildingSystems.Buildings.Airvolumes.Functions.softswitch(x, x_sat, y1, y4, 0.01);
end enthalpy;
