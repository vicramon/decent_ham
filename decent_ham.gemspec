# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "decent_ham"
  spec.version       = "0.0.5"
  spec.authors       = "Vic Ramon"
  spec.email         = "v@vicramon.com"
  spec.description   = "Decent Ham generates rails crud using decent_exposure and haml."
  spec.summary       = "Decent Ham generates rails crud using decent_exposure and haml."
  spec.require_paths = ["lib"]

  spec.files         = Dir["{lib}/**/*", "[A-Z]*"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
