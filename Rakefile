require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rake/contrib/rubyforgepublisher'

PKG_VERSION = "2.1.3"
PKG_NAME = "paypal"
PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"

PKG_FILES = FileList[
    "lib/**/*",
    "test/*",
    "misc/*",
    "[A-Z]*",
    "MIT-LICENSE",
    "Rakefile"
].exclude(/\bCVS\b|~$/)

desc "Default Task"
task :default => [ :test, :test_remote ]

desc "Delete tar.gz / zip / rdoc"
task :cleanup => [ :rm_packages, :clobber_rdoc ]

# Run the unit tests
Rake::TestTask.new :test do |t|
  t.libs << "test"
  t.pattern = 'test/*_test.rb'
  t.ruby_opts << '-rubygems'
  t.verbose = false
end

Rake::TestTask.new :test_remote do |t|
  t.libs << "test"
  t.pattern = 'test/remote/*_test.rb'
  t.ruby_opts << '-rubygems'
  t.verbose = false
end

desc "Create a rubygem and install it. Might need root rights"
task :install => [:package] do
  `gem install pkg/#{PKG_FILE_NAME}.gem`
end

# Genereate the RDoc documentation

Rake::RDocTask.new { |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = "Paypal library"
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
}

task :lines do
  lines = 0
  codelines = 0
  Dir.foreach("lib") { |file_name| 
    next unless file_name =~ /.*rb/

    f = File.open("lib/" + file_name)

    while line = f.gets
      lines += 1
      next if line =~ /^\s*$/
      next if line =~ /^\s*#/
      codelines += 1
    end
  }
  puts "Lines #{lines}, LOC #{codelines}"
end

