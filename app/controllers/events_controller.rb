class EventsController < ApplicationController

  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)
    @location = Location.find(params[:location_id])

    @event.location_id = params[:location_id]
    if @event.save
        redirect_to location_path(@location)
    else
      render @location
    end
  end

  def show
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def edit
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def update
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])

    @event.location_id = params[:location_id]
    if @event.update(event_params)
      redirect_to location_path(@location), notice: 'Event was successfully updated'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])

    @event.location_id = params[:location_id]
    if @event.destroy
      redirect_to location_path(@location), notice: 'Event was successfully deleted'
    end
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :requires_id, :location_id)
  end

end
