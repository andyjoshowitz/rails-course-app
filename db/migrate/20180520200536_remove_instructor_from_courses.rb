class RemoveInstructorFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :instructor, :integer
  end
end
