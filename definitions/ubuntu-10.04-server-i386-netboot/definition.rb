[%w{common config}, %w{common ubuntu-10.04 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Ubuntu1004.config).merge(
    :os_type_id           => 'Ubuntu',
    :iso_file             => "ubuntu-10.04-server-i386.iso", 
    :iso_src              => "http://archive.ubuntu.com/ubuntu/dists/lucid/main/installer-i386/current/images/netboot/mini.iso",
    :iso_md5              => "7b383bcf55f09b1bb7e6614ed6e67a0e"
  )
)
