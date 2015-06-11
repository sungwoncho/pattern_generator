require 'active_support/inflector'

class PoroGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  def generate_template
    template 'poro.rb', "app/models/#{file_name}.rb"
  end

  def generate_test
    if options.test_suite == 'rspec'
      template 'poro_spec.rb', "spec/models/#{file_name}_spec.rb"
    elsif options.test_suite == 'minitest'
      template 'poro_test.rb', "test/models/#{file_name}_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end
