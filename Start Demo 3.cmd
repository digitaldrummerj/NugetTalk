start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 4 - Updating Config Files\Log4NetNugetConsoleAppenderSample.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 4 - Updating Config Files\Nuget.Config.Xdt.Tests\Nuget.Config.Xdt.Tests.sln"

explorer "Demo 4 - Updating Config Files\Nuget Package Contents"
explorer "Nuget Packages"

cd "Demo 4 - Updating Config Files\Nuget Package Contents\"
call "Build All Packages.cmd"