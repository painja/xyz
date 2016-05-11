param
(
    [parameter(mandatory=$true)][int]$BuildId,
    [parameter(mandatory=$true)][string]$TeamFoundationCollectionUri,
    [parameter(mandatory=$true)][string]$TeamProjectName,
    [parameter(mandatory=$true)][string]$TestBuild,
    [parameter(mandatory=$true)][string]$IsHBI,
    [parameter(mandatory=$true)][string]$MailTo,
    [parameter(mandatory=$true)][string]$SourcesDirectory
)

Start-Sleep -Seconds 30
Write-Output "BuildId: $($BuildId)"

if($TestBuild -eq "true"){$testBld = $true}
else {$testBld = $false}

if($IsHBI -eq "true"){$isHBIProject = $true}
else {$isHBIProject = $false}

$dllFolderPath = $PSScriptRoot
$dllPath = Join-Path $dllFolderPath "Microsoft.IT.EPRS.Build.Tasks.dll"

Add-Type -Path $dllPath
$sendMail = New-Object Microsoft.IT.EPRS.Build.Tasks.SendMailTask
$sendMail.Send($BuildId, $TeamFoundationCollectionUri, $TeamProjectName, $testBld, $isHBIProject, $MailTo, $SourcesDirectory)