require "active_support/inflector"

# Base class for all generators to come. If you want to override some behaviour, all you
# got to do is override a method in the child class.
class BaseGenerator < Rails::Generators::NamedBase
  class_option :rspec, type: :boolean, desc: 'DEFAULT: Define rspec as your test framework.'
  class_option :minitest, type: :boolean, desc: 'Test framework to generate test. (rspec or minitest)'
  class_option :no_suffix, type: :boolean, desc: "If you don't want any pattern suffix. Ex: AuthenticationService. Service is the suffix."

  # Creates the file for the requested pattern based on a template file.
  def copy_pattern_file
    template "#{pattern_name}.rb", generated_file_path
  end

  # Creates the test file for the request pattern based on a template file.
  def copy_pattern_test_file
    template "#{pattern_name}_#{test_suite_identifier}.rb", generated_test_file_path
  end

  private

  # Determines the class name based on the file name given by the user.
  def class_name
    file_name.classify + suffix.classify
  end

  # This method must be overrided in the child classes.
  def pattern_name
    raise NotImplementedError
  end

  def folder_name
    pattern_name.pluralize
  end

  # Generates the pattern suffix.
  # Ex: _service
  def suffix
    options.no_suffix? ? "" : "_#{pattern_name}"
  end

  # Generates the file path.
  # Ex: app/services/authentication.rb
  def generated_file_path
    "app/#{folder_name}/#{file_name}#{suffix}.rb"
  end

  def test_suite_identifier
    identifier = "spec"
    identifier = "test" if options.minitest?
    identifier
  end

  # Generates the test file path.
  # Ex: spec/services/authentication_spec.rb
  def generated_test_file_path
    "#{test_suite_identifier}/#{folder_name}/#{file_name}#{suffix}_#{test_suite_identifier}.rb"
  end
end
