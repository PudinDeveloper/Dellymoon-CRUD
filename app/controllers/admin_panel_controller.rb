class AdminPanelController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_role

  def index
    @users = User.all
  end

  def show
    redirect_to "/admin_panel"
  end

  # GET /admin_panel/new
  def new
    @user = User.new
    render "new"
  end

  # POST /admin_panel
  def create
    @user = User.new(user_params)

    # Create a new User record in the database.
    if @user.save
      # If the User record is successfully created, redirect to the User's page with a notice.
      flash[:notice] = "User was successfully created."
      redirect_to "/admin_panel"
    else
      # If the User record is not successfully created, render the new template with an unprocessable entity status.
      flash[:alert] = @user.errors.full_messages.join(', ')
      redirect_to "/admin_panel/new", status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])

    # This is to prevent the super admin from being edited.
    # The super admin is the first user created in the database.
    # The super admin has an id of 1 always.
    if params[:id] == '1'
      flash[:alert] = 'You cannot edit the super admin'
      redirect_to "/admin_panel"
    end
  end

  def update
    @user = User.find(params[:id])

    # This is to prevent the super admin from being edited.
    # The super admin is the first user created in the database.
    # The super admin has an id of 1 always.
    if params[:id] == '1'
      flash[:alert] = 'You cannot edit the super admin'
      redirect_to "/admin_panel/#{params[:id]}/edit"
      return
    end

    # If the password field is empty, update the user's email and role only.
    # This is to prevent to change the password if the password field is empty.
    if user_params[:password] == ""
      @user.email = user_params[:email]
      @user.role = user_params[:role]
      @user.save
      flash[:notice] = 'User role updated successfully'
      redirect_to "/admin_panel"
      return
    end

    # If the password field is not empty, update the user's email, role, and password.
    # This is to allow the user to change the password.
    # The password field is encrypted using bcrypt.
    if @user.update(user_params)
      flash[:notice] = 'User updated successfully'
      redirect_to "/admin_panel"
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      redirect_to "/admin_panel/#{params[:id]}/edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:role, :email, :password)
  end

  # This method checks if the current user is an admin.
  # If the current user is not an admin, redirect to the root path.
  def authorize_role
    unless current_user && (current_user.role == "Admin")
      flash[:alert] = "Your role '#{current_user.role}' is not authorized to access this page."
      redirect_to root_path
    end
  end
end
