class EventsController < ApplicationController
  before_action :require_login, only: [:show, :index]

  def show
  end

  def index
    @current_user = current_user
    @local_events = Event.find_by(state:@current_user.state)
    @out_of_state_events = Event.where.not(state:@current_user.state).ids.sample(10)
  end
end
