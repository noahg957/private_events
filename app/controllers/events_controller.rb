class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to @event
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.order("created_at DESC")
  end
  

  private
  def event_params
    params.require(:event).permit(:name,:description,:event_date)
  end
  
  
end
