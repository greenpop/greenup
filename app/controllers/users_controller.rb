class UsersController < ApplicationController
  def new
      @event = Event.find(params[:event_id])
      @user = User.new(params[:user], params[:event_id])
  end

  def create
    @user = User.find_by(email: user_params[:email])
    unless @user
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          session[:user_id] = @user.id
          UserMailer.welcome_email(@user).deliver
          format.html { redirect_to new_event_trip_path }
          format.json {render json: @user, status: :create, location: @user}
        else
          format.html {render action: 'new'}
          format.json {render json: @user.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :surname)
  end
end
