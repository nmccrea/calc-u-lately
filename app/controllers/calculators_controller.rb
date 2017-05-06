class CalculatorsController < ApplicationController

  def calculator
  end

  def calculate
    calculation = Calculation.new(
      params[:input_a],
      params[:input_b],
      params[:operation] )

    result = calculation.result
    update_history( calculation )

    render json: { result: result, history: session[:history] }
  end

  private

    ##
    # Update the calculation history that is persisted in the session.
    # Takes the calculation to add to the history.

    def update_history( calculation )
      history = session[:history] ? session[:history] : []
      history.push( calculation.as_string )
      session[:history] = history.last( 10 )
    end
end