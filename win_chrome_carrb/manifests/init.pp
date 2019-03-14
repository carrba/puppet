class {
  include chocolatey
  package { 'google-chrome-x64':
    ensure   => latest,
    provider => 'chocolatey',
  }
}
