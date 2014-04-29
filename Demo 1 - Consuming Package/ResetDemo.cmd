del packages.config
rmdir packages /S /Q
rmdir bin /S /Q
rmdir obj /S /Q
copy ProgramClean.cs Program.cs /Y

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\RemoveReference.ps1 "Demo 1.csproj" "Common.Logging"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\RemoveReference.ps1 "Demo 1.csproj" "nunit.framework"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\RemoveReference.ps1 "Demo 1.csproj" "log4net, Version=1.2.13.0, Culture=neutral, PublicKeyToken=669e0ddf0bb1aa2a, processorArchitecture=MSIL"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\RemoveReference.ps1 "Demo 1.csproj" "Common.Logging.Log4Net1211"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  "..\RemoveFiles.ps1" "Demo 1.csproj" "packages.config"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\RemoveReference.ps1 "Demo 1.csproj" "log4net, Version=1.2.11.0, Culture=neutral, PublicKeyToken=669e0ddf0bb1aa2a, processorArchitecture=MSIL"