within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneThermal3D3x3
  "Thermal zone model and some 1D-constructions elements under real weather data"
  extends Modelica.Icons.Example;
  parameter Integer nSurfaces = 3*3 + 2*9;

  record Construction
    "Construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=2,
      thickness={0.2,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
      BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()});
  end Construction;

  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall11(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-28,-18})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof1(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,28})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall31(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{18,-28},{38,-8}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor11(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-18,-28})));
  BuildingSystems.Buildings.Ambient ambient(
    weatherDataFile=BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco(),
    nSurfaces=nSurfaces)
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
  BuildingSystems.Buildings.Zones.Examples.ZoneAirvolume3D3x3 zone(
    nAirElements = 9,
    V=3.0*3.0*3.0,
    nConstructions1=3,
    nConstructions2=3,
    nConstructions3=3,
    nConstructions4=3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,34})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,34})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={34,0})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-34})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-34})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface6
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={18,34})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor21(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    redeclare Construction constructionData,
    angleDegTil=0.0,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-28})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface7
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={18,-34})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof2(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,28})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof3(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={18,28})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall12(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-28,0})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall13(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-28,18})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor13(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    redeclare Construction constructionData,
    angleDegTil=0.0,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={18,-28})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall32(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall33(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{18,8},{38,28}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface8
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={34,-18})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface9
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={34,18})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface10
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-34,18},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface11
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-34,0},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface12
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-34,-18},
        rotation=180)));
equation
  connect(surface12.toConstructionPort, wall11.toSurfacePort_2) annotation (
        Line(points={{-33.4,-18},{-31.7,-18},{-30,-18}}, color={0,0,0}));
  connect(surface11.toConstructionPort, wall12.toSurfacePort_2)
    annotation (Line(points={{-33.4,0},{-31.7,0},{-30,0}}, color={0,0,0}));
  connect(surface10.toConstructionPort, wall13.toSurfacePort_2)
    annotation (Line(points={{-33.4,18},{-31.7,18},{-30,18}}, color={0,0,0}));
  connect(surface.toConstructionPort, roof1.toSurfacePort_2)
    annotation (Line(points={{-18,33.4},{-18,31.7},{-18,30}}, color={0,0,0}));
  connect(surface1.toConstructionPort, roof2.toSurfacePort_2)
    annotation (Line(points={{0,33.4},{0,31.7},{0,30}}, color={0,0,0}));
  connect(surface6.toConstructionPort, roof3.toSurfacePort_2)
    annotation (Line(points={{18,33.4},{18,31.7},{18,30}}, color={0,0,0}));
  connect(surface9.toConstructionPort, wall33.toSurfacePort_2)
    annotation (Line(points={{33.4,18},{31.7,18},{30,18}}, color={0,0,0}));
  connect(surface2.toConstructionPort, wall32.toSurfacePort_2)
    annotation (Line(points={{33.4,0},{31.7,0},{30,0}}, color={0,0,0}));
  connect(surface8.toConstructionPort, wall31.toSurfacePort_2)
    annotation (Line(points={{33.4,-18},{31.7,-18},{30,-18}}, color={0,0,0}));
  connect(surface7.toConstructionPort, floor13.toSurfacePort_2)
    annotation (Line(points={{18,-33.4},{18,-31.7},{18,-30}}, color={0,0,0}));
  connect(surface3.toConstructionPort, floor21.toSurfacePort_2)
    annotation (Line(points={{0,-33.4},{0,-31.7},{0,-30}}, color={0,0,0}));
  connect(surface4.toConstructionPort, floor11.toSurfacePort_2) annotation (
      Line(points={{-18,-33.4},{-18,-31.7},{-18,-30}}, color={0,0,0}));
  connect(wall11.toSurfacePort_1, zone.toConstructionPorts1[1]) annotation (
      Line(points={{-26,-18},{-20,-18},{-20,1.33333},{-11,1.33333}}, color={0,0,
          0}));
  connect(wall12.toSurfacePort_1, zone.toConstructionPorts1[2])
    annotation (Line(points={{-26,0},{-20,0},{-20,4},{-11,4}}, color={0,0,0}));
  connect(wall13.toSurfacePort_1, zone.toConstructionPorts1[3]) annotation (
      Line(points={{-26,18},{-20,18},{-20,6.66667},{-11,6.66667}}, color={0,0,0}));
  connect(roof1.toSurfacePort_1, zone.toConstructionPorts2[1]) annotation (Line(
        points={{-18,26},{-18,20},{6.66667,20},{6.66667,11}}, color={0,0,0}));
  connect(roof2.toSurfacePort_1, zone.toConstructionPorts2[2])
    annotation (Line(points={{0,26},{0,20},{4,20},{4,11}}, color={0,0,0}));
  connect(roof3.toSurfacePort_1, zone.toConstructionPorts2[3]) annotation (Line(
        points={{18,26},{18,20},{1.33333,20},{1.33333,11}}, color={0,0,0}));
  connect(wall33.toSurfacePort_1, zone.toConstructionPorts3[1]) annotation (
      Line(points={{26,18},{20,18},{20,-6.66667},{11,-6.66667}}, color={0,0,0}));
  connect(wall32.toSurfacePort_1, zone.toConstructionPorts3[2])
    annotation (Line(points={{26,0},{20,0},{20,-4},{11,-4}}, color={0,0,0}));
  connect(wall31.toSurfacePort_1, zone.toConstructionPorts3[3]) annotation (
      Line(points={{26,-18},{20,-18},{20,-1.33333},{11,-1.33333}}, color={0,0,0}));
  connect(floor13.toSurfacePort_1, zone.toConstructionPorts4[1]) annotation (
      Line(points={{18,-26},{18,-20},{-1.33333,-20},{-1.33333,-11}}, color={0,0,
          0}));
  connect(floor21.toSurfacePort_1, zone.toConstructionPorts4[2]) annotation (
      Line(points={{0,-26},{0,-20},{-4,-20},{-4,-11}}, color={0,0,0}));
  connect(floor11.toSurfacePort_1, zone.toConstructionPorts4[3]) annotation (
      Line(points={{-18,-26},{-18,-20},{-6.66667,-20},{-6.66667,-11}}, color={0,
          0,0}));
  connect(ambient.toSurfacePorts[1], surface12.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,-22},{-34.6,-22}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[2], surface11.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,-4},{-34.6,-4}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[3], surface10.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,14},{-34.6,14}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[4], surface.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{-22,38},{-22,34.6}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[5], surface1.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{-4,38},{-4,34.6}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[6], surface6.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{14,38},{14,34.6}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[7], surface9.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{38,38},{38,22},{34.6,22}}, color={0,255,
          0}));
  connect(ambient.toSurfacePorts[8], surface2.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{38,38},{38,4},{34.6,4}}, color={0,255,
          0}));
  connect(ambient.toSurfacePorts[9], surface8.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{38,38},{38,-14},{34.6,-14}}, color={0,
          255,0}));
  connect(ambient.toSurfacePorts[10], surface7.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,-40},{22,-40},{22,-34.6}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[11], surface3.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,-40},{4,-40},{4,-34.6}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[12], surface4.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,-40},{-14,-40},{-14,-34.6}}, color={0,255,0}));
  connect(ambient.toAirPorts[1], surface12.toAirPort) annotation (Line(points={{
          -44,-4},{-38,-4},{-38,-14},{-34.6,-14}}, color={85,170,255}));
  connect(ambient.toAirPorts[2], surface11.toAirPort) annotation (Line(points={{
          -44,-4},{-38,-4},{-38,4},{-34.6,4}}, color={85,170,255}));
  connect(ambient.toAirPorts[3], surface10.toAirPort) annotation (Line(points={{
          -44,-4},{-38,-4},{-38,22},{-34.6,22}}, color={85,170,255}));
  connect(ambient.toAirPorts[4], surface.toAirPort) annotation (Line(points={{-44,
          -4},{-38,-4},{-38,36},{-14,36},{-14,34.6}}, color={85,170,255}));
  connect(ambient.toAirPorts[5], surface1.toAirPort) annotation (Line(points={{-44,
          -4},{-38,-4},{-38,36},{4,36},{4,34.6}}, color={85,170,255}));
  connect(ambient.toAirPorts[6], surface6.toAirPort) annotation (Line(points={{-44,
          -4},{-38,-4},{-38,36},{22,36},{22,34.6}}, color={85,170,255}));
  connect(ambient.toAirPorts[7], surface9.toAirPort) annotation (Line(points={{-44,
          -4},{-38,-4},{-38,36},{36,36},{36,14},{34.6,14}}, color={85,170,255}));
  connect(ambient.toAirPorts[8], surface2.toAirPort) annotation (Line(points={{-44,
          -4},{-38,-4},{-38,36},{36,36},{36,-4},{34.6,-4}}, color={85,170,255}));
  connect(ambient.toAirPorts[9], surface8.toAirPort) annotation (Line(points={{-44,
          -4},{-38,-4},{-38,36},{34.6,36},{34.6,-22}}, color={85,170,255}));
  connect(ambient.toAirPorts[10], surface7.toAirPort) annotation (Line(points={{
          -44,-4},{-38,-4},{-38,-38},{14,-38},{14,-34.6}}, color={85,170,255}));
  connect(ambient.toAirPorts[11], surface3.toAirPort) annotation (Line(points={{
          -44,-4},{-38,-4},{-38,-38},{-4,-38},{-4,-34.6}}, color={85,170,255}));
  connect(ambient.toAirPorts[12], surface4.toAirPort) annotation (Line(points={{
          -44,-4},{-38,-4},{-38,-38},{-22,-38},{-22,-34.6}}, color={85,170,255}));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneThermal3D3x3.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end SingleZoneThermal3D3x3;
