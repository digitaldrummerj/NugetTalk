PowerShell -NoProfile -ExecutionPolicy Bypass -File .\CloseDevEnv.ps1 "Demo 1"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 2 - Creating Package\Step 1 - Working Console App\Demo2.1.ConsoleOnly.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 2 - Creating Package\Step 2 - Move Logic to Library and Create WinForm App\Demo2.2.2ndUi.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 2 - Creating Package\Step 3- Create Package\Demo2.3.CreatePackage.sln"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 2 - Creating Package\Step 4- Using Package\Demo2.4.UsingPackage.sln"