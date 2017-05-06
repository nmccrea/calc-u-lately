class Calculation

  NUMBER_MATCHER        = /^\d*(\.\d*)?$/

  class InvalidNumberError        < Exceptions::ApplicationError; end
  class UnsupportedOperationError < Exceptions::ApplicationError; end

  ##
  # Constructor.
  # Takes two numbers and an operation to be performed on the numbers.

  def initialize( input_a, input_b, operation )
    unless input_a =~ NUMBER_MATCHER && input_b =~ NUMBER_MATCHER
      raise InvalidNumberError, "Inputs must be numbers."
    end

    @input_a    = input_a.to_f
    @input_b    = input_b.to_f
    @operation  = operation
  end

  ##
  # Return the result of this calculation.

  def result
    return case @operation
      when '+'    then @input_a + @input_b
      when '-'    then @input_a - @input_b
      when '*'    then @input_a * @input_b
      when '/'    then @input_a / @input_b
      when '**'   then @input_a ** @input_b
      when 'sqrt' then Math.sqrt( @input_a )
        
      else raise UnsupportedOperationError, "Unsupported operation."
    end
  end

  ##
  # Return the string representation of this calculation.

  def as_string
    return case @operation
      when '+'    then "#{@input_a} + #{@input_b} = #{result}"
      when '-'    then "#{@input_a} - #{@input_b} = #{result}"
      when '*'    then "#{@input_a} * #{@input_b} = #{result}"
      when '/'    then "#{@input_a} / #{@input_b} = #{result}"
      when '**'   then "#{@input_a} ** #{@input_b} = #{result}"
      when 'sqrt' then "sqrt( #{@input_a} ) = #{result}"
    end
  end
end