# frozen_string_literal: true

require_relative "envoker/version"

module Envoker
  def self.load(file)
    parse(file).each { |k, v| ENV[k] ||= v }
  rescue Errno::ENOENT
    nil
  end

  def self.overload(file)
    parse(file).each { |k, v| ENV[k] = v }
  rescue Errno::ENOENT
    nil
  end

  def self.parse(file)
    File.read(file).scan(/(.+)=(.*)$/)
  end
end
