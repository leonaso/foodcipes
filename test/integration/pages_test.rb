require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get home page" do
		#get pages-controller -> home-action-url
		get pages_home_url
		assert_response :success
	end

	test "should get root" do
		#get the root-url page
		get root_url
		assert_response :success
	end	

end
