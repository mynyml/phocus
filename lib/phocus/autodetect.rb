# :stopdoc:
# Script to auto detect the test framework in use, and set it up with Phocus.

# Somewhat hackish, but simple/straightforward. If there ever is a need for
# extendability I'll gladly refactor.

# --------------------------------------------------
# test/unit, contest
# --------------------------------------------------
if defined?(Test::Unit::TestCase)

  Test::Unit::TestCase.class_eval { include ::Phocus }
  Test::Unit::TestSuite.class_eval { def empty?() false end } if defined?(Test::Unit::TestSuite)
  Phocus.method_pattern = /^test_/
end

# --------------------------------------------------
# minitest
# --------------------------------------------------
if defined?(MiniTest::Unit::TestCase)

  MiniTest::Unit::TestCase.class_eval { include ::Phocus }
  Phocus.method_pattern = /^test_/
end

# --------------------------------------------------
# context
# --------------------------------------------------
if defined?(Test::Unit::TestCase) &&
            Test::Unit::TestCase.class_eval { class << self; self; end }.included_modules.map {|m| m.to_s }.include?('Context::Context')
  Phocus.method_pattern = /test:/
end

# --------------------------------------------------
# shoulda (test/unit)
# --------------------------------------------------
if defined?(Shoulda)
  Phocus.method_pattern = /^test:/
end

