require 'test_helper'

class CalculationTest < ActiveSupport::TestCase

  ##
  # Constructor

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

  ##
  # #result

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

  ##
  # #as_string

  test '#as_string must return the string representation of addition' do
    assert_equal  Calculation.new( '3.0', '2.0', '+' ).as_string(),
                  '3.0 + 2.0 = 5.0'
  end

  test '#as_string must return the string representation of subtraction' do
    assert_equal  Calculation.new( '3.0', '2.0', '-' ).as_string(),
                  '3.0 - 2.0 = 1.0'
  end

  test '#as_string must return the string representation of multiplication' do
    assert_equal  Calculation.new( '3.0', '2.0', '*' ).as_string(),
                  '3.0 * 2.0 = 6.0'
  end

  test '#as_string must return the string representation of division' do
    assert_equal  Calculation.new( '3.0', '2.0', '/' ).as_string(),
                  '3.0 / 2.0 = 1.5'
  end

  test '#as_string must return the string representation of exponentiation' do
    assert_equal  Calculation.new( '3.0', '2.0', '**' ).as_string(),
                  '3.0 ** 2.0 = 9.0'
  end

  test '#as_string must return the string representation of sqrt of input_a' do
    assert_equal  Calculation.new( '9.0', '2.0', 'sqrt' ).as_string(),
                  'sqrt( 9.0 ) = 3.0'
  end
end