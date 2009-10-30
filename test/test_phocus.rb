require 'test/test_helper'
require 'nanotest'
require 'lib/phocus'

class TestCase
  include Phocus
end
class TestA < TestCase; end
class TestB < TestCase; end

def reset
  reset_phocused_classes(TestA, TestB)
  reset_phocus
end

include NanoTest

# api
reset
assert { TestA.respond_to?(:focus  ) }
assert { TestA.respond_to?(:focused) }
assert { TestA.respond_to?(:phocus ) }

# method pattern
reset
Phocus.method_pattern = /^test:/
class TestA
  define_method(:'test:foo') {}
  focus
  define_method(:'test:bar') {}
  define_method(:'test_baz') {}
end

assert {     TestA.method_defined?(:'test_baz') }
assert {     TestA.method_defined?(:'test:bar') }
assert { not TestA.method_defined?(:'test:foo') }


# only keeps focused method
reset
class TestA
  focus
  def test_foo() end
  def test_bar() end
end

assert {     TestA.method_defined?(:test_foo) }
assert { not TestA.method_defined?(:test_bar) }


# keeps more than one focused methods
reset
class TestA
  focus
  def test_foo() end
  focus
  def test_bar() end
  def test_baz() end
end

assert {     TestA.method_defined?(:test_foo) }
assert {     TestA.method_defined?(:test_bar) }
assert { not TestA.method_defined?(:test_baz) }


# focuses across subclasses
reset
class TestA
  focus
  def test_foo() end
  def test_bar() end
end
class TestB
  def test_abc() end
end

assert {     TestA.method_defined?(:test_foo) }
assert { not TestA.method_defined?(:test_bar) }
assert { not TestB.method_defined?(:test_abc) }


# focuses more than one methods across subclasses
reset
class TestA
  focus
  def test_foo() end
  def test_bar() end
end
class TestB
  def test_abc() end
  focus
  def test_def() end
end

assert {     TestA.method_defined?(:test_foo) }
assert {     TestB.method_defined?(:test_def) }
assert { not TestA.method_defined?(:test_bar) }
assert { not TestB.method_defined?(:test_abc) }


# non-test methods aren't touched
reset
class TestA
  focus
  def test_foo() end
  def test_bar() end
  def helper()   end
end

assert {     TestA.method_defined?(:helper) }
assert {     TestA.method_defined?(:test_foo) }
assert { not TestA.method_defined?(:test_bar) }


# methods don't get removed if nothing is focused (control test)
reset
class TestA
  def test_foo() end
  def test_bar() end
end

assert { TestA.method_defined?(:test_foo) }
assert { TestA.method_defined?(:test_bar) }

