[%w{common config}, %w{common debian-6.0.1a config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Debian600.config).merge(
    :os_type_id => 'Debian_64',
    :iso_file => "debian-6.0.1a-amd64-netinst.iso",
    :iso_src => "http://mirrors.usc.edu/pub/linux/distributions/debian-cd/current/amd64/iso-cd/debian-6.0.1a-amd64-netinst.iso",
    :iso_md5 => "eb25e5098ed0e60381f78b4efdde8737"
  )
)
