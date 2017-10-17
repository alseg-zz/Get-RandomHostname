#PowerShell
#Requires -Version 4

# --------------------------------------------------------------
# SCRIPT           : Script.ps1
# DESCRIPTION      : Generate random hostname
# DATE             : 18-Oct-2017
# AUTHOR           : Alseg
# VERSION          : 0.1a
# KEYWORDS         : Hostname, Random, Generate
# --------------------------------------------------------------

Function Get-RandomHostname([int] $length = 15)
{
    <#
    .DESCRIPTION
    Generate random hostname
    .SYNOPSIS
    Generate random hostname
    .EXAMPLE
    Get-RandomHostname
    Without length argument default lenght is 15 symbols
    .EXAMPLE
    Get-RandomHostname -length 20
    Set length manually
    #>

    #Generate new hostname string:
    #Symbols in ASCII character set, always started from letters, 15 symbols length, uses all upper-case letters and 0-9 numbers
    #Exclude symbols: "073 I", "079 O"
    $RandomHostname = (-join (((65..72) + (74..78) + (80..90)) | Get-Random -Count 1 | % {[char]$_})) + (-join ((65..72) + (74..78) + (80..90) + (48..57) | Get-Random -Count ($length-1) | % {[char]$_}))
    Return $RandomHostname
} #end Get-RandomHostname

#Action
1..10 | % {Write-Host $(Get-RandomHostname)}