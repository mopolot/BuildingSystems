within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneHygroThermal1D
  "Hygro-thermal zone model and some 1D-constructions elements under real weather data"
  extends Modelica.Icons.Example;

  parameter Integer nSurfaces = 8;

  BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction construction1(
    nLayers=2,
    thickness={0.1,0.1},
    material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton(),
    BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton()})
    annotation(Placement(transformation(extent={{-34,40},{-14,60}})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall1(
    height=3.0,
    width=3.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    constructionData=construction1,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-30,0})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall2(
    height=3.0,
    width=3.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    AInnSur=window2.A,
    constructionData=construction1,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,18})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall3(
    height=3.0,
    width=3.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    constructionData=construction1,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{24,-10},{44,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall4(
    height=3.0,
    width=3.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    AInnSur=window4.A,
    constructionData=construction1,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-20})));
  BuildingSystems.Buildings.Constructions.Windows.Window window4(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-20})));
  BuildingSystems.Buildings.Constructions.Windows.Window window2(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,18})));
  BuildingSystems.Buildings.Ambient ambient(
    weatherDataFile=BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco(),
    nSurfaces=nSurfaces)
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    nConstructions3=1,
    nConstructions2=3,
    nConstructions4=3,
    nConstructions1=1,
    V=3.0*3.0*3.0,
    height=3.0,
    calcIdealLoads=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,24})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,24})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={40,0})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-26})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-26})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface5
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-36,0})));
  Modelica.Blocks.Sources.Constant TSetHeating(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,2},{0,4}})));
  Modelica.Blocks.Sources.Constant TSetCooling(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{2,2},{4,4}})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes ceiling(
    height=3.0,
    width=3.0,
    constructionData=construction1,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,18})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface6
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,24})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes bottom(
    height=3.0,
    width=3.0,
    angleDegAzi=0.0,
    constructionData=construction1,
    angleDegTil=0.0,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-20})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface7
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-26})));
  Modelica.Blocks.Sources.Constant airchange1(
    k=0.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={24,10})));
equation
  connect(ambient.toAirPorts[1], surface5.toAirPort)
    annotation (Line(
      points={{-40,-4},{-40,4},{-36.6,4}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(surface.toAirPort, ambient.toAirPorts[2])
    annotation (Line(
      points={{-14,24.6},{-14,30},{-40,30},{-40,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toAirPort, ambient.toAirPorts[3])
    annotation (Line(
      points={{4,24.6},{4,30},{-40,30},{-40,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toAirPort, ambient.toAirPorts[4])
    annotation (Line(
      points={{-22,-26.6},{-22,-32},{-40,-32},{-40,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.toAirPort, ambient.toAirPorts[5])
    annotation (Line(
      points={{-4,-26.6},{-4,-32},{-40,-32},{-40,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.toAirPort, ambient.toAirPorts[6])
    annotation (Line(
      points={{40.6,-4},{42,-4},{42,-32},{-40,-32},{-40,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.toConstructionPort, wall3.toSurfacePort_2)
    annotation (Line(
      points={{39.4,0},{36,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall3.toSurfacePort_1, zone.toConstructionPorts3[1]) annotation (Line(
      points={{32,0},{14,0},{14,-4},{11,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface.toConstructionPort, wall2.toSurfacePort_2)
    annotation (Line(
      points={{-18,23.4},{-18,20}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toConstructionPort, window2.toSurfacePort_2)
    annotation (Line(
      points={{0,23.4},{0,20}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall2.toSurfacePort_1, zone.toConstructionPorts2[1]) annotation (Line(
      points={{-18,16},{-18,14},{6.66667,14},{6.66667,11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(window2.toSurfacePort_1, zone.toConstructionPorts2[2]) annotation (
      Line(
      points={{0,16},{0,14},{4,14},{4,11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface.toSurfacesPort, ambient.toSurfacePorts[1])
    annotation (Line(
      points={{-22,24.6},{-22,30},{-40,30},{-40,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toSurfacesPort, ambient.toSurfacePorts[2])
    annotation (Line(
      points={{-4,24.6},{-4,30},{-40,30},{-40,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.toSurfacesPort, ambient.toSurfacePorts[3])
    annotation (Line(
      points={{40.6,4},{42,4},{42,30},{-40,30},{-40,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface5.toSurfacesPort, ambient.toSurfacePorts[4])
    annotation (Line(
      points={{-36.6,-4},{-40,-4},{-40,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toSurfacesPort, ambient.toSurfacePorts[5])
    annotation (Line(
      points={{-14,-26.6},{-14,-32},{-40,-32},{-40,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.toSurfacesPort, ambient.toSurfacePorts[6])
    annotation (Line(
      points={{4,-26.6},{4,-32},{-40,-32},{-40,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(TSetCooling.y, zone.T_setCooling) annotation (Line(
      points={{4.1,3},{5,3},{5,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{0.1,3},{1,3},{1,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ceiling.toSurfacePort_1, zone.toConstructionPorts2[3]) annotation (
      Line(
      points={{20,16},{20,14},{1.33333,14},{1.33333,11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ceiling.toSurfacePort_2, surface6.toConstructionPort) annotation (
      Line(
      points={{20,20},{20,23.4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface6.toAirPort, ambient.toAirPorts[7]) annotation (Line(
      points={{24,24.6},{24,30},{-40,30},{-40,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface6.toSurfacesPort, ambient.toSurfacePorts[7]) annotation (Line(
      points={{16,24.6},{16,30},{-40,30},{-40,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface5.toConstructionPort, wall1.toSurfacePort_2) annotation (Line(
      points={{-35.4,0},{-32,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toConstructionPort, wall4.toSurfacePort_2) annotation (Line(
      points={{-18,-25.4},{-18,-22}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.toConstructionPort, window4.toSurfacePort_2) annotation (
      Line(points={{0,-25.4},{0,-22}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(window4.toSurfacePort_1, zone.toConstructionPorts4[1]) annotation (
      Line(points={{0,-18},{0,-14},{-1.33333,-14},{-1.33333,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall4.toSurfacePort_1, zone.toConstructionPorts4[2]) annotation (Line(
      points={{-18,-18},{-18,-14},{-4,-14},{-4,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(bottom.toSurfacePort_1, zone.toConstructionPorts4[3]) annotation (
      Line(points={{20,-18},{20,-14},{-6.66667,-14},{-6.66667,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall1.toSurfacePort_1, zone.toConstructionPorts1[1]) annotation (Line(
      points={{-28,0},{-14,0},{-14,4},{-11,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(bottom.toSurfacePort_2, surface7.toConstructionPort) annotation (Line(
      points={{20,-22},{20,-25.4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface7.toAirPort, ambient.toAirPorts[8]) annotation (Line(
      points={{16,-26.6},{16,-32},{-40,-32},{-40,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface7.toSurfacesPort, ambient.toSurfacePorts[8]) annotation (Line(
      points={{24,-26.6},{24,-32},{-40,-32},{-40,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.TAirRef, zone.TAirAmb) annotation (Line(
      points={{-56.2,7},{-60,7},{-60,-36},{30,-36},{30,5},{11,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient.xAir, zone.xAirAmb) annotation (Line(
      points={{-56.2,5},{-60,5},{-60,-36},{30,-36},{30,3},{11,3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airchange1.y, zone.airchange) annotation (Line(
      points={{21.8,10},{14,10},{14,7},{11,7}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneHygroThermal1D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="Hygro-thermal zone model and some 1D-constructions elements
    under real weather data")}),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end SingleZoneHygroThermal1D;
