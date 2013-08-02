# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sounder/version'

Gem::Specification.new do |spec|
  spec.name          = "sounder"
  spec.version       = Sounder::VERSION
  spec.authors       = ["Adam Zaninovich"]
  spec.email         = ["adam.zaninovich@gmail.com"]
  spec.description   = %q{Play sounds on your Mac}
  spec.summary       = %q{Play sounds on your Mac}
  spec.homepage      = "https://github.com/adamzaninovich/sounder"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
