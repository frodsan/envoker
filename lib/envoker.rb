require_relative "envoker/version"

module Envoker
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
end
