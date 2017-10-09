# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplespotify/version'

Gem::Specification.new do |spec|
  spec.name          = "simplespotify"
  spec.version       = SimpleSpotify::VERSION
  spec.authors       = ["Roberto Hidalgo"]
  spec.email         = ["un@rob.mx"]

  spec.summary       = "Yet another Spotify client"
  spec.description   = "Spotify API wrapper"
  spec.homepage      = "https://github.com/unRob/simplespotify"
  spec.licenses      = %w{WTFPL GPLv2}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.6"

  spec.add_runtime_dependency 'httparty'
end
