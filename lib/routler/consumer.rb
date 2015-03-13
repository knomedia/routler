module Routler
  class Consumer

    def load_file path=nil
      if path
        contents = IO.read(path)
      else
        build_routes
      end
    end

    def build_routes
      # TODO
      # contents = ''
      # pipe = IO.popen("bundle exec rails routes")
      # while (line = pipe.gets)
      #   contents += line
      # end
      # contents
    end

  end
end
