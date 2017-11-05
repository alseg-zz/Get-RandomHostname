#PowerShell
#Requires -Version 4

# --------------------------------------------------------------
# SCRIPT           : Get-RandomHostname.ps1
# DESCRIPTION      : Generate random hostname
# DATE             : 22-Oct-2017
# AUTHOR           : Alseg
# VERSION          : 0.4a
# KEYWORDS         : Hostname, Random, Generate
# --------------------------------------------------------------

#Function Get-RandomHostname
Function Get-RandomHostname
{
    <#
    .DESCRIPTION
        Generate random hostname
    .PARAMETER Length
        (Optionally) Length of hostname string (default is 15)
    .PARAMETER Number
        (Optionally) Number output random hostname strings (default is 15)
    .NOTES
        Generate new hostname string
        Symbols in ASCII character set, always started from letters, 15 symbols length, uses all upper-case letters and 0-9 numbers
        Exclude symbols: "073 I", "079 O"
    .EXAMPLE
        Import-Module <path>
        Get-RandomHostname
    .EXAMPLE
        Import-Module <path>
        Get-RandomHostname -l 22
    .EXAMPLE
        Import-Module <path>
        Get-RandomHostname -l 5 -n 20
    #>

    #Argument for command line request
    Param(
        [ValidateRange(2,50)]
        [Alias("l")]
        [Int]$Length = 15,
        
        [ValidateRange(1,200)]
        [Alias("n")]
        [Int]$Number = 1
        )#End Param

    for ($i = 1; $i -le $Number; $i++)
        {
            $RandomHostname = (-join (((65..72) + (74..78) + (80..90)) | Get-Random -count 1 | ForEach-Object {[char]$_})) + `
            (-join ((65..72) + (74..78) + (80..90) + (48..57) | Get-Random -count ($Length - 1) | ForEach-Object {[char]$_}))
            Write-Host $RandomHostname
        }
}#End Get-RandomHostname