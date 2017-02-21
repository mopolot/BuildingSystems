within BuildingSystems.Buildings.Airvolumes.AirElements;
model visual3d
  "Visualization"
  parameter Real r = 0.5
    annotation (HideResult=true);
  parameter Real g = 0.5
    annotation (HideResult=true);
  parameter Real b = 0.5
    annotation (HideResult=true);
  parameter SIunits.Time updateInterval = 5
    annotation (HideResult=true);
  //min and max values for the scale
  parameter SIunits.Temp_K minTempVis3D= 293.15-5;//298.15
  parameter SIunits.Temp_K maxTempVis3D= 293.15+5;//303.15
  parameter SIunits.Velocity minVel= 0.0
    annotation (HideResult=true);
  parameter SIunits.Velocity maxVel = 0.11
    annotation (HideResult=true);
  parameter SIunits.Velocity minVelMag= 0.0
    annotation (HideResult=true);
  parameter SIunits.Velocity maxVelMag= 3.3
    annotation (HideResult=true);
  parameter Real minVal= 0.0
    annotation (HideResult=true);
  parameter Real maxVal= 10.0
    annotation (HideResult=true);
  annotation (HideResult=true, HideResult=true);
end visual3d;
