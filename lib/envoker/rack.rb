require_relative "../envoker"

module Envoker
  module Rack
    def self.load(file = ".env")
      Envoker.load(file)
      Envoker.overload(format("%s.%s", file, environment))
    end

    def self.environment
      ENV.fetch("RACK_ENV", "development")
    end
  end
end
