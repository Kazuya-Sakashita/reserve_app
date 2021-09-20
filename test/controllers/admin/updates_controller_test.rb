require 'test_helper'

class Admin::UpdatesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_updates_index_url
    assert_response :success
  end

  test 'should get new' do
    get admin_updates_new_url
    assert_response :success
  end

  test 'should get show' do
    get admin_updates_show_url
    assert_response :success
  end

  test 'should get edit' do
    get admin_updates_edit_url
    assert_response :success
  end
end
