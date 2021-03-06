require File.expand_path('../helper', __FILE__)

class AndPredicateTest < Test::Unit::TestCase
  def test_terminal?
    rule = AndPredicate.new
    assert_equal(false, rule.terminal?)
  end

  def test_exec
    rule = AndPredicate.new('abc')
    events = rule.exec(Input.new('abc'))
    assert_equal([rule, CLOSE, 0], events)
  end

  def test_exec_miss
    rule = AndPredicate.new('def')
    events = rule.exec(Input.new('abc'))
    assert_equal([], events)
  end

  def test_consumption
    rule = AndPredicate.new('abc')
    input = Input.new('abc')
    events = rule.exec(input)
    assert_equal(0, input.pos)
  end

  def test_to_s
    rule = AndPredicate.new('a')
    assert_equal('&"a"', rule.to_s)
  end
end
