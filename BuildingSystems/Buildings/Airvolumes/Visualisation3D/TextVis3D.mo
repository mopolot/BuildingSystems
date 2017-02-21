within BuildingSystems.Buildings.Airvolumes.Visualisation3D;
model TextVis3D
  extends ModelVis3D;
  Modelica3D.Text shapeVis3D(name = "shape", info = info);
  Modelica3D.Material materialVis3D(name = "material",  r = r, g = g, b = b);
  parameter String info = "Hello World";
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
end TextVis3D;
