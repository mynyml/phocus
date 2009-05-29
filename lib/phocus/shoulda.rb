require 'pathname'
require 'test/unit'
require 'shoulda'

root  = Pathname(__FILE__).dirname.parent.parent.expand_path
require root + 'lib/phocus'

module Test #:nodoc: all
  class Unit::TestCase
    include ::Phocus
  end
end

module Test #:nodoc: all
  class Unit::TestSuite
    # TODO only override when @@__focused
    def empty?
      false
    end
  end
end

Phocus.method_pattern = /^test:/
