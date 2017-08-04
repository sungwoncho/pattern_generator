require 'test_helper'
require 'generators/form/form_generator'

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

    assert_file 'app/forms/registration.rb' do |content|
      assert_match /Registration/, content
      assert_match /def initialize/, content
    end
  end

  test 'correct spec file is generated' do
    run_generator %w(registration)

    assert_file 'spec/forms/registration_spec.rb' do |content|
      assert_match /RSpec.describe Registration, type: :form/, content
      assert_match /pending/, content
    end
  end

  test 'generates minitest file if test-framework is minitest' do
    run_generator %w(registration --test-suite=minitest)

    assert_file 'test/forms/registration_test.rb' do |content|
      assert_match /class RegistrationTest < Minitest::Test/, content
    end
  end
end
