within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
function Translate "Translate a geometric object"
  input ExtID objId;
  input Real x;
  input Real y;
  input Real z;
  input Integer frame;
  output Integer out;

  external "C" out = M3D_Translate(objId,x,y,z,frame);
  annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
end Translate;
