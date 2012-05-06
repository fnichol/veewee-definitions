[%w{common config}, %w{common ubuntu-12.04 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Ubuntu1204.config).merge(
    :os_type_id           => 'Ubuntu',
    :iso_file             => "ubuntu-12.04-server-i386-netboot.iso",
    :iso_src              => "http://archive.ubuntu.com/ubuntu/dists/precise/main/installer-i386/current/images/netboot/mini.iso",
    :iso_md5              => "e4d16caf537be112f3dc9ba94e158cf7"
  )
)
