del *Demo2.Calculator*.nupkg
del *Demo2.Calculator*.nuspec

del "..\..\Nuget Packages\*calculator.*.nupkg"

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "gci -fil 'bin' -r -force | ri -r -force"

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "gci -fil 'obj' -r -force | ri -r -force"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveFiles.ps1 "NugetTalk.Demo2.Calculator.csproj" "NugetTalk.Demo2.Calculator.nuspec"

