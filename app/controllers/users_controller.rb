class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: root_path }
        session[:user_id] = @user.id
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @hosting_events = @user.created_events
    @attending_events = @user.attending_events
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
  end

private
  def user_params
    params.require(:user).permit(:username,:email)
  end
end

