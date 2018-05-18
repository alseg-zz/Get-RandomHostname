#PowerShell
#Requires -Version 3.0


function Get-RandomHostname {
    <#
    .SYNOPSIS
        Generate random hostname function.

    .DESCRIPTION
        Generate new hostname string.
        Symbols in ASCII character set, always started from letters, upper-case letters and 0-9 numbers.
        (Exclude symbols: "073 I", "079 O").

    .PARAMETER Length
        Length of hostname string (by default is 15).

    .PARAMETER Number
        Number output random hostname strings (by default is 1).

    .PARAMETER Format
        Parameter define result string format: "UPPERCASE", "lowercase" or "Capitalize" (by default is uppercase)

    .PARAMETER DisableAlwaysStartFromLetter
        By default, result string always start from letter. Parameter override this behavior

    .LINK
        https://github.com/alseg/Get-RandomHostname

    .NOTES
        .

    .EXAMPLE
        Get-RandomHostname

    .EXAMPLE
        Get-RandomHostname -Length 22

    .EXAMPLE
        Get-RandomHostname -Length 5 -Number 20

    .EXAMPLE
        Get-RandomHostname -Length 5 -Number 20 -Format Lowercase

    .EXAMPLE
        Get-RandomHostname -Length 5 -Number 20 -Format Lowercase -DisableAlwaysStartFromLetter
    #>

    [CmdletBinding()]
    [OutputType([Array])]
    Param(
        [Parameter()]
        [ValidateRange(1, 100)]
        [Alias("l")]
        [Int]
        $Length = 15,

        [Parameter()]
        [ValidateRange(1, 200)]
        [Alias("n")]
        [Int]
        $Number = 1,

        [Parameter()]
        [ValidateSet("Uppercase", "Lowercase", "Capitalize")]
        [String]
        $Format = "Uppercase",

        [Parameter()]
        [Switch]
        $DisableAlwaysStartFromLetter
    )

    process {
        [Array]$Result = @()

        for ($i = 1; $i -le $Number; $i++)
            {
                <#
                ASCII characters:
                65..90 - Uppercase letters [A-Z] (Exclude symbols: "073 I", "079 O").
                48..57 - Numbers [0-9].
                Always start from letter.
                #>

                if ($DisableAlwaysStartFromLetter) {
                    [String]$RandomHostname = `
                        (-join ((65..72) + (74..78) + (80..90) + (48..57) | Get-Random -count ($Length + 1) | ForEach-Object {[Char]$_}))
                }
                else {
                    [String]$RandomHostname = `
                        (-join (((65..72) + (74..78) + (80..90)) | Get-Random -count 1 | ForEach-Object {[Char]$_})) + `
                        (-join ((65..72) + (74..78) + (80..90) + (48..57) | Get-Random -count $Length | ForEach-Object {[Char]$_}))
                }

                switch($Format) {
                    "Uppercase" {
                        $Result += ($RandomHostname.Substring(0, ($RandomHostname.Length - 1))).ToUpper()
                    }
                    "Lowercase" {
                        $Result += ($RandomHostname.Substring(0, ($RandomHostname.Length - 1))).ToLower()
                    }
                    "Capitalize" {
                        $Result += (Get-Culture).TextInfo.ToTitleCase(($RandomHostname.Substring(0, ($RandomHostname.Length - 1))).ToLower())
                    }
                }
            }

        $Result
    }
}
