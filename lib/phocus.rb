# Phocus let's you single out selected methods out of a defined group of methods.
#
# It is intended to be used to focus one or more tests in a test suite,
# although it is generic enough that it could conceivably be used in other
# circumstances as well.
#
# Use the <tt>focus</tt> statement right before defining your test method.
#
# ===== Examples
#   require 'test/unit'
#   require 'phocus'
#
#   Phocus.method_pattern = /^test_/
#
#   class TestUser < Test::Unit::TestCase
#     include Phocus
#
#     focus
#     def test_foo
#       assert true
#     end
#
#     def test_bar
#       flunk "not focused"
#     end
#   end
#
# When executed, only test_foo will be run. Can also be used on more than one
# methods.
#
# Phocus also let's you focus methods across classes, which is almost always
# the desired behaviour. Simply include the mixin in the parent class. In the
# case of test/unit and test/unit based testing frameworks, this means:
#
#   class Test::Unit::TestCase
#     include Phocus
#   end
#
# Now focusing will work across *all* your tests. Not much benifit if you run
# your test files individually, but indispensable when using <tt>rake test</tt>
# or autotest.
#
module Phocus
  class << self
    attr_accessor :method_pattern

    # Specify a pattern that identifies the names of the group of methods
    # focusing will apply to.
    #
    # For example, when using test/unit, you want the relevant group of methods
    # to be your test methods, which are the ones starting with <tt>test_</tt>.
    #
    #   Phocus.method_pattern = /^test_/
    #
    # (which happens to be the default pattern)
    #
    # On the other hand, context (http://github.com/jeremymcanally/context),
    # has test methods starting with <tt>test:</tt>, so you can specify:
    #
    #   Phocus.method_pattern = /^test:/
    #
    # In reality, it's not so much that Phocus focuses on certain methods, but
    # rather it ignores others. Since we don't want to ignore helper methods
    # (setup, teardown, custom helpers, etc.), we must restrict the scope of
    # ignored methods, which is what <tt>method_pattern</tt> allows us to do.
    def method_pattern
      @method_pattern || /^test_/
    end
  end

  def self.included(base) #:nodoc:
    base.extend ClassMethods
  end

  module ClassMethods
    @@__test_methods = {}
    @@__focused      = false
    @@__focus_next   = false

    # Use right before defining a method to focus it.
    def focus
      unless @@__focused
        clear_test_methods!
        @@__focused = true
      end
      @@__focus_next = true
    end
    # :stopdoc:
    alias :focused :focus
    alias :phocus  :focus
    # :startdoc:

    # If the method belongs to target group (method_pattern), then remove it
    # unless it is focused.
    #
    # we don't want any methods removed if focus is never used, so until it is,
    # keep a reference to methods being defined so that we can come back and
    # remove them later.
    #
    def method_added(name) #:nodoc:
      super
      if name.to_s.match(Phocus.method_pattern)
        if @@__focused
          @@__focus_next ? @@__focus_next = false : remove_method(name)
        else
          @@__test_methods[self] ||= []
          @@__test_methods[self] << name
        end
      end
    end

    private
      def clear_test_methods!
        @@__test_methods.each do |klass, method_names|
          method_names.each {|name| klass.class_eval { remove_method(name) } }
        end
      end
  end
end
