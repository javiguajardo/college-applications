class RemoveStatusFromStudentApplication < ActiveRecord::Migration[5.2]
  def change
    remove_column :student_applications, :status, :integer
  end
end
