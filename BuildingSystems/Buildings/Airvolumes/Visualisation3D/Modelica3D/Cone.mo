within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Cone "A 3D cone object"
  String  name = "";
  ExtID     id = ExtID(name);
  Real diameter = 1.0;
  Real length =   1.0;
  Integer dummy;

  function InitCone "Create a cone object"
    input ExtID id;
    input Real diameter;
    input Real length;
    output Integer out;
    external "C" out = M3D_New_Cone(id,diameter,length);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitCone;

algorithm
  when initial() then
        dummy := InitCone(id, diameter, length);
  end when;
end Cone;
