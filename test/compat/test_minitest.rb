require 'test/test_helper'
require 'lib/phocus/minitest'

class MiniTest::Unit::TestCase
  def setup
    reset_phocused_classes(TestMiniTestA, TestMiniTestB, TestMiniTestC)
    reset_phocus
  end
end

# should focus a method
class TestMiniTestA < MiniTest::Unit::TestCase
  def test_foo
    flunk "not focused"
  end

  focus
  def test_bar
    assert true
  end

  def test_baz
    flunk "not focused"
  end
end

# should focus methods across test classes
class TestMiniTestB < MiniTest::Unit::TestCase
  def test_abc
    flunk "not focused"
  end

  focus
  def test_def
    assert true
  end

  focus
  def test_ghi
    assert true
  end
end

# should not complain when no methods are left after focusing
class TestMiniTestC < MiniTest::Unit::TestCase
  def test_xyz
    flunk "not focused"
  end
end
