class win_dev_carrb {
  include chocolatey
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
 package { 'vscode' :
    ensure   => latest,
    provider => 'chocolatey',
  }
 package { 'putty' :
    ensure   => latest,
    provider => 'chocolatey',
  }
  package { 'winscp' :
    ensure  => latest,
    provider => 'chocolatey',
  }
}
