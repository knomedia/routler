module Routler
  class Consumer

    def load_file path=nil
      path ? IO.read(path) : build_routes
    end

    def build_routes
      contents = ''
      pipe = IO.popen("bundle exec rake routes")
      while (line = pipe.gets)
        contents += line
      end
      contents
    end

  end
end
