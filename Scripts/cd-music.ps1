﻿<#
.SYNOPSIS
	Sets the working directory to the user's music folder
.DESCRIPTION
	This PowerShell script changes the working directory to the user's music folder.
.EXAMPLE
	PS> ./cd-music
	📂/home/Joe/Music
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz / License: CC0
#>

try {
	if ($IsLinux) {
		$Path = Resolve-Path "$HOME/Music"
	} else {
		$Path = [Environment]::GetFolderPath('MyMusic')
	}
	if (-not(Test-Path "$Path" -pathType container)) {
		throw "Music folder at 📂$Path doesn't exist (yet)"
	}
	set-location "$Path"
	"📂$Path"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
