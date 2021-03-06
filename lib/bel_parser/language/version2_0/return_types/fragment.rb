require_relative 'any'

module BELParser
  module Language
    module Version2_0
      module ReturnTypes
        # Fragment return type.
        class Fragment < Any
          # Return the {Symbol} value.
          #
          # @note This method should be overridden in subclasses.
          def self.to_sym
            raise_not_implemented(__method__) if self != Fragment
            :fragment
          end
        end
      end
    end
  end
end
