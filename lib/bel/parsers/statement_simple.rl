# begin: ragel
=begin
%%{
  machine bel;

  include 'term.rl';
  include 'relationship.rl';
  include 'comment.rl';

  action statement_subject {
    @buffers[:subject] = s(:subject,
                           @buffers[:term_stack][-1])
  }

  action statement_object {
    @buffers[:object] = s(:object,
                          @buffers[:term_stack][-1])
  }

  action yield_statement_simple {
    @buffers[:comment] ||= s(:comment, nil)
    yield s(:statement_simple,
            @buffers[:subject],
            @buffers[:relationship],
            @buffers[:object],
            @buffers[:comment])
  }

  statement_simple :=
    outer_term %statement_subject
    SP+
    RELATIONSHIP
    SP+
    outer_term %statement_object
    SP*
    COMMENT? %yield_statement_simple
    NL;
}%%
=end
# end: ragel

require          'ast'
require_relative 'mixin/buffer'
require_relative 'nonblocking_io_wrapper'

module StatementSimple

  class << self

    MAX_LENGTH = 1024 * 128 # 128K

    def parse(content)
      return nil unless content

      Parser.new(content).each do |obj|
        yield obj
      end
    end
  end

  private

  class Parser
    include Enumerable
    include AST::Sexp
    include BEL::Parser::Buffer

    def initialize(content)
      @content = content
# begin: ragel        
      %% write data;
# end: ragel        
    end

    def each
      @buffers = {}
      stack    = []
      data     = @content.unpack('C*')
      p        = 0
      pe       = data.length

# begin: ragel        
      %% write init;
      %% write exec;
# end: ragel        
    end
  end
end

if __FILE__ == $0
  $stdin.each_line do |line|
    StatementSimple.parse(line) { |obj|
      puts obj.inspect
    }
  end
end

# vim: ft=ruby ts=2 sw=2:
# encoding: utf-8
