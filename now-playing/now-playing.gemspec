# coding: utf-8
 lib = File.expand_path('../lib', __FILE__)
 $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
 require 'now/version'

 Gem::Specification.new do |spec|
    spec.authors       = ["Miguel Gonzalez"]
    spec.email         = ["sb.mgonzalez1@gmail.com"]
    spec.description   = %q{Movies playing}
    spec.summary       = %q{Movies playing}
    spec.homepage      = "https://learn.co"

    spec.files         = `git ls-files`.split($\)
    spec.executables   = ["now-playing"]
    spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
    spec.name          = "now-cli-gem"
    spec.require_paths = ["lib"]
    spec.require_paths = ["lib", "lib/now"]
    spec.version       = NowPlaying::VERSION
    spec.license       = "MIT"
