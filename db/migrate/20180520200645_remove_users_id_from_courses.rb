class RemoveUsersIdFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :users_id, :integer
  end
end
