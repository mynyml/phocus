begin
  require 'ruby-debug'
rescue LoadError, RuntimeError
end

def reset_phocused_classes(*classes)
  Array(classes).flatten.each do |klass|
    klass.class_eval do
      instance_methods(false).each {|name| remove_method(name) }
    end
  end
end

def reset_phocus
  Phocus.method_pattern = nil
  Phocus::ClassMethods.send(:class_variable_set, :@@__focused,    false)
  Phocus::ClassMethods.send(:class_variable_set, :@@__focus_next, false)
  Phocus::ClassMethods.send(:class_variable_set, :@@__test_methods, {} )
end
