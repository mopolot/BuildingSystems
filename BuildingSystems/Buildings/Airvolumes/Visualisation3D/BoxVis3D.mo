within BuildingSystems.Buildings.Airvolumes.Visualisation3D;
model BoxVis3D
  extends ModelVis3D;
  Modelica3D.Box shapeVis3D(name = "shape", width = width, length = length, height = height);
  Modelica3D.Material materialVis3D(name = "material",  r = r, g = g, b = b);
  parameter SIunits.Length length = 1.0;
  parameter SIunits.Length width = 1.0;
  parameter SIunits.Length height = 1.0;
  parameter Real r = 0.5;
  parameter Real g = 0.5;
  parameter Real b = 0.5;

algorithm
  when update3d.send then
    if not initDone then
      Modelica3D.SetObjectMaterial(shapeVis3D.id,materialVis3D.id);
      Modelica3D.Translate(shapeVis3D.id, xVis3D, yVis3D, zVis3D, update3d.frame);
      Modelica3D.Rotate(shapeVis3D.id, xAngleVis3D, yAngleVis3D, zAngleVis3D, update3d.frame);
      Modelica3D.Scale(shapeVis3D.id, xScaleVis3D, yScaleVis3D, zScaleVis3D, update3d.frame);
      initDone := true;
    end if;
  end when;
end BoxVis3D;
