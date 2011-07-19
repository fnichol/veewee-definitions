[%w{common config}, %w{common debian-6.0.0 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Debian600.config).merge(
    :os_type_id => 'Debian_64',
    :iso_file => "debian-6.0.2.1-amd64-netinst.iso",
    :iso_src => "http://cdimage.debian.org/debian-cd/6.0.2.1/amd64/iso-cd/debian-6.0.2.1-amd64-netinst.iso",
    :iso_md5 => "25f23779f2f967b4b9497cc0fc80a42d"
  )
)
