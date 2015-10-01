require_relative "lib/envoker/version"

Gem::Specification.new do |s|
  s.name        = "envoker"
  s.version     = Envoker::VERSION
  s.summary     = "Load environment variables from `.env`"
  s.description = s.summary
  s.authors     = ["Francesco Rodríguez"]
  s.email       = ["frodsan@protonmail.ch"]
  s.homepage    = "https://github.com/harmoni/envoker"
  s.license     = "MIT"

  s.files = `git ls-files`.split("\n")

  s.add_development_dependency "cutest", "~> 1.2"
end
