module Routler
  class StatBuilder

    attr_accessor :parser

    def initialize(parser)
      @parser = parser
    end

    def display
      controllers = @parser.all_controllers
      num_actions = controllers.inject(0) {|sum, c| sum + c.actions.length}
      output =  "            Stats:\n"
      output += "=============================\n"
      output += "Controllers found: #{controllers.length}\n"
      output += "    Actions found: #{num_actions}\n"
      output += "     Lines parsed: #{@parser.lines}\n"
      output += "   Parsing errors: #{@parser.error_lines.length}\n"
      output
    end

  end
end
