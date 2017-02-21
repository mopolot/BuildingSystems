within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Light "A light"
  String  name = "";
  ExtID     id = ExtID(name);
  Integer typ =  0;
  Real    r =    1.0;
  Real    g =    1.0;
  Real    b =    1.0;
  Integer dummy;

  function InitLight "Create a light object"
    input ExtID id;
    input Integer typ;
    input Real    r;
    input Real    g;
    input Real    b;
    output Integer out;

    external "C" out = M3D_New_Light(id,typ,r,g,b);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitLight;

algorithm
  when initial() then
        dummy := InitLight(id,typ,r,g,b);
  end when;
end Light;
