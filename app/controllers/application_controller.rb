# The base controller for all controllers in the application.
# It provides common functionality and filters that are used across multiple controllers.
class ApplicationController < ActionController::Base
  # Ensures that a user is logged in before they can access any controller action.
  before_action :create_admin_user_if_none_exists
  before_action :authenticate_user!

  private

  # Creates an admin user if no user exists in the database.
  def create_admin_user_if_none_exists
    # If no users exist in the database, create an admin user.
    if User.count.zero?
      # Create an admin user with the email "admin@example.com" and "password" password.
      # This user will have the "Admin" role.
      User.create(
        # Warning: Putting passwords in the code is a security risk, but it's done here for simplicity.
        # In a real application, you should use environment variables or other secure methods to store passwords.
        email: 'admin@example.com',
        password: 'password',
        role: 'Admin'
      )
    end
  end
end
