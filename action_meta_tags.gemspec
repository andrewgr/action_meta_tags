require File.expand_path('../lib/action_meta_tags/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Andrei Gridnev']
  gem.email         = ['andrew.gridnev@gmail.com']
  gem.summary       = 'Meta tags'
  gem.description   = 'Well structured meta tags for your Rails app views'
  gem.homepage      = 'https://github.com/andrewgr/action_meta_tags/'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($ORS)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.name          = 'action_meta_tags'
  gem.require_paths = ['lib']
  gem.version       = ActionMetaTags::VERSION

  gem.add_runtime_dependency 'activesupport', '~> 4'

  gem.add_development_dependency 'rspec', '~> 3'
  gem.add_development_dependency 'actionpack', '~> 4'
  gem.add_development_dependency 'rubocop', '~> 0.30'
  gem.add_development_dependency 'cane', '~> 2.6', '>= 2.6.1'
  gem.add_development_dependency 'shoulda', '~> 3.5'
  gem.add_development_dependency 'shoulda-matchers', '~> 2.8', '>= 2.8.0'
end
