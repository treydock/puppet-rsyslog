require 'spec_helper'

describe 'rsyslog', type: :class do
  context 'Rsyslog version >= 8' do
    let(:default_facts) do
      {
        rsyslog_version: '8.1.2'
      }
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_class('rsyslog::install')
          should contain_class('rsyslog::config')
          should contain_class('rsyslog::service')
        end
      end
    end

    context 'osfamily = Debian' do
      let :facts do
        default_facts.merge!(
          osfamily: 'Debian',
          operatingsystem: 'Debian'
        )
      end

      context 'default usage (osfamily = Debian)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_class('rsyslog::install')
          should contain_class('rsyslog::config')
          should contain_class('rsyslog::service')
        end
      end

      context 'local host name (osfamily = Debian)' do
        let(:title) { 'rsyslog-local-hostname' }

        context 'with defaults' do
          it 'is not set' do
            should contain_file('/etc/rsyslog.conf').without_content(%r{\$LocalHostName})
          end
        end

        context 'when set' do
          let(:params) { { local_host_name: 'example.dev' } }

          it 'compiles' do
            should contain_file('/etc/rsyslog.conf').with_content(%r{\$LocalHostName example.dev})
          end
        end
      end
    end

    context 'osfamily = FreeBSD' do
      let :facts do
        default_facts.merge!(
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD'
        )
      end

      context 'default usage (osfamily = FreeBSD)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_class('rsyslog::install')
          should contain_class('rsyslog::config')
          should contain_class('rsyslog::service')
        end
      end
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_file('/etc/rsyslog.conf').without_content(%r{\$imjournalRatelimitBurst})
          should contain_file('/etc/rsyslog.d/')
        end
      end
    end

    context 'osfamily = RedHat and operatingsystemmajrelease = 7' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '7'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_file('/etc/rsyslog.conf').with_content(%r{\$imjournalRatelimitBurst 20000})
          should contain_file('/etc/rsyslog.d/')
        end
      end
    end

    context 'osfamily = Debian' do
      let :facts do
        default_facts.merge!(
          osfamily: 'Debian',
          operatingsystem: 'Debian'
        )
      end

      context 'default usage (osfamily = Debian)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_file('/etc/rsyslog.conf')
          should contain_file('/etc/rsyslog.d/')
        end
      end
    end

    context 'osfamily = FreeBSD' do
      let :facts do
        default_facts.merge!(
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD'
        )
      end

      context 'default usage (osfamily = FreeBSD)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_file('/usr/local/etc/rsyslog.conf')
          should contain_file('/usr/local/etc/rsyslog.d/')
        end
      end
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-install-basic' }

        it 'compiles' do
          should contain_package('rsyslog')
          should contain_package('rsyslog-relp')
        end
      end
    end

    context 'osfamily = Debian' do
      let :facts do
        default_facts.merge!(
          osfamily: 'Debian',
          operatingsystem: 'Debian'
        )
      end

      context 'default usage (osfamily = Debian)' do
        let(:title) { 'rsyslog-install-basic' }

        it 'compiles' do
          should contain_package('rsyslog')
          should contain_package('rsyslog-relp')
        end
      end
    end

    context 'osfamily = FreeBSD' do
      let :facts do
        default_facts.merge!(
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD'
        )
      end

      context 'default usage (osfamily = FreeBSD)' do
        let(:title) { 'rsyslog-install-basic' }

        it 'compiles' do
          should contain_package('sysutils/rsyslog8')
        end
      end
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-service-basic' }

        it 'compiles' do
          should contain_service('rsyslog')
        end
      end
    end

    context 'osfamily = Debian' do
      let :facts do
        default_facts.merge!(
          osfamily: 'Debian',
          operatingsystem: 'Debian'
        )
      end

      context 'default usage (osfamily = Debian)' do
        let(:title) { 'rsyslog-service-basic' }

        it 'compiles' do
          should contain_service('rsyslog')
        end
      end
    end

    context 'osfamily = FreeBSD' do
      let :facts do
        default_facts.merge!(
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD'
        )
      end

      context 'default usage (osfamily = FreeBSD)' do
        let(:title) { 'rsyslog-service-basic' }

        it 'compiles' do
          should contain_service('rsyslogd')
        end
      end
    end
  end

  context 'Rsyslog version =< 8' do
    let(:default_facts) do
      {
        rsyslog_version: '7.1.2'
      }
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_class('rsyslog::install')
          should contain_class('rsyslog::config')
          should contain_class('rsyslog::service')
        end
      end
    end

    context 'osfamily = Debian' do
      let :facts do
        default_facts.merge!(
          osfamily: 'Debian',
          operatingsystem: 'Debian'
        )
      end

      context 'default usage (osfamily = Debian)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_class('rsyslog::install')
          should contain_class('rsyslog::config')
          should contain_class('rsyslog::service')
        end
      end
    end

    context 'osfamily = FreeBSD' do
      let :facts do
        default_facts.merge!(
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD'
        )
      end

      context 'default usage (osfamily = FreeBSD)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_class('rsyslog::install')
          should contain_class('rsyslog::config')
          should contain_class('rsyslog::service')
        end
      end
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_file('/etc/rsyslog.conf')
          should contain_file('/etc/rsyslog.d/')
        end
      end
    end

    context 'osfamily = Debian' do
      let :facts do
        default_facts.merge!(
          osfamily: 'Debian',
          operatingsystem: 'Debian'
        )
      end

      context 'default usage (osfamily = Debian)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_file('/etc/rsyslog.conf')
          should contain_file('/etc/rsyslog.d/')
        end
      end
    end

    context 'osfamily = FreeBSD' do
      let :facts do
        default_facts.merge!(
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD'
        )
      end

      context 'default usage (osfamily = FreeBSD)' do
        let(:title) { 'rsyslog-basic' }

        it 'compiles' do
          should contain_file('/usr/local/etc/rsyslog.conf')
          should contain_file('/usr/local/etc/rsyslog.d/')
        end
      end
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-install-basic' }

        it 'compiles' do
          should contain_package('rsyslog')
          should contain_package('rsyslog-relp')
        end
      end
    end

    context 'osfamily = Debian' do
      let :facts do
        default_facts.merge!(
          osfamily: 'Debian',
          operatingsystem: 'Debian'
        )
      end

      context 'default usage (osfamily = Debian)' do
        let(:title) { 'rsyslog-install-basic' }

        it 'compiles' do
          should contain_package('rsyslog')
          should contain_package('rsyslog-relp')
        end
      end
    end

    context 'osfamily = FreeBSD' do
      let :facts do
        default_facts.merge!(
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD'
        )
      end

      context 'default usage (osfamily = FreeBSD)' do
        let(:title) { 'rsyslog-install-basic' }

        it 'compiles' do
          should contain_package('sysutils/rsyslog8')
        end
      end
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        let(:title) { 'rsyslog-service-basic' }

        it 'compiles' do
          should contain_service('rsyslog')
        end
      end
    end

    context 'osfamily = Debian' do
      let :facts do
        default_facts.merge!(
          osfamily: 'Debian',
          operatingsystem: 'Debian'
        )
      end

      context 'default usage (osfamily = Debian)' do
        let(:title) { 'rsyslog-service-basic' }

        it 'compiles' do
          should contain_service('rsyslog')
        end
      end
    end

    context 'osfamily = FreeBSD' do
      let :facts do
        default_facts.merge!(
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD'
        )
      end

      context 'default usage (osfamily = FreeBSD)' do
        let(:title) { 'rsyslog-service-basic' }

        it 'compiles' do
          should contain_service('rsyslogd')
        end
      end
    end
  end

  context 'Rsyslog version >= 8' do
    let(:default_facts) do
      {
        rsyslog_version: nil
      }
    end

    context 'osfamily = RedHat' do
      let :facts do
        default_facts.merge!(
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemmajrelease: '6'
        )
      end

      context 'default usage (osfamily = RedHat)' do
        it 'compiles' do
          should contain_file('/etc/rsyslog.conf')
          should contain_file('/etc/rsyslog.d/')
        end
      end
    end
  end
end
