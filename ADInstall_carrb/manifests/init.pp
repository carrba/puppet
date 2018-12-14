class ad_domaintest(
    $DomainAdministratorCredential => {
        'user' => 'jane-doe',
        'password' => 'jane-password'
        },
    $NTDSFolder     = 'S:\NTDS',
    $SYSVOLFolder   = 'S:\SYSVOL'
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
    dsc_destinationpath => $SYSVOLFolder,
  }
#Config AD Domain 
    dsc_xaddomain {'FirstDS':
    ensure                              => present,
    dsc_domainname                      => 'domaintest.local',
    dsc_domainadministratorcredential   => $DomainAdministratorCredential,
    dsc_safemodeadministratorpassword   => $DomainAdministratorCredential,
    dsc_databasepath                    => $NTDSFolder,
    dsc_logpath                         => $NTDSFolder,
    dsc_sysvolpath                      => $NTDSFolder,
    }
}