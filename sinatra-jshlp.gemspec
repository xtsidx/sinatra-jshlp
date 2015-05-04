# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "sinatra-jshlp"
  spec.version       = "0.1.0"
  spec.authors       = ["xtsidx"]
  spec.email         = ["xtsidx@gmail.com"]

  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Assets helper for JS and CSS files in Sinatra applications}
  spec.description   = %q{Simple and easy way for connect JS and CSS file in your Sinatra applications}
  spec.homepage      = "https://github.com/xtsidx/sinatra-jshlp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

	spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "rack-test"
	spec.add_dependency "sinatra"
end
