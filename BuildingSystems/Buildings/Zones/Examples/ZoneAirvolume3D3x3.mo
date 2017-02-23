within BuildingSystems.Buildings.Zones.Examples;
model ZoneAirvolume3D3x3
  "Zone with 3 x 3 air elements"
  extends BuildingSystems.Buildings.Zones.ZoneTemplateAirvolume3D(
  nSurfaces = 4*3 + 2*9,
  nAirElements = 9,
  redeclare BuildingSystems.Buildings.Airvolumes.Examples.Airvolume3D3x3 airvolume);

  annotation();
end ZoneAirvolume3D3x3;
