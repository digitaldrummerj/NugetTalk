PowerShell -NoProfile -ExecutionPolicy Bypass -File  .\CloseDevEnv.ps1 "Demo 1"
PowerShell -NoProfile -ExecutionPolicy Bypass -File  .\CloseDevEnv.ps1 "Demo 2"
PowerShell -NoProfile -ExecutionPolicy Bypass -File  .\CloseDevEnv.ps1 "Demo 3"
PowerShell -NoProfile -ExecutionPolicy Bypass -File  .\CloseDevEnv.ps1 "Nuget.Config"

start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 3 - Remote Feeds\Demo3.RemoteFeeds.sln"

explorer "Nuget Packages"

REM start "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe" "Demo 4 - Updating Config Files\Log4NetNugetConsoleAppenderSample.sln"
