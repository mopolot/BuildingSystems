within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Text "An planar text object"
  String  name = "";
  ExtID   id =   ExtID(name);
  String  info;
  Integer dummy;

  function InitText "Create a planar text object"
    input ExtID id;
    input String info;
    output Integer out;
    external "C" out = M3D_New_Text(id,info);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitText;

algorithm
  when initial() then
        dummy := InitText(id, info);
  end when;
end Text;
