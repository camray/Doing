# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doing/version'

Gem::Specification.new do |spec|
  spec.name          = "Doing"
  spec.version       = Doing::VERSION
  spec.authors       = ["Cameron Ray"]
  spec.email         = ["cameron@cameronray.net"]
  spec.summary       = %q{Command line "to do" manager.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/camray/Doing"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "thor"
end
