class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :authorize_role

  # GET /tickets or /tickets.json
  def index
    @ticketsActive = (Ticket.where(status: true)).reverse
    @ticketsInactive = (Ticket.where(status: false)).reverse
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    # This code is for displaying the ordered foods in the ticket show page
    @employee = User.find_by(id: (@ticket.user_id))

    # If the employee exists, then the orders are displayed based on the ticket id
    if @employee
      @orders = OrderFood.where(ticket_id: params[:id])
    else
      # If the employee does not exist, then the user is redirected to the tickets page
      # This error does not suppose to happen, but it is a security measure
      flash[:alert] = 'Something went wrong, the employee was not found, check the database integrity'
      redirect_to tickets_path
    end
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @food = Food.all
  end

  # GET /tickets/1/edit
  def edit
    @foods = Food.all
    render 'edit'
  end

  # POST /tickets or /tickets.json
  def create

    @find_employee = User.find_by(id: (current_user.id).to_i)

    if @find_employee
      # Create a new ticket with the table number and the user id
      # table: params[:ticket][:table] is the table number that the user inputs in the form
      # user_id: current_user.id is the user id of the user that is currently logged in
      @ticket = Ticket.new(table: params[:ticket][:table], user_id: current_user.id)

      if @ticket.save
        flash[:notice] = "Ticket was successfully created."
        redirect_to ticket_url(@ticket)
      else
        render :new, status: :unprocessable_entity
      end

    # If the employee does not exist, then the user is redirected to the new ticket page
    # This error does not suppose to happen, but it is a security measure
    else
      flash[:alert] = 'Employee does not exist, please contact the system administrator'
      redirect_to new_ticket_url
    end

  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update

    # The reason for this is that the update method is used for both updating the ticket and adding a dish to the ticket
    OrderFood.create(food_id: params[:dish], ticket_id: params[:id])

    # This code is for updating the final price of the ticket
    update_final_price

    # Finally, redirect to the ticket show page
    flash[:notice] = "Ticket was successfully updated."
    redirect_to ticket_url(params[:id])

  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy

    # If the dish parameter exists, then the dish is removed from the ticket
    if params[:dish]
      OrderFood.find(params[:dish]).destroy
      update_final_price
      flash[:notice] = "Dish was successfully removed."
      redirect_to ticket_url(params[:id])
    else
      @ticket_temp = Ticket.find(params[:id])
      @ticket_temp.status = false
      @ticket_temp.save
      flash[:notice] = "Ticket was successfully marked as inactive."
      redirect_to tickets_url
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:table, :final_price, :user_id)
    end

    def update_final_price
      # Updates the final price of a ticket based on the prices of the ordered foods.
      @final_price = OrderFood.where(ticket_id: params[:id])

      @fp = 0

      @final_price.each do |price|
        @food = Food.find(price.food_id)
        @fp += @food.price
      end

      # This method calculates the final price of a ticket by summing up the prices of all the ordered foods associated with the ticket.
      # It retrieves the ordered foods from the `OrderFood` model and finds the corresponding `Food` model to get the price.
      # The calculated final price is then assigned to the `final_price` attribute of the `Ticket` model and saved.
      @lticket = Ticket.find(params[:id])
      @lticket.final_price = @fp
      @lticket.save
    end

    def authorize_role
      unless current_user && (current_user.role == "Waitstaff" || current_user.role == "Admin")
        flash[:alert] = "Your role '#{current_user.role}' is not authorized to access this page."
        redirect_to root_path
      end
    end

end
