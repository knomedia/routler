require 'csv'

module Routler
  module Formatters
    class Csv

      def initialize(controllers=[])
        @controllers = controllers
      end

      def format(controllers=nil)
        @controllers = controllers if controllers
        CSV.generate do |csv|
          csv << ['Controller', 'Action']
          @controllers.each do |c|
            c.actions.each do |a|
              csv << [c.name, a]
            end
          end
        end
      end

    end
  end
end
