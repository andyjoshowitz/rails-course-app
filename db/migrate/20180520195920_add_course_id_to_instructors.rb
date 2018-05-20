class AddCourseIdToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_reference :instructors, :course, foreign_key: true
  end
end
