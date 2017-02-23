within BuildingSystems.Buildings.Zones;
model ZoneTemplateAirvolume3D
  "Template model for a thermal zone with 3D discretized air volume"
  extends BuildingSystems.Buildings.BaseClasses.ZoneTemplateGeneral(
    redeclare final package Medium = BuildingSystems.Media.Air);
  parameter Integer nAirElements(min=1) = 1
    "Number of air elements, which are included in the air volume"
    annotation(Dialog(tab="General"));
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start air temperature of the zone"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.MassFraction x_start = 0.005
    "Start air moisture of the zone"
    annotation (Dialog(tab="Initialization"));
  output BuildingSystems.Interfaces.Temp_KOutput TAir[nAirElements]
    "Air temperature"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,36}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-70,70})));
  output BuildingSystems.Interfaces.Moisture_absOutput xAir[nAirElements]
    "Absolute air moisture"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,46}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-10,70})));
  output BuildingSystems.Interfaces.VelocityOutput vAir[nAirElements]
    "Air velocity (magnitude)"
    annotation (Placement(transformation(extent={{24,46},{44,66}}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={10,70})));
  replaceable BuildingSystems.Buildings.Airvolumes.Airvolume3DTemplate airvolume(
    nSurfaces=nSurfaces,
    nAirElements=nAirElements,
    V=V,
    T_start=fill(T_start,nAirElements),
    x_start=fill(x_start,nAirElements))
    annotation (Placement(transformation(extent={{-24,64},{24,16}})));
  equation
    for i in 1:nConstructions1 loop
      connect(surfaces1.toAirPorts[i],airvolume.toSurfacePorts[i]);
    end for;
    for i in 1:nConstructions2 loop
      connect(surfaces2.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+i]);
    end for;
    for i in 1:nConstructions3 loop
      connect(surfaces3.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+nConstructions2+i]);
    end for;
    for i in 1:nConstructions4 loop
      connect(surfaces4.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+i]);
    end for;
    for i in 1:nConstructions5 loop
      connect(surfaces5.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+nConstructions4+i]);
    end for;
    for i in 1:nConstructions6 loop
      connect(surfaces6.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+nConstructions4+nConstructions5+i]);
    end for;
    connect(airvolume.T,TAir)
      annotation (Line(points={{19.2,35.2},{22.6,35.2},{22.6,36},{34,36}}, color={0,0,127}));
    connect(airvolume.x,xAir)
      annotation (Line(points={{19.2,44.8},{24.6,44.8},{24.6,46},{34,46}}, color={0,0,127}));
    connect(airvolume.v,vAir) annotation (Line(points={{19.2,54.4},{21.6,54.4},{21.6,56},{34,56}}, color={0,0,127}));

  annotation(defaultComponentName="zone");
end ZoneTemplateAirvolume3D;
