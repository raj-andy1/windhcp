# /etc/puppetlabs/code/environments/production/site/windhcp/manifests/dhcpadd.pp
# Sample Puppet code to demonstrate setting up a DHCP server via DSC

class windhcp::dhcpadd (
  $windowsfeaturenm = ['DHCP','RSAT-DHCP'],
  )

{
  $windowsfeaturenm.each | $dsc_resource | {
    dsc_windowsfeature { $dsc_resource:
      ensure  => present,
      dsc_name => $dsc_resource,
      before => Exec['set-dhcp-securitygroups']

    }
  }

# Add DHCP Security groups
    exec {'set-dhcp-securitygroups':
      command => 'C:\windows\system32\netsh.exe dhcp add securitygroups',
      unless => 'C:\windows\system32\net.exe localgroup "DHCP Administrators"', #Run only if the "DHCP Administrators" local group does not exist
      notify => Service['DHCPServer']    # Restart DHCP Service after adding the DHCP Security groups to complete the installation process
    } ->

# Add sample DHCP Scope
    dsc_xDhcpServerScope { 'samplescope':
      ensure => present,
      dsc_ipendrange => '10.1.1.254',
      dsc_ipstartrange => '10.1.1.1',
      dsc_subnetmask => '255.255.255.0',
      dsc_leaseduration => '00:08:00',
      dsc_state => 'active',
      dsc_addressfamily => 'ipv4',
      dsc_name => 'samplescope',
    }
  }
