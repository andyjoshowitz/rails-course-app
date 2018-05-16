class ProfilesController < ApplicationController
  before_action :authorize, only: [:edit, :update, :destroy]

 def show
   @user = User.find_by(id: params[:user_id])
   @profile = @user.try(:profile)
  # @interests = @user.try(:profile).try(:categories)
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
   # params.require(:profile).permit(:user_id, :username, :avatar, :categories_attributes => [:id, :rating] )
 end

 def authorize
   unless current_user.try(:admin?) || current_user.id == params[:id]
     flash[:error] = "You are not authorized to view this page."
     redirect_back(fallback_location: root_path)
   end
 end
end
