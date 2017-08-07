require 'test_helper'

class FormGeneratorTest < Rails::Generators::TestCase
  tests FormGenerator

  destination File.join(Rails.root)
  teardown :cleanup

  def cleanup
    FileUtils.rm_rf(File.join(Rails.root, 'app/forms'))
    FileUtils.rm_rf(File.join(Rails.root, 'spec/forms'))
    FileUtils.rm_rf(File.join(Rails.root, 'test/forms'))
  end

  test 'correct file is generated' do
    run_generator %w(registration)

    assert_file 'app/forms/registration_form.rb' do |content|
      assert_match /RegistrationForm/, content
      assert_match /def initialize/, content
    end
  end

  test 'correct spec file is generated' do
    run_generator %w(registration)

    assert_file 'spec/forms/registration_form_spec.rb' do |content|
      assert_match /RSpec.describe RegistrationForm, type: :form/, content
      assert_match /pending/, content
    end
  end

  test 'generates minitest file if test-framework is minitest' do
    run_generator %w(registration --minitest)

    assert_file 'test/forms/registration_form_test.rb' do |content|
      assert_match /class RegistrationFormTest < Minitest::Test/, content
    end
  end
end
