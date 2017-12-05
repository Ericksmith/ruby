class DisplayController < ApplicationController
  @@count = 0

  def result
    @survey = Survey.last
    @count = @@count
  end

  def create
    survey = Survey.new(survey_params)
    if survey.save
      @@count += 1
      redirect_to '/result'
    else
      flash[:errors] = survey.errors.full_messages
      redirect_to :back
    end
  end

  def index
  end 

  private
    def survey_params
      params.require(:survey).permit(:name, :location, :language, :comment)
    end
end
