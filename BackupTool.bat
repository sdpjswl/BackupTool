@echo off

:: run as administrator
:: https://stackoverflow.com/a/51472107
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

:: https://ss64.com/nt/delayedexpansion.html
setlocal EnableDelayedExpansion

echo ******** AXON BACKUP TOOL ********

:: https://stackoverflow.com/a/11539774
pushd C:\Axon Backup
for /f "tokens=1,2,3 delims=/- " %%x in ("%date%") do set d=%%z-%%y-%%x
echo %d%
for /f "tokens=*" %%a in ('dir /b /od') do set latest=%%a
::set destination=C:\Testing\Backups\Axon Backup\%d%.zip
set destination=G:\My Drive\Backups\Axon Backup\%d%.zip
echo %destination%
copy "%latest%" "%destination%"
popd

echo ******** AXON BACKUP COMPLETE ********

echo ******************************************************

echo ******** TALLY BACKUP TOOL ********

:: Generate file name using current date
:: https://stackoverflow.com/a/44023788

:: for /f "tokens=1,2,3 delims=/- " %%x in ("%date%") do set d=%%x-%%y-%%z
:: set "mo=%d:~3,2%"
:: if "%mo:~0,1%"=="0" set "mo=%mo:~1%"
:: set names=JanFebMarAprMayJunJulAugSepOctNovDec
:: set /a "pos=3*%mo%"-3
:: set "ti=!names:~%pos%,3!"
:: for /f "tokens=1,2,3 delims=/- " %%x in ("%date%") do set string=%%x-%ti%-%%z

:: Zip data and save to temp folder
:: https://stackoverflow.com/a/64475079
:: https://stackoverflow.com/a/67542742

for /f "tokens=1,2,3 delims=/- " %%x in ("%date%") do set string=%%z-%%y-%%x
set "dataPath=C:\Tally.ERP9\Data"
set "tempZipPath=C:\Windows\Temp\%string%.zip"

echo Archiving data present at %dataPath% to %tempZipPath%
::powershell compress-archive -path %dataPath% -destinationpath %tempZipPath% -force

:: 7-zip
:: https://superuser.com/a/281283
"C:\Program Files\7-Zip\7z.exe" a -tzip %tempZipPath% %dataPath%
echo Archive complete!

:: Copy to google drive path
:: https://stackoverflow.com/a/33714729

set "googleDrivePath=G:\My Drive\Backups\Tally Backup\%string%.zip"
:: set "googleDrivePath=C:\Testing\Backups\Tally Backup\%string%.zip"

echo Moving zipped data from %tempZipPath% to %googleDrivePath%
move "%tempZipPath%" "%googleDrivePath%"

echo ******** TALLY BACKUP COMPLETE ********
echo You can find your backup at %googleDrivePath%

pause
