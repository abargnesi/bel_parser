require_relative '../../version1_0'
require_relative '../../relationship'

module BELParser
  module Language
    module Version1_0
      module Relationships
        # TranslatedTo:  +R >> P+ -  For rnaAbundance term R and
        # proteinAbundance term P, +R translatedTo P+ or +R >> P+
        # indicates that members of P are produced by the translation
        # of members of R. For example: +r(HGNC:AKT1) >> p(HGNC:AKT1)+
        # indicates that AKT1 protein is produced by translation of
        # AKT1 RNA.
        class TranslatedTo
          extend Relationship

          SHORT       = :>>
          LONG        = :translatedTo
          DESCRIPTION = ' +R >> P+ -  For rnaAbundance term R and
          roteinAbundance term P, +R translatedTo P+ or
          R >> P+ indicates that members of P are produced
          y the translation of members of R. For example:
          r(HGNC:AKT1) >> p(HGNC:AKT1)+ indicates that
          KT1 protein is produced by translation of AKT1
          NA.'.freeze

          def self.short
            SHORT
          end

          def self.long
            LONG
          end

          def self.description
            DESCRIPTION
          end

          def self.direct?
            true
          end

          def self.directed?
            true
          end

          def self.genomic?
            true
          end
        end
      end
    end
  end
end
