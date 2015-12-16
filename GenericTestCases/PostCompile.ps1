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
		
      )

function PreCompile
{
	try
	{
		
		 Robocopy.exe "$SourcesDirectory" "$Droplocation\Installers\DB"	 /E
	}
	Catch [system.exception]
	{
		write-OutPut $_.exception.message
	}
    Finally
    {
       Write-OutPut "Completed Successfully!" updated
	  
    }
}

Write-OutPut "PreCompile Function implementation"
PreCompile -BinariesDirectory $BinariesDirectory -SourcesDirectory $SourcesDirectory -CodeSignPropertyName $CodeSignPropertyName -CodeSignPropertyValue $CodeSignPropertyValue 
    