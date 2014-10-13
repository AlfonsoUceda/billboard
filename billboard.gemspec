# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'billboard/version'

Gem::Specification.new do |spec|
  spec.name          = "billboard"
  spec.version       = Billboard::VERSION
  spec.authors       = ["Alfonso Uceda Pompa"]
  spec.email         = ["alfonso@aspgems.com"]
  spec.summary       = %q{This gem gets the spanish billboard.}
  spec.homepage      = "https://github.com/AlfonsoUceda/billboard"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "nokogiri", "~> 1.6.3"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
