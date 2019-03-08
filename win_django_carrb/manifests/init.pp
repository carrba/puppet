class win_django_carrb {
  package { 'mysql':
    ensure   => latest,
    provider => chocolatey,
  }
  package { 'python':
    ensure   => latest,
    provider => chocolatey,
  }
  exec { 'update pip':
    command => 'c:\windows\system32\cmd.exe /c python -m pip install --upgrade pip',
  }
  exec { 'install django':
    command => 'c:\windows\system32\cmd.exe /c pip install django',
  }
}
