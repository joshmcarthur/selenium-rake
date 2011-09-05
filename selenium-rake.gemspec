# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "selenium-rake/version"

Gem::Specification.new do |s|
  s.name        = "selenium-rake"
  s.version     = Selenium::Rake::VERSION
  s.authors     = ["Chris Holmes"]
  s.email       = ["ciholmes86@yahoo.co.uk"]
  s.homepage    = ""
  s.summary     = %q{"Blah"}
  s.description = %q{"Blah Blah"}

  s.rubyforge_project = "selenium-rake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
