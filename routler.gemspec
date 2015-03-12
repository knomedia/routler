# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'routler/version'

Gem::Specification.new do |spec|
  spec.name          = "routler"
  spec.version       = Routler::VERSION
  spec.authors       = ["Jason Madsen"]
  spec.email         = ["knomedia@gmail.com"]
  spec.summary       = %q{Convert your rails routes to a CSV for reporting, processing, etc.}
  spec.description   = %q{Convert your rails routes to a CSV for reporting, processing, etc.}
  spec.homepage      = "https://github.com/knomedia/routler"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
