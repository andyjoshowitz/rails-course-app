class AddUserIdToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_reference :instructors, :user, foreign_key: true
  end
end
