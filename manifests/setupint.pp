# /etc/puppetlabs/code/environments/production/site/windhcp/manifests/setupint.pp
# Sample Puppet code to configure the interfaces on the dhcp server

class windhcp::setupint (
  $interface_nm = 'Ethernet'
)
{
$facts['networking']['interfaces'].keys.each | $int_name| {
  dsc_xdhcpclient { $int_name:
  ensure => present,
  dsc_state => 'Disabled',
  dsc_interfacealias => $int_name,
  dsc_addressfamily => 'IPv4',
  before => Dsc_xipaddress["${interface_nm}"]
  }
  }
  dsc_xipaddress {$interface_nm:
  ensure => present,
  dsc_addressfamily => 'IPV4',
  dsc_interfacealias => $interface_nm,
  dsc_ipaddress => '192.168.0.118/24'
  before => dsc_xdefaultgateway["${interface_nm}"]
  }
  dsc_xdefaultgateway {$interface_nm:
  ensure => present,
  dsc_addressfamily => 'IPV4',
  dsc_interfacealias => $interface_nm,
  dsc_address => '192.168.0.1'
  before => dsc_xdnsserveraddress["${interface_nm}"]
  }
  dsc_xdnsserveraddress {$interface_nm,
  ensure => present,
  dsc_addressfamily => 'IPV4',
  dsc_interfacealias => $interface_nm,
  dsc_address => '8.8.8.8'
  }
  }
