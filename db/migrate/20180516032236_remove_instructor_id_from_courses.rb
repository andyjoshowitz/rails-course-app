class RemoveInstructorIdFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :instructors_id
  end
end
