# PS12BAT
Converts `.ps1` files to a standalone `.bat` files via base64. Won't work, if it includes any banner with ASCII art!

Preview:
![ps12batpre](https://github.com/5Noxi/PS12BAT/blob/main/NV-PS12BAT.png?raw=true)

## How It Works 
Converts a `.ps1` file to a `.bat` by encoding the powershell script in base64 and embedding it in a batch file for execution, using the following command:
```
powershell -ExecutionPolicy Bypass -Command "iex ([Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('::Base64Payload::')))"
```
