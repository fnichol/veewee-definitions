[%w{common config}, %w{common debian-6.0.0 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Debian600.config).merge(
    :os_type_id => 'Debian',
    :iso_file => "debian-6.0.0-i386-netinst.iso",
    :iso_src => "http://ftp.acc.umu.se/debian-cd/current/i386/iso-cd/debian-6.0.0-i386-netinst.iso",
    :iso_md5 => "2840eea06e9cdd2e125f32cefa25fa1d"
  )
)
