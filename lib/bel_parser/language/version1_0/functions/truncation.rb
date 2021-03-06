require_relative '../../version1_0'
require_relative '../../function'
require_relative '../../signature'
require_relative '../../semantics'

module BELParser
  module Language
    module Version1_0
      module Functions
        # Truncation: Indicates an abundance of proteins with truncation
        # sequence variants
        class Truncation
          extend Function

          SHORT       = :trunc
          LONG        = :truncation
          RETURN_TYPE = BELParser::Language::Version1_0::ReturnTypes::Truncation
          DESCRIPTION = 'Indicates an abundance of proteins with
          runcation sequence variants'.freeze

          def self.short
            SHORT
          end

          def self.long
            LONG
          end

          def self.return_type
            RETURN_TYPE
          end

          def self.description
            DESCRIPTION
          end

          def self.signatures
            SIGNATURES
          end

          module Signatures
            # TruncationWithPositionSignature
            class TruncationWithPositionSignature
              extend BELParser::Language::Signature

              private_class_method :new

              AST = BELParser::Language::Semantics::Builder.build do
                term(
                  function(
                    identifier(
                      function_of(Truncation))),
                  argument(
                    parameter(
                      prefix(any),
                      value(
                        is_sequence_position))))
              end
              private_constant :AST

              STRING_FORM = 'truncation(E:*)truncation'.freeze
              private_constant :STRING_FORM

              def self.semantic_ast
                AST
              end

              def self.string_form
                STRING_FORM
              end
            end
          end

          SIGNATURES = Signatures.constants.map do |const|
            Signatures.const_get(const)
          end.freeze
        end
      end
    end
  end
end
