require_relative "envoker/version"

module Envoker
  KeyNotFound = Class.new(StandardError)

  def self.load(file)
    parse(file).each { |k, v| ENV[k] ||= v }
  rescue Errno::ENOENT
  end

  def self.overload(file)
    parse(file).each { |k, v| ENV[k] = v }
  rescue Errno::ENOENT
  end

  def self.parse(file)
    return File.read(file).scan(/(.+)=(.*)$/)
  end

  def self.fetch(key, default = nil)
    return ENV.fetch(key) do
      raise(KeyNotFound, sprintf("ENV[%p] not found", key))
    end
  end
end
