require 'test_helper'

class ApiCallerTest < ActionController::TestCase
  setup do
    @api_caller = ApiCaller.new
  end

  test "get list of cities returns city names in array" do
    assert_not_nil @api_caller.get_list_of_cities
    assert_not_empty @api_caller.get_list_of_cities
  end

  test "get categories for cities returns categories text" do
    response = @api_caller.get_categories_for_city "paris"
    assert_not_nil response
  end

  test "get attractions for city with q returns attractions" do
    response = @api_caller.get_attractions_for_city "NewYork", {q: "church"}
    assert_not_nil response
  end

  test "get attractions for city with category returns attractions" do
    response = @api_caller.get_attractions_for_city "paris", {category: "Churches"}
    assert_not_nil response
  end

  test "get attractions for city with category and q returns attractions" do
    response = @api_caller.get_attractions_for_city "paris", {q: "church", category: "Churches"}
    assert_not_nil response
  end

  test "get attraction detail returns attraction detail" do
  	response = @api_caller.get_attractions_for_city "paris", {q: "church"}
  	assert_not_nil response
  	attraction = response["list"]["link"].first
  	attraction_detail = @api_caller.get_attraction_detail "paris", attraction["id"]
  	assert_not_nil attraction_detail
  	puts attraction_detail
  end


end