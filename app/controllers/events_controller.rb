class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all      
  end
  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      @event.users << @current_user
      flash[:notice] = 'Event Created'
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location, :organizer_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
