ubuntu_defs = {
  :maverick32 => "ubuntu-10.10-server-i386",
  :maverick64 => "ubuntu-10.10-server-amd64"
}

debian_defs = {
  :squeeze32  => "debian-6.0.1a-i386",
  :squeeze64  => "debian-6.0.1a-amd64"
}

defs = Hash.new
defs.merge!(ubuntu_defs)
defs.merge!(debian_defs)

namespace :build do
  cmd_pre = "bundle exec vagrant basebox"

  defs.each do |tag, definition|
    desc "Builds #{definition} Vagrant base box"
    task tag do
      %w{build export}.each do |goal|
        sh %{#{cmd_pre} #{goal} #{definition}}
      end
    end
  end

  desc "Builds all Vagrant base boxes"
  task :all do
    defs.each { |tag, definition| Rake::Task["build:#{tag.to_s}"].invoke }
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
