# pe_puppet_agent_syslog
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include pe_puppet_agent_syslog
class pe_puppet_agent_syslog(
  String $facility = 'local6',
  String $log_filename = '/var/log/puppetlabs/puppet-agent.log',
) {
  file { $log_filename:
    ensure => file,
    before => File['/etc/rsyslog.d/99-puppet-agent.conf'],
  }

  file { '/etc/rsyslog.d/99-puppet-agent.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${facility}.info  ${log_filename}",
    notify  => Service['rsyslog'],
  }

  pe_ini_setting { 'set syslogfacility in puppet.conf':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'syslogfacility',
    value   => $facility,
    notify  => Service['puppet'],
  }

  service { 'puppet':
    ensure => running,
  }

  service { 'rsyslog':
    ensure => running,
  }
}
