within BuildingSystems.Climate.SolarRadiationTransformers;
model SolarRadiationTransformerIsotropicSky
  "Solar radiation calculation on a tilted surface (isotropic sky model)"
  extends SolarRadiationTransformerGeneral;
equation
  R = BuildingSystems.Utilities.SmoothFunctions.softcut_upper(cosAngleDegInc/cosAngleZen,5.0,0.001);

  radiationPort.IrrDir = BuildingSystems.Utilities.SmoothFunctions.softcut_upper(R * IrrDirHor, 1341.0,  0.001);

  // softcut for the limit of the solar constant = 1341 W/m^2
  IrrTotTil = BuildingSystems.Utilities.SmoothFunctions.softcut_upper(radiationPort.IrrDir + 0.5 * (1.0 + cosAngleDegTil) * IrrDifHor,1341.0,0.01)
    + 0.5 * (1.0 - cosAngleDegTil) * rhoAmb * IrrTotHor;

annotation (Documentation(info="<html>
    Model for isotropic sky
    <p>
    The direct solar radiation forms an angle with the vector normal to the earth <code>Zen</code>.
    The same direct solar radiation forms an angle with the normal vector of a tilted surface <code>Inc</code>.
    </p>
    <p>
    Based on trigonometric relations, the model calculates the conversion factor <code>R</code> which calculates the amount of direct solar radiation incident
    on a tilted surface from the value of the total direct solar radiation on a horizontal surface. 
    </p>
    <p>
    The total solar radiation on a tilted surface <code>ITotTil</code> is calculated with the following equation:
    </p>
    <code>
    IrrTotTil = R * IrrDirHor + 0.5 * (1.0 + cosAngleTil) * IrrDifHor + 0.5 * (1.0 - cosAngleTil) * rhoAmb * IrrTotHor
    </code>
<p>
The first term <code>R*IDirHor</code> stands for the total direct radiation on the tilted surface. The second term <code>0.5 * (1.0 + cosAngleTil) * IrrDifHor </code> stands for the fraction of diffuse irradiation on a tilted surface. It corresponds to the isotropic model of Liu and Jordan. The third term represents the portion of incident radiation on the tilted surface due to reflection on the ground 
</p>
<p>
    <code>cosAngleTil</code> is the cosinus of the tilt angle, the angle formated by the tilted surface and
    the horizontal ground. <code>IDifHor</code> is the total diffuse radiation on an horizontal surface,
    <code>ITotHor</code> is the total radiation on the horizonal surface and <code>rhoAmb</code>
    is the reflexion factor of the surroundings.
    </p>


<h4> Implementation </h4>
<p>
Since the value obtained with the equation <code>R * IrrDirHor </code> might be higher than the solar constant 1341 W/m2. The <a href=\"modelica://BuildingSystems.Utilities.SmoothFunctions.softcut_upper\">
  softcut_upper</a> function is used to upper limit the obtained value. 
</p>
<p>
The same softcur_upper function is used to limit the total irradation on a tilted surface <code>IrrTotTil</code>.
</p>

    <h4>References</h4>
    <p>
    Nikolai. V. Khartchenko. Thermische Solaranlagen Grundlagen, Planung und Auslegung, Springer ISBN 3-540-58300-9
    </p>
    </html>"));
end SolarRadiationTransformerIsotropicSky;
