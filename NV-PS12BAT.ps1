#    PowerShell to Batch Converter - PS12BAT
#    Copyright (C)2024 Noverse
#
#    This program is proprietary software: you may not copy,redistribute,or modify
#    it in any way without prior written permission from Noverse.
#
#    Unauthorized use,modification,or distribution of this program is prohibited
#    and will be pursued under applicable law. This software is provided "as is,"
#    without warranty of any kind,express or implied,including but not limited to
#    the warranties of merchantability,fitness for a particular purpose,and
#    non-infringement.
#
#    For permissions or inquiries,contact: https://discord.gg/E2ybG4j9jU
#    Minified with NV-Minifier

$NV = @"
# Created by Noxi-Hu! - Copyright (C) 2024 Noverse
"@

sv -Scope Global -Name "ErrorActionPreference" -Value "SilentlyContinue"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force
$Host.UI.RawUI.BackgroundColor="Black"
$host.ui.RawUI.WindowTitle="Noxi's PS12BAT Converter"
clear
function log{param (
[string]$HighlightMessage,[string]$Message,[string]$More,[ConsoleColor]$TimeColor='DarkGray',[ConsoleColor]$HighlightColor='White',[ConsoleColor]$MessageColor='White',[ConsoleColor]$MoreColor='White')
$time=" [{0:HH:mm:ss}]" -f (Get-Date)
Write-Host -ForegroundColor $TimeColor $time -NoNewline
Write-Host -NoNewline " "
Write-Host -ForegroundColor $HighlightColor $HighlightMessage -NoNewline
Write-Host -ForegroundColor $MessageColor " $Message" -NoNewline
Write-Host -ForegroundColor $MoreColor " $More"}
function banner{clear
echo ""
echo ""
Write-Host -ForegroundColor DarkBlue "              ░░░     ░░░   ░░░░░░░░░░░   ░░░     ░░░   ░░░░░░░░░░   ░░░░░░░░░░    ░░░░░░░░░░   ░░░░░░░░░░"
Write-Host -ForegroundColor DarkBlue "              ░░░░    ░░░   ░░░     ░░░   ░░░     ░░░   ░░░          ░░░     ░░░   ░░░          ░░░"
Write-Host -ForegroundColor Blue     "              ▒▒▒▒▒   ░▒▒   ▒░░     ░░▒   ▒░░     ░░▒   ░░░          ▒░░     ▒▒░   ░░░          ░░░"
Write-Host -ForegroundColor Blue     "              ▒▒▒ ▒▒▒ ▒▒▒   ▒▒░     ░▒▒   ▒▒░     ░▒▒   ▒▒▒▒▒▒▒▒     ▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒"
Write-Host -ForegroundColor Blue     "              ▒▒▒   ▒▒▒▒▒   ▒▒▒     ▒▒▒    ▒▒▒   ▒▒▒    ▒▒▒          ▒▓▓     ▓▓▒          ▒▒▒   ▒▒▒"
Write-Host -ForegroundColor DarkCyan "              ▒▓▓    ▓▓▓▒   ▓▓▓     ▓▓▓     ▒▓▓ ▓▓▒     ▓▓▓          ▓▓▓     ▓▓▓          ▓▓▓   ▓▓▓"
Write-Host -ForegroundColor DarkCyan "              ▓▓▓     ▓▓▓   ▓▓▓▓▓▓▓▓▓▓▓       ▓▓▓       ▓▓▓▓▓▓▓▓▓▓   ▓▓▓     ▓▓▓   ▓▓▓▓▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓▓▓"
echo ""
Write-Host                            "‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗" -ForegroundColor DarkGray
echo ""
echo ""}
$data=@'
@echo off
setlocal enabledelayedexpansion
:: Created with Noxi's PS12BAT Converter
:: All Rights Reserved © Noverse
powershell -ExecutionPolicy Bypass -Command "iex ([Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('::Base64Payload::')))"
endlocal
exit /b
'@
function main{try{banner
if ($NV -notmatch '\!\*') {$null=$null}else{exit}
log "[?]" "Location of the PS1 file" "(Drag/Write)" -HighlightColor Blue -MoreColor DarkGray
Write-Host " >> " -ForegroundColor Blue -NoNewline
$path=Read-Host
$path=$path.Trim('"')
if (-not$path){log "[!]" "No input provided" -HighlightColor Red
return}
if (Test-Path $path){log "[+]" "File found at location" -HighlightColor Green
sleep -Milliseconds 100}else{log "[!]" "File not found" -HighlightColor Red
log "[/]" "Press any key to exit" -HighlightColor Yellow
[System.Console]::ReadKey()> $null
return}
log "[~]" "Reading PS script" -HighlightColor Gray
if ($NV -notmatch '\!\*') {$null=$null}else{exit}
sleep -Milliseconds 100
$code=cat $path -raw
log "[~]" "Encoding script to base64" -HighlightColor Gray
sleep -Milliseconds 100
$bytes=[System.Text.Encoding]::UTF8.GetBytes($code)
$encode=[System.Convert]::ToBase64String($bytes)
log "[~]" "Preparing batch file with embedded base64 payload" -HighlightColor Gray
sleep -Milliseconds 100
$content=$data -replace'::Base64Payload::',$encode
$out=Join-Path -Path (Split-Path -Path $path -Parent)-ChildPath ("NV-" + [System.IO.Path]::GetFileNameWithoutExtension($path)+ ".bat")
if (Test-Path $out){log "[#]" "File already exists,overwriting it" -HighlightColor Yellow
sleep -Milliseconds 100}
log "[~]" "Writing batch file" -HighlightColor Gray
sleep -Milliseconds 100
sc -Path $out -Value $content -Force
log "[+]" "Batch file created successfully" -HighlightColor Green
sleep -Milliseconds 100
if ("$NV" -notlike "*!*") { kill -Id $PID }
log "[/]" "Press any key to exit" -HighlightColor Yellow
[System.Console]::ReadKey()> $null}catch{log "[!]" "Failed:" $_.Exception.Message -HighlightColor Red}}
main