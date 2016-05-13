param
(
    [parameter(mandatory=$true)][int]$BuildId,
    [parameter(mandatory=$true)][string]$TeamFoundationCollectionUri,
    [parameter(mandatory=$true)][string]$TeamProjectName,
    [parameter(mandatory=$true)][string]$TestBuild,
    [parameter(mandatory=$true)][string]$IsHBI,
    [parameter(mandatory=$true)][string]$MailTo,
    [parameter(mandatory=$true)][string]$SourcesDirectory,
    [parameter(mandatory=$true)][string]$MailFrom,
    [parameter(mandatory=$true)][string]$MailPwd,
    [parameter(mandatory=$true)][string]$MailCc,
    [parameter(mandatory=$true)][string]$SMTP,
    [parameter(mandatory=$true)][string]$Port
    
)

Start-Sleep -Seconds 600
Write-Output "BuildId: $($BuildId)"

if($TestBuild -eq "true"){$testBld = $true}
else {$testBld = $false}

if($IsHBI -eq "true"){$isHBIProject = $true}
else {$isHBIProject = $false}

$dllFolderPath = $PSScriptRoot
$dllPath = Join-Path $dllFolderPath "Microsoft.IT.EPRS.Build.Tasks.dll"

Add-Type -Path $dllPath
$sendMail = New-Object Microsoft.IT.EPRS.Build.Tasks.SendMailTask
$sendMail.Send($BuildId, $TeamFoundationCollectionUri, $TeamProjectName, $testBld, $isHBIProject, $MailTo, $SourcesDirectory, $MailFrom, $MailPwd, $MailCc, $SMTP, $Port)