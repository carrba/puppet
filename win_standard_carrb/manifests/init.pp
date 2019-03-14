class win_standard_carrb {
  include chocolatey
  package { 'chocolatey' :
    ensure   => latest,
    provider => 'chocolatey',
  }
}
