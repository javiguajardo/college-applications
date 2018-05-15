class CreateStudentApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :student_applications do |t|
      t.references :student, foreign_key: true
      t.references :institution, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
