# puppet-lint-params_not_optional_with_undef-check

[![License](https://img.shields.io/github/license/voxpupuli/puppet-lint-params_not_optional_with_undef-check.svg)](https://github.com/voxpupuli/puppet-lint-params_not_optional_with_undef-check/blob/master/LICENSE)
[![Test](https://github.com/voxpupuli/puppet-lint-params_not_optional_with_undef-check/actions/workflows/test.yml/badge.svg)](https://github.com/voxpupuli/puppet-lint-params_not_optional_with_undef-check/actions/workflows/test.yml)
[![Release](https://github.com/voxpupuli/puppet-lint-params_not_optional_with_undef-check/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-lint-params_not_optional_with_undef-check/actions/workflows/release.yml)
[![RubyGem Version](https://img.shields.io/gem/v/puppet-lint-params_not_optional_with_undef-check.svg)](https://rubygems.org/gems/puppet-lint-params_not_optional_with_undef-check)
[![RubyGem Downloads](https://img.shields.io/gem/dt/puppet-lint-params_not_optional_with_undef-check.svg)](https://rubygems.org/gems/puppet-lint-params_not_optional_with_undef-check)
[![Donated by Tim Meusel](https://img.shields.io/badge/donated%20by-Tim%20%27bastelfreak%27%20Meusel-fb7047.svg)](#transfer-notice)

A puppet-lint plugin to check for parameters without Optional as type but undef
as value.

## Installing

### From the command line

```shell
$ gem install puppet-lint-params_not_optional_with_undef-check
```

### In a Gemfile

```ruby
gem 'puppet-lint-params_not_optional_with_undef-check', require: false
```

## Checks

### Parameter assigned to the empty string

According the the Vox Pupuli best practices, a class parameter with the string
datatype should default to `undef` and not `''`, if it's optional. The
recommendations are documented at [voxpupuli.org](https://voxpupuli.org/docs/reviewing_pr/).

#### What you have done

```puppet
class foo (
  String $bar = undef,
) {
  # logic
}
```

#### What you should have done

```puppet
class foo (
  Optional[String[1]] $bar = undef,
) {
  # logic
}
```

or:

```puppet
class foo (
  String[1] $bar = 'value',
) {
  # logic
}
```

#### Disabling the check

To disable this check, you can add `--no-empty_string_assignment-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-empty_string_assignment-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_empty_string_assignment')
```

You can also disable it inline:

```puppet
class foo (
  String $baz = '', # lint:ignore:params_empty_string_assignment
) {
  # awesome logic here
}
```

## Transfer Notice

This plugin was originally authored by [Tim 'bastelfreak' Meusel](https://github.com/bastelfreak).
The maintainer preferred that Vox Pupuli take ownership of the module for future improvement and maintenance.

## License

This gem is licensed under the MIT license.

## Release information

To make a new release, please do:
* update the version in the gemspec file
* Install gems with `bundle install --with release --path .vendor`
* generate the changelog with `bundle exec rake changelog`
* Check if the new version matches the closed issues/PRs in the changelog
* Create a PR with it
* After it got merged, push a tag. GitHub actions will do the actual release to rubygems and GitHub Packages
