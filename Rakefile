ubuntu_defs = {
  :lucid32    => "ubuntu-10.04-server-i386-netboot",
  :lucid64    => "ubuntu-10.04-server-amd64-netboot",
  :maverick32 => "ubuntu-10.10-server-i386-netboot",
  :maverick64 => "ubuntu-10.10-server-amd64-netboot",
  :natty32    => "ubuntu-11.04-server-i386-netboot",
  :natty64    => "ubuntu-11.04-server-amd64-netboot"
}

debian_defs = {
  :squeeze32  => "debian-6.0.2-i386-netboot",
  :squeeze64  => "debian-6.0.2-amd64-netboot"
}

defs = Hash.new
defs.merge!(ubuntu_defs)
defs.merge!(debian_defs)

cmd_pre = "bundle exec vagrant basebox"

namespace :build do

  defs.each do |tag, definition|
    desc "Builds #{definition} Vagrant base box"
    task tag do
      sh %{#{cmd_pre} build #{definition} && #{cmd_pre} export #{definition}}
    end
  end

  desc "Builds all Vagrant base boxes"
  task :all do
    defs.each { |tag, definition| Rake::Task["build:#{tag.to_s}"].invoke }
  end
end

namespace :destroy do
  defs.each do |tag, definition|
    desc "Destroys #{definition} Vagrant base box"
    task tag do
      sh %{#{cmd_pre} destroy #{definition}}
    end
  end
end

namespace :list do
  desc "List all base box definitions"
  task :all do
    puts "The full list of base box definitions are:\n\n"
    defs.each { |tag, definition| puts "  * #{tag}" }
    puts "\nTo build all base box definitions, use `rake build:all'\n\n"
  end

  desc "List all Ubuntu base box definitions"
  task :ubuntu do
    puts "The list of Ubuntu base box definitions are:\n\n"
    ubuntu_defs.each { |tag, definition| puts "  * #{tag}" }
    puts "\nTo list all base box definitions, use `rake list:all'\n\n"
  end

  desc "List all Debian base box definitions"
  task :debian do
    puts "The list of Debian base box definitions are:\n\n"
    debian_defs.each { |tag, definition| puts "  * #{tag}" }
    puts "\nTo list all base box definitions, use `rake list:all'\n\n"
  end
end
