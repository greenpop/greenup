class TripsController < ApplicationController
  before_action :set_event, only: [:new, :create]
  before_action :set_user, only: [:new, :create]
  require 'rest_client'

  def new
  	@trip = Trip.new    
  end

  def create
    @event = Event.find(params[:event_id])
    @trip = Trip.create(user_id: @user.id, event_id: @event.id)
    @trip.set_carbon_and_km(params)
    @money_amount = (@trip.carbon * 120 / 1000).round
    @conversion_rate = JSON.load(RestClient.get("http://api.fixer.io/latest?base=USD"))["rates"]["ZAR"]
    @dollar_amount = "USD $" + (@money_amount/@conversion_rate).round(2).to_s
    
    @session = Session.create(user_id: @user.id, event_name: @event.name)
    @session.total_carbon = @trip.carbon
    @session.car_carbon = @trip.car_carbon
    @session.plane_carbon = @trip.flight_carbon
    @session.bus_carbon = @trip.bus_carbon
    @session.train_carbon = @trip.train_carbon
    @session.km_travelled = @trip.km_travelled
    @session.email = @user.email
    @session.name = @user.name
    @session.surname = @user.surname
    @session.first_session = @user.created_at
    @session.save
  end

  private 

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end

# casimir pulaski day