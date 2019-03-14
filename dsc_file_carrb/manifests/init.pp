class dsc_file_carrb {
  dsc_file{ 'ExampleTextFile':
    dsc_ensure          => 'Present',
    dsc_type            => 'File',
    dsc_destinationpath => 'c:\fqdn.txt',
    dsc_contents        => $facts['networking']['fqdn'],
  }

  dsc_file{ 'HieraData':
    dsc_ensure          => 'Present',
    dsc_type            => 'File',
    dsc_destinationpath => 'c:\foo.txt',
    dsc_contents        => lookup('foo'),
  }

  dsc_user{ 'NewUserHieraPwd':
    dsc_ensure          => 'Present',
    dsc_fullname        => 'Stephen Fox',
    dsc_password        => {'user' => 'foxs', 'password' => Sensitive(lookup('serverbuild'))},
    dsc_username	=> 'foxs',
    dsc_disabled	=> 'false',
  }

#  dsc_windowsfeature {'IIS':
#    dsc_ensure   => 'present',
#    dsc_name     => 'Web-Server',
#  }
}
