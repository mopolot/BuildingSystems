within BuildingSystems.Buildings.Airvolumes.Visualisation3D;
function RGB
  input Real val;
  input Real minVal;
  input Real maxVal;
  output Real r;
  output Real g;
  output Real b;
  protected
    Real x;
algorithm
    x := (val - minVal) * (2.0 * Constants.pi / (maxVal - minVal));
    if x < 0 then
      x := 0;
    elseif x > 2.0 * Constants.pi then
      x := 2.0 * Constants.pi;
    end if;
    if x < Constants.pi then
      b := 0.5 + 0.5 * Math.cos(x);
      r := 0.0;
    else
      r := 0.5 + 0.5 * Math.cos(x);
      b := 0.0;
    end if;
    g := 1.0 - r - b;
end RGB;
