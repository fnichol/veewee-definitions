[%w{common config}, %w{common ubuntu-12.04 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Ubuntu1204.config).merge(
    :os_type_id           => 'Ubuntu_64',
    :iso_file             => "ubuntu-12.04-server-amd64-netboot.iso",
    :iso_src              => "http://archive.ubuntu.com/ubuntu/dists/precise/main/installer-amd64/current/images/netboot/mini.iso",
    :iso_md5              => "1278936cb0ee9d9a32961dd7743fa75c"
  )
)
