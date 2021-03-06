Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-params_not_optional_with_undef-check'
  spec.version     = '1.0.0'
  spec.homepage    = 'https://github.com/voxpupuli/puppet-lint-params_not_optional_with_undef-check'
  spec.license     = 'MIT'
  spec.author      = 'Vox Pupuli'
  spec.email       = 'voxpupuli@groups.io'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check for class parameters with undef as value but not Optional type'

  spec.add_dependency             'puppet-lint', '~> 2.5'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rspec-its', '~> 1.3'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.2'
  spec.add_development_dependency 'rspec-json_expectations', '~> 2.2'
  spec.add_development_dependency 'rake'
end
