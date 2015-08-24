class TreesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def payment_complete
    @event = Event.find(params[:event_id])
  end

  def new
    @tree = Tree.new
    @rand_amount = params[:rand_amount]
    @conversion = params[:conversion]
    @dollar_amount = params[:dollar_amount]
    @paypal_url = paypal_url(payment_path(params[:event_id]), @tree.id)
  end

  def create
    @tree = Tree.create(tree_params.merge({user_id: session[:user_id], event_id: @event.id}))
    
    @user = User.find(@tree.user_id)
    @event = Event.find(@tree.event_id)

    UserMailer.tree_email(@user, @tree, @event).deliver
    redirect_to @event, notice: "Thank you for your contribution. You're tree-mendous!"
  end

  private
  def tree_params
  	params.require(:tree).permit(:rand_given)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def paypal_url(return_url, id)
    values = {
      business: 'jeremy@greenpop.org',
      cmd: '_xclick',
      upload: 1,
      return: return_url,
      invoice: id,
      item_name: 'Donating Trees to Greenpop',
    }   
    values.to_query
  end
end
