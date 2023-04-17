# frozen_string_literal: true

class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length.eql?(strand2.length)

    strand1.chars.zip(strand2.chars).count do |left, right|
      !left.eql?(right)
    end
  end
end
