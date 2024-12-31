# PS12BAT
Converts `.ps1` files to a standalone `.bat` files via base64. Doesn't work with **BOM** (*UFT8 with BOM*) encoded scripts!

Preview:
![ps12batpre](https://github.com/5Noxi/PS12BAT/blob/main/NV-PS12BAT.png?raw=true)

## Discord Server
- https://discord.gg/E2ybG4j9jU

## How it works 
Converts a .ps1 file to a .bat by encoding the PowerShell script in Base64 and embedding it in a Batch file for execution
```
powershell -ExecutionPolicy Bypass -Command "iex ([Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('::Base64Payload::')))"
```
