class OrderFoodsController < ApplicationController
  before_action :set_order_food, only: %i[ show edit update destroy ]

  # GET /order_foods or /order_foods.json
  def index
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
        format.html { redirect_to order_food_url(@order_food), notice: "Order food was successfully created." }
        format.json { render :show, status: :created, location: @order_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_foods/1 or /order_foods/1.json
  def update
    @order_food.update(status: 2)
    flash[:notice] = 'Pedido Listo'
    redirect_to order_foods_path
  end

  # DELETE /order_foods/1 or /order_foods/1.json
  def destroy
    @order_food.update(status: 0)
    flash[:notice] = 'Pedido Cancelado'
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
end
