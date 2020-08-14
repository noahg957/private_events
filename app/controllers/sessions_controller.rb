class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: session_params[:username])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Logged In"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
  private
  def session_params
    params.require(:signin)
  end
end
