class HammingDistanceCalculationController < ApplicationController
  def new
    @calculation = HammingDistanceCalculation.new
  end

  def calculate
    @message = hamming_result(params)
  end

  private

  def hamming_result(params)
    strand_1 = params[:hamming_distance_calculation][:dna_strand_1]
    strand_2 = params[:hamming_distance_calculation][:dna_strand_2]
    "Result: #{Hamming.compute(strand_1, strand_2)}"
  rescue ArgumentError
    'Incorrect input'
  end
end
