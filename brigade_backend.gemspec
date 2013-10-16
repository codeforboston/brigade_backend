$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "brigade_backend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "brigade_backend"
  s.version     = BrigadeBackend::VERSION
  s.authors     = ["Liam Morley"]
  s.email       = ["liam@carpeliam.com"]
  s.homepage    = "https://github.com/codeforboston/brigade_backend"
  s.summary     = "A RESTful backend for a Code for America brigade."
  s.description = "A RESTful backend for a Code for America brigade."

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "active_model_serializers"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
