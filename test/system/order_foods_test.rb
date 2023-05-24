require "application_system_test_case"

class OrderFoodsTest < ApplicationSystemTestCase
  setup do
    @order_food = order_foods(:one)
  end

  test "visiting the index" do
    visit order_foods_url
    assert_selector "h1", text: "Order foods"
  end

  test "should create order food" do
    visit order_foods_url
    click_on "New order food"

    fill_in "Food", with: @order_food.food_id
    fill_in "Status", with: @order_food.status
    fill_in "Ticket", with: @order_food.ticket_id
    click_on "Create Order food"

    assert_text "Order food was successfully created"
    click_on "Back"
  end

  test "should update Order food" do
    visit order_food_url(@order_food)
    click_on "Edit this order food", match: :first

    fill_in "Food", with: @order_food.food_id
    fill_in "Status", with: @order_food.status
    fill_in "Ticket", with: @order_food.ticket_id
    click_on "Update Order food"

    assert_text "Order food was successfully updated"
    click_on "Back"
  end

  test "should destroy Order food" do
    visit order_food_url(@order_food)
    click_on "Destroy this order food", match: :first

    assert_text "Order food was successfully destroyed"
  end
end
