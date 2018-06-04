# /etc/puppetlabs/code/environments/production/site/windhcp/manifests/setupint.pp
# Sample Puppet code to configure the interfaces on the dhcp server

class windhcp::setupint ()
{
$facts['networking']['interfaces'].keys.each | $int_name| {
  dsc_xdhcpclient { $int_name:
  ensure => present,
  dsc_state => 'Disabled',
  dsc_interfacealias => $inst_name,
  }
  }
  }
