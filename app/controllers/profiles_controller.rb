class ProfilesController < ApplicationController
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @profile = @user.try(:profile)
    @courses = @user.try(:profile).try(:courses)
    @reviews = @user.reviews
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_profile_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @profile = @user.profile
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @profile = @user.profile
    @profile.update(profile_params)
    if @profile.save
      redirect_to user_profile_path
    else
      render "edit"
    end
  end




  private
  def profile_params
    params.require(:profile).permit(:user_id, :username, :courses_attributes => [
          :user_id,
          :title,
          :department,
          :course_number,
          :description
        ], :courses_attributes => [
          :difficulty,
          :course_quality,
          :instructor_quality,
          :amount_learned,
          :work_amount,
          :comment,
          :user_id,
          :course_id
        ]

      )
  end

  def authorize
    unless current_user.try(:admin?) || current_user.id == params[:id] || current_user.id == params[:user_id].to_i
      raise params.inspect
      flash[:error] = "You are not authorized to view this page."
      redirect_back(fallback_location: root_path)
    end
  end
end
