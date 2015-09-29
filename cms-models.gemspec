# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cms/models/version'

Gem::Specification.new do |spec|
  spec.name          = "cms-models"
  spec.version       = Cms::Models::VERSION
  spec.authors       = ["Kristian Mandrup"]
  spec.email         = ["kmandrup@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  
  spec.add_dependency 'mongoid', '~> 5.0.0.beta'
  spec.add_dependency 'activesupport', '~> 4.2.4'
  spec.add_dependency 'mongoid-history'
  spec.add_dependency 'mongoid_orderable'
  spec.add_dependency 'workflow'
  spec.add_dependency 'microsoft_translator'
  spec.add_dependency 'dotenv-rails'
  spec.add_dependency 'carrierwave'
  spec.add_dependency 'carrierwave-mongoid'
  spec.add_dependency 'fog'
  spec.add_dependency 'fog-aws'
  spec.add_dependency 'mini_magick'
  spec.add_dependency 'resque'
  spec.add_dependency 'resque-scheduler'
  spec.add_dependency 'carrierwave_backgrounder'
end
