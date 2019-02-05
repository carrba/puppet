class lnx_rubygem_carrb {
  package { 'ruby':
    ensure   => 'installed',
  }

  package { 'puppet':
    ensure   => 'installed',
    provider => 'gem',
  }
  package { 'puppet-lint':
    ensure   => 'installed',
    provider => 'gem',
  }

  package { 'puppet-syntax':
    ensure   => 'installed',
    provider => 'gem',
  }

  package { 'puppetlabs_spec_helper':
    ensure   => 'installed',
    provider => 'gem',
  }
}
