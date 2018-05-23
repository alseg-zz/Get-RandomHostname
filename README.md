# Random hostname generator

## Import
```powershell
Import-Module <path>
```

## Screenshot
<img src="./Images/hucv26pglyxb1w0.png" width="350px">

## Usage
```powershell
Get-RandomHostname
Get-RandomHostname -Length 22
Get-RandomHostname -Length 5 -Number 20
Get-RandomHostname -Length 5 -Number 20 -Format Lowercase
Get-RandomHostname -Length 5 -Number 20 -Format Lowercase -DisableAlwaysStartFromLetter
Get-RandomHostname -Number 5 -Domain dev.example.com
```

## Help
```powershell
Get-Help Get-RandomHostname -full
```
