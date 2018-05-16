class CoursesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    @course.build_location()
  end

  def create
    @course = Course.new(acourse_params)
    if @course.save
      redirect_to course_path(@course)
    else
      flash.now[:alert] = "You must enter a name and description of the activity"
      render "new"
    end
  end

  def edit
    @course = Course.find_by(id: params[:id])
    @course.build_location() unless @course.location
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course.update(course_params)
    if @course.save
      redirect_to course_path(@activity)
    else
      render "edit"
    end
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy
    redirect_to root_path
  end

  def most_popular
    with_null = Course.no_reviews
    without_null = Course.most_popular
    @courses = without_null + with_null
  end


  private

  def course_params
    params.require(:course).permit(:user_id, :title, :description, :suggested_duration, :category_ids => [], location_attributes: [:user_id, :street_address_1, :street_address_2, :city, :state, :zip_code, :country])
  end

  def authorize
    unless current_user.try(:admin?) || current_user.id == Course.find_by(id: params[:id]).user_id
      flash[:error] = "You are not authorized to view this page."
      redirect_back(fallback_location: root_path)
    end
  end

end
