require_relative '../../function'

module BEL
  module Language
    module Version1
      # Geneabundance
      class Geneabundance
        include Function

        SHORT       = :g
        LONG        = :geneAbundance
        RETURN_TYPE = :g
        DESCRIPTION = 'Denotes the abundance of a gene'.freeze
        SIGNATURES  = [].freeze

        def short
          SHORT
        end

        def long
          LONG
        end

        def return_type
          RETURN_TYPE
        end

        def description
          DESCRIPTION
        end

        def signatures
          SIGNATURES
        end
      end
    end
  end
end