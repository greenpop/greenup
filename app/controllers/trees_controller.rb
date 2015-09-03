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
    @event = Event.find(params[:event_id])
    @paypal_url = paypal_url(@event.name, @tree.id)

    @session = Session.find(params[:session])
  end

  def create
    @tree = Tree.create(tree_params.merge({user_id: session[:user_id], event_id: @event.id}))
    
    @user = User.find(@tree.user_id)
    @event = Event.find(@tree.event_id)

    @param_tree = params[:tree]
    @session = Session.find(@param_tree["session_id"])
    @session.rand_given = @tree.rand_given
    @session.dollar_amount = @tree.dollar_amount
    @session.save

    UserMailer.tree_email(@user, @tree, @event).deliver
    redirect_to @event, notice: "Thank you for your contribution. You're tree-mendous!"
  end

  private
  def tree_params
  	params.require(:tree).permit(:rand_given, :dollar_amount)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def paypal_url(event, id)
    values = {
      business: 'jeremy@greenpop.org',
      cmd: '_xclick',
      upload: 1,
      invoice: id,
      item_name: 'Donation to Greening Projects at ' + event,
    }   
    values.to_query
  end
end
