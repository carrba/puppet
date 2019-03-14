class win_chrome_carrb {
  include chocolatey
  package { 'google-chrome-x64':
    ensure   => latest,
    provider => 'chocolatey',
  }
}
