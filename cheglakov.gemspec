$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cheglakov/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cheglakov_somebook"
  s.version     = Cheglakov::VERSION
  s.authors     = ["Gregory Eremin"]
  s.email       = ["magnolia_fan@me.com"]
  s.homepage    = "https://github.com/itfog/cheglakov.somebook"
  s.summary     = "Somebook Cheglakov shard"
  s.description = "Rails mountable engine that provides embedded shard functionality"

  s.files = Dir["{app,config,lib}/**/*"] + ["Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  # s.add_dependency "rails", "3.2.8"
  # s.add_dependency "jquery-rails"
end
