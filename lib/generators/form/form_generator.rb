require "active_support/inflector"

class FormGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  PATTERN_NAME = "form"

  def copy_service_file
    template "#{PATTERN_NAME}.rb", "app/#{PATTERN_NAME.pluralize}/#{file_name}.rb"
  end

  def copy_forms_test_file
    if options.test_suite == 'rspec'
      template "#{PATTERN_NAME}_spec.rb", "spec/#{PATTERN_NAME.pluralize}/#{file_name}_spec.rb"
    elsif options.test_suite == 'minitest'
      template "#{PATTERN_NAME}_test.rb", "test/#{PATTERN_NAME.pluralize}/#{file_name}_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end
