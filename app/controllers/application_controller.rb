class ApplicationController < ActionController::Base
  before_action :create_admin_user_if_none_exists

  private

  def create_admin_user_if_none_exists
    if User.count.zero?
      User.create(
        email: 'admin@example.com',
        password: '21232f297a57a5a743894a0e4a801fc3',
        role: 'Admin'
      )
    end
  end
end
