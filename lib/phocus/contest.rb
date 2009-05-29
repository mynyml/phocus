require 'pathname'
require 'contest'

root  = Pathname(__FILE__).dirname.parent.parent.expand_path
require root + 'lib/phocus'

class Test::Unit::TestCase
  include ::Phocus
end

Phocus.method_pattern = /^test_/
