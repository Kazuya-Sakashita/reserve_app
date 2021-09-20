require 'test_helper'

class ReservesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get reserves_index_url
    assert_response :success
  end

  test 'should get show' do
    get reserves_show_url
    assert_response :success
  end

  test 'should get edit' do
    get reserves_edit_url
    assert_response :success
  end

  test 'should get new' do
    get reserves_new_url
    assert_response :success
  end
end
