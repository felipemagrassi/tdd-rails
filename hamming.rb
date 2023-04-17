# frozen_string_literal: true

class Hamming
  def self.compute(strand1, strand2)
    strand1 == strand2 ? 0 : 1
  end
end
