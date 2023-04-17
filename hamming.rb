# frozen_string_literal: true

class Hamming
  def self.compute(strand1, strand2)
    @dna1 = Genetics::Strand.new(strand1)
    @dna2 = Genetics::Strand.new(strand2)

    raise ArgumentError unless @dna1.length.eql?(@dna2.length)

    @dna1.chars.zip(@dna2.chars).count do |left, right|
      !left.eql?(right)
    end
  end
end

module Genetics
  class Strand
    def initialize(strand)
      @strand = strand
    end

    def length
      @strand.length
    end

    def chars
      @strand.chars
    end
  end
end
