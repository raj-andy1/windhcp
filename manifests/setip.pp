# /etc/puppetlabs/code/environments/production/site/windhcp/manifests/setip.pp
# Sample Puppet code to set a static IP for an interface on a Windows machine

class windhcp::setip (
  $net_int_nm = 'Ethernet',
  $net_int_ipaddr = '192.168.0.117',
  $net_int_ipmask = '255.255.255.0',
  $net_int_ipgw = '192.168.0.1',
  )
{
exec {'set-staticip-for-interface':
  command => "netsh interface ip set address ${net_int_nm} static ${net_int_ipaddr} ${net_int_ipmask} ${net_int_ipgw}",
  #onlyif => ,

  }
}
