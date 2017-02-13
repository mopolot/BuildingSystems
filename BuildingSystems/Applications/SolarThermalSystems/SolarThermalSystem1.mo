within BuildingSystems.Applications.SolarThermalSystems;
model SolarThermalSystem1
  "Example of a  solar thermal system with an internal heat exchanger"
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal= 0.01;
  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Egypt_ElGouna weatherDataFile)
    "time IrrDir IrrDif TAirAmb"
    annotation (Placement(transformation(extent={{-126,62},{-110,78}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb=0.2,
    angleDegL=0.0)
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-100,82},{-92,90}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-88,82},{-80,90}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump(
    redeclare package Medium = Medium,
    m_flow=0.01,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-40,-70},{-60,-50}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium,
    dp_nominal=2,
    angleDegAzi=0,
    angleDegTil=30.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true,
    nEle=10,
    width=2,
    AColData=false,
    height=1)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pipe1(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5)
    "Pipe outside of the building"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-80,10})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pipe2(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5)
    "Pipe outside of the building"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-20,10})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start=0.01) "Expansion vessel"
    annotation (Placement(transformation(extent={{-40,-56},{-32,-48}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb(
    T=293.15)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=-90,origin={-70,-40})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1 HeatBuoyancy,
    redeclare package Medium = Medium,
    height=2.0,
    nEle=10,
    HX_2=false,
    HX_1=true,
    V=0.4)
    annotation (Placement(transformation(extent={{12,-64},{-8,-44}})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pipe3(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5)
    "Pipe inside of the building"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=90,origin={-80,-18})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pipe4(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5)
    "Pipe inside of the building"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=270,origin={-20,-18})));
    Modelica.Blocks.Sources.Constant  consumptionProfile(k=120/24/3600)
    "Mean hot water demand: 120 liter per day"
    annotation (Placement(transformation(extent={{34,-62},{28,-56}})));
BuildingSystems.Fluid.Sources.MassFlowSource_T consumption(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow = 0.0,
    use_m_flow_in = true,
    T=288.15)
    "Flow source"
    annotation (Placement(transformation(extent={{24,-68},{14,-58}})));
  BuildingSystems.Fluid.Sources.Boundary_pT sink(
    redeclare package Medium = Medium,
    use_T_in=false,
    p(displayUnit="Pa"),
    T=293.15,
    nPorts=1)
    "Sink"
    annotation (Placement(transformation(extent={{3,-3},{-3,3}},origin={59,-19})));
  Modelica.Blocks.Logical.Hysteresis control(
    pre_y_start=false,
    uLow=2.0,
    uHigh=4.0)
    "Two-point controller"
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-50,-28})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(
    realTrue=0.1)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-50,-40})));
  Modelica.Blocks.Math.Add add(
    k1=-1,
    k2=+1)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=-90,origin={-50,-12})));
  BuildingSystems.Fluid.HeatExchangers.HeaterCooler_T hea(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=1)
    "Ideal heater for back up energy"
    annotation (Placement(transformation(extent={{32,-28},{52,-10}})));
  Modelica.Blocks.Sources.Constant TSet(
     k=273.15 + 60.0)
     "Set temperature for hot water production"
    annotation (Placement(transformation(extent={{18,-12},{24,-6}})));
equation
  connect(weatherData.y[1], radiation.IrrDirHor) annotation (Line(points={{-109.2,
          69.3143},{-104,69.3143},{-104,76},{-97.6,76}},  color={0,0,127}));
  connect(weatherData.y[2], radiation.IrrDifHor) annotation (Line(points={{-109.2,
          69.5429},{-104,69.5429},{-104,72},{-97.6,72}},  color={0,0,127}));
  connect(collector.angleDegAzi, radiation.angleDegAzi) annotation (Line(points={{-57,31},
          {-57,30},{-102,30},{-102,64},{-97.6,64}},           color={0,0,127}));
  connect(collector.angleDegTil, radiation.angleDegTil) annotation (Line(points={{-55,31},
          {-55,28},{-104,28},{-104,68},{-97.6,68}},           color={0,0,127}));
  connect(pipe1.port_b, collector.port_a) annotation (Line(points={{-80,20},{-80,
          20},{-80,40},{-60,40}}, color={0,127,255}));
  connect(collector.port_b, pipe2.port_a)
    annotation (Line(points={{-40,40},{-20,40},{-20,20}}, color={0,127,255}));
  connect(pipe3.port_b, pipe1.port_a)
    annotation (Line(points={{-80,-8},{-80,0}},           color={0,127,255}));
  connect(pipe4.port_a, pipe2.port_b)
    annotation (Line(points={{-20,-8},{-20,-8},{-20,0}}, color={0,127,255}));
  connect(TAmb.port, pipe3.heatPort)
    annotation (Line(points={{-70,-36},{-70,-18},{-75,-18}}, color={191,0,0}));
  connect(TAmb.port, pipe4.heatPort)
    annotation (Line(points={{-70,-36},{-70,-18},{-25,-18}}, color={191,0,0}));
  connect(from_degC.y, prescribedTemperature.T) annotation (Line(points={{-91.6,
          86},{-88.8,86}},            color={0,0,127}));
  connect(weatherData.y[3], from_degC.u) annotation (Line(points={{-109.2,69.7714},
          {-104,69.7714},{-104,86},{-100.8,86}}, color={0,0,127}));
  connect(prescribedTemperature.port, collector.heatPortCon) annotation (Line(
        points={{-80,86},{-64,86},{-45,86},{-45,49}}, color={191,0,0}));
  connect(radiation.radiationPort, collector.radiationPort) annotation (Line(
      points={{-82,69.8},{-66,69.8},{-66,70},{-51,70},{-51,49}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(prescribedTemperature.port, pipe2.heatPort) annotation (Line(points={{-80,86},
          {-44,86},{-6,86},{-6,10},{-15,10}},           color={191,0,0}));
  connect(prescribedTemperature.port, pipe1.heatPort) annotation (Line(points={{-80,86},
          {-78,86},{-78,88},{-78,96},{-134,96},{-134,10},{-85,10}},       color=
         {191,0,0}));
  connect(pipe3.port_a, pump.port_b) annotation (Line(points={{-80,-28},{-80,-60},
          {-60,-60}}, color={0,127,255}));
  connect(exp.port_a, pump.port_a) annotation (Line(points={{-36,-56},{-36,-56},
          {-36,-60},{-40,-60}}, color={0,127,255}));
  connect(storage.port_a1, consumption.ports[1])
    annotation (Line(points={{9,-63},{14,-63}}, color={0,127,255}));
  connect(consumption.m_flow_in, consumptionProfile.y)
    annotation (Line(points={{24,-59},{27.7,-59}}, color={0,0,127}));
  connect(pump.m_flow_in, booleanToReal.y) annotation (Line(points={{-49.8,-48},
          {-50,-48},{-50,-44.4}}, color={0,0,127}));
  connect(control.y, booleanToReal.u) annotation (Line(points={{-50,-32.4},{-50,
          -35.2}},             color={255,0,255}));
  connect(control.u, add.y)
    annotation (Line(points={{-50,-23.2},{-50,-16.4}}, color={0,0,127}));
  connect(add.u2, collector.TSeg[10]) annotation (Line(
      points={{-52.4,-7.2},{-52.4,12.4},{-46.8,12.4},{-46.8,30.1}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(add.u1, storage.T[1]) annotation (Line(
      points={{-47.6,-7.2},{-47.6,-4},{14,-4},{14,-48.9},{9.4,-48.9}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(storage.port_b1, hea.port_a) annotation (Line(points={{9,-45},{8,-45},
          {8,-19},{32,-19}}, color={0,127,255}));
  connect(hea.port_b, sink.ports[1])
    annotation (Line(points={{52,-19},{52,-19},{56,-19}}, color={0,127,255}));
  connect(TSet.y, hea.TSet) annotation (Line(points={{24.3,-9},{26.15,-9},{26.15,
          -13.6},{30,-13.6}}, color={0,0,127}));
  connect(pipe4.port_b, storage.port_HX_1_a) annotation (Line(
      points={{-20,-28},{-20,-58},{-5,-58}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.port_a, storage.port_HX_1_b) annotation (Line(
      points={{-40,-60},{-5,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(weatherData.latitudeDeg, radiation.latitudeDeg) annotation (Line(
          points={{-109.2,77.2},{-106,77.2},{-106,80},{-93.8,80},{-93.8,77.6}},
          color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation.longitudeDeg) annotation (Line(
        points={{-109.2,75.6},{-106,75.6},{-106,80},{-90,80},{-90,77.6}}, color
        ={0,0,127}));
  connect(weatherData.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
        points={{-109.2,74},{-106,74},{-106,80},{-86,80},{-86,77.6}}, color={0,0,127}));

  annotation (experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/SolarThermalSystems/SolarThermalSystem1.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
            100,100}}),
    graphics={Text(extent={{-134,-72},{56,-104}},lineColor={0,0,255},
    textString="Example of a solar thermal system with an internal heat exchanger")}),
Documentation(info="<html>
<p>
Example that simulates a solar thermal system with an internal heat exchanger.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SolarThermalSystem1;
