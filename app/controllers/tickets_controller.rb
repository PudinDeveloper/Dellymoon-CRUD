class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @ticketsActive = (Ticket.where(status: true)).reverse
    @ticketsInactive = (Ticket.where(status: false)).reverse
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @employee = User.find_by(id: (@ticket.user_id))
    if @employee
      @orders = OrderFood.where(ticket_id: params[:id])
    else
      flash[:alert] = 'Ocurrió un error, no se encontro el empleado, revisa la integridad de la base de datos'
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
    @find_employee = User.find_by(id: (params[:ticket][:user_id]).to_i)
    if @find_employee
      @ticket = Ticket.new(ticket_params)
      respond_to do |format|
        if @ticket.save
          format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = 'Ese empleado no existe, usa el ID: "1" si no cuentas con ID de empleado'
      redirect_to new_ticket_url
    end

  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update

    # byebug

    OrderFood.create(food_id: params[:dish], ticket_id: params[:id])
    update_final_price
    redirect_to ticket_url(params[:id]), notice: "Ticket was successfully updated."

    # respond_to do |format|
    #   if @ticket.update(ticket_params)
    #     format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
    #     format.json { render :show, status: :ok, location: @ticket }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @ticket.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    if params[:dish]
      byebug
      OrderFood.find(params[:dish]).destroy
      update_final_price
      redirect_to ticket_url(params[:id]), notice: "Dish was successfully removed."
    else
      byebug
      @ticket_temp = Ticket.find(params[:id])
      @ticket_temp.status = false
      @ticket_temp.save
      redirect_to tickets_url, notice: "Ticket ha sido marcado como inactivo."
    end

    # @ticket.destroy

    # respond_to do |format|
    #   format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
    #   format.json { head :no_content }
    # end
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
      @final_price = OrderFood.where(ticket_id: params[:id])
      @fp = 0
      @final_price.each do |price|
        @food = Food.find(price.food_id)
        @fp += @food.price
      end
      @lticket = Ticket.find(params[:id])
      @lticket.final_price = @fp
      @lticket.save
    end

end
