#PowerShell
#Requires -Version 4

Function Get-RandomHostname()
{
    #Generate new hostname string:
    #Symbols in ASCII character set, always started from letters, 15 symbols length, uses all upper-case letters and 0-9 numbers
    #Exclude symbols: "073 I", "079 O"
    $RandomHostname = (-join (((65..72) + (74..78) + (80..90)) | Get-Random -Count 1 | % {[char]$_})) + (-join ((65..72) + (74..78) + (80..90) + (48..57) | Get-Random -Count 14 | % {[char]$_}))
    Write-Host $RandomHostname
} #end Get-RandomHostname

1..10 | % {Get-RandomHostname}