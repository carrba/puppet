class init_disk_carrb {
  $scriptfile = "new-datadisk.ps1"
  $powershellexe = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
  $scriptpath = 'C:/Windows/Temp/${wsrpsscriptfile}'
  file { 'new-datadisk.ps1':
    path   => $scriptpath,
    ensure => "file",
    source => "puppet:///modules/init_disk_carrb/files/$scriptfile",
  }
  exec { 'Init Disk and Format':
    command  => "start-process -verb runas $powershellexe -argumentlist '-file ${wsrpsscriptpath}'",
    provider => "powershell"
  }
}
