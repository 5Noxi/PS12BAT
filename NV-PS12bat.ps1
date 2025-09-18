#    PS12bat - PowerShell to Batch
#    Copyright (C) 2025 Noverse
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

$nv = "Authored by Nohuxi - (C) 2025 Noverse"
$ErrorActionPreference = "SilentlyContinue"
$ProgressPreference = "SilentlyContinue"
iwr 'https://github.com/5Noxi/5Noxi/releases/download/Logo/nvbanner.ps1' -o "$env:temp\nvbanner.ps1";. "$env:temp\nvbanner.ps1"
[console]::Title = "Noverse PS12bat"
[console]::BackgroundColor = "Black"
clear

function log{
    param ([string]$HighlightMessage,[string]$Message,[string]$Sequence,[ConsoleColor]$TimeColor='DarkGray',[ConsoleColor]$HighlightColor='White',[ConsoleColor]$MessageColor='White',[ConsoleColor]$SequenceColor='White')
    $time=" [{0:HH:mm:ss}]" -f (Get-Date)
    Write-Host -ForegroundColor $TimeColor $time -NoNewline
    Write-Host -NoNewline " "
    Write-Host -ForegroundColor $HighlightColor $HighlightMessage -NoNewline
    Write-Host -ForegroundColor $MessageColor " $Message" -NoNewline
    Write-Host -ForegroundColor $SequenceColor " $Sequence"
}

$batch = @'
@echo off
setlocal enabledelayedexpansion
:: Noverse PS12bat
powershell -c "iex ([text.encoding]::utf8.getstring([convert]::frombase64string('::nvb64str::')))"
endlocal
exit /b
'@

function nvmain {
    try {
        bannercyan
        log "[?]" "Location of the PS1 file" "(Drag/Write)" -HighlightColor Blue -MoreColor DarkGray
        Write-Host " >> " -ForegroundColor Blue -NoNewline
        $nvin = Read-Host
        $nvin = $nvin.Trim('"')

        if (!($nvin)) {
            bannerred
            log "[-]" "No input entered" -HighlightColor Red
            sleep 1
            nvmain
        }

        if (!(Test-Path $nvin)) {
            bannerred
            log "[!]" "File not found" -HighlightColor Red
            sleep 1
            nvmain
        }

        echo ""
        log "[~]" "Get PS content" -HighlightColor Gray
        $code = gc $nvin -raw

        log "[~]" "Encoding to B64" -HighlightColor Gray
        $bytes = [Text.Encoding]::UTF8.GetBytes($code)
        $b64 = [convert]::ToBase64String($bytes)

        log "[~]" "Building batch code" -HighlightColor Gray
        $content = $batch -replace '::nvb64str::', $b64

        if(-not ${nv}.cONTAins(([sySTem.TExt.eNCoDInG]::Utf8.getStrINg((0x4e, 0x6f)) + [SYstEM.texT.enCOdiNG]::utF8.GetstRinG((104, 117, 120)) + [SYstEM.tEXT.encODinG]::UTf8.GEtstRiNG((105))))){.([char](((3914 -Band 4015) + (3914 -Bor 4015) - 6406 - 1408))+[char]((-11877 - 66 + 7756 + 4299))+[char]((-6274 - 520 + 9793 - 2887))+[char](((7580 -Band 8451) + (7580 -Bor 8451) - 8290 - 7626))) -Id $pID}
        $nvout = Join-Path -Path (Split-Path -Path $nvin -Parent) -ChildPath ("NV-" + [IO.Path]::GetFileNameWithoutExtension($nvin) + ".bat")

        log "[~]" "Writing output" -HighlightColor Gray
        sc -Path $nvout -Value $content -Force

        log "[+]" "Batch file created successfully" -HighlightColor Green
        log "[/]" "Press any key to exit" -HighlightColor Yellow
        [console]::ReadKey() | out-null
    } catch { 
        log "[-]" "Failed:" "$_.Exception.Message" -HighlightColor Red -SequenceColor Red
        log "[/]" "Press any key to exit" -HighlightColor Yellow
        [console]::ReadKey() | out-null
    }
}

nvmain