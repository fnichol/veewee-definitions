[%w{common config}, %w{common ubuntu-11.04 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Ubuntu1104.config).merge(
    :os_type_id           => 'Ubuntu_64',
    :iso_file             => "ubuntu-11.04-server-amd64-netboot.iso", 
    :iso_src              => "http://archive.ubuntu.com/ubuntu/dists/natty/main/installer-amd64/current/images/netboot/mini.iso",
    :iso_md5              => "13507ac70863edd2df11cdd6260011ba"
  )
)
