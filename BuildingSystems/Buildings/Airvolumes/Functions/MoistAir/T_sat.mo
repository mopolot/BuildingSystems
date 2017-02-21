within BuildingSystems.Buildings.Airvolumes.Functions.MoistAir;
function T_sat
/* Saettigungstemperatur in Abhaengigkeit von der Enthalpie von -30 bis 360 kJ/kg
     Saettigungstemperatur in [K], Enthalpie in [kJ/kg]
     - aus h-x-Diagramm und Fkt., ueber Polynom 5. Ordnung gefittet */
  input Real h;
  output Real value;
  //constant Real h_min = -30.0;
  //constant Real h_max = 360.0;
protected
            Real c[6] = {4.07048E-11, -4.48926E-8, 1.95342E-5, -4.44190E-3, 6.48352E-1, -5.79441};

algorithm
  //if h > h_min and h < h_max then
    value := c[6] + h * (c[5] + h * (c[4] + h * (c[3] + h * (c[2] + h * c[1])))) + 273.15;
  /*else
      value := 0.0;
    end if;*/
end T_sat;
