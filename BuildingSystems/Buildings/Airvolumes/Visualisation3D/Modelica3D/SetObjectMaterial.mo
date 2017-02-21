within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
function SetObjectMaterial "Set object to use given material"
  input ExtID objId;
  input ExtID materialId;
  output Integer out;

  external "C" out = M3D_Set_Object_Material(objId,materialId);
  annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
end SetObjectMaterial;
