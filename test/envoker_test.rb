require "bundler/setup"
require "minitest/autorun"
require "minitest/pride"
require "minitest/sugar"
require_relative "../lib/envoker"
require_relative "../lib/envoker/rack"

class EnvokerTest < Minitest::Test
  FILE = File.expand_path(".env.example", __dir__)
  DEFAULT_ENV = ENV.to_hash

  setup do
    ENV.replace(DEFAULT_ENV)
  end

  test "ignore wrong environment lines" do
    assert_equal 1, Envoker.parse(FILE).count
  end

  test "don't raise if file doesn't exist" do
    assert !Envoker.load(".notexists")
  end

  test "load environment vars" do
    Envoker.load(FILE)

    assert_equal "secret", ENV["SECRET"]
  end

  test "don't override environment vars" do
    ENV["SECRET"] = "supersecret"

    Envoker.load(FILE)

    assert_equal "supersecret", ENV["SECRET"]
  end

  test "override environment vars" do
    ENV["SECRET"] = "supersecret"

    Envoker.overload(FILE)

    assert_equal "secret", ENV["SECRET"]
  end

  test "rack" do
    ENV["RACK_ENV"] = "development"

    Envoker::Rack.load(FILE)

    assert_equal "secret", ENV.fetch("SECRET")
    assert_equal "development", ENV.fetch("ENVIRONMENT")
  end
end
