class ApplicationController < ActionController::Base
  before_action :create_admin_user_if_none_exists

  private

  def create_admin_user_if_none_exists
    if User.count.zero?
      User.create(
        email: 'admin@example.com',
        password: '5f4dcc3b5aa765d61d8327deb882cf99',
        role: 'Admin'
      )
    end
  end
end
