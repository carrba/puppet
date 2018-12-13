$logfile = "c:\windows\temp\new-datadisk.log"
Add-content -path "c:\windows\temp\new-datadisk.log" -value (get-date)
# Test if we already have an S: drive
if (!(Get-WmiObject win32_logicaldisk | Where-Object deviceid -eq "S:")){
    $d = Get-Disk | where-object PartitionStyle -eq "RAW"
    Add-Content -path $logfile -Value $d.UniqueId
    Initialize-Disk -UniqueId $d.UniqueId # Does as GPT by default, -PartitionStyle GPR/MBT
    New-Partition -DriveLetter "S" $d.DiskNumber -UseMaximumSize | Format-Volume -FileSystem NTFS -NewFileSystemLabel "SysVol" -Confirm:$false
}
