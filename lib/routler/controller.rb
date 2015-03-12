module Routler
  class Controller

    attr_accessor :actions
    attr_accessor :name

    def initialize(name)
      @name = name
      @actions = []
    end

    def add_action(action)
      actions.push action unless actions.include? action
    end

  end
end
