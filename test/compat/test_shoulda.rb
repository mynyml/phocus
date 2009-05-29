require 'test/test_helper'
require 'lib/phocus/shoulda' # testing shoulda/test_unit

class Test::Unit::TestCase
  def setup
    reset_phocused_classes(TestShouldaA, TestShouldaB, TestShouldaC)
    reset_phocus
  end
end

# should focus a method
class TestShouldaA < Test::Unit::TestCase
  should "foo" do
    flunk "not focused"
  end

  focus
  should "bar" do
    assert true
  end

  should "baz" do
    flunk "not focused"
  end
end

# should focus methods across test classes
class TestShouldaB < Test::Unit::TestCase
  should "abc" do
    flunk "not focused"
  end

  focus
  should "def" do
    assert true
  end

  focus
  should "ghi" do
    assert true
  end
end

# should not complain when no methods are left after focusing
class TestShouldaC < Test::Unit::TestCase
  should "xyz" do
    flunk "not focused"
  end
end
