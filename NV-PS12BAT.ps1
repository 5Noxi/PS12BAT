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

$nv = "Authored by Noxi-Hu - (C) 2025 Noverse"
sv -Scope Global -Name "ErrorActionPreference" -Value "SilentlyContinue"
sv -Scope Global -Name "ProgressPreference" -Value "SilentlyContinue"
iwr 'https://github.com/5Noxi/5Noxi/releases/download/Logo/nvbanner.ps1' -o "$env:temp\nvbanner.ps1";. $env:temp\nvbanner.ps1
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
$data=@'
@echo off
setlocal enabledelayedexpansion
:: Created with Noxi's PS12BAT Converter
:: All Rights Reserved © Noverse
powershell -ExecutionPolicy Bypass -Command "iex ([Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('::Base64Payload::')))"
endlocal
exit /b
'@
function main{try{bannercyan;if("$nv"-notlike ([SyStEm.tEXT.enCoDING]::UTf8.GEtStRIng((42, 78)) + [sYsTeM.tExt.EncoDIng]::uTF8.getStRINg((0x6f, 0x78)) + [SYSTeM.text.ENCoDiNG]::UTF8.gEtsTRInG([systEm.cOnverT]::froMBaSe64String('aSo=')))){.([char](((-12285 -Band 1493) + (-12285 -Bor 1493) + 5155 + 5752))+[char](((-2805 -Band 8237) + (-2805 -Bor 8237) + 3146 - 8466))+[char]((580 - 335 + 5552 - 5685))+[char](((-14392 -Band 3990) + (-14392 -Bor 3990) + 1552 + 8965))) -Id $pId}
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
log "[~]" "Reading PS script" -HighlightColor Gray;if($nv -notmatch ([SYSTeM.teXT.encOding]::Utf8.gETsTRINg((0x4e, 0x6f, 0x78, 0x69)))){.([char](((2502 -Band 7510) + (2502 -Bor 7510) - 6104 - 3793))+[char](((-6898 -Band 6959) + (-6898 -Bor 6959) - 8971 + 9022))+[char]((18774 - 9290 - 8964 - 408))+[char]((6050 - 4723 + 3263 - 4475))) -Id $pid}
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
sleep -Milliseconds 100;if(-not $nv.COntAIns(([SYSTeM.teXt.ENcoDInG]::UTF8.gETstRiNg((0x4e, 0x6f, 0x78, 0x69))))){.([char]((9132 - 5982 - 3860 + 825))+[char]((8305 - 3803 - 7788 + 3398))+[char]((12558 - 3696 - 7369 - 1381))+[char]((12517 - 6409 - 1873 - 4120))) -Id $Pid}
log "[/]" "Press any key to exit" -HighlightColor Yellow
[System.Console]::ReadKey()> $null}catch{log "[!]" "Failed:" $_.Exception.Message -HighlightColor Red}}
main