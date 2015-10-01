require "cutest"
require_relative "../lib/envoker"

FILE = File.expand_path(".env.example", __dir__)

def test(*)
  defaults = ENV.to_hash
  super
ensure
  ENV.replace(defaults)
end

scope "parse" do
  test "ignore wrong environment lines" do
    assert_equal 1, Envoker.parse(FILE).count
  end
end

scope "load" do
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
end

scope "fetch" do
  test "return value from ENV" do
    Envoker.load(FILE)

    assert_equal "secret", Envoker.fetch("SECRET")
  end

  test "return default if not exists" do
    assert_equal "secret", Envoker.fetch("notexists", "secret")
  end

  test "raise error if key not exists" do
    assert_raise do
      Envoker.fetch("notexists")
    end
  end
end
