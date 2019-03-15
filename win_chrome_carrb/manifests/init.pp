class win_chrome_carrb {
  package { 'google-chrome-x64':
    ensure   => latest,
    provider => 'chocolatey',
  }
}
