require 'test/test_helper'
require 'lib/phocus/contest'

class Test::Unit::TestCase
  def setup
    reset_phocused_classes(TestContestA, TestContestB, TestContestC)
    reset_phocus
  end
end

# should focus a method
class TestContestA < Test::Unit::TestCase
  test "foo" do
    flunk "not focused"
  end

  focus
  test "bar" do
    assert true
  end

  test "baz" do
    flunk "not focused"
  end
end

# should focus methods across test classes
class TestContestB < Test::Unit::TestCase
  test "abc" do
    flunk "not focused"
  end

  focus
  test "def" do
    assert true
  end

  focus
  test "ghi" do
    assert true
  end
end

# should not complain when no methods are left after focusing
class TestContestC < Test::Unit::TestCase
  test "xyz" do
  end
end
