within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Camera "A camera"
  String  name = "";
  ExtID     id = ExtID(name);
  Real    fov = 90.0;
  Integer dummy;

  function InitCamera "Create a camera object"
    input ExtID id;
    input Real fov;
    output Integer out;

    external "C" out = M3D_New_Camera(id,fov);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end InitCamera;

algorithm
  when initial() then
        dummy := InitCamera(id, fov);
  end when;
end Camera;
