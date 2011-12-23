[%w{common config}, %w{common debian-6.0.0 config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Debian600.config).merge(
    :os_type_id => 'Debian',
    :iso_file => "debian-6.0.3-i386-netinst.iso",
    :iso_src => "http://cdimage.debian.org/debian-cd/6.0.3/i386/iso-cd/debian-6.0.3-i386-netinst.iso",
    :iso_md5 => "bf10748a0b867912727b248d2e21e8ba"
  )
)
