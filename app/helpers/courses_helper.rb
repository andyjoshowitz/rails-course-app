module CoursesHelper
  def edit_option(obj)
    obj.user_id == current_user.try(:id)
  end
end
