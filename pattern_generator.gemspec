$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pattern_generator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pattern_generator"
  s.version     = PatternGenerator::VERSION
  s.authors     = ["Sung Won Cho"]
  s.email       = ["mikeswcho@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PatternGenerator."
  s.description = "TODO: Description of PatternGenerator."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "byebug"
end
