class TreesController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.create(tree_params.merge({user_id: session[:user_id], event_id: @event.id}))
    redirect_to @event, notice: "Thank you for your contribution. You're tree-mendous!"
  end

  private
  def tree_params
  	params.require(:tree).permit(:rand_given)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
