  dsc_user{ 'NewUserHieraPwd':
    dsc_ensure          => 'Present',
    dsc_fullname        => 'Stephen Fox',
    dsc_password        => {'user' => 'foxs', 'password' => Sensitive(lookup('serverbuild'))},
    dsc_username	=> 'foxs',
    dsc_disabled	=> 'false',
  }
