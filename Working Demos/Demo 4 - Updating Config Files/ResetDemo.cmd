rmdir packages /S /Q

del "..\Nuget Packages\log4net.logmanager.*.nupkg"
del "..\Nuget Packages\log4net.blank.config.*.nupkg"
del "..\Nuget Packages\log4net.appender.console.*.nupkg"

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "gci -fil 'bin' -r -force | ri -r -force"

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "gci -fil 'obj' -r -force | ri -r -force"

rmdir Log4netNugetConsoleAppenderSample\packages /S /Q
rmdir Log4netNugetConsoleAppenderSample\LogManager /S /Q

del Log4NetNugetConsoleAppenderSample\packages.config
copy Log4NetNugetConsoleAppenderSample\log4netClean.config Log4NetNugetConsoleAppenderSample\log4net.config /Y

copy Log4NetNugetConsoleAppenderSample\ProgramClean.cs Log4NetNugetConsoleAppenderSample\Program.cs /Y

PowerShell -NoProfile -ExecutionPolicy Bypass -File  "..\RemoveReference.ps1" "Log4NetNugetConsoleAppenderSample\Log4NetNugetConsoleAppenderSample.csproj" "log4net, Version=1.2.13.0, Culture=neutral, PublicKeyToken=669e0ddf0bb1aa2a, processorArchitecture=MSIL"

REM PowerShell -NoProfile -ExecutionPolicy Bypass -File  "..\RemoveFiles.ps1" "Log4NetNugetConsoleAppenderSample\Log4NetNugetConsoleAppenderSample.csproj" "Log4net.config"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  "..\RemoveFiles.ps1" "Log4NetNugetConsoleAppenderSample\Log4NetNugetConsoleAppenderSample.csproj" "packages.config"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  "..\RemoveCompileFiles.ps1" "Log4NetNugetConsoleAppenderSample\Log4NetNugetConsoleAppenderSample.csproj" "LogManager\ILogger.cs"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  "..\RemoveCompileFiles.ps1" "Log4NetNugetConsoleAppenderSample\Log4NetNugetConsoleAppenderSample.csproj" "LogManager\Log4NetWrapper.cs"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  "..\RemoveCompileFiles.ps1" "Log4NetNugetConsoleAppenderSample\Log4NetNugetConsoleAppenderSample.csproj" "LogManager\LogManager.cs"


PowerShell -NoProfile -ExecutionPolicy Bypass -File  "..\RemoveAssemblyInfoAttribute.ps1" "Log4NetNugetConsoleAppenderSample" "log4net.config"

PowerShell -NoProfile -ExecutionPolicy Bypass -File "Nuget Package Contents\IncrementNugetVersionNumber.ps1" -NuspecFile "Nuget Package Contents\log4net.logmanager\log4net.logmanager.nuspec" -RevisionVersion "0" -MajorVersion "1" -MinorVersion "0"

PowerShell -NoProfile -ExecutionPolicy Bypass -File "Nuget Package Contents\IncrementNugetVersionNumber.ps1" -NuspecFile "Nuget Package Contents\log4net.blank.config\log4net.blank.config.nuspec" -RevisionVersion "0" -MajorVersion "1" -MinorVersion "0"


PowerShell -NoProfile -ExecutionPolicy Bypass -File "Nuget Package Contents\IncrementNugetVersionNumber.ps1" -NuspecFile "Nuget Package Contents\log4net.appender.console\log4net.appender.console.nuspec" -RevisionVersion "0" -MajorVersion "1" -MinorVersion "0"
