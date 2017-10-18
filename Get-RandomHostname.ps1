#PowerShell
#Requires -Version 4

# --------------------------------------------------------------
# SCRIPT           : Get-RandomHostname.ps1
# DESCRIPTION      : Generate random hostname
# DATE             : 18-Oct-2017
# AUTHOR           : Alseg
# VERSION          : 0.2a
# KEYWORDS         : Hostname, Random, Generate
# --------------------------------------------------------------

#Argument for command line request
Param(
    [int]
    [ValidateRange(2,15)]
    [Alias("l")]
    $length = 15,
    
    [int]
    [ValidateRange(1,200)]
    [Alias("n")]
    $number = 1
    ) #end Param

#Function Get-RandomHostname
Function Get-RandomHostname([int] $length = 15)
{
    <#
    .DESCRIPTION
    Generate random hostname
    .SYNOPSIS
    Generate new hostname string
    Symbols in ASCII character set, always started from letters, 15 symbols length, uses all upper-case letters and 0-9 numbers
    Exclude symbols: "073 I", "079 O"
    .EXAMPLE
    Get-RandomHostname
    Without length argument default length is 15 symbols
    .EXAMPLE
    Get-RandomHostname -l 22
    Set length manually
    .EXAMPLE
    Get-RandomHostname -l 5 -n 20
    Set length manually and show 20 results
    #>

    $RandomHostname = (-join (((65..72) + (74..78) + (80..90)) | Get-Random -Count 1 | % {[char]$_})) + `
    (-join ((65..72) + (74..78) + (80..90) + (48..57) | Get-Random -Count ($length - 1) | % {[char]$_}))
    
    Return $RandomHostname
} #end Get-RandomHostname

# *** Entry point to script ***
1..$number | % {Write-Host $(Get-RandomHostname -length $length)}