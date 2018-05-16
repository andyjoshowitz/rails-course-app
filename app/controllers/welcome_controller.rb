class WelcomeController < ApplicationController

  def home
    @categories = Category.all
    @courses = Activity.all
    @newest_courses = Activity.recently_added.first_twelve
  end

end
