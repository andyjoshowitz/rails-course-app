class InstructorsController < ApplicationController
  before_action :require_login, only: [:new, :create]

def index
  @instructors = Instructor.all
end

def new
  @instructor = Instructor.new
  @instructor.courses.build()
  @instructor.courses.build()
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
end

def edit
  @instructor = Instructor.find_by(id: params[:id])
  @instructor.courses.build()
  @instructor.courses.build()
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

#def location_params
#  params.require(:location).permit(
#    :user_id,
#    :street_address_1,
#    :street_address_2,
#    :city,
#    :state,
#    :zip_code,
#    :country,
#    :activities_attributes => [
#      :id,
#      :user_id,
#      :title,
#      :description,
#      :suggested_duration,
#      :category_ids => []
#    ]
#  )
#end

end
