[%w{common config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(
    :os_type_id           => 'Ubuntu_64',
    :iso_file             => 'tinycorelinux-core-4.7.iso',
    :iso_src              => 'http://distro.ibiblio.org/tinycorelinux/4.x/x86/release/Core-4.7.iso',
    :iso_md5              => '5bda1bb9213d953fa7d3c9495477b206',

    :ssh_user             => 'tc',
    :ssh_password         => 'tc',
    :ssh_port             => '7231',

    :boot_wait            => '5',
    :boot_cmd_sequence    => [
      '<Enter>',
      '<Wait>',
      '<Wait>',
      'sudo passwd tc<Enter><Wait>',
      'tc<Enter>tc<Enter>',
      'tce-load -iw openssh.tcz && ',
      'sudo cp /usr/local/etc/ssh/sshd_config.example /usr/local/etc/ssh/sshd_config && ',
      'sudo /usr/local/etc/init.d/openssh start<Enter>'
    ],
    :sudo_cmd             => "sudo %f",
    :shutdown_cmd         => 'poweroff'
  )
)
