class UsersController < ApplicationController
  def new
      @event = Event.find(params[:event_id])
      @user = User.new(params[:user], params[:event_id])
  end

  def create
    @user = User.find_by(email: user_params[:email])
    unless @user
      @user = User.new(user_params)
      session[:user_id] = @user.id
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :surname)
  end
end
