class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Events.all
  end

  def show
  end

  def new
    @event = Events.new
  end

  def create
    @event = Events.new(event_params)

    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  private

  def set_event
    @event = Events.find(params[:id])
  end

  def quote_params
    params.require(:event).permit(:title, :start_date, :end_date, :season)
  end
end
