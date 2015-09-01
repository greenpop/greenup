class UsersController < ApplicationController
  def new
      @event = Event.find(params[:event_id])
      @user = User.new(params[:user], params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @user = User.find_by(email: user_params[:email])
    unless @user
      @user = User.create(user_params)
    end
    session[:user_id] = @user.id
    @user.events << @event
    @user.save

    redirect_to new_event_trip_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :surname)
  end
end
