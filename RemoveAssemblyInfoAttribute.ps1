param($path, $stringToRemove)

$path  = (resolve-path $path)
Write-Host $path

$assemblyInfoPath = "$path\Properties\AssemblyInfo.cs"
Write-Host $assemblyInfoPath

Write-Host "$stringToRemove"
$newFile = Get-Content $assemblyInfoPath -encoding "UTF8" | foreach-object {
    if ($_ -like "*$stringToRemove*") 
    {

    }
    else
    {
        $_
    }
}

$newfile | set-Content $assemblyInfoPath -encoding "UTF8"
