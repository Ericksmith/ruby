class AttendeesController < ApplicationController
  def create
    puts "create *****************************"
    puts params[:id]
    attendee = Attendee.new(event_id:params[:event_id], user_id: current_user.id)
    if attendee.save
      redirect_to :back  
    else
      flash[:errors] = attendee.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    if Attendee.find(params[:id]).destroy
      redirect_to :back
    else
      flash[:errors] = ["Unable to leave event"]
      redirect_to :back
    end
  end
end
