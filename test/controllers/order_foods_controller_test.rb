require "test_helper"

class OrderFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_food = order_foods(:one)
  end

  test "should get index" do
    get order_foods_url
    assert_response :success
  end

  test "should get new" do
    get new_order_food_url
    assert_response :success
  end

  test "should create order_food" do
    assert_difference("OrderFood.count") do
      post order_foods_url, params: { order_food: { food_id: @order_food.food_id, status: @order_food.status, ticket_id: @order_food.ticket_id } }
    end

    assert_redirected_to order_food_url(OrderFood.last)
  end

  test "should show order_food" do
    get order_food_url(@order_food)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_food_url(@order_food)
    assert_response :success
  end

  test "should update order_food" do
    patch order_food_url(@order_food), params: { order_food: { food_id: @order_food.food_id, status: @order_food.status, ticket_id: @order_food.ticket_id } }
    assert_redirected_to order_food_url(@order_food)
  end

  test "should destroy order_food" do
    assert_difference("OrderFood.count", -1) do
      delete order_food_url(@order_food)
    end

    assert_redirected_to order_foods_url
  end
end
