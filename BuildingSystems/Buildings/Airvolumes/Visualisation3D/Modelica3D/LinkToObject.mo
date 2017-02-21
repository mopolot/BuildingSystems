within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
function LinkToObject "Link object as child of parent object"
  input ExtID childId;
  input ExtID parentId;
  output Integer out;

  external "C" out = M3D_Link_To_Object(childId, parentId);
  annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
end LinkToObject;
