class InstructorsController < ApplicationController
  before_action :require_login, only: [:new, :create]

def index
  @instructors = Instructor.all
end

def new
  @instructor = Instructor.new
  @instructor.courses.build()
end

def create
  @instructor = Instructor.new(instructor_params)
  if @instructor.save
    redirect_to @instructor
  else
    render "new"
  end
end

def show
  @instructor = Instructor.find_by(id: params[:id])
  @courses = @instructor.courses
end

def edit
  @instructor = Instructor.find_by(id: params[:id])
  @instructor.courses.build()
end

def update
  @instructor = Instructor.find_by(id: params[:id])
  @instructor.update(instructor_params)
  if @instructor.save
    redirect_to instructor_path(@instructor)
  else
    render "edit"
  end
end

def new_course
  @instructor = Instructor.find_by(id: params[:id])
  @course = Course.new
end

private

  def instructor_params
    params.require(:instructor).permit(:user_id, :first_name, :second_name, :course_attributes => [:id, :user_id, :title, :description, :department, :course_number])
  end

end
