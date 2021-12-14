class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to items_path
    else
      flash[:error] = 'Wrong email or password'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_path
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    @current_user = nil
    session.delete
    reset_session
  end
end