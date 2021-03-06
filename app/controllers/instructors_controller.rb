class InstructorsController < ApplicationController
  before_action :require_login, only: [:new, :create]

def index
  @instructors = Instructor.all
end

def new
  @instructors = Instructor.all
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
  @course = @instructor.courses.build
end

def destroy
  @instructor = Instructor.find_by(id: params[:id])
  @instructor.destroy
  redirect_to root_path
end

private

  def instructor_params
    params.require(:instructor).permit(
      :user_id,
      :first_name,
      :second_name,
      :courses_attributes => [
        :user_id,
        :title,
        :department,
        :course_number,
        :description
      ]
      )
  end

end
