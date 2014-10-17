@echo off
PowerShell -NoProfile -ExecutionPolicy Bypass -File .\CloseAllDevEnv.ps1

REM DEMO 1
start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 1 - Consuming Package\Demo 1.sln"

REM demo 2 
start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 2 - Creating Package\Step 1 - Working Console App\Demo2.1.ConsoleOnly.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 2 - Creating Package\Step 2 - Move Logic to Library and Create WinForm App\Demo2.2.2ndUi.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 2 - Creating Package\Step 3- Create Package\Demo2.3.CreatePackage.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 2 - Creating Package\Step 4- Using Package\Demo2.4.UsingPackage.sln"

REM Demo 3

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 4 - Updating Config Files\Log4NetNugetConsoleAppenderSample.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 4 - Updating Config Files\Nuget.Config.Xdt.Tests\Nuget.Config.Xdt.Tests.sln"

explorer "Demo 4 - Updating Config Files\Nuget Package Contents"
explorer "Nuget Packages"

cd "Demo 4 - Updating Config Files\Nuget Package Contents\"
call "Build All Packages.cmd"


REM Demo 4
start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 3 - Remote Feeds\Demo3.RemoteFeeds.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 4 - Updating Config Files\Log4NetNugetConsoleAppenderSample.sln"
