module VeeWee
  module Common
    def self.config
      {
        :cpu_count            => '1',
        :memory_size          => '256',
        :disk_size            => '10140',
        :disk_format          => 'VDI',
        :hostiocache          => 'off',
        :iso_download_timeout => "1000",
        :boot_wait            => "10",
        :kickstart_port       => "7122",
        :kickstart_timeout    => "10000",
        :ssh_login_timeout    => "10000",
        :ssh_user             => "vagrant",
        :ssh_password         => "vagrant",
        :ssh_key              => "",
        :ssh_host_port        => "7222",
        :ssh_guest_port       => "22",
        :postinstall_timeout  => "10000"
      }
    end
  end
end
