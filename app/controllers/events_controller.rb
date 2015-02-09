class EventsController<ApplicationController

  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)

    @event.location_id = params[:event_id]
    if @event.save
      redirect_to locations_path
    else
      render @location
    end
  end

  def show
  end

  def edit
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :requires_id)
  end

end
