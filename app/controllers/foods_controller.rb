class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i[ show edit update destroy ]
  before_action :authorize_role

  # GET /foods or /foods.json
  def index
    # Get all the foods from the database with the isActive column set to true.
    @foods = Food.where(isActive: true)
    # @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show
    redirect_to foods_path
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    # Create a new food record in the database.
    if @food.save
      # If the food record is successfully created, redirect to the food's page with a notice.
      redirect_to food_url(@food), notice: "Food was successfully created."
    else
      # If the food record is not successfully created, render the new template with an unprocessable entity status.
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    # If the food record is successfully updated, redirect to the food's page with a notice.
    if @food.update(food_params)
      redirect_to food_url(@food), notice: "Food was successfully updated."
    else
      # If the food record is not successfully updated, render the edit template with an unprocessable entity status.
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /foods or /foods.json
  def destroy
    # Soft delete the food because it has a isActive column.
    @food.update(isActive: false)

    # Redirect to the foods page with a notice.
    flash[:notice] = "Food was successfully destroyed."
    redirect_to foods_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :quantity, :price, :food_type)
    end

    def authorize_role
      unless current_user && (current_user.role == "Chef" || current_user.role == "Admin")
        flash[:alert] = "Your role '#{current_user.role}' is not authorized to access this page."
        redirect_to root_path
      end
    end
end
