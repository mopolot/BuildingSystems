within BuildingSystems.Buildings.Airvolumes.AirElements;
model AirElement3DThermal
  "Visualization of FVelement"
  extends BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal;
  extends BuildingSystems.Buildings.Airvolumes.AirElements.visual3d;
  Boolean initDone(start = false) "true, if initialization done"
    annotation (HideResult=true);
  // var = 1: Temperature, 2: velX, 3: velY, 4: velZ, 5: velMag
  // Everything else is possible
  parameter Integer var = 2
    "To determine which variable should be visualized"
     annotation (HideResult=true);
  inner BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.Update3D update3d(
    updateInterval=updateInterval)
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length xVis3D = posX
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length yVis3D = posZ
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length zVis3D = posY
    annotation (HideResult=true);
  parameter Modelica.SIunits.Angle xAngleVis3D = 0.0
    annotation (HideResult=true);
  parameter Modelica.SIunits.Angle yAngleVis3D = 0.0
    annotation (HideResult=true);
  parameter Modelica.SIunits.Angle zAngleVis3D = 0.0
    annotation (HideResult=true);
  // normal
  parameter Real xScaleVis3D = 0.9
    annotation (HideResult=true);
  parameter Real yScaleVis3D = 0.9
    annotation (HideResult=true);
  parameter Real zScaleVis3D = 0.9
    annotation (HideResult=true);
  parameter Real spaceX = 0
    annotation (HideResult=true);
  //length + 1
  parameter Modelica.SIunits.Length length = scalF[3]
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length width = scalF[1]
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length height = scalF[2]
    annotation (HideResult=true);
  parameter Boolean enabledVol = enabled;
  // finite volumes
  BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.Box shapeVis3D(
    name = "shape",
    width = width,
    length = length,
    height = height)
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.Material materialVis3D(
    name = "fluidMat",
    r = r,
    g = g,
    b = b)
    annotation (HideResult=true);
  Real rVis3D(
    start = 1)
    annotation (HideResult=true);
  Real gVis3D
    annotation (HideResult=true);
  Real bVis3D
    annotation (HideResult=true);
algorithm
  when update3d.send then
  // to 'freeze' one moment
  // when update3d.send and time < 2 then
  // when update3d.send and time < 5 then
  // when update3d.send and time < 10 then
  // when update3d.send and time < 20 then
    if not initDone then
      ////coordinate system
      //Modelica3D.SetObjectMaterial(shapeVis3Dtop.id,materialVis3D.id);
      //Modelica3D.Translate(shapeVis3Dtop.id,1.5*spaceX,1.5*spaceX, 2, update3d.frame);
      //Modelica3D.Rotate(shapeVis3Dtop.id, xAngleVis3D, yAngleVis3D, zAngleVis3D, update3d.frame);
      //Modelica3D.Scale(shapeVis3Dtop.id, xScaleVis3D, yScaleVis3D, zScaleVis3D, update3d.frame);
      //
      //to choose which FV
      if enabledVol == true then
        BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.SetObjectMaterial(shapeVis3D.id,materialVis3D.id);
        BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.Translate(shapeVis3D.id, xVis3D, yVis3D, zVis3D, update3d.frame);
        BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.Rotate(shapeVis3D.id, xAngleVis3D, yAngleVis3D, zAngleVis3D, update3d.frame);
        BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.Scale(shapeVis3D.id, xScaleVis3D, yScaleVis3D, zScaleVis3D, update3d.frame);
      end if;
      initDone := true;
    end if;
    // value
    if (var ==1) then
      (rVis3D,gVis3D,bVis3D) := BuildingSystems.Buildings.Airvolumes.Visualisation3D.RGB(fluid.T,minTempVis3D,maxTempVis3D);
      BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.SetMaterialColor(materialVis3D.id, rVis3D, gVis3D, bVis3D, update3d.frame);
    elseif (var ==2) then
      (rVis3D,gVis3D,bVis3D) := BuildingSystems.Buildings.Airvolumes.Visualisation3D.RGB(vVec[1],minVel,maxVel);
      BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.SetMaterialColor(materialVis3D.id, rVis3D, gVis3D, bVis3D, update3d.frame);
    elseif (var ==3) then
      (rVis3D,gVis3D,bVis3D) := BuildingSystems.Buildings.Airvolumes.Visualisation3D.RGB(vVec[2],minVel,maxVel);
      BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.SetMaterialColor(materialVis3D.id, rVis3D, gVis3D, bVis3D, update3d.frame);
    elseif (var ==4) then
      (rVis3D,gVis3D,bVis3D) := BuildingSystems.Buildings.Airvolumes.Visualisation3D.RGB(vVec[3],minVel,maxVel);
      BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.SetMaterialColor(materialVis3D.id, rVis3D, gVis3D, bVis3D, update3d.frame);
    elseif (var ==5) then
      (rVis3D,gVis3D,bVis3D) := BuildingSystems.Buildings.Airvolumes.Visualisation3D.RGB(velMag,minVelMag,maxVelMag);
      BuildingSystems.Buildings.Airvolumes.Visualisation3D.Modelica3D.SetMaterialColor(materialVis3D.id, rVis3D, gVis3D, bVis3D, update3d.frame);
    end if;
  end when;
end AirElement3DThermal;
