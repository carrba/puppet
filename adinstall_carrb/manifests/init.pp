class adinstall_carrb (
    $domainadmincred = {
      'user' => 'jane-doe',
      'password' => 'jane-123!"£',
    }, 
    $ntdsfolder     = 'S:\NTDS',
    $sysvolfolder   = 'S:\SYSVOL',
)
{
require init_disk_carrb
#dsc_reboot resource
    reboot {'dsc_reboot':
      when  => pending,
      timeout => 15,
    }
#Install the AD role
    dsc_windowsfeature {'ADDSInstall':
    dsc_ensure => 'present',
    dsc_name   => 'AD-Domain-Services',
    notify => Reboot['dsc_reboot'],
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
    dsc_destinationpath => $ntdsfolder,
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
    dsc_domainname                      => 'domaintest.local',
    dsc_domainadministratorcredential   => $domainadmincred,
    dsc_safemodeadministratorpassword   => $domainadmincred,
    dsc_databasepath                    => $ntdsfolder,
    dsc_logpath                         => $ntdsfolder,
    dsc_sysvolpath                      => $sysvolfolder,
    }
}

