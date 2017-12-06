class StudentsController < ApplicationController
  def new
    @current_dojo = Dojo.find(params[:dojo_id])
    @dojos = Dojo.all
  end

  def create
    student = Student.new(student_params)
    if student.save
      flash[:message] = ["New Student Created!"]
      redirect_to :back
    else
      flash[:message] = student.errors.full_messages
      redirect_to :back
    end
  end

  def update
    student = Student.find(params[:id])
    if student.update(student_params)
      redirect_to "dojos/#{student.dojo_id}/students/#{student.id}"
    else
      flash[:message] = student.errors.full_messages
      redirect_to :back
    end
  end

  def delete
  end

  def edit
    @dojos = Dojo.all
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end
