
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "now_playing/version"

Gem::Specification.new do |spec|
  spec.name          = "now-playing"
  spec.version       = NowPlaying::VERSION
  spec.authors       = ["Miguel Gonzalez"]
  spec.email         = ["sb.mgonzalez1@gmail.com"]

  spec.summary       = %q{Flatiron School CLI scraper project and is called "NowPlaying"}
  spec.description   = %q{This is the CLI scraper project I produced from scratch. I chose to go with
  a movie info app that will give the user a means of entering a title and getting back a summary, actors names,
  and other pertinent info about the film. All the info will be drawn from the IMDB database, which is wiki in nature,
  but does offer very good summaries and background info.}
  spec.homepage      = "https://github.com/SpartanGeek2014/cli-data-gem-assessment-cb-000"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
