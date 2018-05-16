class WelcomeController < ApplicationController

  def home
    @courses = Course.all
    @newest_courses = Course.recently_added.first_ten
  end

end
