require_relative '../../version2_0'
require_relative '../../relationship'

module BELParser
  module Language
    module Version2_0
      module Relationships
        # Includes:  +compositeAbundance(A,B) includes A+ -  This
        # relationship links each individual abundance term in a
        # +compositeAbundance(<list>)+ to the compositeAbundance. For
        # example, +compositeAbundance(A, B) includes A+ and
        # +compositeAbundance(A, B) includes B+. This relationship is
        # direct because it is a _self_ relationship. This relationship
        # is introduced by the BEL Compiler and may not be used by
        # statements in BEL documents.
        class Includes
          extend Relationship

          SHORT       = :includes
          LONG        = :includes
          DESCRIPTION = ' +compositeAbundance(A,B) includes A+ -  This
          elationship links each individual abundance
          erm in a +compositeAbundance(<list>)+
          o the compositeAbundance. For example,
          compositeAbundance(A, B) includes A+ and
          compositeAbundance(A, B) includes B+. This
          elationship is direct because it is a _self_
          elationship. This relationship is introduced by
          he BEL Compiler and may not be used by statements
          n BEL documents.'.freeze

          def self.short
            SHORT
          end

          def self.long
            LONG
          end

          def self.description
            DESCRIPTION
          end

          def self.directed?
            true
          end

          def self.injected?
            true
          end

          def self.self?
            true
          end
        end
      end
    end
  end
end
