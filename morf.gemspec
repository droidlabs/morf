# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'morf/version'

Gem::Specification.new do |spec|
  spec.name          = "morf"
  spec.version       = Morf::VERSION
  spec.authors       = ["Droid Labs LLC"]
  spec.email         = ["droid@droidlabs.pro"]
  spec.description   = %q{Declarative object morpher}
  spec.summary       = %q{Declarative object morher}
  spec.homepage      = "https://github.com/droidlabs/morf"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "activesupport", "~> 1.3"
  spec.add_development_dependency "rake"
end
