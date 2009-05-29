require 'pathname'
require 'test/unit'

root  = Pathname(__FILE__).dirname.parent.parent.expand_path
require root + 'lib/phocus'

class Test::Unit::TestCase
  include ::Phocus

  # TODO prevent test count from going up
  # TODO only override when @@__focused
  def default_test
  end
end

Phocus.method_pattern = /^test_/
