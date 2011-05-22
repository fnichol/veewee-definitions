[%w{common config}, %w{common ubuntu-10.10 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Ubuntu1010.config).merge(
    :os_type_id           => 'Ubuntu',
    :iso_file             => "ubuntu-10.10-server-i386-netboot.iso", 
    :iso_src              => "http://archive.ubuntu.com/ubuntu/dists/maverick/main/installer-i386/current/images/netboot/mini.iso",
    :iso_md5              => "02abb1a71bde21a1335e9368dad529ca"
  )
)
