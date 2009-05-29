require 'pathname'
require 'context'

root  = Pathname(__FILE__).dirname.parent.parent.expand_path
require root + 'lib/phocus'

module Test #:nodoc: all
  class Unit::TestCase
    include ::Phocus
  end
end

Phocus.method_pattern = /test:/
