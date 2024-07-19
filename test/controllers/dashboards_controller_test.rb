# frozen_string_literal: true

require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get dashboard_index_url
    assert_response :success
  end
end
