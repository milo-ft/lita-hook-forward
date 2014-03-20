Gem::Specification.new do |spec|
  spec.name          = 'lita-hook-forward'
  spec.version       = '1.0.0'
  spec.authors       = ['Emilio Figueroa']
  spec.email         = ['emiliofigueroatorres@gmail.com']
  spec.description   = %q{A simple Lita handler that will forward any message coming from a hook}
  spec.summary       = %q{A simple Lita handler that will forward any message coming from a hook}
  spec.homepage      = 'https://github.com/milo-ft/lita-hook-forward'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 3.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0.0.beta2'
  spec.add_development_dependency 'shoulda', '>= 3.5.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
end
