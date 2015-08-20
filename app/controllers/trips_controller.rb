class TripsController < ApplicationController
  before_action :set_event, only: [:new, :create]
  before_action :set_user, only: [:new, :create]
  require 'rest_client'

  def new
  	@trip = Trip.new    
  end

  def create
    @trip = Trip.create(user_id: @user.id, event_id: params[:event_id])
    @trip.set_carbon_and_km(params)
    @money_amount = (@trip.carbon * 120 / 1000).round
    @conversion_rate = JSON.load(RestClient.get("http://api.fixer.io/latest?base=USD"))["rates"]["ZAR"]
    @dollar_amount = "USD $" + (@money_amount/@conversion_rate).round(2).to_s
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