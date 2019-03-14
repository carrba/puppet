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

#  dsc_windowsfeature {'IIS':
#    dsc_ensure   => 'present',
#    dsc_name     => 'Web-Server',
#  }
}
