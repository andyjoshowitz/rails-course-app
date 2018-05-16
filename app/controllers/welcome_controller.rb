class WelcomeController < ApplicationController

  def home
    @courses = Course.all
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.new
  end

end
