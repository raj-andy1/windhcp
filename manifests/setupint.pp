# /etc/puppetlabs/code/environments/production/site/windhcp/manifests/setupint.pp
# Sample Puppet code to configure the interfaces on the dhcp server

class windhcp::setupint ()

$::interfaces.each | $dsc_resource| {
  {
  dsc_xdhcpclient { $dsc_resource:
  ensure => present,
  dsc_state => 'Disabled',
  dsc_interfacealias => $dsc_resource,
  }
  }
  }
