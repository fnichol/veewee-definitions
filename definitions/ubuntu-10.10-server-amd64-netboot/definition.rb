[%w{common config}, %w{common ubuntu-10.10 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Ubuntu1010.config).merge(
    :os_type_id           => 'Ubuntu_64',
    :iso_file             => "ubuntu-10.10-server-amd64-netboot.iso", 
    :iso_src              => "http://archive.ubuntu.com/ubuntu/dists/maverick/main/installer-amd64/current/images/netboot/mini.iso",
    :iso_md5              => "3d9f096398991ed1eaa9ff32128e199a"
  )
)
