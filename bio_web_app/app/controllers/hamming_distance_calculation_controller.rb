class HammingDistanceCalculationController < ApplicationController
  def new
    @calculation = HammingDistanceCalculation.new
  end
end
