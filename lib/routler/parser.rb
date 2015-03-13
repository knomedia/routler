module Routler
  class Parser

    attr_accessor :controllers
    attr_accessor :lines
    attr_accessor :error_lines

    def initialize
      @controllers = Hash.new
      @error_lines = []
      @lines = 0
    end

    def parse(content)
      content.each_line do |line|
        @lines += 1
        add_controller(parse_line line)
      end
      all_controllers
    end

    def parse_line(line)
      match = line.match(/^(\s{1,})?(\S*\s\S*\s{1,}\/\S*)(?<cont>.*)\#(?<action>\S*)/)
      controller = Hash.new
      begin
        if match[:cont]
          controller[:name] = match[:cont].strip
          controller[:action] = match[:action].strip.chomp
        end
      rescue
        controller[:error] = line
      end
      controller
    end

    def add_controller(controller)
      if controller.fetch :error, nil
        @error_lines << controller[:error]
      else
        name = controller[:name]
        action = controller[:action]
        @controllers[name] = Controller.new(name) if !@controllers.fetch name, nil
        @controllers[name].add_action action
      end
    end

    def all_controllers
      cont = []
      @controllers.keys.sort.each do |k|
        cont << @controllers[k]
      end
      cont
    end

  end
end
