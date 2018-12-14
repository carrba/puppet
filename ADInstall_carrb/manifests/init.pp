class ad_domaintest(
    $domainadmincred = {
      'user' => 'jane-doe',
      'password' => 'jane-123!"£'
    } 
    $ntdsfolder     = 'S:\NTDS',
    $sysvolfolder   = 'S:\SYSVOL'
)
{
# Install the AD role
    dsc_windowsfeature {'ADDSInstall':
    dsc_ensure => 'present',
    dsc_name   => 'AD-Domain-Services',
  }
#Install the AD Tools
    dsc_windowsfeature {'ADDSTools':
    dsc_ensure => 'present',
    dsc_name   => 'RSAT-ADDS',
  }
#ADD NTDS folder  
    dsc_file { 'NTDS Folder':
    dsc_ensure         => 'present',
    dsc_type           => 'Directory',
    dsc_destinationpath => $NTDSFolder,
  }
#ADD SYSVOL folder  
    dsc_file { 'SYSVOL Folder':
    dsc_ensure         => 'present',
    dsc_type           => 'Directory',
    dsc_destinationpath => $sysvolfolder,
  }
#Config AD Domain 
    dsc_xaddomain {'FirstDS':
    ensure                              => present,
    dsc_domainname                      => 'celtic.local',
    dsc_domainadministratorcredential   => $domainadmincred,
    dsc_safemodeadministratorpassword   => $domainadmincred,
    dsc_databasepath                    => $ntdsfolder,
    dsc_logpath                         => $ntdsfolder,
    dsc_sysvolpath                      => $ntdsfolder,
    }
}