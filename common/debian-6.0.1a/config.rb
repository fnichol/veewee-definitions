module VeeWee
  module Common
    module Debian600
      def self.config
        {
          :boot_cmd_sequence => [
             '<Esc>',
             'install ',
             'preseed/url=http://%IP%:%PORT%/preseed.cfg ',
             'debian-installer=en_US ',
             'auto ',
             'locale=en_US ',
             'kbd-chooser/method=us ',
             'netcfg/get_hostname=%NAME% ',
             'netcfg/get_domain=vagrantup.com ',
             'fb=false ',
             'debconf/frontend=noninteractive ',
             'console-setup/ask_detect=false ',
             'console-keymaps-at/keymap=us ',
             '<Enter>'
          ],
          :kickstart_file => "preseed.cfg",
          :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
          :shutdown_cmd => "halt -p",
          :postinstall_files => [ "postinstall.sh" ]
        }
      end
    end
  end
end
