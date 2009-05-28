require 'test/test_helper'
require 'expectations'
require 'lib/phocus'

class TestCase
  include Phocus
end
class TestA < TestCase; end
class TestB < TestCase; end

def reset
  reset_phocused_classes(TestA, TestB)
end

Expectations do

  ## api

  expect true do
    reset
    TestA.respond_to?(:focus)   &&
    TestA.respond_to?(:focused) &&
    TestA.respond_to?(:phocus)
  end

  ## focused tests

  # only keeps focused method
  expect %w( test_foo ) do
    reset
    class TestA
      focus
      def test_foo() end
      def test_bar() end
    end

    TestA.instance_methods(false)
  end

  # keeps more than one focused methods
  expect %w( test_foo test_bar ).to_set do
    reset
    class TestA
      focus
      def test_foo() end
      focus
      def test_bar() end
      def test_baz() end
    end

    TestA.instance_methods(false).to_set
  end

  # focuses across subclasses
  expect %w( test_foo ).to_set do
    reset
    class TestA
      focus
      def test_foo() end
      def test_bar() end
    end
    class TestB
      def test_abc() end
    end

    TestA.instance_methods(false).to_set +
    TestB.instance_methods(false).to_set
  end

  # focuses more than one methods across subclasses
  expect %w( test_foo test_def ).to_set do
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

    TestA.instance_methods(false).to_set +
    TestB.instance_methods(false).to_set
  end

  # non-test methods aren't touched
  expect %w( test_foo helper ).to_set do
    reset
    class TestA
      focus
      def test_foo() end
      def test_bar() end
      def helper()   end
    end

    TestA.instance_methods(false).to_set
  end

  # test methods don't get removed if nothing is focused (control test)
  expect %w( test_foo test_bar ).to_set do
    reset
    class TestA
      def test_foo() end
      def test_bar() end
    end

    TestA.instance_methods(false).to_set
  end
end
