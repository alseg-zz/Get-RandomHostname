#============================================================

#Function return process result
Function ProcessResult ($Description) # | ProcessResult -Description "Description"
    {
        if ($?) {Write-Host $Description ".......... SUCCESS" -ForegroundColor Green}
        else {Write-Host $Description ".......... FAIL" -ForegroundColor Magenta}
    }

#============================================================

#Generate new hostname
#Symbols in ASCII character set, always started from letters, 15 symbols, uses all upper-case letters and 0-9 numbers, exclude symbols: "073 I", "079 O"
$Newhostname = (-join (((65..72) + (74..78) + (80..90)) | Get-Random -Count 1 | % {[char]$_})) + (-join ((65..72) + (74..78) + (80..90) + (48..57) | Get-Random -Count 14 | % {[char]$_}))

#START
Write-host "version 0.1" -ForegroundColor Cyan
Write-host "==========BEGIN==========" -ForegroundColor Cyan

#Set new hostname
#Rename-Computer -NewName $Newhostname; ProcessResult -Description "Set new hostname"
Write-host "New hostname:"$Newhostname -ForegroundColor Yellow

#END
Write-host "==========EOF==========" -ForegroundColor Cyan
