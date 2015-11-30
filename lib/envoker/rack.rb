require_relative "../envoker"

module Envoker
  module Rack
    def self.load(file = ".env")
      Envoker.load(file)
      Envoker.overload(sprintf("%s.%s", file, environment))
    end

    def self.environment
      return ENV.fetch("RACK_ENV", "development")
    end
  end
end
