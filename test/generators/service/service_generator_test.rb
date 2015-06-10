require 'test_helper'
require 'generators/service/service_generator'

class ServiceGeneratorTest < Rails::Generators::TestCase
  tests ServiceGenerator

  destination File.join(Rails.root)
  teardown :cleanup

  test 'correct file is generated' do
    run_generator %w(find_match)

    assert_file 'app/services/find_match_service.rb' do |content|
      assert_match /FindMatchService/, content
      assert_match /def call/, content
    end
  end

  test 'correct spec file is generated' do
    run_generator %w(find_match)

    assert_file 'spec/services/find_match_service_spec.rb' do |content|
      assert_match /RSpec.describe FindMatchService, type: :service/, content
    end
  end

  test 'generates minitest file if test-framework is minitest' do
    run_generator %w(find_match --test-suite=minitest)

    assert_file 'test/services/find_match_service_test.rb' do |content|
      assert_match /class FindMatchServiceTest < Minitest::Test/, content
    end
  end

  def cleanup
    FileUtils.rm_rf(File.join(Rails.root, 'app/services'))
    FileUtils.rm_rf(File.join(Rails.root, 'spec/services'))
  end
end
