require 'test_helper'

class CalculationTest < ActiveSupport::TestCase

  test 'must accept valid inputs' do
    assert_nothing_raised do
      Calculation.new( '1.0', '2', '+' )
    end
  end

  test 'must raise an exception if input_a is not a number' do
    assert_raises Calculation::InvalidNumberError do
      Calculation.new( 'invalid input', '2', '+' )
    end
  end

  test 'must raise an exception if input_b is not a number' do
    assert_raises Calculation::InvalidNumberError do
      Calculation.new( '1.0', 'invalid input', '+' )
    end
  end

  test '#result must support addition' do
    assert_equal  Calculation.new( '3.4', '2.6', '+' ).result(),
                  3.4 + 2.6
  end

  test '#result must support subtraction' do
    assert_equal  Calculation.new( '3.4', '2.6', '-' ).result(),
                  3.4 - 2.6
  end

  test '#result must support multiplication' do
    assert_equal  Calculation.new( '3.4', '2.6', '*' ).result(),
                  3.4 * 2.6
  end

  test '#result must support division' do
    assert_equal  Calculation.new( '3.4', '2.6', '/' ).result(),
                  3.4 / 2.6
  end

  test '#result must support exponentiation' do
    assert_equal  Calculation.new( '3.4', '2.6', '**' ).result(),
                  3.4 ** 2.6
  end

  test '#result must support sqrt of input_a' do
    assert_equal  Calculation.new( '3.4', '0.0', 'sqrt' ).result(),
                  Math.sqrt( 3.4 )
  end

  test '#result must raise an exception if operation is not supported' do
    assert_raises Calculation::UnsupportedOperationError do
      Calculation.new( '1.0', '2', 'invalid operator' ).result()
    end
  end
end