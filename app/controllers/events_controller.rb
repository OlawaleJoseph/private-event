class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = 'Event Created Successfully'
      redirect_to event_path(@event)
      return
    end
    flash[:alert] = @event.errors.full_messages
    render :new
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  protected
  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date)
  end
end
