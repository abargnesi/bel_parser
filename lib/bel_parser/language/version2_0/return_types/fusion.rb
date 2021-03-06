require_relative 'any'

module BELParser
  module Language
    module Version2_0
      module ReturnTypes
        # Fusion return type.
        class Fusion < Any
          def self.to_sym
            raise_not_implemented(__method__) if self != Fusion
            :fusion
          end
        end
      end
    end
  end
end
