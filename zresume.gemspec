# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zresume/version'

Gem::Specification.new do |spec|
  spec.name          = "zresume"
  spec.version       = Zresume::VERSION
  spec.authors       = ["suffering"]
  spec.email         = ["zhuboliu@gmail.com"]
  spec.description   = %q{Use this to write a resume for you.}
  spec.summary       = %q{Write resume by ruby, generate serval different kids of files.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.0.0"
  spec.add_development_dependency "active_support", "~> 3.2.13"
  spec.add_development_dependency "rake"
end
