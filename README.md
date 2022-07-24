# TallyBackupTool

Batch file to backup Tally data to Google Drive

# To-do

- [x] Make zip of C:\Tally.ERP9\Data folder
- [x] Name the zip properly with date/time
- [x] Copy and paste the zip to G:\My Drive\Tally Backup
- [x] Delete the generated zip from the original path (or cut paste if possible)
- [x] Always run as administrator (can’t do this without prompting for security reasons)
- [x] Powershell issue

# Notes:

- Check version of Powershell: $PSVersionTable
- [Powershell archive incompatible with macOS](https://github.com/PowerShell/PowerShell/issues/2140)
- [How to update Powershell?](https://docs.microsoft.com/en-us/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.2)
