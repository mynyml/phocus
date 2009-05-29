require 'pathname'
require 'minitest/unit'

root  = Pathname(__FILE__).dirname.parent.parent.expand_path
require root + 'lib/phocus'

module MiniTest #:nodoc: all
  class Unit::TestCase
    include ::Phocus
  end
end

Phocus.method_pattern = /^test_/

MiniTest::Unit.autorun
