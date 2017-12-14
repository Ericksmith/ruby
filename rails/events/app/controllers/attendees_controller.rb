class AttendeesController < ApplicationController
  def create
    attendee = Attendee.new(event_id:params[:id], user_id: current_user.id)
    if attendee.save
      redirect_to :back  
    else
      flash[:errors] = attendee.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
  end
end
