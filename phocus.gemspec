--- !ruby/object:Gem::Specification 
name: phocus
version: !ruby/object:Gem::Version 
  version: "1.0"
platform: ruby
authors: 
- Martin Aumont
autorequire: 
bindir: bin
cert_chain: []

date: 2009-10-05 00:00:00 -04:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: minitest
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: thoughtbot-shoulda
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: citrusbyte-contest
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: jeremymcanally-context
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: expectations
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
description: Tell test/unit exactly which tests you want run. It will ignore all the other ones and let you concentrate on a few.
email: mynyml@gmail.com
executables: []

extensions: []

extra_rdoc_files: []

files: 
- .gitignore
- LICENSE
- Manifest
- README
- Rakefile
- TODO
- VERSION
- lib/phocus.rb
- lib/phocus/autodetect.rb
- phocus.gemspec
- specs.watchr
- test/README
- test/compat/test_contest.rb
- test/compat/test_context.rb
- test/compat/test_minitest.rb
- test/compat/test_shoulda.rb
- test/compat/test_test_unit.rb
- test/test_helper.rb
- test/test_phocus.rb
has_rdoc: true
homepage: http://github.com/mynyml/watchr
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

rubyforge_project: phocus
rubygems_version: 1.3.5
signing_key: 
specification_version: 3
summary: Run focused tests on test/unit.
test_files: []

