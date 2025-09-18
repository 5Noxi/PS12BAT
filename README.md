# PS12bat - PowerShell to Batch Converter
Converts `.ps1` code to a standalone `.bat` file using [B64](https://en.wikipedia.org/wiki/Base64). It won't work, if it includes any banner with ASCII art.

Preview:
![](https://github.com/5Noxi/ps12bat/blob/main/images/ps12batpre.png?raw=true)

PS code:
```ps
Write-Host "Noverse" -ForegroundColor Blue
pause
```
Converted batch code:
```bat
@echo off
setlocal enabledelayedexpansion
:: Noverse PS12bat
powershell -c "iex ([text.encoding]::utf8.getstring([convert]::frombase64string('V3JpdGUtSG9zdCAiTm92ZXJzZSIgLUZvcmVncm91bmRDb2xvciBCbHVlDQpwYXVzZQ==')))"
endlocal
exit /b
```
`V3JpdGUtSG9zdCAiTm92ZXJzZSIgLUZvcmVncm91bmRDb2xvciBCbHVlDQpwYXVzZQ==` is the B64 string, which includes the PS code. 

Decode it manually [here](https://www.base64decode.org/) yourself.
