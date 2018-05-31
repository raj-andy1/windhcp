#module to setup manage and setup DHCP server on Windows

class windhcp 

{
  include windhcp::dhcpadd
  include windhcp::dhcpint
  include windhcp::setip

  Class['windhcp::dhcpint'] -> Class['windhcp::setip'] -> Class['windhcp::dhcpadd']
}
