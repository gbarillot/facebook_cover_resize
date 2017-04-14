# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'facebook_cover_resize/version'

Gem::Specification.new do |spec|
  spec.name          = "facebook_cover_resize"
  spec.version       = FacebookCoverResize::VERSION
  spec.authors       = ["guillaume barillot"]
  spec.email         = ["gbarillot@gmail.com"]

  spec.summary       = "Compute width/size and offsets x/y for Facebook events cover image"
  spec.description   = "Compute width/size and offsets x/y for Facebook events cover image"
  spec.homepage      = "https://github.com/gbarillot/facebook_cover_resize"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
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

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
