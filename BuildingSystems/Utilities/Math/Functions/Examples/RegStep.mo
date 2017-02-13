within BuildingSystems.Utilities.Math.Functions.Examples;
model RegStep "Example for inlined regStep function"
  extends Modelica.Icons.Example;
  Real y "Function value";
equation
  y=BuildingSystems.Utilities.Math.Functions.regStep(time, 1, -1, 1e-5);
  annotation(experiment(StartTime=-1,StopTime=1.0),
__Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Utilities/Math/Functions/Examples/RegStep.mos"
        "Simulate and plot"),
Documentation(info="<html>
<p>
This example tests the implementation of
<a href=\"modelica://BuildingSystems.Utilities.Math.Functions.regStep\">
BuildingSystems.Utilities.Math.Functions.regStep</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
February 18, 2016, by Marcus Fuchs:<br/>
First implementation.
</li>
</ul>
</html>"));
end RegStep;
