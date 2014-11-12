param($installPath, $toolsPath, $package, $project)

function SetLog4NetAssemblyAttribute([string]$pathToFile) {
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
	$localPath = "$projectDirectory\$fileName" #$config.Properties | where {$_.Name -eq "LocalPath"}
	
   $config = $project.ProjectItems | where {$_.Name -eq $fileName}
    
	# Add blank <configuration /> section to be able to transform it
	if ($config -eq $null)
    {
        # get an XMLTextWriter to create the XML
        $XmlWriter = New-Object System.XMl.XmlTextWriter($localPath,$Null)
 
        # choose a pretty formatting:
        $xmlWriter.Formatting = 'Indented'
        $xmlWriter.Indentation = 1
        $XmlWriter.IndentChar = "`t"
        $xmlWriter.WriteStartDocument()
        $xmlWriter.WriteStartElement('configuration')
        $xmlWriter.WriteEndElement()
        # finalize the document:
        $xmlWriter.WriteEndDocument()
        $xmlWriter.Flush()
        $xmlWriter.Close()
    
        $project.ProjectItems.AddFromFile($localPath);
    }

    # 1 - Copy Always
    # 2 - Copy If newer
    $project.ProjectItems.Item($fileName).Properties.Item("CopyToOutputDirectory").Value = 1

    $assemblyInfoPath = "$projectDirectory\Properties\AssemblyInfo.cs"

    SetLog4NetAssemblyAttribute $assemblyInfoPath
 }