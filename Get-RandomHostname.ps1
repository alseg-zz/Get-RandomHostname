#PowerShell
#Requires -Version 3

Function Get-RandomHostname
{
    <#
    .SYNOPSIS
        Generate random hostname function.

    .DESCRIPTION
        Generate new hostname string.
        Symbols in ASCII character set, always started from letters, upper-case letters and 0-9 numbers.
        (Exclude symbols: "073 I", "079 O").

    .PARAMETER Length
        Length of hostname string (default is 15).

    .PARAMETER Number
        Number output random hostname strings (default is 1).

    .PARAMETER Uppercase
        Hostname in uppercase or lowercase (default uppercase).

    .LINK
        https://github.com/alseg/Get-RandomHostname

    .NOTES
        ToDo-List:
        * Task

    .EXAMPLE
        PS> Import-Module <path>
        PS> Get-RandomHostname

    .EXAMPLE
        PS> Import-Module <path>
        PS> Get-RandomHostname -l 22

    .EXAMPLE
        PS> Import-Module <path>
        PS> Get-RandomHostname -l 5 -n 20
    #>

    [CmdletBinding()]
    Param(
        [Parameter()]
        [ValidateRange(1, 100)]
        [Alias("l")]
        [Int]$Length = 15,

        [Parameter()]
        [ValidateRange(1, 200)]
        [Alias("n")]
        [Int]$Number = 1,

        [Parameter()]
        [Alias("upper")]
        [Bool]$Uppercase = 1
        )

    $Result = @()

    For ($i = 1; $i -le $Number; $i++)
        {
            # ASCII characters:
            # 65..90 - Uppercase letters [A-Z] (Exclude symbols: "073 I", "079 O").
            # 48..57 - Numbers [0-9].
            # Always start from letter.
            $RandomHostname = `
                (-Join (((65..72) + (74..78) + (80..90)) | Get-Random -Count 1 | ForEach-Object {[Char]$_})) + `
                (-Join ((65..72) + (74..78) + (80..90) + (48..57) | Get-Random -Count $Length | ForEach-Object {[Char]$_}))

            If ($Uppercase) {
                $Result += $RandomHostname.Substring(0, $RandomHostname.Length - 1)
            }
            Else {
                $Result += ($RandomHostname.Substring(0, $RandomHostname.Length - 1)).ToLower()
            }
        }

    Return $Result
}