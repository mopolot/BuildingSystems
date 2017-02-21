within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
function SetMaterialColor "Setrgb-color of material"
  input ExtID materialId;
  input Real r;
  input Real g;
  input Real b;
  input Integer frame;
  output Integer out;

  external "C" out = M3D_Set_Material_Color(materialId,r,g,b,frame);
  annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
end SetMaterialColor;
