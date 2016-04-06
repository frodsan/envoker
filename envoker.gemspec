require_relative "lib/envoker/version"

Gem::Specification.new do |s|
  s.name        = "envoker"
  s.version     = Envoker::VERSION
  s.summary     = "Load environment variables from .env"
  s.description = s.summary
  s.author      = "Francesco Rodriguez"
  s.email       = "hello@frodsan.com"
  s.homepage    = "https://gitlab.com/frodsan/envoker"
  s.license     = "MIT"

  s.files      = Dir["LICENSE", "README.md", "lib/**/*.rb"]
  s.test_files = Dir["test/**/*.rb"]

  s.add_development_dependency "minitest", "~> 5.8"
  s.add_development_dependency "minitest-sugar", "~> 2.1"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rubocop", "~> 0.39"
end
