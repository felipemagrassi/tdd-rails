# frozen_string_literal: true

module BioRubyCorp
  class Hamming
    def self.compute(strand1, strand2)
      @dna1 = Genetics::DNAStrand.new(strand1)
      @dna2 = Genetics::DNAStrand.new(strand2)

      Calculator::HammingDistance.calculate(@dna1.to_s, @dna2.to_s)
    rescue Calculator::HammingDistance::NotEqualLengthStrings
      raise ArgumentError, 'Strands must be of equal length'
    end
  end

  class Nucleotide
    def self.from_dna(strand)
      DNAStrand.new(strand)
    end
  end

  class DNAStrand
    def initialize(dna_string)
      raise ArgumentError unless dna_string.match?(/\A[ATCG]*\z/)

      @dna_string = dna_string
    end

    def histogram
      %w[A T C G].each_with_object({}) do |nucleotide, histogram|
        histogram[nucleotide] = count(nucleotide)
      end
    end

    def count(nucleotide)
      @dna_string.chars.count { |char| char.eql?(nucleotide) }
    end
  end

  module Genetics
    class DNAStrand
      def initialize(strand)
        raise ArgumentError unless strand.match?(/\A[ATCG]*\z/)

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
