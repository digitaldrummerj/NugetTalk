rmdir packages /Q /S
del NugetTalk.Demo2.Calculator.Console\packages.config

rmdir NugetTalk.Demo2.Calculator.Console\bin /S /Q
rmdir NugetTalk.Demo2.Calculator.Console\obj /S /Q
rmdir NugetTalk.Demo2.Calculator.Console\packages /S /Q

del WinFormUi\packages.config

rmdir WinFormUi\bin /S /Q
rmdir WinFormUi\obj /S /Q
rmdir WinFormUi\packages /S /Q

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveReference.ps1 "WinFormUI\WinFormUI.csproj" "NugetTalk.Demo2.Calculator, Version=1.0.0.0, Culture=neutral, processorArchitecture=MSIL"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveReference.ps1 "NugetTalk.Demo2.Calculator.Console\NugetTalk.Demo2.Calculator.ConsoleUI.csproj" "NugetTalk.Demo2.Calculator, Version=1.0.0.0, Culture=neutral, processorArchitecture=MSIL"


PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveFiles.ps1 "WinFormUI\WinFormUI.csproj" "packages.config"

PowerShell -NoProfile -ExecutionPolicy Bypass -File  ..\..\RemoveFiles.ps1 "NugetTalk.Demo2.Calculator.Console\NugetTalk.Demo2.Calculator.ConsoleUI.csproj" "packages.config"
