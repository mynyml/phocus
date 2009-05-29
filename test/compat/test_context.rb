require 'test/test_helper'
require 'lib/phocus/context'

# should focus a method
class TestContextA < Test::Unit::TestCase
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
class TestContextB < Test::Unit::TestCase
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
class TestContextC < Test::Unit::TestCase
  test "xyz" do
  end
end
