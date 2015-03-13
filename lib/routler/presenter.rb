module Routler
  class Presenter

    def display content, output
      if output == 'stdout'
        puts content
      else
        File.open(output, 'w') {|f| f.write(content)}
      end
    end

  end
end
