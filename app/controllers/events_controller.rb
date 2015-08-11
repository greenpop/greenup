class EventsController < ApplicationController
  def index
    # @events = Event.all
    if params[:event].present?
      q = params[:event][:name].to_i
      @events = Event.where(id: q)
      @events_all = Event.all
      # @selected_event = Event.find(params[:event][:id])
    end
  end

  def show
    @event = Event.find(params[:id])
    @total_trips = @event.trips.count
    @total_carbon = @event.total(:carbon)
    @total_km = @event.total(:km_travelled)
    # @total_trees = @event.total_trees
    @total_pledge = @event.pledges.count
  end

end
