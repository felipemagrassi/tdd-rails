# frozen_string_literal: true

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length.eql?(strand2.length)
    strand1 == strand2 ? 0 : 1
  end
end
