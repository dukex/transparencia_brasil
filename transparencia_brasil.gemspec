# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'transparencia_brasil/version'

Gem::Specification.new do |spec|
  spec.name          = "transparencia_brasil"
  spec.version       = TransparenciaBrasil::VERSION
  spec.authors       = ["Duke"]
  spec.email         = ["srdukex@gmail.com"]
  spec.description   = %q{Gem to get data from transparenciabrasil.org API}
  spec.summary       = %q{Gem to get data from transparenciabrasil.org API}
  spec.homepage      = "http://github.com/dukex/transparencia_brasil"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 2.14'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'activesupport', '>= 3.0'
  spec.add_dependency 'addressable'
  spec.add_dependency 'curb', '0.8.5'
end
