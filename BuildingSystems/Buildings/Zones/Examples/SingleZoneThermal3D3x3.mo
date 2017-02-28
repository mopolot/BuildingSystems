within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneThermal3D3x3
  "Thermal zone model and some 1D-constructions elements under real weather data"
  extends Modelica.Icons.Example;
  parameter Integer nSurfaces = 4*3 + 2*9;

  record Construction
    "Construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=2,
      thickness={0.2,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
      BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()});
  end Construction;

  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south_11(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=0.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-28,-18})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof1(
    height=1.0,
    width=1.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=0.0,
    angleDegTil=180.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,28})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north_31(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=180)
    annotation (Placement(transformation(extent={{18,-28},{38,-8}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor11(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegTil=0.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-18,-28})));
  BuildingSystems.Buildings.Ambient ambient(
    redeclare Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile,
    nSurfaces=nSurfaces)
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
  BuildingSystems.Buildings.Zones.Examples.ZoneAirvolume3D3x3 zone(
    nAirElements = 9,
    V=3.0*3.0*3.0,
    nConstructions1=3,
    nConstructions2=3,
    nConstructions3=3,
    nConstructions4=3,
    nConstructions6=9,
    nConstructions5=9)
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
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=0.0,
    angleDegTil=180.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,28})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof3(
    height=1.0,
    width=1.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=0.0,
    angleDegTil=180.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={18,28})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south_12(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=0.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-28,0})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south_13(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=0.0)
                  annotation (Placement(transformation(
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
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north_32(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=180)
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north_33(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=180)
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
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_13(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-84,-52})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_23(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-66,-52})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_33(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-52})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface5
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-90,-52},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface13
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-72,-52},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface14
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-56,-52},
        rotation=180)));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_12(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-84,-70})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_22(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-66,-70})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_32(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-70})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface15
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-90,-70},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface16
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-72,-70},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface17
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-56,-70},
        rotation=180)));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_11(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-84,-90})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_21(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-66,-90})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east_31(
    height=1.0,
    width=1.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2},
    angleDegAzi=-90.0)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,-90})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface18
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-90,-90},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface19
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-72,-90},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface20
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-56,-90},
        rotation=180)));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_13(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={56,88})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_23(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={74,88})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_33(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,88})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface21
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={50,88},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface22
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={68,88},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface23
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={84,88},
        rotation=180)));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_12(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={56,68})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_22(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={74,68})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_32(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,68})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface24
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={50,68},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface25
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={68,68},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface26
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={84,68},
        rotation=180)));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_11(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={56,48})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_21(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={74,48})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west_31(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,48})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface27
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={50,48},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface28
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={68,48},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface29
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={84,48},
        rotation=180)));
equation
  connect(surface12.toConstructionPort, wall_south_11.toSurfacePort_2)
    annotation (Line(points={{-33.4,-18},{-31.7,-18},{-30,-18}}, color={0,0,0}));
  connect(surface11.toConstructionPort, wall_south_12.toSurfacePort_2)
    annotation (Line(points={{-33.4,0},{-31.7,0},{-30,0}}, color={0,0,0}));
  connect(surface10.toConstructionPort, wall_south_13.toSurfacePort_2)
    annotation (Line(points={{-33.4,18},{-31.7,18},{-30,18}}, color={0,0,0}));
  connect(surface.toConstructionPort, roof1.toSurfacePort_2)
    annotation (Line(points={{-18,33.4},{-18,31.7},{-18,30}}, color={0,0,0}));
  connect(surface1.toConstructionPort, roof2.toSurfacePort_2)
    annotation (Line(points={{0,33.4},{0,31.7},{0,30}}, color={0,0,0}));
  connect(surface6.toConstructionPort, roof3.toSurfacePort_2)
    annotation (Line(points={{18,33.4},{18,31.7},{18,30}}, color={0,0,0}));
  connect(surface9.toConstructionPort, wall_north_33.toSurfacePort_2)
    annotation (Line(points={{33.4,18},{31.7,18},{30,18}}, color={0,0,0}));
  connect(surface2.toConstructionPort, wall_north_32.toSurfacePort_2)
    annotation (Line(points={{33.4,0},{31.7,0},{30,0}}, color={0,0,0}));
  connect(surface8.toConstructionPort, wall_north_31.toSurfacePort_2)
    annotation (Line(points={{33.4,-18},{31.7,-18},{30,-18}}, color={0,0,0}));
  connect(surface7.toConstructionPort, floor13.toSurfacePort_2)
    annotation (Line(points={{18,-33.4},{18,-31.7},{18,-30}}, color={0,0,0}));
  connect(surface3.toConstructionPort, floor21.toSurfacePort_2)
    annotation (Line(points={{0,-33.4},{0,-31.7},{0,-30}}, color={0,0,0}));
  connect(surface4.toConstructionPort, floor11.toSurfacePort_2) annotation (
      Line(points={{-18,-33.4},{-18,-31.7},{-18,-30}}, color={0,0,0}));
  connect(wall_south_11.toSurfacePort_1, zone.toConstructionPorts1[1])
    annotation (Line(points={{-26,-18},{-20,-18},{-20,1.33333},{-11,1.33333}},
        color={0,0,0}));
  connect(wall_south_12.toSurfacePort_1, zone.toConstructionPorts1[2])
    annotation (Line(points={{-26,0},{-20,0},{-20,4},{-11,4}}, color={0,0,0}));
  connect(wall_south_13.toSurfacePort_1, zone.toConstructionPorts1[3])
    annotation (Line(points={{-26,18},{-20,18},{-20,6.66667},{-11,6.66667}},
        color={0,0,0}));
  connect(roof1.toSurfacePort_1, zone.toConstructionPorts2[1]) annotation (Line(
        points={{-18,26},{-18,20},{6.66667,20},{6.66667,11}}, color={0,0,0}));
  connect(roof2.toSurfacePort_1, zone.toConstructionPorts2[2])
    annotation (Line(points={{0,26},{0,20},{4,20},{4,11}}, color={0,0,0}));
  connect(roof3.toSurfacePort_1, zone.toConstructionPorts2[3]) annotation (Line(
        points={{18,26},{18,20},{1.33333,20},{1.33333,11}}, color={0,0,0}));
  connect(wall_north_33.toSurfacePort_1, zone.toConstructionPorts3[1])
    annotation (Line(points={{26,18},{20,18},{20,-6.66667},{11,-6.66667}},
        color={0,0,0}));
  connect(wall_north_32.toSurfacePort_1, zone.toConstructionPorts3[2])
    annotation (Line(points={{26,0},{20,0},{20,-4},{11,-4}}, color={0,0,0}));
  connect(wall_north_31.toSurfacePort_1, zone.toConstructionPorts3[3])
    annotation (Line(points={{26,-18},{20,-18},{20,-1.33333},{11,-1.33333}},
        color={0,0,0}));
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

  connect(surface21.toConstructionPort, wall_west_13.toSurfacePort_2)
    annotation (Line(points={{50.6,88},{52.3,88},{54,88}}, color={0,0,0}));
  connect(surface22.toConstructionPort, wall_west_23.toSurfacePort_2)
    annotation (Line(points={{68.6,88},{70.3,88},{72,88}}, color={0,0,0}));
  connect(surface23.toConstructionPort, wall_west_33.toSurfacePort_2)
    annotation (Line(points={{84.6,88},{86.3,88},{88,88}}, color={0,0,0}));
  connect(surface26.toConstructionPort, wall_west_32.toSurfacePort_2)
    annotation (Line(points={{84.6,68},{86.3,68},{88,68}}, color={0,0,0}));
  connect(surface25.toConstructionPort, wall_west_22.toSurfacePort_2)
    annotation (Line(points={{68.6,68},{70.3,68},{72,68}}, color={0,0,0}));
  connect(surface24.toConstructionPort, wall_west_12.toSurfacePort_2)
    annotation (Line(points={{50.6,68},{52.3,68},{54,68}}, color={0,0,0}));
  connect(surface27.toConstructionPort, wall_west_11.toSurfacePort_2)
    annotation (Line(points={{50.6,48},{52.3,48},{54,48}}, color={0,0,0}));
  connect(surface28.toConstructionPort, wall_west_21.toSurfacePort_2)
    annotation (Line(points={{68.6,48},{70.3,48},{72,48}}, color={0,0,0}));
  connect(surface29.toConstructionPort, wall_west_31.toSurfacePort_2)
    annotation (Line(points={{84.6,48},{86.3,48},{88,48}}, color={0,0,0}));
  connect(surface5.toConstructionPort, wall_east_13.toSurfacePort_2)
    annotation (Line(points={{-89.4,-52},{-87.7,-52},{-86,-52}}, color={0,0,0}));
  connect(surface13.toConstructionPort, wall_east_23.toSurfacePort_2)
    annotation (Line(points={{-71.4,-52},{-69.7,-52},{-68,-52}}, color={0,0,0}));
  connect(surface14.toConstructionPort, wall_east_33.toSurfacePort_2)
    annotation (Line(points={{-55.4,-52},{-53.7,-52},{-52,-52}}, color={0,0,0}));
  connect(surface15.toConstructionPort, wall_east_12.toSurfacePort_2)
    annotation (Line(points={{-89.4,-70},{-87.7,-70},{-86,-70}}, color={0,0,0}));
  connect(surface16.toConstructionPort, wall_east_22.toSurfacePort_2)
    annotation (Line(points={{-71.4,-70},{-69.7,-70},{-68,-70}}, color={0,0,0}));
  connect(surface17.toConstructionPort, wall_east_32.toSurfacePort_2)
    annotation (Line(points={{-55.4,-70},{-53.7,-70},{-52,-70}}, color={0,0,0}));
  connect(surface18.toConstructionPort, wall_east_11.toSurfacePort_2)
    annotation (Line(points={{-89.4,-90},{-87.7,-90},{-86,-90}}, color={0,0,0}));
  connect(surface19.toConstructionPort, wall_east_21.toSurfacePort_2)
    annotation (Line(points={{-71.4,-90},{-69.7,-90},{-68,-90}}, color={0,0,0}));
  connect(surface20.toConstructionPort, wall_east_31.toSurfacePort_2)
    annotation (Line(points={{-55.4,-90},{-53.7,-90},{-52,-90}}, color={0,0,0}));
  connect(ambient.toAirPorts[13], surface5.toAirPort) annotation (Line(points={{
          -44,-4},{-44,-34},{-96,-34},{-96,-48},{-90.6,-48}}, color={85,170,255}));
  connect(ambient.toAirPorts[14], surface15.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-4},{-44,-34},{-96,-34},{-96,-66},{-90.6,-66}}, color={85,
          170,255}));
  connect(ambient.toAirPorts[15], surface18.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-34},{-96,-34},{-96,-86},{-90.6,-86}}, color={85,170,255}));
  connect(ambient.toAirPorts[16], surface13.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-34},{-78,-34},{-78,-48},{-72.6,-48}}, color={85,170,255}));
  connect(ambient.toAirPorts[17], surface16.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-34},{-78,-34},{-78,-66},{-72.6,-66}}, color={85,170,255}));
  connect(ambient.toAirPorts[18], surface19.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-34},{-78,-34},{-78,-86},{-72.6,-86}}, color={85,170,255}));
  connect(ambient.toAirPorts[19], surface14.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-4},{-44,-34},{-60,-34},{-60,-48},{-56.6,-48}}, color={85,
          170,255}));
  connect(ambient.toAirPorts[20], surface17.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-34},{-60,-34},{-60,-66},{-56.6,-66}}, color={85,170,255}));
  connect(ambient.toAirPorts[21], surface20.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-34},{-60,-34},{-60,-86},{-56.6,-86}}, color={85,170,255}));
  connect(ambient.toAirPorts[22], surface21.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-14},{-70,-14},{-70,92},{49.4,92}}, color={85,170,255}));
  connect(ambient.toAirPorts[23], surface24.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-14},{-70,-14},{-70,92},{40,92},{40,72},{49.4,72}},
        color={85,170,255}));
  connect(ambient.toAirPorts[24], surface27.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-14},{-70,-14},{-70,92},{40,92},{40,52},{49.4,52}},
        color={85,170,255}));
  connect(ambient.toAirPorts[25], surface22.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-14},{-70,-14},{-70,92},{40,92},{40,100},{62,100},{62,92},
          {67.4,92}}, color={85,170,255}));
  connect(ambient.toAirPorts[26], surface25.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-4},{-44,-14},{-70,-14},{-70,92},{40,92},{40,100},{62,100},
          {62,72},{67.4,72}}, color={85,170,255}));
  connect(ambient.toAirPorts[27], surface28.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-14},{-70,-14},{-70,92},{40,92},{40,100},{62,100},{62,52},
          {67.4,52}}, color={85,170,255}));
  connect(ambient.toAirPorts[28], surface23.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-14},{-70,-14},{-70,92},{40,92},{40,100},{80,100},{80,92},
          {83.4,92}}, color={85,170,255}));
  connect(ambient.toAirPorts[29], surface26.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-14},{-70,-14},{-70,92},{40,92},{40,100},{80,100},{80,72},
          {83.4,72}}, color={85,170,255}));
  connect(ambient.toAirPorts[30], surface29.toAirPort) annotation (Line(points={
          {-44,-4},{-44,-14},{-70,-14},{-70,92},{40,92},{40,100},{80,100},{80,52},
          {83.4,52}}, color={85,170,255}));
  connect(ambient.toSurfacePorts[13], surface5.toSurfacesPort) annotation (Line(
        points={{-44,4},{-44,16},{-98,16},{-98,-56},{-90.6,-56}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[14], surface15.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,16},{-98,16},{-98,-74},{-90.6,-74}}, color={0,255,
          0}));
  connect(ambient.toSurfacePorts[15], surface18.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,16},{-98,16},{-98,-94},{-90.6,-94}}, color={0,255,
          0}));
  connect(ambient.toSurfacePorts[16], surface13.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,16},{-80,16},{-98,16},{-98,-32},{-80,-32},{-80,-56},
          {-72.6,-56}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[17], surface16.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,16},{-98,16},{-98,-32},{-80,-32},{-80,-74},{-72.6,
          -74}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[18], surface19.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,16},{-98,16},{-98,-32},{-80,-32},{-80,-94},{-72.6,
          -94}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[19], surface14.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,16},{-98,16},{-98,-32},{-62,-32},{-62,-56},{-56.6,
          -56}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[20], surface17.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,16},{-98,16},{-98,-32},{-62,-32},{-62,-74},{-56.6,
          -74}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[21], surface20.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,16},{-98,16},{-98,-32},{-62,-32},{-62,-94},{-56.6,
          -94}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[22], surface21.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{38,98},{38,84},{49.4,84}}, color={0,
          255,0}));
  connect(ambient.toSurfacePorts[23], surface24.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{38,98},{38,64},{49.4,64}}, color={0,
          255,0}));
  connect(ambient.toSurfacePorts[24], surface27.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{38,98},{38,44},{49.4,44}}, color={0,
          255,0}));
  connect(ambient.toSurfacePorts[25], surface22.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{60,98},{60,84},{67.4,84}}, color={0,
          255,0}));
  connect(ambient.toSurfacePorts[26], surface25.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{-44,98},{60,98},{60,64},{67.4,64}},
        color={0,255,0}));
  connect(ambient.toSurfacePorts[27], surface28.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{60,98},{60,44},{67.4,44}}, color={0,
          255,0}));
  connect(ambient.toSurfacePorts[28], surface23.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{78,98},{78,84},{83.4,84}}, color={0,
          255,0}));
  connect(ambient.toSurfacePorts[29], surface26.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{78,98},{78,64},{83.4,64}}, color={0,
          255,0}));
  connect(ambient.toSurfacePorts[30], surface29.toSurfacesPort) annotation (
      Line(points={{-44,4},{-44,4},{-44,98},{78,98},{78,44},{83.4,44}}, color={0,
          255,0}));
  connect(wall_east_13.toSurfacePort_1, zone.toConstructionPorts6[1])
    annotation (Line(points={{-82,-52},{-76,-52},{-76,-22},{-14,-22},{-14,-2.44444},
          {-9,-2.44444}}, color={0,0,0}));
  connect(wall_east_12.toSurfacePort_1, zone.toConstructionPorts6[2])
    annotation (Line(points={{-82,-70},{-76,-70},{-76,-22},{-14,-22},{-14,-3.33333},
          {-9,-3.33333}}, color={0,0,0}));
  connect(wall_east_11.toSurfacePort_1, zone.toConstructionPorts6[3])
    annotation (Line(points={{-82,-90},{-76,-90},{-76,-22},{-14,-22},{-14,-8},{-9,
          -8},{-9,-4.22222}}, color={0,0,0}));
  connect(wall_east_23.toSurfacePort_1, zone.toConstructionPorts6[4])
    annotation (Line(points={{-64,-52},{-60,-52},{-60,-22},{-14,-22},{-14,-5.11111},
          {-9,-5.11111}}, color={0,0,0}));
  connect(wall_east_22.toSurfacePort_1, zone.toConstructionPorts6[5])
    annotation (Line(points={{-64,-70},{-58,-70},{-58,-22},{-14,-22},{-14,-9},{-9,
          -9},{-9,-6}}, color={0,0,0}));
  connect(wall_east_21.toSurfacePort_1, zone.toConstructionPorts6[6])
    annotation (Line(points={{-64,-90},{-58,-90},{-58,-22},{-14,-22},{-14,-9},{-9,
          -9},{-9,-6.88889}}, color={0,0,0}));
  connect(wall_east_33.toSurfacePort_1, zone.toConstructionPorts6[7])
    annotation (Line(points={{-48,-52},{-46,-52},{-46,-22},{-14,-22},{-14,-7.77778},
          {-9,-7.77778}}, color={0,0,0}));
  connect(wall_east_32.toSurfacePort_1, zone.toConstructionPorts6[8])
    annotation (Line(points={{-48,-70},{-46,-70},{-46,-22},{-14,-22},{-14,-9.42857},
          {-9,-9.42857},{-9,-8.66667}}, color={0,0,0}));
  connect(wall_east_31.toSurfacePort_1, zone.toConstructionPorts6[9])
    annotation (Line(points={{-48,-90},{-46,-90},{-46,-22},{-14,-22},{-14,-9.42857},
          {-9,-9.42857},{-9,-9.55556}}, color={0,0,0}));
  connect(wall_west_13.toSurfacePort_1, zone.toConstructionPorts5[1])
    annotation (Line(points={{58,88},{64,88},{64,14},{14,14},{14,2.44444},{9,2.44444}},
        color={0,0,0}));
  connect(wall_west_12.toSurfacePort_1, zone.toConstructionPorts5[2])
    annotation (Line(points={{58,68},{64,68},{64,14},{14,14},{14,3.33333},{9,3.33333}},
        color={0,0,0}));
  connect(wall_west_11.toSurfacePort_1, zone.toConstructionPorts5[3])
    annotation (Line(points={{58,48},{64,48},{64,14},{14,14},{14,4},{9,4},{9,4.22222}},
        color={0,0,0}));
  connect(wall_west_23.toSurfacePort_1, zone.toConstructionPorts5[4])
    annotation (Line(points={{76,88},{82,88},{82,14},{14,14},{14,10},{12,10},{12,
          5.11111},{9,5.11111}}, color={0,0,0}));
  connect(wall_west_22.toSurfacePort_1, zone.toConstructionPorts5[5])
    annotation (Line(points={{76,68},{82,68},{82,14},{14,14},{14,10},{12,10},{12,
          9},{9,9},{9,6}}, color={0,0,0}));
  connect(wall_west_21.toSurfacePort_1, zone.toConstructionPorts5[6])
    annotation (Line(points={{76,48},{82,48},{82,14},{14,14},{14,10},{12,10},{12,
          7.6},{9,7.6},{9,6.88889}}, color={0,0,0}));
  connect(wall_west_33.toSurfacePort_1, zone.toConstructionPorts5[7])
    annotation (Line(points={{92,88},{92,88},{96,88},{96,14},{14,14},{14,8},{12,
          8},{12,7.77778},{9,7.77778}}, color={0,0,0}));
  connect(wall_west_32.toSurfacePort_1, zone.toConstructionPorts5[8])
    annotation (Line(points={{92,68},{96,68},{96,14},{14,14},{14,9.42857},{9,9.42857},
          {9,8.66667}}, color={0,0,0}));
  connect(wall_west_31.toSurfacePort_1, zone.toConstructionPorts5[9])
    annotation (Line(points={{92,48},{96,48},{96,14},{14,14},{14,8.5},{9,8.5},{9,
          9.55556}}, color={0,0,0}));
  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneThermal3D3x3.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, initialScale=0.1)),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end SingleZoneThermal3D3x3;
