within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Plane "A square plane"
  String  name = "";
  ExtID     id = ExtID(name);
  Real length = 1.0;
  Integer dummy;

  function InitPlane "Create a plane object"
    input ExtID id;
    input Real  length;
    output Integer out;

    external "C" out = M3D_New_Plane(id,length);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitPlane;

algorithm
  when initial() then
        dummy := InitPlane(id, length);
  end when;
end Plane;
