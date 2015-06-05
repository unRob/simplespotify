# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplespotify/version'

Gem::Specification.new do |spec|
  spec.name          = "spotify"
  spec.version       = SimpleSpotify::VERSION
  spec.authors       = ["Roberto Hidalgo"]
  spec.email         = ["un@rob.mx"]

  spec.summary       = "Yet another Spotify client"
  spec.description   = "Spotify API wrapper"
  spec.homepage      = "https://github.com/unRob/simplespotify"
  spec.license       = ["WTFPL", 'GPLv2']

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'httparty'
end
