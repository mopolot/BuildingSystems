within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Group "A 3D group object"
  String  name = "";
  ExtID     id = ExtID(name);
  Integer dummy;

  function InitGroup "Create a group object"
    input ExtID objId;
    output Integer out;
    external "C" out = M3D_New_Group(objId);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitGroup;

algorithm
  when initial() then
        dummy := InitGroup(id);
  end when;
end Group;
