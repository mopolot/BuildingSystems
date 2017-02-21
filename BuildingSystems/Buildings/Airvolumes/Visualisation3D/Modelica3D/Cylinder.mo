within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Cylinder "A 3D cylinder object"
  String  name = "";
  ExtID     id = ExtID(name);
  Real diameter = 1.0;
  Real length =   1.0;
  Integer dummy;

  function InitCylinder "Create a cylinder object"
    input ExtID id;
    input Real diameter;
    input Real length;
    output Integer out;
    external "C" out = M3D_New_Cylinder(id,diameter,length);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitCylinder;

algorithm
  when initial() then
        dummy := InitCylinder(id, diameter, length);
  end when;
end Cylinder;
