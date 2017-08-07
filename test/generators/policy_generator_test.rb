require 'test_helper'
require 'generators/policy/policy_generator'

class PolicyGeneratorTest < Rails::Generators::TestCase
  tests PolicyGenerator

  destination File.join(Rails.root)
  teardown :cleanup

  def cleanup
    FileUtils.rm_rf(File.join(Rails.root, 'app/policies'))
    FileUtils.rm_rf(File.join(Rails.root, 'spec/policies'))
    FileUtils.rm_rf(File.join(Rails.root, 'test/policies'))
  end


  test "correct file is generated" do
    run_generator %w(active_user)

    assert_file 'app/policies/active_user.rb' do |content|
      assert_match /class ActiveUser/, content
      assert_match /def initialize/, content
    end
  end

  test "rspec file is generated" do
    run_generator %w(active_user)

    assert_file 'spec/policies/active_user_spec.rb' do |content|
      assert_match /RSpec.describe ActiveUser, type: :policy do/, content
      assert_match /pending/, content
    end
  end

  test "if minitest is specified, minitest file is generated" do
    run_generator %w(active_user --test-suite=minitest)

    assert_file 'test/policies/active_user_test.rb' do |content|
      assert_match /class ActiveUserTest < Minitest::Test/, content
    end
  end

end
