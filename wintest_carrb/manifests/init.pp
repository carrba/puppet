class wintest_carrb {
  include chocolatey
  #mod 'puppetlabs-chocolatey', '3.1.0'
  package { 'notepadplusplus':
    ensure   => latest,
    provider => 'chocolatey',
  }
  package { 'chocolatey' :
    ensure   => latest,
    provider => 'chocolatey',
  }
  package { 'git' :
    ensure   => latest,
    provider => 'chocolatey',
  }
}
