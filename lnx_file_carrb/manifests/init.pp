class lnx_file_carrb {
  $content = hiera('ntp')
  file {'/tmp/hello-file':
    ensure  => 'present',
    content => "${content}\n",
    mode    => '0644',
  }
}
