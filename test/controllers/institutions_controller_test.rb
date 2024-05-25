require "test_helper"

class InstitutionsControllerTest < ActionDispatch::IntegrationTest
	test "should get information" do
		get institutions_information_url
		assert_response :success
	end

	test "should get registrants" do
		get institutions_registrants_url
		assert_response :success
	end
end
