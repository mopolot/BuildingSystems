within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class CustomMesh "An custom mesh, included from a file"
  String  name = "";
  ExtID   id =   ExtID(name);
  String  filePathAndName;
  Integer dummy;

  function InitCustomMesh
    "Create a group object containing 3D objects imported from a file"
    input ExtID id;
    input String filePathAndName;
    output Integer out;
    external "C" out = M3D_New_Custom_Mesh(id,filePathAndName);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitCustomMesh;

algorithm
  when initial() then
        dummy := InitCustomMesh(id, filePathAndName);
  end when;
end CustomMesh;
