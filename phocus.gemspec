--- !ruby/object:Gem::Specification 
name: phocus
version: !ruby/object:Gem::Version 
  version: 0.9.8
platform: ruby
authors: 
- Martin Aumont
autorequire: 
bindir: bin
cert_chain: []

date: 2009-05-29 00:00:00 -04:00
default_executable: 
dependencies: []

description: Tell test/unit exactly which tests you want run. It will ignore all the other ones and let you concentrate on a few.
email: mynyml@gmail.com
executables: []

extensions: []

extra_rdoc_files: []

files: 
- Rakefile
- test
- test/test_phocus.rb
- test/compat
- test/compat/test_shoulda.rb
- test/compat/test_context.rb
- test/compat/test_contest.rb
- test/compat/test_test_unit.rb
- test/compat/test_minitest.rb
- test/README
- test/test_helper.rb
- TODO
- lib
- lib/phocus
- lib/phocus/context.rb
- lib/phocus/shoulda.rb
- lib/phocus/contest.rb
- lib/phocus/minitest.rb
- lib/phocus/test_unit.rb
- lib/phocus.rb
- phocus.gemspec
- LICENSE
- README
has_rdoc: true
homepage: ""
licenses: []

post_install_message: 
rdoc_options: []

require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
requirements: []

rubyforge_project: 
rubygems_version: 1.3.3
signing_key: 
specification_version: 3
summary: Run focused tests on test/unit.
test_files: []

