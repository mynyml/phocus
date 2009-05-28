require 'pathname'
require 'set'
require 'rubygems'
begin
  require 'ruby-debug'
rescue LoadError, RuntimeError
end

class Object
  def self.metaclass
    (class << self; self; end)
  end
end

def reset_phocused_classes(*classes)
  Array(classes).flatten.each do |klass|
    klass.metaclass.class_eval do
      class_variable_set(:@@__focused,    false )
      class_variable_set(:@@__focus_next, false )
      class_variable_set(:@@__test_methods,  {} )
    end
    klass.class_eval do
      instance_methods(false).each {|name| remove_method(name) }
    end
  end
end
