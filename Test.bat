@echo off

:: run as administrator
:: https://stackoverflow.com/a/51472107
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

:: zip
:: https://stackoverflow.com/a/6037167

powershell -command "& {[Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem'); $Compression = [System.IO.Compression.CompressionLevel]::Optimal; $IncludeBaseDirectory = $true; $Source = 'C:\Tally.ERP9\Data'; $Destination = 'C:\My Drive\Backups\Tally Backup\17-Jun-2022.zip'; [System.IO.Compression.ZipFile]::CreateFromDirectory($Source,$Destination,$Compression,$IncludeBaseDirectory);}"

pause