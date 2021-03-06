class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.date :date_of_birth
      t.date :graduation_date

      t.timestamps
    end
  end
end
