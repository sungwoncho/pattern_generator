require 'test_helper'
require 'generators/service/service_generator'

class ServiceGeneratorTest < Rails::Generators::TestCase
  tests ServiceGenerator
  destination File.join(Rails.root, 'app/services')

  setup :prepare_destination
  teardown :cleanup

  test 'correct file is generated' do
    run_generator %w(find_match)

    assert_file 'find_match_service.rb'
  end

  def cleanup
    FileUtils.rm_rf(File.join(Rails.root, 'app/services'))
  end
end
