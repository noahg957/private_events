class EventsController < ApplicationController
  def new
    unless session[:user_id] == nil
      @current_user =  User.find(session[:user_id])
    end
    @event = Event.new
  end

  def create
    unless session[:user_id] == nil
      @current_user =  User.find(session[:user_id])
    end
    @event = @current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to @event
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
    @event.attendees << @event.creator
  end

  def show
    unless session[:user_id] == nil
      @current_user =  User.find(session[:user_id])
    end
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def index
    @events = Event.order("created_at DESC")
  end

  def attend
    unless session[:user_id] == nil
      @current_user =  User.find(session[:user_id])
    end
    @event = Event.find(params[:id])
    unless @event.attendees.include?(@current_user)
      @event.attendees << @current_user
      @event.save
    else
      flash[:error] = "Already attending this event"
    end
    redirect_back(fallback_location: root_path)
  end
  

  private
  
  def event_params
    params.require(:event).permit(:name,:description,:event_date)
  end
  
  
end
