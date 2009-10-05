require 'rake/gempackagetask'
require 'rake/rdoctask'

# --------------------------------------------------
# Gem
# --------------------------------------------------
spec = Gem::Specification.new do |s|
  s.name                = "phocus"
  s.summary             = "Run focused tests on test/unit."
  s.description         = "Tell test/unit exactly which tests you want run. It will ignore all the other ones and let you concentrate on a few."
  s.author              = "Martin Aumont"
  s.email               = "mynyml@gmail.com"
  s.homepage            = "http://github.com/mynyml/watchr"
  s.rubyforge_project   = "phocus"
  s.has_rdoc            =  true
  s.require_path        = "lib"
  s.version             =  File.read("VERSION" ).strip
  s.files               =  File.read("Manifest").strip.split("\n")
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
end

# --------------------------------------------------
# Tests
# --------------------------------------------------
namespace(:test) do

  desc "run framework compatibility tests"
  task(:all) do
    paths = %w(
      test/compat/test_contest.rb
      test/compat/test_context.rb
      test/compat/test_minitest.rb
      test/compat/test_shoulda.rb
      test/compat/test_test_unit.rb
      test/test_phocus.rb
    )
    paths.each do |path|
      cmd = "ruby #{path}"
      puts(cmd) if ENV['VERBOSE']
      system(cmd)
    end
  end

  desc "Run all tests on multiple ruby versions (requires rvm with 1.8.6 and 1.8.7)"
  task(:portability) do
    versions = %w( 1.8.6  1.8.7 )
    versions.each do |version|
      system <<-BASH
        bash -c 'source ~/.rvm/scripts/rvm;
                 rvm use #{version};
                 echo "--------- `ruby -v` ----------\n";
                 rake -s test:all'
      BASH
    end
  end
end

# --------------------------------------------------
# Docs
# --------------------------------------------------
desc "Generate rdoc documentation."
Rake::RDocTask.new("rdoc") { |rdoc|
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.title    = "Phocus"
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.options << '--charset' << 'utf-8'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
}

