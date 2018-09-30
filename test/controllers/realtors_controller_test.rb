require 'test_helper'

class RealtorsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do

    @admin = admins(:admin_1)
    @current_user = @admin.user
    @current_user.admin = @admin

    sign_in @admin.user

    @realtor = realtors(:realtor_1)
  end


  test "should get index" do
    get realtors_url
    assert_response :success
  end

  test "should get new" do
    get new_realtor_url
    assert_response :success
  end

  test "should create realtor" do
    assert_difference('Realtor.count') do
      post realtors_url, params: { realtor: { company_id: @realtor.company_id, email: @realtor.email, full_name: @realtor.full_name, password: @realtor.password, phone: @realtor.phone } }
    end

    assert_redirected_to realtor_url(Realtor.last)
  end

  test "should show realtor" do
    get realtor_url(@realtor)
    assert_response :success
  end

  test "should get edit" do
    get edit_realtor_url(@realtor)
    assert_response :success
  end

  test "should update realtor" do
    patch realtor_url(@realtor), params: { realtor: { company_id: @realtor.company_id, email: @realtor.email, full_name: @realtor.full_name, password: @realtor.password, phone: @realtor.phone } }
    assert_redirected_to realtor_url(@realtor)
  end

  test "should destroy realtor" do
    assert_difference('Realtor.count', -1) do
      delete realtor_url(@realtor)
    end

    assert_redirected_to realtors_url
  end
end
