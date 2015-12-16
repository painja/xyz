#######################  
<#  
.SYNOPSIS  
Update PreCompile.ps1 with task cmds/statements required to execute before the CoreCompile Target
.DESCRIPTION  
Update PreCompile.ps1 with task cmds/statements required to execute before the CoreCompile  Target
.EXAMPLE  
.\PreCompile.ps1 
Version History  
v1.0   - ESIT Build Team - Initial Release  
#>  

param(
		#Write-OutPut "Override Params here"
		[string]$SourceDir = $(throw "Provide the path upto Compiledoutput - Provide full path of this file (D:\TeamBuilds\CHSRVMigrationToGCH\Main\20130219.6\Sources\Compiledoutput\)")
      )

function PreCompile
{
	try
	{
	 
		##Remove the Read only property for all the files in sources folder
         #attrib -R $SourcesDirectory\*.* /S

		 Write-Host $SourceDir

		# md "$SourcesDirectory\Dev"
		
		& "C:\Windows\Microsoft.NET\Framework\v4.0.30319\Msbuild.exe" "$SourceDir\GenericTestCases.sln" /t:Rebuild /p:Configuration=Release
		#$BuildError1 = $LASTEXITCODE

		#$testdata ="The build definition name is "${Env}:TF_BUILD_BUILDDEFINITIONNAME
		#Write-Host $testdata
		Write-Host "hello poweshell"
		Write-Host $Env+":" TF_BUILD_BUILDDEFINITIONNAME
		Write-Host $Env+":" TF_BUILD_BUILDNUMBER

	}
	Catch [system.exception]
	{
		write-OutPut $_.exception.message
	}
    Finally
    {
       Write-OutPut "Completed Successfully!" updated
	 # if ($BuildError1) { throw "msbuild failed to build GenericTestCases" }
    }
}

Write-OutPut "PreCompile Function implementation"
PreCompile -BinariesDirectory $BinariesDirectory -SourcesDirectory $SourcesDirectory -CodeSignPropertyName $CodeSignPropertyName -CodeSignPropertyValue $CodeSignPropertyValue 
    