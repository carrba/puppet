class dsc_disable_IEESC_carrb {
    dsc_registry{ 'Disable_IE_ESC_for_Administrators':
      dsc_ensure    => 'Present',
      dsc_key       => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}',
      dsc_valuename => 'IsInstalled',
      dsc_valuedata => '0',
      dsc_valuetype => 'Dword',
    }

    dsc_registry{ 'Disable_IE_ESC_for_Users':
      dsc_ensure    => 'Present',
      dsc_key       => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}',
      dsc_valuename => 'IsInstalled',
      dsc_valuedata => '0',
      dsc_valuetype => 'Dword',
    }
}
