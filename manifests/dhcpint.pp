# /etc/puppetlabs/code/environments/production/site/windhcp/manifests/dhcpint.pp
# Puppet code to disable DHCP Addressing for all interfaces on a machine. 

class windhcp::dhcpint {
  $::interface_guids.each | $key, $value| {
    registry_value { "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{${value}}\EnableDHCP":
      ensure => present,
      type   => 'dword',
      data   => '0',
    }
  }
}
