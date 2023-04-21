# frozen_string_literal: true

module BioRubyCorp
  class Hamming
    def self.compute(strand1, strand2)
      @dna1 = Genetics::DNAStrand.new(strand1)
      @dna2 = Genetics::DNAStrand.new(strand2)

      Calculator::HammingDistance.calculate(@dna1.to_s, @dna2.to_s)
    rescue Calculator::HammingDistance::NotEqualLengthStrings
      raise ArgumentError, 'Strands must be of equal length'
    rescue Genetics::DNAStrand::InvalidDNAString
      raise ArgumentError, 'Strands must be composed of A, T, C, or G'
    end
  end

  class Nucleotide
    def self.from_dna(strand)
      DNAStrand.new(strand)
    rescue DNAStrand::InvalidDNAStrand
      raise ArgumentError, 'Strand must be composed of A, T, C, or G'
    end
  end

  class DNAStrand
    class InvalidDNAStrand < StandardError; end
    def initialize(dna_string)
      @dna_strand = Genetics::DNAStrand.new(dna_string)
    rescue Genetics::DNAStrand::InvalidDNAString
      raise InvalidDNAStrand
    end

    def histogram
      @dna_strand.histogram
    end

    def count(nucleotide)
      @dna_strand.count(nucleotide)
    end
  end

  module Genetics
    class DNAStrand
      class InvalidDNAString < StandardError; end

      def initialize(strand)
        raise ArgumentError unless strand.match?(/\A[ATCG]*\z/)

        @strand = strand
      end

      def to_s
        @strand
      end

      def count(nucleotide)
        @strand.chars.count { |char| char.eql?(nucleotide) }
      end

      def histogram
        %w[A T C G].each_with_object({}) do |nucleotide, histogram|
          histogram[nucleotide] = count(nucleotide)
        end
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
