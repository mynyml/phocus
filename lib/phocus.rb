module Phocus
  class << self
    attr_accessor :method_pattern
  end

  def self.included(base)
    self.method_pattern = /^test_/
    base.extend ClassMethods
  end

  module ClassMethods
    @@__test_methods = {}
    @@__focused      = false
    @@__focus_next   = false

    def focused
      unless @@__focused
        clear_test_methods!
        @@__focused = true
      end
      @@__focus_next = true
    end
    alias :focus  :focused
    alias :phocus :focused

    def method_added(name)
      super
      #if name.to_s.match(/^test/)
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
