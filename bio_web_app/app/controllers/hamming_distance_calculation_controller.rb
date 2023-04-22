class HammingDistanceCalculationController < ApplicationController
  def new
    @calculation = HammingDistanceCalculation.new
  end

  def calculate
    @message = "Result: #{hamming_result(params)}" end

  private

  def hamming_result(params)
    '1'
  end
end
