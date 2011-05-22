[%w{common config}, %w{common debian-6.0.1a config}].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), "..", "..", file))
end

Veewee::Session.declare(
  VeeWee::Common.config.merge(VeeWee::Common::Debian600.config).merge(
    :os_type_id => 'Debian',
    :iso_file => "debian-6.0.1a-i386-netinst.iso",
    :iso_src => "http://mirrors.usc.edu/pub/linux/distributions/debian-cd/current/i386/iso-cd/debian-6.0.1a-i386-netinst.iso",
    :iso_md5 => "57bd4f765d0f5909cc84f1a7c1eaf976"
  )
)
