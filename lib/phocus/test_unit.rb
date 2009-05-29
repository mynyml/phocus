require 'pathname'
require 'test/unit'

root  = Pathname(__FILE__).dirname.parent.parent.expand_path
require root + 'lib/phocus'

class Test::Unit::TestCase
  include ::Phocus
end

class Test::Unit::TestSuite
  # TODO only override when @@__focused
  def empty?
    false
  end
end

Phocus.method_pattern = /^test_/
