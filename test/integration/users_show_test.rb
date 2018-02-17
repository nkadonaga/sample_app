require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @active     = users(:michael)
    @non_active = users(:megan)
  end

  test "show users only if activated" do
    log_in_as(@active)
    get user_path(@active)
    assert_template 'users/show'
    get user_path(@non_active)
    assert_template nil
  end
end
