within BuildingSystems.Buildings.Airvolumes.Functions;
function interpol
  "Softly cuts to upper and lower limit"
  input Real t;
  input Integer b;
  input Real[b,2] feld;
  output Real ft;
protected
  Boolean done = false;
algorithm
  for i in 1:b-1 loop
    if feld[i,1] <= t  and t <= feld[i+1,1] then
      ft :=(feld[i, 2] + feld[i+1, 2])/2;
      done :=true;
    end if;
    if (i == b-1 and done == false) then
      ft :=-1;
    end if;
  end for;
end interpol;
