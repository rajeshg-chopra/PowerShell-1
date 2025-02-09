﻿<#
.SYNOPSIS
	Prints basic information of an executable file
.DESCRIPTION
	This PowerShell script prints basic information of an executable file.
.PARAMETER PathToExe
	Specifies the path to the executable file
.EXAMPLE
	PS> ./inspect-exe C:\MyApp.exe
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz / License: CC0
#>

param([string]$PathToExe = "")

try {
	if ($PathToExe -eq "" ) { $PathToExe = read-host "Enter path to executable file" }

	get-childitem $PathToExe | % {$_.VersionInfo} | Select *
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
