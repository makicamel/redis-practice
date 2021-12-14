class ApplicationController < ActionController::Base
  before_action :authentecate_user!
  helper_method :current_user

  private

  def authentecate_user!
    if session[:user_id].nil?
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
