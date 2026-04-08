# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspotify/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspotify'
  spec.version       = RSpotify::VERSION
  spec.authors       = ['Guilherme Sad']
  spec.email         = ['gorgulhoguilherme@gmail.com']
  spec.summary       = %q{A ruby wrapper for the Spotify Web API}
  spec.homepage      = 'https://rubygems.org/gems/rspotify'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '>= 1.6'
  spec.add_dependency 'rest-client', '~> 2.1'
  spec.add_dependency 'addressable', '~> 2.9.0'
  spec.add_dependency 'cgi', '>= 0.5', '< 0.6'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'vcr', '~> 6.0'

  spec.required_ruby_version = '>= 3.3.0'
end
