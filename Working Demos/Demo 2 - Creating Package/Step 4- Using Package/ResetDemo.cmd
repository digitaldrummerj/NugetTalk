del NugetTalk.Demo2.Calculator.Console\packages.config

del WinFormUi\packages.config

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "gci -fil 'bin' -r -force | ri -r -force"

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "gci -fil 'obj' -r -force | ri -r -force"

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "gci -fil 'packages' -r -force | ri -r -force"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveReference.ps1 "WinFormUI\WinFormUI.csproj" "NugetTalk.Demo2.Calculator, Version=1.0.0.0, Culture=neutral, processorArchitecture=MSIL"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveReference.ps1 "NugetTalk.Demo2.Calculator.Console\NugetTalk.Demo2.Calculator.ConsoleUI.csproj" "NugetTalk.Demo2.Calculator, Version=1.0.0.0, Culture=neutral, processorArchitecture=MSIL"


PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveFiles.ps1 "WinFormUI\WinFormUI.csproj" "packages.config"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveFiles.ps1 "NugetTalk.Demo2.Calculator.Console\NugetTalk.Demo2.Calculator.ConsoleUI.csproj" "packages.config"
