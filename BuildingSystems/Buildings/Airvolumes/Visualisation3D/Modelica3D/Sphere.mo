within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Sphere "A 3D sphere object"
  String  name =     "";
  ExtID     id = ExtID(name);
  Real    diameter = 1.0;
  Integer dummy;

  function InitSphere "Create a sphere object"
    input ExtID id;
    input Real diameter;
    output Integer out;
    external "C" out = M3D_New_Sphere(id,diameter);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitSphere;

algorithm
  when initial() then
        dummy := InitSphere(id, diameter);
  end when;
end Sphere;
