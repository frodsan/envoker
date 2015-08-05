require_relative "envoker/version"

module Envoker
  DEFAULT = ".env"
  SETTINGS = /(.+)=(.*)$/

  class KeyNotFound < StandardError
    MESSAGE = "%s not found in .env file or environment settings."

    def initialize(key)
      super(sprintf(MESSAGE, key.inspect))
    end
  end

  def self.load(file = DEFAULT)
    return unless File.exists?(file)

    parse(file).each { |k, v| ENV[k] ||= k }
  end

  def self.parse(file)
    return File.read(file).scan(SETTINGS)
  end

  def self.fetch(key, default = nil)
    return ENV.fetch(key, default) || raise(KeyNotFound, key)
  end
end
