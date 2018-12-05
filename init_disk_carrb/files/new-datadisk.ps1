$d = Get-Disk | where PartitionStyle -eq "RAW"
Initialize-Disk -UniqueId $d.UniqueId # Does as GPT by default, -PartitionStyle GPR/MBT

New-Partition -DriveLetter "S" $d.DiskNumber -UseMaximumSize Format-Volume -FileSystem NTFS -NewFileSystemLabel "SysVol" -Confirm:$false
