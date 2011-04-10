[%w{common config}, %w{common debian-6.0.0 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Debian600.config).merge(
    :os_type_id => 'Debian_64',
    :iso_file => "debian-6.0.0-amd64-netinst.iso",
    :iso_src => "http://ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-6.0.0-amd64-netinst.iso",
    :iso_md5 => "98111f815d3bea761d303a14d8df8887"
  )
)
