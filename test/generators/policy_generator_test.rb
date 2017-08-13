require 'test_helper'

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

    assert_file 'app/policies/active_user_policy.rb' do |content|
      assert_match /class ActiveUserPolicy/, content
      assert_match /def initialize/, content
    end
  end

  test "rspec file is generated" do
    run_generator %w(active_user)

    assert_file 'spec/policies/active_user_policy_spec.rb' do |content|
      assert_match /RSpec.describe ActiveUserPolicy, type: :policy do/, content
      assert_match /pending/, content
    end
  end

  test "if minitest is specified, minitest file is generated" do
    run_generator %w(active_user --minitest)

    assert_file 'test/policies/active_user_policy_test.rb' do |content|
      assert_match /class ActiveUserPolicyTest < Minitest::Test/, content
    end
  end

  test 'generates files with no suffixes if --no-sufix option is passed' do
    run_generator %w(active_user --no-suffix)

    assert_file 'app/policies/active_user.rb' do |content|
      assert_match /ActiveUser/, content
      assert_match /def initialize/, content
    end

    assert_file 'spec/policies/active_user_spec.rb' do |content|
      assert_match /RSpec.describe ActiveUser, type: :policy/, content
    end
  end
end
