#
# For reference, please see:
# * http://www.debian.org/releases/stable/i386/ch05s03.html.en
# * http://www.debian.org/releases/stable/i386/apbs04.html.en
# * http://www.debian.org/releases/stable/i386/apbs02.html.en
module VeeWee
  module Common
    module Debian600
      def self.config
        {
          :kickstart_port       => "7125",
          :ssh_host_port        => "7225",
          :boot_cmd_sequence    => [
            '<Esc>',
            'install ',
            'auto-install/enable ',
            'console-tools/archs=at ',
            'console-keymaps-at/keymap=us ',
            'debconf/frontend=noninteractive ',
            'debconf/priority=critical ',
            'debian-installer/locale=en_US ',
            'debian-installer/framebuffer=false ',
            'kbd-chooser/method=us ',
            'netcfg/choose_interface=auto ',
            'netcfg/dhcp_timeout=60 ',
            'netcfg/get_hostname=%NAME% ',
            'preseed/interactive=false ',
            'preseed/url=http://%IP%:%PORT%/preseed.cfg ',
            'vga=normal ',
            'DEBCONF_DEBUG=5 ',
            ' -- <Enter>'
          ],
          :kickstart_file       => "preseed.cfg",
          :sudo_cmd             => "echo '%p'|sudo -S sh '%f'",
          :shutdown_cmd         => "halt -p",
          :postinstall_files    => [ "postinstall.sh" ]
        }
      end
    end
  end
end
