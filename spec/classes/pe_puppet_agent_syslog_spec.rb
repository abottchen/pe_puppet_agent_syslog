require 'spec_helper'

describe 'pe_puppet_agent_syslog' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it do
        is_expected.to compile
        is_expected.to contain_file('/etc/rsyslog.d/99-puppet-agent.conf')
      end
    end
  end
end
