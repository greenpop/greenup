class PledgesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
  	@pledge = Pledge.new

    @session = Session.find(params[:session])
  end

  def create
  	@pledge = Pledge.create(pledge_params.merge({user_id: session[:user_id], event_id: @event.id}))
    @user = User.find(@pledge.user_id)

    @param_pledge = params[:pledge]
    @session = Session.find(@param_pledge["session_id"])
    @session.pledge = @pledge.about
    @session.save

    UserMailer.pledge_email(@user, @pledge, @event).deliver

    redirect_to @event, notice: "Thank you for your pledge. You're tree-mendous!"
  end

  private
  def pledge_params
  	params.require(:pledge).permit(:about)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
