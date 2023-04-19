# frozen_string_literal: true

module BioRubyCorp
  class Hamming
    def self.compute(strand1, strand2)
      @dna1 = Genetics::Strand.new(strand1)
      @dna2 = Genetics::Strand.new(strand2)

      Calculator::HammingDistance.calculate(@dna1.to_s, @dna2.to_s)
    rescue Calculator::HammingDistance::NotEqualLengthStrings
      raise ArgumentError, 'Strands must be of equal length'
    end
  end

  class Nucleotide
    def self.from_dna(_strand)
      DNAStrand.new
    end
  end

  class DNAStrand
    def initialize(dna_string)
      @dna_string = dna_string
    end

    def count(nucleotide)
      @dna_string.chars.count { |char| char.eql?(nucleotide) }
    end
  end

  module Genetics
    class Strand
      def initialize(strand)
        @strand = strand
      end

      def to_s
        @strand
      end
    end
  end

  module Calculator
    module HammingDistance
      class NotEqualLengthStrings < StandardError; end

      def self.calculate(string1, string2)
        raise NotEqualLengthStrings unless string1.length.eql?(string2.length)

        string1.chars.zip(string2.chars).count do |left, right|
          !left.eql?(right)
        end
      end
    end
  end
end

Hamming = BioRubyCorp::Hamming
Nucleotide = BioRubyCorp::Nucleotide
