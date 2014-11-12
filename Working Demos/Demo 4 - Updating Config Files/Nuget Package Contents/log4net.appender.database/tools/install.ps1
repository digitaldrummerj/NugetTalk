param($installPath, $toolsPath, $package, $project)
function SetLog4NetAssemblyAttribute([string]$pathToFile) 
{
    $stringToAdd = "`n[assembly:log4net.Config.XmlConfigurator(ConfigFile =""log4net.config"", Watch = true)]"

    $containsConfigAlready = $false;

    $newFile = Get-Content $pathToFile -encoding "UTF8" | foreach-object {
        if ($_ -like '*XmlConfigurator*') 
        {
            if ($_ -like '*//*' -and $containsConfigAlready -eq $false)
            {
                $stringToAdd
            }
            elseif ($containsConfigAlready -eq $true)
            {
                # REMOVE DUP ENTRIES for Log4Net Attribute    
            }
            else
            { 
                $_
            }

            $containsConfigAlready = $true;
        }
        else
        {
            $_
        }
     }


    if ($containsConfigAlready -eq $false)
    {
        Add-Content $pathToFile $stringToAdd
    } 
    else
    {
        $newfile | set-Content $pathToFile -encoding "UTF8"
    }
}

if ($project -ne $null)
{
    $projectFullName = $project.FullName
    
    $fileInfo = new-object -typename System.IO.FileInfo -ArgumentList $projectFullName
    $projectDirectory = $fileInfo.DirectoryName

    $fileName = "Log4net.config"

   $config = $project.ProjectItems | where {$_.Name -eq $fileName}
    if ($config -ne $null)
    {
        $project.ProjectItems.Item($fileName).Properties.Item("CopyToOutputDirectory").Value = 1		
        #$project.ProjectItems.Item($fileName).Open().Activate()
    }
	
	$assemblyInfoPath = "$projectDirectory\Properties\AssemblyInfo.cs"

    SetLog4NetAssemblyAttribute $assemblyInfoPath
}