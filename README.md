# PS12bat - PowerShell to Batch Converter
Converts `.ps1` code to a standalone `.bat` file using [B64](https://en.wikipedia.org/wiki/Base64). It won't work, if it includes any banner with ASCII art.

"In computer programming, Base64 is a group of [binary-to-text encoding](https://en.wikipedia.org/wiki/Binary-to-text_encoding) schemes that transforms [binary data](https://en.wikipedia.org/wiki/Binary_data) into a sequence of printable characters, limited to a set of 64 unique characters. More specifically, the source binary data is taken 6 bits at a time, then this group of 6 bits is mapped to one of 64 unique characters. As with all binary-to-text encoding schemes, Base64 is designed to carry data stored in binary formats across channels that only reliably support text content. Base64 is particularly prevalent on the World Wide Web where one of its uses is the ability to embed image files or other binary assets inside textual assets such as HTML and CSS files. Base64 is also widely used for sending e-mail attachments, because [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol) – in its original form – was designed to transport [7-bit ASCII](https://en.wikipedia.org/wiki/7-bit_ASCII) characters only. Encoding an attachment as Base64 before sending, and then decoding when received, assures older SMTP servers will not interfere with the attachment. Base64 encoding causes an overhead of 33–37% relative to the size of the original binary data (33% by the encoding itself; up to 4% more by the inserted line breaks)."
> [Base64 | wikipedia](https://en.wikipedia.org/wiki/Base64)

Preview:
![](https://github.com/5Noxi/ps12bat/blob/main/images/ps12batpre.png?raw=true)

PS code:
```ps
Write-Host "Noverse" -ForegroundColor Blue
pause
```
Converted PS (batch) code:
```bat
@echo off
setlocal enabledelayedexpansion
:: Noverse PS12bat
powershell -c "iex ([text.encoding]::utf8.getstring([convert]::frombase64string('V3JpdGUtSG9zdCAiTm92ZXJzZSIgLUZvcmVncm91bmRDb2xvciBCbHVlDQpwYXVzZQ==')))"
endlocal
exit /b
```
`V3JpdGUtSG9zdCAiTm92ZXJzZSIgLUZvcmVncm91bmRDb2xvciBCbHVlDQpwYXVzZQ==` is the B64 string, which includes the PS code. 

Decode it manually [here]([https://www.base64decode.org/](https://onlinewebdevtools.com/base64)) yourself.
