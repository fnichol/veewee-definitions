[%w{common config}, %w{common ubuntu-10.04 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Ubuntu1004.config).merge(
    :os_type_id           => 'Ubuntu_64',
    :iso_file             => "ubuntu-10.04-server-amd64.iso", 
    :iso_src              => "http://archive.ubuntu.com/ubuntu/dists/lucid/main/installer-amd64/current/images/netboot/mini.iso",
    :iso_md5              => "d260ca4ad6d0c81bf5cf38a63fa63b5b"
  )
)
