require 'bel_parser/language'
require          'concurrent/hash'
require          'bel_parser/parsers/ast/node'
require          'bel_parser/expression/model/namespace'
require_relative '../state_function'
require_relative '../apply_resource_uri'

module BELParser
  module Script
    module State
      class NamespaceDefinition
        extend StateFunction

        TARGET_NODE = BELParser::Parsers::AST::NamespaceDefinition

        def self.consume(ast_node, script_context)
          return nil unless ast_node.is_a?(TARGET_NODE)
          uri_reader = script_context[:uri_reader]
          url_reader = script_context[:url_reader]

          keyword, domain = ast_node.children
          keyword_s       = keyword.identifier.string_literal

          case
          when domain.uri?
            uri     = domain.child.string.string_literal
            dataset = uri_reader.retrieve_resource(uri)
            script_context[:namespace_definitions] ||= Concurrent::Hash.new
            script_context[:namespace_definitions][keyword_s] =
              BELParser::Expression::Model::Namespace.new(
                keyword_s,
                uri,
                nil)
          when domain.url?
            ApplyResourceURI.new.process(ast_node)
            if ast_node.uri
              dataset = uri_reader.retrieve_resource(ast_node.uri)
              script_context[:namespace_definitions] ||= Concurrent::Hash.new
              script_context[:namespace_definitions][keyword_s] =
                BELParser::Expression::Model::Namespace.new(
                  keyword_s,
                  ast_node.uri,
                  domain.child.string.string_literal)
            else
              url     = domain.child.string.string_literal
              dataset = url_reader.retrieve_resource(url)
              script_context[:namespace_definitions] ||= Concurrent::Hash.new
              script_context[:namespace_definitions][keyword_s] =
                BELParser::Expression::Model::Namespace.new(
                  keyword_s,
                  nil,
                  url)
            end
          end
        end
      end
    end
  end
end
