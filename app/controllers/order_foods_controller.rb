# frozen_string_literal: true

class OrderFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_food, only: %i[ show edit update destroy ]
  before_action :authorize_role

  # -------------------------------------------------------------
  # FYI - STatus Codes for Order Food Table
  # 0 - Canceled
  # 1 - Active
  # 2 - Ready
  # -------------------------------------------------------------

  # GET /order_foods or /order_foods.json
  def index
    # Get all the orders from tickets from the database with the status column set to 1.
    # 1 Means that the order is active.
    @order_foods = OrderFood.all.where(status: 1)
    @order_foods_all = OrderFood.all.where.not(status: 1).reverse
  end

  # GET /order_foods/1 or /order_foods/1.json
  def show
    redirect_to order_foods_path
  end

  # GET /order_foods/new
  def new
    redirect_to order_foods_path
  end

  # GET /order_foods/1/edit
  def edit
    redirect_to order_foods_path
  end

  # POST /order_foods or /order_foods.json
  def create
    @order_food = OrderFood.new(order_food_params)

    respond_to do |format|
      if @order_food.save
        redirect_to order_food_url(@order_food), notice: "Order food was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /order_foods/1 or /order_foods/1.json
  def update
    @order_food.update(status: 2)
    flash[:notice] = 'Order ready!'
    redirect_to order_foods_path
  end

  # DELETE /order_foods/1 or /order_foods/1.json
  def destroy
    @order_food.update(status: 0)
    flash[:notice] = 'Order canceled!'
    redirect_to order_foods_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order_food
    @order_food = OrderFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_food_params
    params.require(:order_food).permit(:food_id, :ticket_id)
  end

  def authorize_role
    unless current_user && (current_user.role == "Chef" || current_user.role == "Admin")
      flash[:alert] = "Your role '#{current_user.role}' is not authorized to access this page."
      redirect_to root_path
    end
  end
end
