within BuildingSystems.Buildings.Airvolumes.Visualisation3D;
partial model ModelVis3D
  Boolean initDone(start = false) "true, if initialization done";
  inner Modelica3D.Update3D update3d(updateInterval=updateInterval);
  parameter SIunits.Length xVis3D = 0.0;
  parameter SIunits.Length yVis3D = 0.0;
  parameter SIunits.Length zVis3D = 0.0;
  parameter SIunits.Angle xAngleVis3D = 0.0;
  parameter SIunits.Angle yAngleVis3D = 0.0;
  parameter SIunits.Angle zAngleVis3D = 0.0;
  parameter Real xScaleVis3D = 1.0;
  parameter Real yScaleVis3D = 1.0;
  parameter Real zScaleVis3D = 1.0;
  parameter SIunits.Time updateInterval = 1.0;
end ModelVis3D;
