#
# For reference, please see:
# * https://help.ubuntu.com/11.04/installation-guide/i386/boot-parms.html
# * https://help.ubuntu.com/11.04/installation-guide/i386/preseed-contents.html
# * https://help.ubuntu.com/11.04/installation-guide/i386/ch05s01.html
# * https://help.ubuntu.com/8.04/installation-guide/i386/preseed-using.html
module VeeWee
  module Common
    module Ubuntu1104
      def self.config
        {
          :kickstart_port       => "7126",
          :ssh_host_port        => "7226",
          :boot_cmd_sequence    => [
            '<Esc>',
            'install ',
            'noapic ',
            'auto-install/enable ',
            'console-setup/ask_detect=false ',
            'console-setup/layoutcode=us ',
            'console-setup/modelcode=pc105 ',
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
          :shutdown_cmd         => "shutdown -P now",
          :postinstall_files    => [ "postinstall.sh"]
        }
      end
    end
  end
end
