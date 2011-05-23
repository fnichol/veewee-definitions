module VeeWee
  module Common
    module Ubuntu1104
      def self.config
        {
          :kickstart_port       => "7126",
          :ssh_host_port        => "7226",
          :boot_cmd_sequence    => [ 
            '<Esc>',
            'install noapic preseed/url=http://%IP%:%PORT%/preseed.cfg ',
            'debian-installer=en_US auto locale=en_US kbd-chooser/method=us ',
            'hostname=%NAME% ',
            'fb=false debconf/frontend=noninteractive ',
            'keyboard-configuration/layout=USA keyboard-configuration/variant=USA console-setup/ask_detect=false ',
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
