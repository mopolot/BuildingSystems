within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Material "A material object"
  String  name = "";
  ExtID     id = ExtID(name);
  Real r = 1.0;
  Real g = 1.0;
  Real b = 1.0;
  Integer dummy;

  function InitMaterial "Creates a material object"
    input ExtID id;
    input Real  r;
    input Real  g;
    input Real  b;
    output Integer out;
    external "C" out = M3D_New_Material(id,r,g,b);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitMaterial;

algorithm
  when initial() then
        dummy := InitMaterial(id, r, g, b);
  end when;
end Material;
