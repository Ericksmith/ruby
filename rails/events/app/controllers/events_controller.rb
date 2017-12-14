class EventsController < ApplicationController
  before_action :require_login, only: [:show, :index]

  def show
    @event = Event.joins(:user).find(params[:id])
    @attendees = Attendee.joins(:user).where(event_id:params[:id])
  end

  def index
    @states = @@states
    @current_user = current_user
    @local_events = Event.joins(:user).where(state:@current_user.state)
    @out_of_state_events = Event.joins(:user).where.not(state:@current_user.state)
  end

  def create
    puts "in create"
    event_data = event_params
    event_data['user_id'] = current_user.id
    puts event_data
    event = Event.new(event_data)
    if event.save
      puts "saving"
      redirect_to :back
    else
      puts "can't save event"
      flash[:event_errors] = event.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    if Event.find(params[:id]).destroy
      redirect_to :back
    else
      flash[:errors] = ["Unable to delete event"]
      redirect_to :back
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :city, :state)
    end
end
