# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.5] - 2017-08-04
### Added
- Form pattern generator

## [0.1.5] - 2017-08-04
### Changed
- Generated classes and file names will no longer have suffixes.
    ```
    $ rails g form registration
    ```
    The above command used to generate `app/forms/registration_form.rb`. Now it will generate `app/forms/registration.rb`.

    If you do want suffixes, you'll need to declare them explicicity.

