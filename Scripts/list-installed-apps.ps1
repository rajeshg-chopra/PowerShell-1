﻿<#
.SYNOPSIS
	Lists the installed apps
.DESCRIPTION
	This PowerShell script lists the installed apps (from Windows Store or snaps).
.EXAMPLE
	PS> ./list-installed-apps
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz / License: CC0
#>

try {
	if ($IsLinux) {
		& snap list
	} else {
		get-appxPackage | select-object Name,Version | format-table -autoSize
	}
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
