module VeeWee
  module Common
    module Ubuntu1010
      def self.config
        {
          :kickstart_port       => "7123",
          :ssh_host_port        => "7223",
          :boot_cmd_sequence    => [ 
            '<Tab>',
            'noapic preseed/url=http://%IP%:%PORT%/preseed.cfg ',
            'debian-installer=en_US auto locale=en_US kbd-chooser/method=us ',
            'hostname=%NAME% ',
            'fb=false debconf/frontend=noninteractive ',
            'console-setup/ask_detect=false console-setup/modelcode=pc105 console-setup/layoutcode=us ',
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
