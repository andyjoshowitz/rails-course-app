class RemoveInstructorsFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :instructors, :integer
  end
end
