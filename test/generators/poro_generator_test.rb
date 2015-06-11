require 'test_helper'
require 'generators/poro/poro_generator'

class PoroGeneratorTest < Rails::Generators::TestCase
  tests PoroGenerator

  destination File.join(Rails.root)
  teardown :cleanup

  def cleanup
    FileUtils.rm_rf(File.join(Rails.root, 'app/models'))
    FileUtils.rm_rf(File.join(Rails.root, 'spec/models'))
    FileUtils.rm_rf(File.join(Rails.root, 'test/models'))
  end

  test 'correct file is generated' do
    run_generator %w(grade)

    assert_file 'app/models/grade.rb' do |content|
      assert_match /class Grade/, content
      assert_no_match /ActiveRecord::Base/, content
    end
  end

  test 'rspec file is generated' do
    run_generator %w(grade)

    assert_file 'spec/models/grade_spec.rb' do |content|
      assert_match /RSpec.describe Grade do/, content
    end
  end

  test 'minitest file is generated when test-suite is minitest' do
    run_generator %w(grade --test-suite=minitest)

    assert_file 'test/models/grade_test.rb' do |content|
      assert_match /class GradeTest < MiniTest::Test/, content
    end
  end
end
