# Calling Convention
#   RemoveReference.ps1 "MyCsProj.csproj" "..\SomeDirectory\SomeProjectReferenceToRemove.dll"

param($path, $Reference)

$path  = (resolve-path $path)
Write-Host ($path)
$XPath = [string]::Format("//a:Reference[@Include='{0}']", $Reference)   

[System.Console]::WriteLine("");
[System.Console]::WriteLine("XPATH IS {0}", $XPath) 
[System.Console]::WriteLine("");

$proj = [xml](Get-Content $path)
[System.Console]::WriteLine("Loaded project {0} into {1}", $path, $proj)

[System.Xml.XmlNamespaceManager] $nsmgr = $proj.NameTable
$nsmgr.AddNamespace('a','http://schemas.microsoft.com/developer/msbuild/2003')
$node = $proj.SelectSingleNode($XPath, $nsmgr)

if (!$node)
{ 
    [System.Console]::WriteLine("");
    [System.Console]::WriteLine("Cannot find node with XPath {0}", $XPath) 
    [System.Console]::WriteLine("");
    exit
}

[System.Console]::WriteLine("Removing node {0}", $node)
$node.ParentNode.RemoveChild($node);

$proj.Save($path)