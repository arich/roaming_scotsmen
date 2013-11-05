require 'test_helper'

class ApiCallerTest < ActionController::TestCase
	setup do
    @controller = ApiCaller.new
  end

	test "get list of cities returns city names in array" do
		assert_not_nil @controller.get_list_of_cities
		assert_not_empty @controller.get_list_of_cities
	end

	test "get categories for cities returns categories text" do
		response = @controller.get_categories_for_city "paris"
		assert_not_nil response
	end

	test "get attractions for city with q returns attractions" do
		response = @controller.get_attractions_for_city "paris", {q: "church"}
		assert_not_nil response
	end

		test "get attractions for city with category returns attractions" do
		response = @controller.get_attractions_for_city "paris", {category: "Churches"}
		assert_not_nil response
	end
end