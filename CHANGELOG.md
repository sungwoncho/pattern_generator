# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2017-08-07

### Added
- `--minitest` option to specify you're using MiniTest.
- `--rspec` option to specify you're using RSpec. It is the default behaviour.
- `--no-suffix` option to specify you don't want any suffixes.
- Form pattern generator
- Generated classes and file names will no longer have suffixes.
    ```
    $ rails g form registration
    ```
    The above command used to generate `app/forms/registration_form.rb`. Now it will generate `app/forms/registration.rb`.

    If you do want suffixes, you'll need to declare them explicicity.

### Changed
- Get back to using suffixes by default.

### Removed
- `--test-suite` option to specify which test suite you're using.

