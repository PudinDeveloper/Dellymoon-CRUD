class ApplicationController < ActionController::Base
  before_action :create_admin_user_if_none_exists
  before_action :authenticate_user!

  private

  def create_admin_user_if_none_exists
    if User.count.zero?
      User.create(
        email: 'admin@example.com',
        password: 'password',
        role: 'Admin'
      )
    end
  end
end
