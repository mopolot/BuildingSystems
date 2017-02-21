within BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D;
class Update3D "Define communication and update interval"
  parameter Integer framerate = 30;
  parameter Modelica.SIunits.Time updateInterval = 1 / framerate;
  output Boolean send;
  output Integer frame;

equation
  send = sample(1e-08, updateInterval);

algorithm
  when send then
    frame := integer( time/updateInterval + 1); // First frame is 1, not 0;
    SetFrameTime(frame, time);
  end when;
end Update3D;
