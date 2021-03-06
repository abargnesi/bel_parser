require_relative '../../version1_0'
require_relative '../../relationship'

module BELParser
  module Language
    module Version1_0
      module Relationships
        # HasModification:  +p(A) hasModification p(A, pmod(P, S, 473))+
        # -  This relationship links abundance terms modified by the
        # +pmod()+ function to the unmodified abundance term. This is a
        # direct relationship because it is a _self_ relationship. This
        # relationship is introduced by the BEL Compiler and may not be
        # used by statements in BEL documents.
        class HasModification
          extend Relationship

          SHORT       = :hasModification
          LONG        = :hasModification
          DESCRIPTION = ' +p(A) hasModification p(A, pmod(P, S, 473))+ -
          his relationship links abundance terms modified by
          he +pmod()+ function to the unmodified abundance
          erm. This is a direct relationship because it
          s a _self_ relationship. This relationship is
          ntroduced by the BEL Compiler and may not be used
          y statements in BEL documents.'.freeze

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

          def self.injected?
            true
          end
        end
      end
    end
  end
end
