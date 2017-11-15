# /etc/puppetlabs/code/environments/production/site/windhcp/manifests/setip.pp
# Sample Puppet code to set a static IP for an interface on a Windows machine

class windhcp::setip (
  $net_int_nm =,
  $net_int_ipaddr =,
  $net_int_ipmask =,
  $net_int_ipgw =,
  )
{
exec {'set-staticip-for-interface':
  command => 'C:\windows\system32\netsh.exe interface ip set address $net_int_nm static $net_int_ipaddr $net_int_ipmask $net_int_ipgw',
  onlyif => ,

}
