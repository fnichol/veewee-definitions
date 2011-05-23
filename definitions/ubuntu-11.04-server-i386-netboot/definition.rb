[%w{common config}, %w{common ubuntu-11.04 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Ubuntu1104.config).merge(
    :os_type_id           => 'Ubuntu',
    :iso_file             => "ubuntu-11.04-server-i386-netboot.iso", 
    :iso_src              => "http://archive.ubuntu.com/ubuntu/dists/natty/main/installer-i386/current/images/netboot/mini.iso",
    :iso_md5              => "cc1591035877c317fdef7f4ebf1662b9"
  )
)
