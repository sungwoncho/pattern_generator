require 'active_support/inflector'

class PolicyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :test_suite, type: :string, default: 'rspec', desc: 'Test framework to generate test. (rspec or minitest)'

  def generate_template
    template 'policy.rb', "app/policies/#{file_name}_policy.rb"
  end

  def generate_test
    if options.test_suite == 'rspec'
      template 'policy_spec.rb', "spec/policies/#{file_name}_policy_spec.rb"
    elsif options.test_suite == 'minitest'
      template 'policy_test.rb', "test/policies/#{file_name}_policy_test.rb"
    end
  end

  private

  def class_name
    file_name.classify
  end
end
